Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F9E2F04BC
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Jan 2021 02:47:29 +0100 (CET)
Received: from localhost ([::1]:42650 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kyPpI-0006uq-Rj
	for lists+qemu-devel@lfdr.de; Sat, 09 Jan 2021 20:47:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kyPo2-0006Kv-F3
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 20:46:10 -0500
Received: from mta-02.yadro.com ([89.207.88.252]:33232 helo=mta-01.yadro.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <r.bolshakov@yadro.com>)
 id 1kyPnz-0006fl-Ky
 for qemu-devel@nongnu.org; Sat, 09 Jan 2021 20:46:10 -0500
Received: from localhost (unknown [127.0.0.1])
 by mta-01.yadro.com (Postfix) with ESMTP id A0E1C412D1;
 Sun, 10 Jan 2021 01:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
 in-reply-to:content-disposition:content-type:content-type
 :mime-version:references:message-id:subject:subject:from:from
 :date:date:received:received:received; s=mta-01; t=1610243164;
 x=1612057565; bh=gYdhGU/Fi7MbCrmA+fQIJQVhErHdSig+PeF+f7E5eVs=; b=
 OcwKjO4/OR4gkSOasoN3wE9tg9NnDliCbgt7VAiwI/SlEvNgCNh/h90+ymq5ONHo
 ESIRXy0WxXNgFjQAgfrjvGZdq3CxKDDDV070xc48OsoOgcrcj8ZFgwzkO6L9Un2k
 7YzTOlbKq0BeafgqPCVdWtp1Z12HDn1xzitnErX3/K4=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
 by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lNIhHj3OSWWI; Sun, 10 Jan 2021 04:46:04 +0300 (MSK)
Received: from T-EXCH-03.corp.yadro.com (t-exch-03.corp.yadro.com
 [172.17.100.103])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
 (No client certificate requested)
 by mta-01.yadro.com (Postfix) with ESMTPS id AC6E44120B;
 Sun, 10 Jan 2021 04:46:03 +0300 (MSK)
Received: from localhost (172.17.204.212) by T-EXCH-03.corp.yadro.com
 (172.17.100.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id 15.1.669.32; Sun, 10
 Jan 2021 04:46:03 +0300
Date: Sun, 10 Jan 2021 04:46:26 +0300
From: Roman Bolshakov <r.bolshakov@yadro.com>
To: Peter Maydell <peter.maydell@linaro.org>, Hill Ma <maahiuzeon@gmail.com>
Subject: Re: [PATCH] hvf: guard xgetbv call.
Message-ID: <X/pccrqIQ9/N57j6@SPB-NB-133.local>
References: <X91h2yoy7qVrO1kv@Hills-Mac-Pro.local>
 <X/lDozXFWfR4AZAU@SPB-NB-133.local>
 <CAFEAcA9bMbPFj=xFiHgDVg1X14kZOt0Bre-uH0fcjJzsaSk0qA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAFEAcA9bMbPFj=xFiHgDVg1X14kZOt0Bre-uH0fcjJzsaSk0qA@mail.gmail.com>
X-Originating-IP: [172.17.204.212]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-03.corp.yadro.com (172.17.100.103)
Received-SPF: pass client-ip=89.207.88.252; envelope-from=r.bolshakov@yadro.com;
 helo=mta-01.yadro.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: John Arbuckle <programmingkidx@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Cameron Esfahani <dirty@apple.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jan 09, 2021 at 11:42:18AM +0000, Peter Maydell wrote:
> On Sat, 9 Jan 2021 at 05:49, Roman Bolshakov <r.bolshakov@yadro.com> wrote:
> >
> > On Fri, Dec 18, 2020 at 06:13:47PM -0800, Hill Ma wrote:
> > > This prevents illegal instruction on cpus do not support xgetbv.
> > >
> > > Buglink: https://bugs.launchpad.net/qemu/+bug/1758819
> > > Signed-off-by: Hill Ma <maahiuzeon@gmail.com>
> > > ---
> > >  target/i386/hvf/x86_cpuid.c | 11 ++++++++---
> > >  1 file changed, 8 insertions(+), 3 deletions(-)
> > >
> >
> > Hi Hill,
> >
> > I'm sorry for delay with the review.
> 
> So, hvf added a third use of inline asm execution of "xgetbv" to
> the two we had already. Now we have:
>  * this in hvf
>  * a use in tcg_target_init() in tcg/i386/tcg-target.c.inc
>  * a use in init_cpuid_cache() in util/bufferiszero.c
> 
> Is it possible to abstract this out so we have one version
> of this, not three ? I note that the other two got the "avoid
> executing an illegal insn" tests right...

It surely is. If xgetbv() is extended like below and moved out of hvf,
we can reuse it in all other places and no duplication of #UD avoidance
will happen.

diff --git a/target/i386/hvf/x86_cpuid.c b/target/i386/hvf/x86_cpuid.c
index a6842912f5..7994f92d96 100644
--- a/target/i386/hvf/x86_cpuid.c
+++ b/target/i386/hvf/x86_cpuid.c
@@ -27,15 +27,21 @@
 #include "vmx.h"
 #include "sysemu/hvf.h"

-static uint64_t xgetbv(uint32_t xcr)
+static int xgetbv(uint32_t cpuid_ecx, uint32_t idx, uint64_t *xcr)
 {
-    uint32_t eax, edx;
+    uint32_t xcrl, xcrh;

-    __asm__ volatile ("xgetbv"
-                      : "=a" (eax), "=d" (edx)
-                      : "c" (xcr));
+    if (cpuid_ecx && CPUID_EXT_OSXSAVE) {
+        /* The xgetbv instruction is not available to older versions of
+         * the assembler, so we encode the instruction manually.
+         */
+        asm(".byte 0x0f, 0x01, 0xd0" : "=a" (xcrl), "=d" (xcrh) : "c" (idx));

-    return (((uint64_t)edx) << 32) | eax;
+        *xcr = (((uint64_t)xcrh) << 32) | xcrl;
+        return 0;
+    }
+
+    return 1;
 }

 uint32_t hvf_get_supported_cpuid(uint32_t func, uint32_t idx,


Hill, feel free to update the three places Peter mentioned.  If it's
more convenient for you I can make complete patch.

Thanks,
Roman

> 
> thanks
> -- PMM

