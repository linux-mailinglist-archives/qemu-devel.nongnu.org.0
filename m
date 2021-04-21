Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E61C8366F13
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Apr 2021 17:25:33 +0200 (CEST)
Received: from localhost ([::1]:41518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZEjM-0006sn-P6
	for lists+qemu-devel@lfdr.de; Wed, 21 Apr 2021 11:25:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37560)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lZEgb-0004oB-B5
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 11:22:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lZEgY-0004sI-TV
 for qemu-devel@nongnu.org; Wed, 21 Apr 2021 11:22:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619018558;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=3wq6jOb58dyZ5Zl0Bm8RvRqouSB8EvhNHZuqz4wwGFE=;
 b=ECpZb/d0Cc1mSxD/RQED1o8uQ8WsV6BlmrssvxSDIXDXIuteJ6O1mxOBFf25HCEKqUcOW5
 DZ9C/BTE81WQpsmdni6ugjQ3g49mXG7c60jLGe5lP6JDJiuJ4E3cD44ITZzgHeovxiQdoT
 8IJCn+b7E2Khq0dgs9+WWmqQD6IaawM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-qmQrhRBxMrq3IC8X903Tow-1; Wed, 21 Apr 2021 11:21:48 -0400
X-MC-Unique: qmQrhRBxMrq3IC8X903Tow-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 13BE510CF811;
 Wed, 21 Apr 2021 15:18:20 +0000 (UTC)
Received: from localhost (ovpn-117-199.rdu2.redhat.com [10.10.117.199])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C6B895D6A1;
 Wed, 21 Apr 2021 15:18:19 +0000 (UTC)
Date: Wed, 21 Apr 2021 11:18:18 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Xiaoyao Li <xiaoyao.li@intel.com>
Subject: Re: [PATCH v2] i386: Add ratelimit for bus locks acquired in guest
Message-ID: <20210421151818.3svsnpmch5gswtpe@habkost.net>
References: <20210420093736.17613-1-chenyi.qiang@intel.com>
 <20210420163417.lbns24ypfqz7icxg@habkost.net>
 <df860e12-cea5-3d88-ba16-0dd1f8f975cb@intel.com>
 <20210421141210.mx5mt7kewahj7eij@habkost.net>
 <a73d4f4e-d7b2-b187-d13b-d23989976f49@intel.com>
MIME-Version: 1.0
In-Reply-To: <a73d4f4e-d7b2-b187-d13b-d23989976f49@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Chenyi Qiang <chenyi.qiang@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 21, 2021 at 10:50:10PM +0800, Xiaoyao Li wrote:
> On 4/21/2021 10:12 PM, Eduardo Habkost wrote:
> > On Wed, Apr 21, 2021 at 02:26:42PM +0800, Chenyi Qiang wrote:
> > > Hi, Eduardo, thanks for your comments!
> > > 
> > > 
> > > On 4/21/2021 12:34 AM, Eduardo Habkost wrote:
> > > > Hello,
> > > > 
> > > > Thanks for the patch.  Comments below:
> > > > 
> > > > On Tue, Apr 20, 2021 at 05:37:36PM +0800, Chenyi Qiang wrote:
> > > > > Virtual Machines can exploit bus locks to degrade the performance of
> > > > > system. To address this kind of performance DOS attack, bus lock VM exit
> > > > > is introduced in KVM and it will report the bus locks detected in guest,
> > > > > which can help userspace to enforce throttling policies.
> > > > > 
> > > > 
> > > > Is there anything today that would protect the system from
> > > > similar attacks from userspace with access to /dev/kvm?
> > > > 
> > > 
> > > I can't fully understand your meaning for "similar attack with access to
> > > /dev/kvm". But there are some similar associated detection features on bare
> > > metal.
> > 
> > What I mean is: you say guests can make a performance DoS attack
> > on the host, and your patch mitigates that.
> > 
> > What would be the available methods to prevent untrusted
> > userspace running on the host with access to /dev/kvm from making
> > a similar DoS attack on the host?

Thanks for all the clarifications below.  Considering them,
what's the answer to the question above?

> > 
> > > 
> > > 1. Split lock detection:https://lore.kernel.org/lkml/158031147976.396.8941798847364718785.tip-bot2@tip-bot2/
> > > Some CPUs can raise an #AC trap when a split lock is attempted.
> > 
> > Would split_lock_detect=fatal be enough to prevent the above attacks?
> 
> NO.
> 
> There are two types bus lock:
> 1. split lock - lock on cacheable memory while the memory across two cache
> lines.
> 2. non-wb lock - lock on non-writableback memory (you can find it on Intel
> ISE chapter 8, https://software.intel.com/content/www/us/en/develop/download/intel-architecture-instruction-set-extensions-programming-reference.html)
> 
> split lock detection can only prevent 1)
> 
> > Is split_lock_detect=fatal the only available way to prevent them?
> 
> as above, 2) non-wb lock can be prevented by "non-wb lock disable" feature

Bus lock VM exit applies to both 1 and 2, correct?

> 
> > 
> > > 
> > > 2. Bus lock Debug Exception:
> > > https://lore.kernel.org/lkml/20210322135325.682257-1-fenghua.yu@intel.com/
> > > The kernel can be notified by an #DB trap after a user instruction acquires
> > > a bus lock and is executed.
> > 
> > I see a rate limit option mentioned at the above URL.  Would a
> > host kernel bus lock rate limit option make this QEMU patch
> > redundant?
> > 
> 
> No. Bus lock Debug exception cannot be used to detect the bus lock happens
> in guest (vmx non-root mode).
> 
> We have patch to virtualize this feature for guest
> https://lore.kernel.org/kvm/20210202090433.13441-1-chenyi.qiang@intel.com/
> 
> that guest will have its own setting of bus lock debug exception on or off.
> 
> What's more important is that, even we force set the
> MSR_DEBUGCTL.BUS_LOCK_DETECT for guest, guest still can escape from it.
> Because bus lock #DB is a trap which is delivered after the instruction
> completes. If the instruction acquires bus lock subsequently faults e.g.,
> #PF, then no bus lock #DB generated. But the bus lock does happen.
> 
> But with bus lock VM exit, even the instruction faults, it will cause a BUS
> LOCK VM exit.
> 
> 

-- 
Eduardo


