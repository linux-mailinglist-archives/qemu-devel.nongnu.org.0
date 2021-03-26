Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2977A34AA81
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 15:52:34 +0100 (CET)
Received: from localhost ([::1]:47744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPnpA-0008IE-Kr
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 10:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPnle-0004u9-TI
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:48:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1lPnlW-0006pf-F8
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 10:48:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616770125;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=4SMl0+38xrlgCRfeTu3MFQqpON1mYllx4PmtyH1jbMU=;
 b=ECpPk4rdOAcVHGCeqNERNsyeiG/bwHr4KFgF1Kyql+y8H2v4atw+Eu9XoMr5MTXBKIbPY5
 z4ByUBirXxFNVDxdK9D23oiDmReoJxaysOwMooHLW4Y3Mkq5/Nnqz7SNnhXEo+i8q/hWv3
 r4MWNo+P+UAjrDfTAIWzPiAJZ9p4q0k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-153-k_khlMYkMVSfu60mfxCirQ-1; Fri, 26 Mar 2021 10:48:41 -0400
X-MC-Unique: k_khlMYkMVSfu60mfxCirQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4A421107ACCA;
 Fri, 26 Mar 2021 14:48:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-114-17.ams2.redhat.com
 [10.36.114.17])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C61613441;
 Fri, 26 Mar 2021 14:48:39 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E336D11327E1; Fri, 26 Mar 2021 15:48:37 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: Wolfgang Bumiller <w.bumiller@proxmox.com>
Subject: Re: [PATCH] monitor/qmp: fix race on CHR_EVENT_CLOSED without OOB
References: <20210318133550.13120-1-s.reiter@proxmox.com>
 <20210322110847.cdo477ve2gydab64@wobu-vie.proxmox.com>
Date: Fri, 26 Mar 2021 15:48:37 +0100
In-Reply-To: <20210322110847.cdo477ve2gydab64@wobu-vie.proxmox.com> (Wolfgang
 Bumiller's message of "Mon, 22 Mar 2021 12:08:47 +0100")
Message-ID: <87lfaahsxm.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Stefan Reiter <s.reiter@proxmox.com>, qemu-devel@nongnu.org,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Wolfgang Bumiller <w.bumiller@proxmox.com> writes:

> On Thu, Mar 18, 2021 at 02:35:50PM +0100, Stefan Reiter wrote:
>> If OOB is disabled, events received in monitor_qmp_event will be handled
>> in the main context. Thus, we must not acquire a qmp_queue_lock there,
>> as the dispatcher coroutine holds one over a yield point, where it
>> expects to be rescheduled from the main context. If a CHR_EVENT_CLOSED
>> event is received just then, it can race and block the main thread by
>> waiting on the queue lock.
>> 
>> Run monitor_qmp_cleanup_queue_and_resume in a BH on the iohandler
>> thread, so the main thread can always make progress during the
>> reschedule.
>> 
>> The delaying of the cleanup is safe, since the dispatcher always moves
>> back to the iothread afterward, and thus the cleanup will happen before
>> it gets to its next iteration.
>> 
>> Signed-off-by: Stefan Reiter <s.reiter@proxmox.com>
>> ---
>
> This is a tough one. It *may* be fine, but I wonder if we can approach
> this differently:

You guys make my head hurt.

I understand we're talking about a bug.  Is it a recent regression, or
an older bug?  How badly does the bug affect users?

I'm about to vanish for my Easter break...  If the bug must be fixed for
6.0, just waiting for me to come back seems unadvisable.

[...]


