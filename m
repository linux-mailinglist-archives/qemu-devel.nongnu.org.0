Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 796C83FCC6A
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 19:36:59 +0200 (CEST)
Received: from localhost ([::1]:51006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL7go-0006du-Ut
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 13:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL7fP-0005pD-4B
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:35:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mL7fK-0008Kf-EM
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 13:35:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630431316;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=89NYuLCJ+TdXMbwcFSFyey9bjYqe2eRsEhSD27COWyU=;
 b=YnUQwqyyMjARBI8TogQmkgHAklVqaprtcOe9tmWuQ4cPJc5C+m9+Tvzej/2g1PoRiwCVwK
 Rf0y60oO6uDJ6oiavLEwSPunYLmKRojlsPeayVgMIAIRGXACASLrqvScUDN5VJPhauVTMz
 mya3VISdwGWDGyW1JV3uLMB4pLdLaD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-0w9Q5oIIO9-fdsopz7n2fA-1; Tue, 31 Aug 2021 13:35:10 -0400
X-MC-Unique: 0w9Q5oIIO9-fdsopz7n2fA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A73C4C73A0;
 Tue, 31 Aug 2021 17:35:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 83D3F60E1C;
 Tue, 31 Aug 2021 17:35:08 +0000 (UTC)
Date: Tue, 31 Aug 2021 18:35:05 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Richard W.M. Jones" <rjones@redhat.com>
Subject: Re: [PULL 08/15] target/i386: Added consistency checks for CR4
Message-ID: <YS5oSeJFw6p4gLgZ@redhat.com>
References: <20210722153612.955537-1-pbonzini@redhat.com>
 <20210722153612.955537-9-pbonzini@redhat.com>
 <20210831170304.GA24819@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210831170304.GA24819@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Lara Lazier <laramglazier@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Aug 31, 2021 at 06:03:04PM +0100, Richard W.M. Jones wrote:
> On Thu, Jul 22, 2021 at 05:36:05PM +0200, Paolo Bonzini wrote:
> > From: Lara Lazier <laramglazier@gmail.com>
> > 
> > All MBZ bits in CR4 must be zero. (APM2 15.5)
> > Added reserved bitmask and added checks in both
> > helper_vmrun and helper_write_crN.
> > 
> > Signed-off-by: Lara Lazier <laramglazier@gmail.com>
> > Message-Id: <20210721152651.14683-2-laramglazier@gmail.com>
> > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> 
> FYI this commit causes a regression with -cpu max (regression analyzed
> by Daniel Berrange).  See:
> 
> https://bugzilla.redhat.com/show_bug.cgi?id=1999700
> 
> Rich.
> 
> >  target/i386/cpu.h                    | 39 ++++++++++++++++++++++++++++
> >  target/i386/tcg/sysemu/misc_helper.c |  3 +++
> >  target/i386/tcg/sysemu/svm_helper.c  |  9 ++++---
> >  3 files changed, 48 insertions(+), 3 deletions(-)
> > 
> > diff --git a/target/i386/cpu.h b/target/i386/cpu.h
> > index 5d98a4e7c0..1f7e8d7f0a 100644
> > --- a/target/i386/cpu.h
> > +++ b/target/i386/cpu.h
> > @@ -240,6 +240,7 @@ typedef enum X86Seg {
> >  #define CR4_OSFXSR_SHIFT 9
> >  #define CR4_OSFXSR_MASK (1U << CR4_OSFXSR_SHIFT)
> >  #define CR4_OSXMMEXCPT_MASK  (1U << 10)
> > +#define CR4_UMIP_MASK   (1U << 11)
> >  #define CR4_LA57_MASK   (1U << 12)
> >  #define CR4_VMXE_MASK   (1U << 13)
> >  #define CR4_SMXE_MASK   (1U << 14)
> > @@ -251,6 +252,14 @@ typedef enum X86Seg {
> >  #define CR4_PKE_MASK   (1U << 22)
> >  #define CR4_PKS_MASK   (1U << 24)
> >  
> > +#define CR4_RESERVED_MASK \
> > +(~(target_ulong)(CR4_VME_MASK | CR4_PVI_MASK | CR4_TSD_MASK \
> > +                | CR4_DE_MASK | CR4_PSE_MASK | CR4_PAE_MASK \
> > +                | CR4_MCE_MASK | CR4_PGE_MASK | CR4_PCE_MASK \
> > +                | CR4_OSFXSR_MASK | CR4_OSXMMEXCPT_MASK |CR4_UMIP_MASK \
> > +                | CR4_FSGSBASE_MASK | CR4_PCIDE_MASK | CR4_OSXSAVE_MASK \
> > +                | CR4_SMEP_MASK | CR4_SMAP_MASK | CR4_PKE_MASK | CR4_PKS_MASK))
> > +

This is missing  CR4_LA57_MASK, and adding that makes Fedora kernels
boot again.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


