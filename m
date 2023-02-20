Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF2469D2FB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 19:45:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUB89-0005tU-7Q; Mon, 20 Feb 2023 13:43:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6Y-0004YN-9e
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:40 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUB6M-00046l-E6
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 13:41:33 -0500
Received: by mail-pj1-x1030.google.com with SMTP id o16so2304832pjp.3
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 10:41:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LOOB3Z1xjodTvhYT+/+rAv7/3kmyBvt7jdZIeAngVJ8=;
 b=q45uAIVDo3UnP9Jd5GEZWKLuqkJwPqvaNk4ZU/73sJlDNRXU8BY4x3XPG7RWEPOdDR
 Q7wkyoMRQVULde7cOXVGHwSUyXhixFoMPZe0mwWkaEMoMgxoR+0e+yFLu7t5+Wf68fyd
 yjCKQ0EdmtI8hwVkgEPHNe8UbJsQLjz/l716dvDjKmAsXH1mgYXOfTT/9iJeP4LjTcYN
 wQsSnshDwCyo/ZGakmJNE2NuIWP2dpflLxSLMVzSWAETbzYw1SLyULSmvbVc6U+LPgqk
 feS59HMJtx6hD0usGsP3ztVoF4U9gpfz7e22R3aT6soOCSHtMS53dH9E9jILi94deepP
 +smA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LOOB3Z1xjodTvhYT+/+rAv7/3kmyBvt7jdZIeAngVJ8=;
 b=Jpas4ZiQ4pmPLjeCkwclL5IBPrf7AAMmj5C8c9/R9CLw355UEkNAvNZWjAMFkMp4Yr
 3qk0LL8UWdB97RRipgR1hY2tryDR+oFfnup/+/7fuaTrRI38wq/zFxW3YnlayOvxVSnk
 zRAJNBuKic5SVwZCUphXjNipsmwvRC7EA+b0nwwGzn+NKf6fyOGgTTrGvLBYMW0xbxBN
 MG25yyDz12wKlrI8S446KscDZlHDQrzPJJtXiwmsaBteGcLoiAPh+3gq8yoatnLpNxFy
 UrcOWOC9bE4+8D9/zqQtJHUm7VvHuJJKSFX3qZ1Nfbjwiqddw1VKVE/glzQHllp3RsrI
 LlXw==
X-Gm-Message-State: AO0yUKWHYz90KPswVEStbQrxqqKS+m6T1OwWuz0/V9d3PIN6pBPrTayY
 ZOy57TYUPreCQd6u3JURFUcpKCHHij/bxc/4xOQ=
X-Google-Smtp-Source: AK7set8dhYNNoxYOKM22GA1Bub7n2FB2pZPhQGx44LKCQql7tzrlU/SEaWyA8+lcZkukbYSFsQAkKw==
X-Received: by 2002:a17:903:24e:b0:19c:32b1:185d with SMTP id
 j14-20020a170903024e00b0019c32b1185dmr2899401plh.39.1676918473368; 
 Mon, 20 Feb 2023 10:41:13 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 jk20-20020a170903331400b0019258bcf3ffsm1911676plb.56.2023.02.20.10.41.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 10:41:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com, qemu-s390x@nongnu.org,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH v4 09/27] target/s390x: Remove pc argument to pc_to_link_into
Date: Mon, 20 Feb 2023 08:40:34 -1000
Message-Id: <20230220184052.163465-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230220184052.163465-1-richard.henderson@linaro.org>
References: <20230220184052.163465-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

All callers pass s->pc_tmp.

Reviewed-by: Ilya Leoshkevich <iii@linux.ibm.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 48e558a790..3dbbcfd2d3 100644
--- a/target/s390x/tcg/translate.c
+++ b/target/s390x/tcg/translate.c
@@ -174,8 +174,10 @@ static void gen_psw_addr_disp(DisasContext *s, TCGv_i64 dest, int64_t disp)
     tcg_gen_movi_i64(dest, s->base.pc_next + disp);
 }
 
-static void pc_to_link_info(TCGv_i64 out, DisasContext *s, uint64_t pc)
+static void pc_to_link_info(TCGv_i64 out, DisasContext *s)
 {
+    uint64_t pc = s->pc_tmp;
+
     if (s->base.tb->flags & FLAG_MASK_32) {
         if (s->base.tb->flags & FLAG_MASK_64) {
             tcg_gen_movi_i64(out, pc);
@@ -1549,7 +1551,7 @@ static DisasJumpType op_ni(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_bas(DisasContext *s, DisasOps *o)
 {
-    pc_to_link_info(o->out, s, s->pc_tmp);
+    pc_to_link_info(o->out, s);
     if (o->in2) {
         tcg_gen_mov_i64(psw_addr, o->in2);
         per_branch(s, false);
@@ -1564,7 +1566,7 @@ static void save_link_info(DisasContext *s, DisasOps *o)
     TCGv_i64 t;
 
     if (s->base.tb->flags & (FLAG_MASK_32 | FLAG_MASK_64)) {
-        pc_to_link_info(o->out, s, s->pc_tmp);
+        pc_to_link_info(o->out, s);
         return;
     }
     gen_op_calc_cc(s);
@@ -1594,7 +1596,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_basi(DisasContext *s, DisasOps *o)
 {
-    pc_to_link_info(o->out, s, s->pc_tmp);
+    pc_to_link_info(o->out, s);
     return help_goto_direct(s, (int64_t)get_field(s, i2) * 2);
 }
 
-- 
2.34.1


