Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A41C024608
	for <lists+qemu-devel@lfdr.de>; Tue, 21 May 2019 04:39:10 +0200 (CEST)
Received: from localhost ([127.0.0.1]:45333 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSugH-0001yj-Rc
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 22:39:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47811)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hSufH-0001gm-MQ
	for qemu-devel@nongnu.org; Mon, 20 May 2019 22:38:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peterx@redhat.com>) id 1hSufG-0000x0-Od
	for qemu-devel@nongnu.org; Mon, 20 May 2019 22:38:07 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54376)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <peterx@redhat.com>) id 1hSufG-0000wn-JY
	for qemu-devel@nongnu.org; Mon, 20 May 2019 22:38:06 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EFE587F7C5
	for <qemu-devel@nongnu.org>; Tue, 21 May 2019 02:38:05 +0000 (UTC)
Received: from xz-x1 (dhcp-15-205.nay.redhat.com [10.66.15.205])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2117E19C5B;
	Tue, 21 May 2019 02:38:03 +0000 (UTC)
Date: Tue, 21 May 2019 10:38:01 +0800
From: Peter Xu <peterx@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190521023801.GS16681@xz-x1>
References: <20190520030839.6795-1-peterx@redhat.com>
	<20190520030839.6795-13-peterx@redhat.com>
	<9558ee27-7d61-4afd-f4f3-ff726e8ce93d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <9558ee27-7d61-4afd-f4f3-ff726e8ce93d@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Tue, 21 May 2019 02:38:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 12/15] kvm: Support KVM_CLEAR_DIRTY_LOG
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>, qemu-devel@nongnu.org,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>,
	Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 20, 2019 at 12:50:24PM +0200, Paolo Bonzini wrote:
> On 20/05/19 05:08, Peter Xu wrote:
> > +    s->manual_dirty_log_protect =
> > +        kvm_check_extension(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2);
> > +    if (s->manual_dirty_log_protect) {
> > +        ret = kvm_vm_enable_cap(s, KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2, 0, 1);
> > +        if (ret) {
> > +            warn_report("Trying to enable KVM_CAP_MANUAL_DIRTY_LOG_PROTECT "
> 
> Please use KVM_CAP_MANUAL_DIRTY_LOG_PROTECT2 in the error too (and in
> the commit message).

Oops I did miss these, actually I also noticed some commit messages
that mentioned the wrong capability name and I'll change them too
(e.g., in patch 8 where the new memory API is introduced).

Thanks,

-- 
Peter Xu

