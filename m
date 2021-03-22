Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5EC3343F76
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 12:18:28 +0100 (CET)
Received: from localhost ([::1]:33048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOIZj-0002IR-2a
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 07:18:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w.bumiller@proxmox.com>)
 id 1lOIWa-0001JV-Ab
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:15:09 -0400
Received: from proxmox-new.maurer-it.com ([212.186.127.180]:62456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <w.bumiller@proxmox.com>)
 id 1lOIWX-0008Q6-H0
 for qemu-devel@nongnu.org; Mon, 22 Mar 2021 07:15:07 -0400
Received: from proxmox-new.maurer-it.com (localhost.localdomain [127.0.0.1])
 by proxmox-new.maurer-it.com (Proxmox) with ESMTP id 3F5BD42E4F;
 Mon, 22 Mar 2021 12:08:48 +0100 (CET)
Date: Mon, 22 Mar 2021 12:08:47 +0100
From: Wolfgang Bumiller <w.bumiller@proxmox.com>
To: Stefan Reiter <s.reiter@proxmox.com>
Subject: Re: [PATCH] monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
Message-ID: <20210322110847.cdo477ve2gydab64@wobu-vie.proxmox.com>
References: <20210318133550.13120-1-s.reiter@proxmox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210318133550.13120-1-s.reiter@proxmox.com>
User-Agent: NeoMutt/20180716
Received-SPF: pass client-ip=212.186.127.180;
 envelope-from=w.bumiller@proxmox.com; helo=proxmox-new.maurer-it.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Mar 18, 2021 at 02:35:50PM +0100, Stefan Reiter wrote:
> If OOB is disabled, events received in monitor_qmp_event will be handled
> in the main context. Thus, we must not acquire a qmp_queue_lock there,
> as the dispatcher coroutine holds one over a yield point, where it
> expects to be rescheduled from the main context. If a CHR_EVENT_CLOSED
> event is received just then, it can race and block the main thread by
> waiting on the queue lock.
> 
> Run monitor_qmp_cleanup_queue_and_resume in a BH on the iohandler
> thread, so the main thread can always make progress during the
> reschedule.
> 
> The delaying of the cleanup is safe, since the dispatcher always moves
> back to the iothread afterward, and thus the cleanup will happen before
> it gets to its next iteration.
> 
> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
> ---

This is a tough one. It *may* be fine, but I wonder if we can approach
this differently:

From what I can gather we have the following call stacks & contexts:

Guarded lock (lock & release):
  * monitor_qmp_cleanup_queue_and_resume
    by monitor_qmp_event
    by file handler (from I/O loop)
    ^ iohandler_context (assuming that's where the file handling happens...)
    (after this patch as BH though)

  * handle_qmp_command
    a) by the json parser (which is also re-initialized by
       monitor_qmp_event btw., haven't checked if that can also
       "trigger" its methods immediately)
    b) by monitor_qmp_read
    by file handler (from I/O loop)
    ^ iohandler_context

Lock-"returning":
  * monitor_qmp_requests_pop_any_with_lock
    by coroutine_fn monitor_qmp_dispatcher_co
    ^ iohandler_context

Lock-releasing:
  * coroutine_fn monitor_qmp_dispatcher_co
    ^ qemu_aio_context

The only *weird* thing that immediately pops out here is
`monitor_qmp_requests_pop_any_with_lock()` keeping a lock while
switching contexts.
This is done in order to allow `AIO_WAIT_WHILE` to work while making
progress on the events, but do we actually already need to be in this
context for the OOB `monitor_resume()` call or can we defer the context
switch to after having done that and released the lock?
`monitor_resume()` itself seems to simply schedule a BH which should
work regardless if I'm not mistaken. There's also a
`readline_show_prompt()` call, but that *looks* harmless?
`monitor_resume()` is also called without the lock later on, so even if
it needs to be in this context at that point for whatever reason, does
it need the lock?


