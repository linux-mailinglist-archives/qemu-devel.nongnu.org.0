Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF04DC5AA
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 13:19:00 +0100 (CET)
Received: from localhost ([::1]:50484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUp5n-0001hi-6I
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 08:18:59 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59368)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1nUozj-0007JC-3I
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1nUozT-0003cd-7Z
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 08:12:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647519146;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=faJBNwHS3j6Ms4fZMFFVA8Tzr0KTGWfL+P/7OHBjul8=;
 b=DvAsxN12HED6cz4UUuBwvrEMUaHeECkOMFo4j0uyx9zPVfPibB0csHWermZYHjuEht5X8P
 eV/GObaDumEJPNj/YpMSNPssHpGDpesVv0Q7NXJNxIMvvMsPqb+b/3CsRUIDthk+Kmnvt+
 vOYvFLzZnt0IDnkeoA4yZy1aoVEIb0o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-Thx0ZP30NuWeQb09ZjUQlw-1; Thu, 17 Mar 2022 08:12:22 -0400
X-MC-Unique: Thx0ZP30NuWeQb09ZjUQlw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 842E9811E78;
 Thu, 17 Mar 2022 12:12:22 +0000 (UTC)
Received: from starship (unknown [10.40.192.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D907A1400C2D;
 Thu, 17 Mar 2022 12:12:20 +0000 (UTC)
Message-ID: <f9e225fa4cfd2f908fc8bf4f2f48afc7d8320595.camel@redhat.com>
Subject: Re: [PULL 15/22] x86: Grant AMX permission for guest
From: Maxim Levitsky <mlevitsk@redhat.com>
To: "Daniel P." =?ISO-8859-1?Q?Berrang=E9?= <berrange@redhat.com>, David
 Edmondson <david.edmondson@oracle.com>
Date: Thu, 17 Mar 2022 14:12:19 +0200
In-Reply-To: <YjIjeYOtZAG7E0D2@redhat.com>
References: <20220308113445.859669-1-pbonzini@redhat.com>
 <20220308113445.859669-16-pbonzini@redhat.com>
 <YjII86LKWTe0mVED@angien.pipo.sk> <YjIKrSZGcvh3/Aq7@redhat.com>
 <cunilsdvlez.fsf@oracle.com> <YjIjeYOtZAG7E0D2@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlevitsk@redhat.com;
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
Cc: Yang Zhong <yang.zhong@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Krempa <pkrempa@redhat.com>, qemu-devel@nongnu.org,
 Jing Liu <jing2.liu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2022-03-16 at 17:50 +0000, Daniel P. Berrangé wrote:
> On Wed, Mar 16, 2022 at 05:48:04PM +0000, David Edmondson wrote:
> > On Wednesday, 2022-03-16 at 16:05:01 GMT, Daniel P. Berrangé wrote:
> > 
> > > On Wed, Mar 16, 2022 at 04:57:39PM +0100, Peter Krempa wrote:
> > > > On Tue, Mar 08, 2022 at 12:34:38 +0100, Paolo Bonzini wrote:
> > > > > From: Yang Zhong <yang.zhong@intel.com>
> > > > > 
> > > > > Kernel allocates 4K xstate buffer by default. For XSAVE features
> > > > > which require large state component (e.g. AMX), Linux kernel
> > > > > dynamically expands the xstate buffer only after the process has
> > > > > acquired the necessary permissions. Those are called dynamically-
> > > > > enabled XSAVE features (or dynamic xfeatures).
> > > > > 
> > > > > There are separate permissions for native tasks and guests.
> > > > > 
> > > > > Qemu should request the guest permissions for dynamic xfeatures
> > > > > which will be exposed to the guest. This only needs to be done
> > > > > once before the first vcpu is created.
> > > > > 
> > > > > KVM implemented one new ARCH_GET_XCOMP_SUPP system attribute API to
> > > > > get host side supported_xcr0 and Qemu can decide if it can request
> > > > > dynamically enabled XSAVE features permission.
> > > > > https://lore.kernel.org/all/20220126152210.3044876-1-pbonzini@redhat.com/
> > > > > 
> > > > > Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
> > > > > Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> > > > > Signed-off-by: Jing Liu <jing2.liu@intel.com>
> > > > > Message-Id: <20220217060434.52460-4-yang.zhong@intel.com>
> > > > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > > > ---
> > > > >  target/i386/cpu.c          |  7 +++++
> > > > >  target/i386/cpu.h          |  4 +++
> > > > >  target/i386/kvm/kvm-cpu.c  | 12 ++++----
> > > > >  target/i386/kvm/kvm.c      | 57 ++++++++++++++++++++++++++++++++++++++
> > > > >  target/i386/kvm/kvm_i386.h |  1 +
> > > > >  5 files changed, 75 insertions(+), 6 deletions(-)
> > > > 
> > > > With this commit qemu crashes for me when invoking the following
> > > > QMP command:
> > > 
> > > It is way worse than that even. If you remove '-S' you get an
> > > immediate kaboom on startup on AMD hosts
> > 
> > Which AMD CPU is in this host?
> 
> AMD EPYC 7302P
> 
> 
> With regards,
> Daniel

my 3970X - same issue.

Best regards,
	Maxim Levitsky


