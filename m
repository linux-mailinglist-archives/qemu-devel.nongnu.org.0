Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EF724623D
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 11:15:33 +0200 (CEST)
Received: from localhost ([::1]:49504 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7bEq-0005J1-C8
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 05:15:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asb-00024X-D8
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 04:52:33 -0400
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643]:42170)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1k7asZ-0005Fc-SD
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 04:52:33 -0400
Received: by mail-pl1-x643.google.com with SMTP id f5so7158442plr.9
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 01:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Vh1d/7COD/mfvW/5E0f0zDF/EMaSIZT7W/T9JzjHKBs=;
 b=W5GoLOs/btJKJj7CxNLBeaZUleEed6589Dwv59TRy5eAFWMCCemi5YNairS33JKtHV
 tO9VXfNsX6m1lf7jMhl3c7IZis2G9X74iy3/eb5wyjBOm2cUvLDNiVTePtgMe/zvzdjJ
 mJcWvUlqZFv9yG6qeq+QB1Fa6aMsBN77USeHHZKnuIL1/umAdCI1HSeRnEfeI+eS4ubn
 32byMtW+tBMeGobTOPGB/L29TzI2uFwTMSRky220svh9GAuFTsOiHW1j8YXe2+gqqDlA
 C/w/dG/4rdDwuZeFml8qOIZ8csgIejDSp0YiDHKTpcbwcXk8nma7ftJ4foz9+iliq+BS
 crNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Vh1d/7COD/mfvW/5E0f0zDF/EMaSIZT7W/T9JzjHKBs=;
 b=NMUuaoIUDgK+VSCMy0lcuD/lYgNB76HHel3QH5TqYD366OFY7K8bvEucKrjlYbSdev
 qUKkNOxjvkF6k1iQltOLsHQ8Td9xhbdQm7DV4qp8D4hocGcH2YE83i6a8P12+lvTIhh5
 WMJRUph2Ysb8Q00fBXaBjoTQ15qfH407ZYAVEIfrdBqM5xUqsSOC7OR6TRHA1vTlUeHl
 sMaPvMmGXaO90iwblKiGbJAf09wTrREgmwzwziBu7SpJFCpmZ9ko8S9iof5IdPcvmPhe
 GGkBtlKZC885RJvSMXAltCCBn3witbOOtqYJNKHueMDnatyDBsJdBgYvoGr9EKKZ0TMe
 lSlA==
X-Gm-Message-State: AOAM530aBh8IFzJ/tQdTKlLJaowoOx0SqwEgV2VvkMzwWbGrrfB/rjBV
 TUb1BpfZ3lJ6ZpBKpsKFa0lB9TprYS9UJA==
X-Google-Smtp-Source: ABdhPJz4LIE5NMu/WXB22wWYAw3eP85htRAzEICtAUKX1ePOznTNv+ZvAgCz5E7RTakymlbLuCEuKg==
X-Received: by 2002:a17:902:690a:: with SMTP id
 j10mr10483800plk.155.1597654350488; 
 Mon, 17 Aug 2020 01:52:30 -0700 (PDT)
Received: from frankchang-ThinkPad-T490.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id d9sm16478588pgv.45.2020.08.17.01.52.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 01:52:30 -0700 (PDT)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org,
	qemu-riscv@nongnu.org
Subject: [RFC v4 52/70] target/riscv: rvv-1.0: slide instructions
Date: Mon, 17 Aug 2020 16:49:37 +0800
Message-Id: <20200817084955.28793-53-frank.chang@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200817084955.28793-1-frank.chang@sifive.com>
References: <20200817084955.28793-1-frank.chang@sifive.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::643;
 envelope-from=frank.chang@sifive.com; helo=mail-pl1-x643.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: Frank Chang <frank.chang@sifive.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
---
 target/riscv/vector_helper.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index ea1715b5484..2f1460b624d 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4689,17 +4689,22 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
 void HELPER(NAME)(void *vd, void *v0, target_ulong s1, void *vs2,         \
                   CPURISCVState *env, uint32_t desc)                      \
 {                                                                         \
-    uint32_t vlmax = env_archcpu(env)->cfg.vlen;                          \
+    uint32_t vlmax = vext_max_elems(desc, ctzl(sizeof(ETYPE)));           \
     uint32_t vm = vext_vm(desc);                                          \
     uint32_t vl = env->vl;                                                \
-    target_ulong offset = s1, i;                                          \
+    target_ulong i_max, i;                                                \
                                                                           \
-    for (i = 0; i < vl; ++i) {                                            \
-        target_ulong j = i + offset;                                      \
-        if (!vm && !vext_elem_mask(v0, i)) {                              \
-            continue;                                                     \
+    i_max = MIN(s1 < vlmax ? vlmax - s1 : 0, vl);                         \
+    for (i = 0; i < i_max; ++i) {                                         \
+        if (vm || vext_elem_mask(v0, i)) {                                \
+            *((ETYPE *)vd + H(i)) = *((ETYPE *)vs2 + H(i + s1));          \
+        }                                                                 \
+    }                                                                     \
+                                                                          \
+    for (i = i_max; i < vl; ++i) {                                        \
+        if (vm || vext_elem_mask(v0, i)) {                                \
+            *((ETYPE *)vd + H(i)) = 0;                                    \
         }                                                                 \
-        *((ETYPE *)vd + H(i)) = j >= vlmax ? 0 : *((ETYPE *)vs2 + H(j));  \
     }                                                                     \
 }
 
-- 
2.17.1


