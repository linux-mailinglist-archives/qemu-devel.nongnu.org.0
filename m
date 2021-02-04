Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BBB30EA69
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 03:49:06 +0100 (CET)
Received: from localhost ([::1]:34552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7Uhd-0003eW-84
	for lists+qemu-devel@lfdr.de; Wed, 03 Feb 2021 21:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TrG-0007x4-90
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:54:58 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:36080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1l7TrE-0006Qw-Md
 for qemu-devel@nongnu.org; Wed, 03 Feb 2021 20:54:57 -0500
Received: by mail-pl1-x634.google.com with SMTP id e9so907324plh.3
 for <qemu-devel@nongnu.org>; Wed, 03 Feb 2021 17:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Vq4qc1b2g43xbe/29EXgve4/dpXJMnCEHSHrRl9cyeE=;
 b=dBleJIp7eM6v2xo8UrzFm8pRF97pLj2hzHbVsPQyAhak0swfNH7f/BryDg2sCKVb5v
 /R+aOg1OQS0ZNqCHuuFm/TUivgM7qAAsUwYyr/7VX6dkp9Ol8vW6XIogzksjQYwqLMwx
 HfkJ7sQTCzx790fRK5Xru4y4pLlQsdzrqV6R/9pt4G/1U0f3MQGqDlwPzSEIiONFH+Fb
 dejR2PBaMS1j/ign4o3pTUeZVjgxkxMTkWLVPw4WXT81bnPYz1lNA73WvR8hmrgux5qq
 2kIDQlvZV1om9754evzJ6WcJRAvFQu1KB/7zu77ZSCdKhLpzWmaNnbAuQnRcnEwR72tK
 LOmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vq4qc1b2g43xbe/29EXgve4/dpXJMnCEHSHrRl9cyeE=;
 b=jBmFt2j2s7VZ4nvJi93svZboTf+o+Q4xyIB3BQ6K/OKvcMQss79alJGgNd7iDTY6fk
 X2Z9hlNu/b7tcLhwHGJ4dy+4+HSfcoGpF5MTwXZp4Lj3AkdKzGetoO9DsgLtN39ZQ5ng
 sADD/waykNdu179MbPC9hZGYCy2+XRojxf4QwBffAum7Z7ZR5sUfRwej1R3H58ghjAiU
 b6l8TRsVsjRnbsXWdvabLJzZYPEm0m9vxAkP8tZPzuJTZEdfA8jjmkhasird1KB98T4k
 aSFav3TgDK8MmbrzRsFkHcLdgbNLoy+wtqBw+eu01GOZEe6JIuBNqAfDez/ERazlsmBR
 oz5Q==
X-Gm-Message-State: AOAM5307N0grD2+b3n5JTvIcuRNan+EgaaCBw/pRqxBdzVrThoye6KKC
 eZ/3oGrfyJ9qkh7ZML7g73Ntxqls1xv+NGF4
X-Google-Smtp-Source: ABdhPJw6N1klc+h4emQsip+AuqALJjyJ+b3DUiplUoswB3wEss0zJJ8wLxPWs2FWRPcjXdtOOJk2jA==
X-Received: by 2002:a17:902:7043:b029:df:cabc:cc97 with SMTP id
 h3-20020a1709027043b02900dfcabccc97mr5865587plt.4.1612403695211; 
 Wed, 03 Feb 2021 17:54:55 -0800 (PST)
Received: from localhost.localdomain (cpe-66-27-222-29.hawaii.res.rr.com.
 [66.27.222.29])
 by smtp.gmail.com with ESMTPSA id h23sm4176238pgh.64.2021.02.03.17.54.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Feb 2021 17:54:54 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 80/93] tcg/tci: Split out tcg_out_op_v
Date: Wed,  3 Feb 2021 15:54:52 -1000
Message-Id: <20210204015452.885290-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210204014509.882821-1-richard.henderson@linaro.org>
References: <20210204014509.882821-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: sw@weilnetz.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index f93772f01f..eeafec6d44 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -303,6 +303,15 @@ static void tcg_out_op_p(TCGContext *s, TCGOpcode op, void *p0)
     old_code_ptr[1] = s->code_ptr - old_code_ptr;
 }
 
+static void tcg_out_op_v(TCGContext *s, TCGOpcode op)
+{
+    uint8_t *old_code_ptr = s->code_ptr;
+
+    tcg_out_op_t(s, op);
+
+    old_code_ptr[1] = s->code_ptr - old_code_ptr;
+}
+
 static void tcg_out_op_rr(TCGContext *s, TCGOpcode op, TCGReg r0, TCGReg r1)
 {
     uint8_t *old_code_ptr = s->code_ptr;
@@ -587,8 +596,6 @@ static void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
 static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
                        const int *const_args)
 {
-    uint8_t *old_code_ptr = s->code_ptr;
-
     switch (opc) {
     case INDEX_op_exit_tb:
         tcg_out_op_p(s, opc, (void *)args[0]);
@@ -725,8 +732,7 @@ static void tcg_out_op(TCGContext *s, TCGOpcode opc, const TCGArg *args,
         break;
 
     case INDEX_op_mb:
-        tcg_out_op_t(s, opc);
-        old_code_ptr[1] = s->code_ptr - old_code_ptr;
+        tcg_out_op_v(s, opc);
         break;
 
     case INDEX_op_mov_i32:  /* Always emitted via tcg_out_mov.  */
-- 
2.25.1


