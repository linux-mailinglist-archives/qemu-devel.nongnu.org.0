Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7331B5F5FF3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 06:13:48 +0200 (CEST)
Received: from localhost ([::1]:43304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogIGZ-0003rr-Ie
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 00:13:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoI-0004A8-Js
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:36 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:46939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ogHoG-0003t4-6S
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 23:44:33 -0400
Received: by mail-pl1-x636.google.com with SMTP id l1so549693pld.13
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 20:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=1X+qhN7JnZScxVTpZC+V5LOihnVucXwspU7Ku+85/ug=;
 b=ab7xa3B6sE6YzUtDzmnBHK26zhKzxd/d2Y6WXd9KB+Dby4JJeOPRzH1M223RsX0B+d
 WXe44wxcYG6aY9xl3BHjoXsMYlL8oVwVaPP5xJbLvAbohiNh8eVINpohKjg5IR3rIXEg
 pCto4dnRIWAMw4y28pbDhk3yOFYigwKEX+Dcq2D5iUq8E7nSbNZbBSlJVZOEKf1meBTd
 j0IZjizmSXKvP5yC7Xcq4omwXgYqxQl24fcN6S5gOgFwVLbT8hXeAPfoAScFAGY1LFSv
 CM4QeC4KP4gT7YObHSM/R4mTKXgA/jYynGnEW6Mbq8q1NbKL2f0aNGhnOiGfA5CNvrBP
 qO7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=1X+qhN7JnZScxVTpZC+V5LOihnVucXwspU7Ku+85/ug=;
 b=7hgHcosmX0O+Z5VEdOqo4OFhXJZO6Rnrve2u4fJHXvpQnQx69H0abbV0QRXbP1TOce
 M8xLpCeC1uu1aL+nj7hElKoLjybnKG/lvpbQcUaHCHrSW+ALizjeuc3OrBJC4BZmh/ni
 D+Sti/ilSwwhF4w7CGVjXpffK/yRD1sQod+0xlakR+aStASkaoUr1P78pYYlQJ+SOmWk
 foWp9BY2Eou+Gt4AndUCvwBSO2RWSuC70ncN3n8EO6gijo0+QrEpgo0nwk684yQiGv6N
 lU/Alq6P6dslbh7Mn1LRzce3m7VpzWj4WHltljNS3SXkkf2GBb5MH7AJZlykw6FRgrhC
 /sPg==
X-Gm-Message-State: ACrzQf1eq12LSKWhaEiULYbw246JOT8nO5lokSEjkrnORRd+3lrUe4IE
 FQzkgpWBRGPfagp7bAmK/fgGINjEsRwVlw==
X-Google-Smtp-Source: AMsMyM7zAxfjoYtSxno1r48WwcG1DkUuNlIR3IotlAfLmKdLlfwgwYo9J1FYZvrIN1N9Qz8BJQj+Kg==
X-Received: by 2002:a17:902:c951:b0:176:d421:7502 with SMTP id
 i17-20020a170902c95100b00176d4217502mr2601586pla.72.1665027869824; 
 Wed, 05 Oct 2022 20:44:29 -0700 (PDT)
Received: from stoup.. ([2602:47:d49d:ec01:9ad0:4307:7d39:bb61])
 by smtp.gmail.com with ESMTPSA id
 y6-20020a17090ad0c600b00205f4f7a3b3sm1905086pjw.21.2022.10.05.20.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Oct 2022 20:44:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 07/26] target/s390x: Remove pc argument to pc_to_link_into
Date: Wed,  5 Oct 2022 20:44:02 -0700
Message-Id: <20221006034421.1179141-8-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006034421.1179141-1-richard.henderson@linaro.org>
References: <20221006034421.1179141-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All callers pass s->pc_tmp.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/tcg/translate.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/target/s390x/tcg/translate.c b/target/s390x/tcg/translate.c
index 47a9d87416..7c98a72ddd 100644
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
@@ -1534,7 +1536,7 @@ static DisasJumpType op_ni(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_bas(DisasContext *s, DisasOps *o)
 {
-    pc_to_link_info(o->out, s, s->pc_tmp);
+    pc_to_link_info(o->out, s);
     if (o->in2) {
         tcg_gen_mov_i64(psw_addr, o->in2);
         per_branch(s, false);
@@ -1549,7 +1551,7 @@ static void save_link_info(DisasContext *s, DisasOps *o)
     TCGv_i64 t;
 
     if (s->base.tb->flags & (FLAG_MASK_32 | FLAG_MASK_64)) {
-        pc_to_link_info(o->out, s, s->pc_tmp);
+        pc_to_link_info(o->out, s);
         return;
     }
     gen_op_calc_cc(s);
@@ -1579,7 +1581,7 @@ static DisasJumpType op_bal(DisasContext *s, DisasOps *o)
 
 static DisasJumpType op_basi(DisasContext *s, DisasOps *o)
 {
-    pc_to_link_info(o->out, s, s->pc_tmp);
+    pc_to_link_info(o->out, s);
     return help_goto_direct(s, (int64_t)get_field(s, i2) * 2);
 }
 
-- 
2.34.1


