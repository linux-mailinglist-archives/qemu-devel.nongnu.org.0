Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC1D0518EB4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 22:28:59 +0200 (CEST)
Received: from localhost ([::1]:42284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlz8k-0006e5-Nt
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 16:28:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZS-0007i5-F5
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:31 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:41745)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nlyZQ-00067g-RR
 for qemu-devel@nongnu.org; Tue, 03 May 2022 15:52:30 -0400
Received: by mail-pg1-x536.google.com with SMTP id t13so14802932pgn.8
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 12:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=imisZyWOU+HOiAHcCce7P36gJQd/+JzsQTknZrdoLJI=;
 b=eAi0YPW01H5a0onB+LHOge9T2anERQQxVGLvF+6xcK9X3Vno8tfitnCe63mixRDxiB
 bq6mvX9THRspYp2MDfwAnlKiAQ75hD86P274d7+EzBLsBsKkGsBOe3SnJLuZ1q2uTuXq
 n/v5a1SuyKayplF0ozD+IQRc8q63SYaigcUf8djkplkD8n8248XBSSl+mudUbIGKNHbs
 7AG08Ie/4XKdCpULyPVJU2+HfpvTV4R2mPlJx+7unjtrGRpkleS+RloU/NBFreCrS3o5
 OUlGmS53NOjlmc8BjSJ2wvClYOUoXqjV5Jzm6ktQU15kigCI7IqonWrPEdqqI0cimXf+
 DCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=imisZyWOU+HOiAHcCce7P36gJQd/+JzsQTknZrdoLJI=;
 b=BdZD3hLRdizjS51j4iv7IvizYvdBujuQ0Yoaspu+/FOzg0uWXD9lvOUtftO16/hjEV
 wKcjZj0vtkk7EFCpUnJXpp9oWeo6jjTMxR4D3Pcc87N+7ux3nIQ0d3dNi8zkdG2DwtxQ
 1bR8+4BWTpAGyv9CIqI7iS1qFqXWhzOlZpI0Oxln/iLbYG5rKJWQhqMXmJDNFIwW8vLj
 S70WzAA/elH0C5QzFJEA3qAF4khJFolAADgtvF0qAjJKIGnr2UGlC5kEbdW8/2tyo0Kl
 PzHj5swNeeXzxVOGZBjTpX3JuPqaXxQt3a90pzeC4l8Ze5cuvDsZkiIDakoTsVQGq5VR
 14vA==
X-Gm-Message-State: AOAM532rZN52L6aaM6H62SNAiDzrkAhbyCe8HFrE2J/FtJ0YSHjK9r6W
 OXJ+0CEp+nzVhAwLgLlMRIZpSaYsXiOr3g==
X-Google-Smtp-Source: ABdhPJyEMGnDpgAXCwbAgtV0GtcVOcAFCnYtl2FgU1r1shVTngHdy6DrZ9eKBG+wYetARbQw2hvxCg==
X-Received: by 2002:a63:2b05:0:b0:3c2:3ed1:5fa9 with SMTP id
 r5-20020a632b05000000b003c23ed15fa9mr7681135pgr.220.1651607547367; 
 Tue, 03 May 2022 12:52:27 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 fz16-20020a17090b025000b001dbe11be891sm1692286pjb.44.2022.05.03.12.52.26
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 12:52:26 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 42/74] semihosting: Use console_in_gf for SYS_READC
Date: Tue,  3 May 2022 12:48:11 -0700
Message-Id: <20220503194843.1379101-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220503194843.1379101-1-richard.henderson@linaro.org>
References: <20220503194843.1379101-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 semihosting/arm-compat-semi.c | 27 ++++++++++++++++++---------
 1 file changed, 18 insertions(+), 9 deletions(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index d60f7ed6a4..34d635006d 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -293,6 +293,22 @@ common_semi_flen_fstat_cb(CPUState *cs, uint64_t ret, int err)
     common_semi_cb(cs, ret, err);
 }
 
+static void
+common_semi_readc_cb(CPUState *cs, uint64_t ret, int err)
+{
+    if (!err) {
+        CPUArchState *env G_GNUC_UNUSED = cs->env_ptr;
+        uint8_t ch;
+
+        if (get_user_u8(ch, common_semi_stack_bottom(cs) - 1)) {
+            ret = -1, err = EFAULT;
+        } else {
+            ret = ch;
+        }
+    }
+    common_semi_cb(cs, ret, err);
+}
+
 #define SHFB_MAGIC_0 0x53
 #define SHFB_MAGIC_1 0x48
 #define SHFB_MAGIC_2 0x46
@@ -418,15 +434,8 @@ void do_common_semihosting(CPUState *cs)
         break;
 
     case TARGET_SYS_READC:
-        {
-            uint8_t ch;
-            int ret = qemu_semihosting_console_read(cs, &ch, 1);
-            if (ret == 1) {
-                common_semi_cb(cs, ch, 0);
-            } else {
-                common_semi_cb(cs, -1, EIO);
-            }
-        }
+        semihost_sys_read_gf(cs, common_semi_readc_cb, &console_in_gf,
+                             common_semi_stack_bottom(cs) - 1, 1);
         break;
 
     case TARGET_SYS_ISERROR:
-- 
2.34.1


