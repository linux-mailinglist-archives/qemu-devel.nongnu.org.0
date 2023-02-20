Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A011E69D2EE
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:44:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB7h-00057z-JB; Mon, 20 Feb 2023 13:42:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6Y-0004YP-A3
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:41 -0500
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6M-000475-Vt
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:33 -0500
Received: by mail-pl1-x630.google.com with SMTP id e5so3551600plg.8
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xeg/0EdSZC28AvGMk7qqsjE82NOjaTkrGHHmkOUC36U=;
 b=mqXC4PcmX7t3gCsr8WGoGFmpbnxBnHgJ+Q3zi9WwJf3yi+b52e7MivXpzNBtNlVI7E
 Jnj5NkKiiSX3CKLDBJ9s/hEy7PQ/yne7BcOICV1yYCQ1FQy9pyEVHBS/hw7wHQw+J6z/
 u1xUZfSzdQIXvS4b1ClLbrdzvahpPb68hi2ZoIeiynte/e2kuwMbXgL+ZjLwvWBJTsHE
 eXOjgtrYfTU5+cINSQSmdhJmAihzJzA7BP2p7fdr05Qviu+FGp9JEt9vmnlp8yHJwaGS
 9lVxJ91tn5NlfZpFLRTn/ZXXYSRPJJZp2DeNrn7rNxevepHrFzgsbB4eRbn7Y06swFr/
 IrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xeg/0EdSZC28AvGMk7qqsjE82NOjaTkrGHHmkOUC36U=;
 b=XKAKR6N27uxYdtgfZEUx9I8Ipjy9hsd4DJPXr7RDGYduw4o6OOEl0FpjHzVjSwlpuM
 6cPOXC5i+IeJ++CvBXxF53TLA3mm6i2LN31y00PvrAcMjaNGrxe/dk6O3anmK1/CZexD
 I9VnsRf3W7VIdKtK2gRRPPQg/2K5/EZBIeRtXl10HoVrQKZ4jo0Up/y6n0rv5LgZQnNq
 5SM3KMqzuPnUtibAk6rOjlu8hEW1JZIQprSetBtFN29ycbK/kuwd/Z9ONhOLh2EQZv5b
 TTRjWejNvLgbprIFg7CsMwFVgcXzRAKj3UKs11LKgOgfJc7eKdI+5GZ7zACQGjnaW2W5
 LKpg==
X-Gm-Message-State: AO0yUKX7HtIbba3B9+MM65mTCpVkefVTh+pMPTLsFnOOGe0kxKvPOU67
 HtjLjgZD3uUdCdJf/Yxr3OxYUk6iF9bwlHYpcJE=
X-Google-Smtp-Source: AK7set89+uV444LHJwwuPTfPKPvwy2vNIrqmklOJH4U9/3nEm6jL7bQ6O0CPg0bFiNwgwm5fqVnlyQ==
X-Received: by 2002:a17:902:d48b:b0:19a:a810:51b with SMTP id
 c11-20020a170902d48b00b0019aa810051bmr2234645plg.63.1676918474961; 
 Mon, 20 Feb 2023 10:41:14 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:14 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v4 10/27] target/s390x: Use gen_psw_addr_disp in
 pc_to_link_info
Date: Mon, 20 Feb 2023 08:40:35 -1000
Message-Id: <20230220184052.163465-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is slightly more complicated than a straight displacement
for 31 and 24-bit modes.  Dont bother with a cant-happen assert.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 3dbbcfd2d3..027a5b0673 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -176,17 +176,20 @@ static void gen_psw_addr_disp(DisasContext *s, TCGv_i64 dest, int64_t disp)
 
 static void pc_to_link_info(TCGv_i64 out, DisasContext *s)
 {
-    uint64_t pc = s->pc_tmp;
+    TCGv_i64 tmp;
 
-    if (s->base.tb->flags & FLAG_MASK_32) {
-        if (s->base.tb->flags & FLAG_MASK_64) {
-            tcg_gen_movi_i64(out, pc);
-            return;
-        }
-        pc |= 0x80000000;
+    if (s->base.tb->flags & FLAG_MASK_64) {
+        gen_psw_addr_disp(s, out, s->ilen);
+        return;
     }
-    assert(!(s->base.tb->flags & FLAG_MASK_64));
-    tcg_gen_deposit_i64(out, out, tcg_constant_i64(pc), 0, 32);
+
+    tmp = tcg_temp_new_i64();
+    gen_psw_addr_disp(s, tmp, s->ilen);
+    if (s->base.tb->flags & FLAG_MASK_32) {
+        tcg_gen_ori_i64(tmp, tmp, 0x80000000);
+    }
+    tcg_gen_deposit_i64(out, out, tmp, 0, 32);
+    tcg_temp_free_i64(tmp);
 }
 
 static TCGv_i64 psw_addr;
-- 
2.34.1


