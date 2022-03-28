Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C64D4E97FF
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 15:24:33 +0200 (CEST)
Received: from localhost ([::1]:55544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYpMG-00038L-0W
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 09:24:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nYoyA-0005Jr-GY; Mon, 28 Mar 2022 08:59:40 -0400
Received: from [2607:f8b0:4864:20::329] (port=40560
 helo=mail-ot1-x329.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nYoy4-0001lJ-QU; Mon, 28 Mar 2022 08:59:36 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 o20-20020a9d7194000000b005cb20cf4f1bso10597058otj.7; 
 Mon, 28 Mar 2022 05:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=c3GuDjYV8+CvKwjXT3Es7dS2kO+26fJurI7bCchoVSY=;
 b=TUc3ptStE6Pa7KKOiV0x4x/abx7e6aEcRwdWpKdP64P39p6K1HyM3G+JfkwMw20EsJ
 W6GoQ1Ji0wmLOoAuyG/zlgghzTxXuUJtNBp3LOoubqHOsTfl0Dl5oOCac711A1f2mZ9A
 WwrZ4m4pB01/YR3G3DaMYdzHkDOMaVDOBgntiY3MOAkc5tNn2n6gkiH8yvAuKFLHMHZg
 AX/4MdmcnIR3V10qqfMR2VF5Yp8hEEIDKJCQrwgIm7qn1+vatPhh5QpqfmomS0zkSi8B
 V9KkJCUXZeeoy+IF2URezwN1mE1SDkk7noZeUCU62HfnCH5Vn2AjGNLgZdivTPyEK79x
 l39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=c3GuDjYV8+CvKwjXT3Es7dS2kO+26fJurI7bCchoVSY=;
 b=BIKuX9ST/H5g4UxCI22pwaSCx2TJQTZY4i2pDZsn2ob70g6k82ei4bFSVP+0SYcvND
 w4RpA8lLeoyvufgU71nfwpPmfkJHE9Pkr1JmLBBZHN9QWs3SPWxKwXCygXwYFcRxuTCF
 YMb3I65hGman/dfTi2La5OjcplP/xQTwF7RW54GzY6aD6jfn+fo1UIOfXKbvMEAqP5lP
 /jg44r3XH1oUsQXfU9bsNEauz8gVopq9iQs753jUecEOms4MEoJPb+OqwQwWnoQO5aL/
 vxbQjT/W5wqb23cP6vEoTVwVzpDOrVG+FUudfIXxUocCPzGVpzOB9YvLcPtJ3Z0gYL5z
 muUQ==
X-Gm-Message-State: AOAM5303l0Wn/kNG8fe/Zsia26boYLfzzX4B0jargTYo4mTrMBqnom4V
 1okvkMOfnmtHHDwInDGhtV+V0iqvibU=
X-Google-Smtp-Source: ABdhPJycnXNmTdcHlf6ZT49Tq3fNC7oJ5lhFcUeSthSjvP+4bM0TK795L+TFp0WhqvL5x7mrH+Omvw==
X-Received: by 2002:a9d:5e15:0:b0:5b2:5125:fd09 with SMTP id
 d21-20020a9d5e15000000b005b25125fd09mr9993915oti.129.1648472370757; 
 Mon, 28 Mar 2022 05:59:30 -0700 (PDT)
Received: from rekt.ibmuc.com ([2804:431:c7c7:8271:32d5:64c:7754:f033])
 by smtp.gmail.com with ESMTPSA id
 e9-20020a056820060900b003216277bfdasm6950698oow.19.2022.03.28.05.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 05:59:30 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] hw/ppc: free env->tb_env in spapr_unrealize_vcpu()
Date: Mon, 28 Mar 2022 09:59:18 -0300
Message-Id: <20220328125918.494787-3-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328125918.494787-1-danielhb413@gmail.com>
References: <20220328125918.494787-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::329
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x329.google.com
X-Spam_score_int: -3
X-Spam_score: -0.4
X-Spam_bar: /
X-Spam_report: (-0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.659,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The timebase is allocated during spapr_realize_vcpu() and it's not
freed. This results in memory leaks when doing vcpu unplugs:

==636935==
==636935== 144 (96 direct, 48 indirect) bytes in 1 blocks are definitely lost in loss record 6
,461 of 8,135
==636935==    at 0x4897468: calloc (vg_replace_malloc.c:760)
==636935==    by 0x5077213: g_malloc0 (in /usr/lib64/libglib-2.0.so.0.6400.4)
==636935==    by 0x507757F: g_malloc0_n (in /usr/lib64/libglib-2.0.so.0.6400.4)
==636935==    by 0x93C3FB: cpu_ppc_tb_init (ppc.c:1066)
==636935==    by 0x97BC2B: spapr_realize_vcpu (spapr_cpu_core.c:268)
==636935==    by 0x97C01F: spapr_cpu_core_realize (spapr_cpu_core.c:337)
==636935==    by 0xD4626F: device_set_realized (qdev.c:531)
==636935==    by 0xD55273: property_set_bool (object.c:2273)
==636935==    by 0xD523DF: object_property_set (object.c:1408)
==636935==    by 0xD588B7: object_property_set_qobject (qom-qobject.c:28)
==636935==    by 0xD52897: object_property_set_bool (object.c:1477)
==636935==    by 0xD4579B: qdev_realize (qdev.c:333)
==636935==

Fix it by calling cpu_ppc_tb_free() in spapr_unrealize_vcpu().

Fixes: 6f4b5c3ec590 ("spapr: CPU hot unplug support")
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_cpu_core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/hw/ppc/spapr_cpu_core.c b/hw/ppc/spapr_cpu_core.c
index ed84713960..8a4861f45a 100644
--- a/hw/ppc/spapr_cpu_core.c
+++ b/hw/ppc/spapr_cpu_core.c
@@ -189,10 +189,13 @@ static const VMStateDescription vmstate_spapr_cpu_state = {
 
 static void spapr_unrealize_vcpu(PowerPCCPU *cpu, SpaprCpuCore *sc)
 {
+    CPUPPCState *env = &cpu->env;
+
     if (!sc->pre_3_0_migration) {
         vmstate_unregister(NULL, &vmstate_spapr_cpu_state, cpu->machine_data);
     }
     spapr_irq_cpu_intc_destroy(SPAPR_MACHINE(qdev_get_machine()), cpu);
+    cpu_ppc_tb_free(env);
     qdev_unrealize(DEVICE(cpu));
 }
 
-- 
2.35.1


