Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9802446FCC1
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 09:30:05 +0100 (CET)
Received: from localhost ([::1]:39276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvbI4-0006x2-Du
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 03:30:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoj-0006mv-R1
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:45 -0500
Received: from [2607:f8b0:4864:20::433] (port=43784
 helo=mail-pf1-x433.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <frank.chang@sifive.com>)
 id 1mvaoh-00072J-Uh
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 02:59:45 -0500
Received: by mail-pf1-x433.google.com with SMTP id k26so7742094pfp.10
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 23:59:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XZL0vHwErqt2DCDapRPpE+y8AgaRUbb713wyO3FaWts=;
 b=HBt+sB9FfROapy5IaHcAThNXvyJVU769wQzChB5F2cayXQp2CSDGadQ0TLYe6/okOS
 0+mHRel4EyZeyigU1OD7pUSGBVsMDqq3aHGo7+xco5Aq3F6nUQ30sxVYCQIyRNx3kYcZ
 Y3iNfF4xJOE8GZqLdr3tl0VKhENi9TF6ophahk9zrIO3LnvL5iRM5iNDzS6ePv8v874o
 peU9mMZ2bCwiG8OnxzKdOlmw0tG0/VQfhPM0ZmsHW3uZwpNu+2XB5lMGDF95EYBXhZqW
 dBsXQBY4ZK/p9OCx+oOXyACd9XVo1CmpqooW5IZ/FH58EB+ONmGIw8nIOfXCmktpeZXK
 RV3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XZL0vHwErqt2DCDapRPpE+y8AgaRUbb713wyO3FaWts=;
 b=PzR8OdTN7iCR6Lv2YIeWeOBwGjVtXLuO5U49w8GbNHn7a74qdovrO/EIV1/LzwB7oI
 O5Kfrwkb/05GaJqRb7s7NvdX9UfOvpaWNBJyk5VqzH+fk05m+87/qhExNareAHrSHI63
 6eKkzRnT/y+h0eGEJT+t0F27KbLBonIMcxUYi2c3IpVT0L0KT9y+7FwNeyhZJqlRUKbx
 nF5dh3gZ/mSHIXhSBi8vm2g5Sj17CD8Rzs8sQyuenx/jBGfE8vWskPcrsIXg6Ixo88nN
 wHZiJTGa/9rMapTRFGRyYmB84PvO9/6RDY8fyejrAU9OTp6F6sgbsDbylBNvf5DdePrz
 +aOA==
X-Gm-Message-State: AOAM533wj4LTDZzzm5KpbSNhp6nLRwRtCjvKErQoWeQH3lYlSUvuaEuu
 UNPkk0DIVXjQ3dxqW8Tg3T7VdpFy5Ru8vJHw
X-Google-Smtp-Source: ABdhPJxUwO/1YrH3bcnhKN9ktvIkuYvv7LDClidNo1ltCE1wRBiYqshSDP2EQ5yA8iYLeJb5Cx0haA==
X-Received: by 2002:a62:1cc4:0:b0:49f:99b6:3507 with SMTP id
 c187-20020a621cc4000000b0049f99b63507mr16768911pfc.76.1639123182556; 
 Thu, 09 Dec 2021 23:59:42 -0800 (PST)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id f4sm2087955pfg.34.2021.12.09.23.59.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 23:59:42 -0800 (PST)
From: frank.chang@sifive.com
To: qemu-devel@nongnu.org
Subject: [PATCH v11 50/77] target/riscv: rvv-1.0: slide instructions
Date: Fri, 10 Dec 2021 15:56:36 +0800
Message-Id: <20211210075704.23951-51-frank.chang@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211210075704.23951-1-frank.chang@sifive.com>
References: <20211210075704.23951-1-frank.chang@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::433
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=frank.chang@sifive.com; helo=mail-pf1-x433.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, Frank Chang <frank.chang@sifive.com>,
 Bin Meng <bin.meng@windriver.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frank Chang <frank.chang@sifive.com>

* Remove clear function from helper functions as the tail elements
  are unchanged in RVV 1.0.

Signed-off-by: Frank Chang <frank.chang@sifive.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/vector_helper.c | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/target/riscv/vector_helper.c b/target/riscv/vector_helper.c
index f883fdf474..d79f59e443 100644
--- a/target/riscv/vector_helper.c
+++ b/target/riscv/vector_helper.c
@@ -4430,17 +4430,22 @@ GEN_VEXT_VSLIDEUP_VX(vslideup_vx_d, uint64_t, H8)
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
2.31.1


