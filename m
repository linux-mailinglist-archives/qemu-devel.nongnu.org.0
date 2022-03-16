Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6314DB79C
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 18:53:02 +0100 (CET)
Received: from localhost ([::1]:33718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUXpV-0002AW-HN
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 13:53:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUXnj-00011A-8h
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:51:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nUXnf-000844-CP
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 13:51:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647453066;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TdRLl7jRzmLItVI9/Mwhd0xPliK3Eg/Xpmi8xtiF3N8=;
 b=dm8rpolQ/3p6pLuO3tPGVkfw6o7l7y2FapgLB2lphSoo4zzM5d+TBAzhFSaCr6jhiDhtgJ
 PvSk2qVIL6XixlQ8G8iV+uKbstwrR9tjA0js/7RHXwwyIDK+VUdxNLo824OosGlWmeZLfQ
 1p0ue02tkMTsW49x6JW7x+yCOAa5Ps4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-166-bnUPLBZmNsOtFZaMUzNIUg-1; Wed, 16 Mar 2022 13:50:53 -0400
X-MC-Unique: bnUPLBZmNsOtFZaMUzNIUg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 383DE1066558;
 Wed, 16 Mar 2022 17:50:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDFAE432485;
 Wed, 16 Mar 2022 17:50:51 +0000 (UTC)
Date: Wed, 16 Mar 2022 17:50:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Subject: Re: [PULL 15/22] x86: Grant AMX permission for guest
Message-ID: <YjIjeYOtZAG7E0D2@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
 <20220308113445.859669-16-pbonzini@redhat.com>
 <YjII86LKWTe0mVED@angien.pipo.sk> <YjIKrSZGcvh3/Aq7@redhat.com>
 <cunilsdvlez.fsf@oracle.com>
MIME-Version: 1.0
In-Reply-To: <cunilsdvlez.fsf@oracle.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Yang Zhong <yang.zhong@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 16, 2022 at 05:48:04PM +0000, David Edmondson wrote:
> On Wednesday, 2022-03-16 at 16:05:01 GMT, Daniel P. Berrangé wrote:
> 
> > On Wed, Mar 16, 2022 at 04:57:39PM +0100, Peter Krempa wrote:
> >> On Tue, Mar 08, 2022 at 12:34:38 +0100, Paolo Bonzini wrote:
> >> > From: Yang Zhong <yang.zhong@intel.com>
> >> > 
> >> > Kernel allocates 4K xstate buffer by default. For XSAVE features
> >> > which require large state component (e.g. AMX), Linux kernel
> >> > dynamically expands the xstate buffer only after the process has
> >> > acquired the necessary permissions. Those are called dynamically-
> >> > enabled XSAVE features (or dynamic xfeatures).
> >> > 
> >> > There are separate permissions for native tasks and guests.
> >> > 
> >> > Qemu should request the guest permissions for dynamic xfeatures
> >> > which will be exposed to the guest. This only needs to be done
> >> > once before the first vcpu is created.
> >> > 
> >> > KVM implemented one new ARCH_GET_XCOMP_SUPP system attribute API to
> >> > get host side supported_xcr0 and Qemu can decide if it can request
> >> > dynamically enabled XSAVE features permission.
> >> > https://lore.kernel.org/all/20220126152210.3044876-1-pbonzini@redhat.com/
> >> > 
> >> > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> >> > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> >> > Signed-off-by: Jing Liu <jing2.liu@intel.com>
> >> > Message-Id: <20220217060434.52460-4-yang.zhong@intel.com>
> >> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> >> > ---
> >> >  target/i386/cpu.c          |  7 +++++
> >> >  target/i386/cpu.h          |  4 +++
> >> >  target/i386/kvm/kvm-cpu.c  | 12 ++++----
> >> >  target/i386/kvm/kvm.c      | 57 ++++++++++++++++++++++++++++++++++++++
> >> >  target/i386/kvm/kvm_i386.h |  1 +
> >> >  5 files changed, 75 insertions(+), 6 deletions(-)
> >> 
> >> With this commit qemu crashes for me when invoking the following
> >> QMP command:
> >
> > It is way worse than that even. If you remove '-S' you get an
> > immediate kaboom on startup on AMD hosts
> 
> Which AMD CPU is in this host?

AMD EPYC 7302P


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


