Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 720DB4D07BA
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 20:30:30 +0100 (CET)
Received: from localhost ([::1]:57004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRJ3t-0007XN-IB
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 14:30:29 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIqF-00070L-0Y; Mon, 07 Mar 2022 14:16:23 -0500
Received: from [2607:f8b0:4864:20::235] (port=43748
 helo=mail-oi1-x235.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nRIqD-0005yE-HW; Mon, 07 Mar 2022 14:16:22 -0500
Received: by mail-oi1-x235.google.com with SMTP id w127so5917736oig.10;
 Mon, 07 Mar 2022 11:16:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cL3cI4FY/fVeRwL4pUn2Dy69CS535x5dvlyRPTrkSFg=;
 b=NOq63a0Mq0Hpus8WoOTnG/jYruqD9s0tgcRCQApQL5OuvZ1SUh3CFsxt6vX/BYZHG9
 UafbyckR3du3QXC5b+Mh6j4qpCaRv0cRA/3t0Wv9GTgl8upj+82njTsb9WlFvufqVwGC
 3aKzQTHaGfxF2NVS0ovqTPCdSB9b1gS5SjVx4fDx6CgupRTiMHnIXR+IbPh4ee9ON2AV
 wzEdgqKMF8Su0XcrbjZtdMw7dv2sOItSNVq2dHwwwt6madbVEV/F4dp2V9EDe4ep2pUn
 5/Mb0hyKOPpZIjLHLbcH4Qu5NW0bQsUwzU1ZjfmEAN65YIn9j21KO4w5xcvWR3lG5G75
 4k6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cL3cI4FY/fVeRwL4pUn2Dy69CS535x5dvlyRPTrkSFg=;
 b=c0SX/ee05f4K+RVemk1JdfE8TrziJvz3b2byzkBWzw3qiPn/pn5ZJNMn43/uupjO/o
 hwpLom79Uaz5A1MDWBJ5qRBl+sH5XgWprB25OK50kByRdCQ6+0AmE3GD86S6ztssHrJj
 u6jw/LyDS8qwfCQ+AdgqkeeOBLjmaxx/LMBUL1p6yZ1qoC6pu+vXAyVHa+MHusIDea2p
 OxkXO0+qJ1TDHTPP58KPo9IANAAGzvyf4EHWngU1Hsv+8g+VWiSuPZt0F3EzWKzzBj5B
 W6Vdl7i0VP+FxbNanH77jkCyL8pqvWMie3ov341BSMGO2pgfbwM2B0xaDF0aK3cZI3r1
 thFg==
X-Gm-Message-State: AOAM533c1XtdH8I0IPI+RS1Offa6EhzGu6cTaGvX9lp6gJYCJEWv/LH/
 OzVB7rpMK6GWw6RpMi5J6rV60fR7U4o=
X-Google-Smtp-Source: ABdhPJx1Qd5YJhYPksXN864qe8T07TobDaXUC0WXkoEMv6LUtF4fHryDo0hT/WsjHE7hxb+lEfu8DA==
X-Received: by 2002:a05:6808:1586:b0:2d5:1211:5785 with SMTP id
 t6-20020a056808158600b002d512115785mr313675oiw.0.1646680580118; 
 Mon, 07 Mar 2022 11:16:20 -0800 (PST)
Received: from rekt.ibmuc.com ([2804:431:c7c7:3b4a:a86f:f27d:30ef:6eb6])
 by smtp.gmail.com with ESMTPSA id
 t40-20020a05680815a800b002d48ffad94bsm7283093oiw.2.2022.03.07.11.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Mar 2022 11:16:19 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] hw/ppc/spapr_hcall.c: log H_GET_PPP as unsupported
Date: Mon,  7 Mar 2022 16:15:52 -0300
Message-Id: <20220307191553.429236-9-danielhb413@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220307191553.429236-1-danielhb413@gmail.com>
References: <20220307191553.429236-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::235
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
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

H_GET_PPP is a SPLPAR hcall that we aren't able to support because, at
least for now, we can't retrieve any performance metrics of the
partition.

Mark it as unsupported.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/spapr_hcall.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index fdce44daf7..f7240fbd41 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -638,6 +638,21 @@ static target_ulong h_prod(PowerPCCPU *cpu, SpaprMachineState *spapr,
     return H_SUCCESS;
 }
 
+static target_ulong h_get_ppp(PowerPCCPU *cpu,
+                              SpaprMachineState *spapr,
+                              target_ulong opcode,
+                              target_ulong *args)
+{
+    /*
+     * H_GET_PPP (partition performance parameters) isn't supported
+     * the same way h_get_em_parms or any other performance/metric
+     * related HCALL is not supported in QEMU.
+     */
+    qemu_log_mask(LOG_UNSUPP, "Unsupported SPAPR hcall 0x"TARGET_FMT_lx"%s\n",
+                  opcode, " (H_GET_PPP)");
+    return H_FUNCTION;
+}
+
 static target_ulong h_rtas(PowerPCCPU *cpu, SpaprMachineState *spapr,
                            target_ulong opcode, target_ulong *args)
 {
@@ -1894,6 +1909,7 @@ static void hypercall_register_types(void)
     spapr_register_hypercall(H_CEDE, h_cede);
     spapr_register_hypercall(H_CONFER, h_confer);
     spapr_register_hypercall(H_PROD, h_prod);
+    spapr_register_hypercall(H_GET_PPP, h_get_ppp);
 
     /* hcall-join */
     spapr_register_hypercall(H_JOIN, h_join);
-- 
2.35.1


