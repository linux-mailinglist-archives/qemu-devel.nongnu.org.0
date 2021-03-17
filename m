Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F6E33F543
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Mar 2021 17:16:43 +0100 (CET)
Received: from localhost ([::1]:54586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMYqg-00023w-KW
	for lists+qemu-devel@lfdr.de; Wed, 17 Mar 2021 12:16:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCq-0005N7-Pi
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:33 -0400
Received: from mail-oi1-x22e.google.com ([2607:f8b0:4864:20::22e]:38568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lMYCh-0007Jq-AU
 for qemu-devel@nongnu.org; Wed, 17 Mar 2021 11:35:32 -0400
Received: by mail-oi1-x22e.google.com with SMTP id v192so34620947oia.5
 for <qemu-devel@nongnu.org>; Wed, 17 Mar 2021 08:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1jqdZoMkwFIBCGSsjtnW2H3IsZVrYebU0beixQQ3ds4=;
 b=isBpwSquSBoAr1jvkxnzsTUuIu3H4I3fcuL9R13x0/3jEofkfYt5QvfyME/nmu5+EY
 wUQ1RRx6qXr0/ZZqEsDWe0QatpH8fky/5iMAv30VmppvuYYkbRxtpUYTVWUDminWc0mB
 d5ViyEIjxPOuExGo5KocU4Fwxrw2mh2X/uHFrPPBlYDIZ9qAA4FyHpnVKaG3ERxfxv+A
 dHdD7go51ptR0DzsNtwpkkPazgbcCYi/Wkdnb6PKYCB2eIV/lfK3jf51fQVyriwVuaX+
 v2jy4ttMP6F6mYdHxcQ7dDh2ndx3T0CuHH8Q2gesIriaYz7q+AgVpo5V1VNgGHWdS45B
 1TOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1jqdZoMkwFIBCGSsjtnW2H3IsZVrYebU0beixQQ3ds4=;
 b=J0jHOCcn7i+M/RY/FKwQJuQGff01DFh57k06tRXNJid/BRL9HLRu5v/H5X/93r0f+N
 ymR7lN4UJU0n7ZRSdMYWnMJvYTW0YzY/Hu5A9rJ2VLJlK2n4Vnp6SGf8Y9hkmoDyy7EG
 XbzIfK1OmrZ7a+nLjhUNwUTqaUU5G4HpXqFCJ9NmcMrNOa29q5lF16InaD9f0BPKoJ4b
 QvAiN+wVH9Nuj4LAwOcabLbo3f8eh955OrRAelKBaOBlbt8KKhdC9QsBkncIWvRGmgPm
 j+xLDAEZUuYvzMYOhwQMtLkTXF0OoHRcFRvsw68P5vRPxL3sthiNP5h3mZ8SzepuDkOE
 HByg==
X-Gm-Message-State: AOAM530BuTbMLz+YmaRbOEJ4APnAKSXXiDt+vXKdd6g6FH/3TvxKHNVc
 X3R0LAmCASgA4YC2fh/tQpjoGu7L1hyqErtI
X-Google-Smtp-Source: ABdhPJytht/qlTv7V8nYGvUfess8dOZC45It1oXnYtTXA5rHd0t/cG1A0S2aUZDWT3KjAJXJOjDGVg==
X-Received: by 2002:aca:53cc:: with SMTP id h195mr3084178oib.12.1615995322316; 
 Wed, 17 Mar 2021 08:35:22 -0700 (PDT)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id i11sm8271154otp.76.2021.03.17.08.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 08:35:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/38] tcg/tci: Split out tcg_out_op_v
Date: Wed, 17 Mar 2021 09:34:42 -0600
Message-Id: <20210317153444.310566-37-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210317153444.310566-1-richard.henderson@linaro.org>
References: <20210317153444.310566-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22e;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x22e.google.com
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
Cc: peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 tcg/tci/tcg-target.c.inc | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/tcg/tci/tcg-target.c.inc b/tcg/tci/tcg-target.c.inc
index 2aa0997ae9..f93d587493 100644
--- a/tcg/tci/tcg-target.c.inc
+++ b/tcg/tci/tcg-target.c.inc
@@ -317,6 +317,15 @@ static void tcg_out_op_p(TCGContext *s, TCGOpcode op, void *p0)
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
@@ -587,8 +596,6 @@ static inline void tcg_out_call(TCGContext *s, const tcg_insn_unit *arg)
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


