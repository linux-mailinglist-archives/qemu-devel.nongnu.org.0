Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA93D41ADE9
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 13:35:12 +0200 (CEST)
Received: from localhost ([::1]:38350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVBOB-0004sb-B1
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 07:35:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mVBM8-00032b-4t
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:33:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25172)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1mVBM4-00069z-Ac
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 07:33:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632828779;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1AaEfA2PK4IIwoHbxwZe/EkKrxav9MdwVe4osXvnKB0=;
 b=eyKNk2Wk3yLraFhSWwlemHya9JZ9B6U43cupoRAgkvi8qqPOOwPEnrDDm+70dyl8dpE7dU
 GiIM3VLny5noAh0KGUYiKqMr+o8qDIBV3dNGo77K5zmzfTCHIlcTNzQ3HKmXwHQcSr/iZw
 /5zQWeOLY7g03LVgdyLovi7YECHsPSE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-128-n_RCn6BMNs2yokza9hVKFQ-1; Tue, 28 Sep 2021 07:32:54 -0400
X-MC-Unique: n_RCn6BMNs2yokza9hVKFQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 33784192379B;
 Tue, 28 Sep 2021 11:32:51 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.193.134])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ABAC77621B;
 Tue, 28 Sep 2021 11:32:06 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2899018003B6; Tue, 28 Sep 2021 13:32:04 +0200 (CEST)
Date: Tue, 28 Sep 2021 13:32:04 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 10/29] tcg_funcs: Add tlb_flush to TCGModuleOps
Message-ID: <20210928113204.ic2syx4w2cjsqr7h@sirius.home.kraxel.org>
References: <20210831121545.2874233-1-kraxel@redhat.com>
 <20210831121545.2874233-11-kraxel@redhat.com>
 <fdfd7f35-fbec-84f7-ebbd-7790df20b1bd@linaro.org>
MIME-Version: 1.0
In-Reply-To: <fdfd7f35-fbec-84f7-ebbd-7790df20b1bd@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Max Filippov <jcmvbkbc@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Huacai Chen <chenhuacai@kernel.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 Stafford Horne <shorne@gmail.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Mahmoud Mandour <ma.mandourr@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 02, 2021 at 03:09:15PM +0200, Richard Henderson wrote:
> On 8/31/21 2:15 PM, Gerd Hoffmann wrote:
> > diff --git a/target/i386/helper.c b/target/i386/helper.c
> > index 533b29cb91b6..100add713c5d 100644
> > --- a/target/i386/helper.c
> > +++ b/target/i386/helper.c
> > @@ -103,7 +103,7 @@ void x86_cpu_set_a20(X86CPU *cpu, int a20_state)
> >           /* when a20 is changed, all the MMU mappings are invalid, so
> >              we must flush everything */
> > -        tlb_flush(cs);
> > +        tcg.tlb_flush(cs);
> 
> I think this is a mistake.
> 
> (1) If tcg module is not enabled, we should be able to make a direct call.
> 
> So IMO we want to retain the direct function call syntax in all the uses.  I
> think you want to put wrapper functions doing the indirection somewhere --
> possibly tcg-module.c.

Hmm, when we want avoid indirection I guess it makes sense to use inline
wrappers in tcg-module.h

How about the patch below? (proof-of-concept for tlb_flush, on top of
this series)?

thanks,
  Gerd

From 22f5a216f410fccb769d0f7496c3c36f4b131833 Mon Sep 17 00:00:00 2001
From: Gerd Hoffmann <kraxel@redhat.com>
Date: Tue, 28 Sep 2021 11:51:12 +0200
Subject: [PATCH] tlb_flush inline wrapper

---
 include/exec/exec-all.h  |  2 ++
 include/tcg/tcg-module.h | 13 +++++++++++++
 meson.build              |  3 ++-
 3 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index 608d768a4371..72e4e3b5bb89 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -160,7 +160,9 @@ void tlb_flush_page_all_cpus_synced(CPUState *src, target_ulong addr);
  * so this is generally safe. If more selective flushing is required
  * use one of the other functions for efficiency.
  */
+#ifdef TCG_DIRECT_CALL
 void tlb_flush(CPUState *cpu);
+#endif
 /**
  * tlb_flush_all_cpus:
  * @cpu: src CPU of the flush
diff --git a/include/tcg/tcg-module.h b/include/tcg/tcg-module.h
index e9c0615b51d9..b3c0f53ea9f3 100644
--- a/include/tcg/tcg-module.h
+++ b/include/tcg/tcg-module.h
@@ -1,6 +1,10 @@
 #ifndef TCG_MODULE_H
 #define TCG_MODULE_H
 
+#if defined(CONFIG_TCG_BUILTIN) || defined(TCG_MODULE)
+# define TCG_DIRECT_CALL 1
+#endif
+
 #include "exec/exec-all.h"
 
 struct TCGModuleOps {
@@ -21,4 +25,13 @@ struct TCGModuleOps {
 };
 extern struct TCGModuleOps tcg;
 
+#ifndef TCG_DIRECT_CALL
+
+static inline void tlb_flush(CPUState *cpu)
+{
+    tcg.tlb_flush(cpu);
+}
+
+#endif
+
 #endif /* TCG_MODULE_H */
diff --git a/meson.build b/meson.build
index 15ef4d3c4187..afe07e7d59c3 100644
--- a/meson.build
+++ b/meson.build
@@ -2317,8 +2317,9 @@ subdir('tests/qtest/libqos')
 subdir('tests/qtest/fuzz')
 
 # accel modules
+tcg_module_cflags = declare_dependency(compile_args: '-DTCG_MODULE=1')
 tcg_real_module_ss = ss.source_set()
-tcg_real_module_ss.add_all(when: 'CONFIG_TCG_MODULAR', if_true: tcg_module_ss)
+tcg_real_module_ss.add_all(when: ['CONFIG_TCG_MODULAR', tcg_module_cflags], if_true: tcg_module_ss)
 specific_ss.add_all(when: 'CONFIG_TCG_BUILTIN', if_true: tcg_module_ss)
 target_modules += { 'accel' : { 'qtest': qtest_module_ss,
                                 'tcg': tcg_real_module_ss }}
-- 
2.31.1


