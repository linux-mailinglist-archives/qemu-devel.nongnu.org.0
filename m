Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D6B14385A7
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Oct 2021 23:59:14 +0200 (CEST)
Received: from localhost ([::1]:45266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meP2n-0005Gn-B9
	for lists+qemu-devel@lfdr.de; Sat, 23 Oct 2021 17:59:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40794)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsm-0004aI-G8
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1meOsk-0005MB-Kk
 for qemu-devel@nongnu.org; Sat, 23 Oct 2021 17:48:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id e4so4823622wrc.7
 for <qemu-devel@nongnu.org>; Sat, 23 Oct 2021 14:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PVaCg6GCUpgKGbLvwmrR25Suk0A+VaCfoj7O99m3aJU=;
 b=QxDRmOK+MIecQYm56Q/iD3FeD3Mw4WPqXJCMWwhB30Sg5XZzeMMPBB4K+3IGtNF14U
 m5h61wzDidXAbCiqfX7jSTOkH5kJD8QsviMv0hWJLAW/ponzv6KWSK6qGoXYlFNJ2SQ6
 EvDveLwpwkINDeIQknsncxQ2UdJf8s9pipDH3xFKhLbP7G7TSXSqoA9PgkVCjqHIJABM
 Blhjoy9NdZuhjlO6fh2LpvNqNUlhHi1v6QcfD0CKsoN+NMJIpGjqs5ovO162TCJRXqq2
 tzehR32YqrzoVxF515qGA8zV7K9EnT5XUD5ex9CYsvxRGk4nkXO3T8sh19LCN897tDLz
 Ltuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=PVaCg6GCUpgKGbLvwmrR25Suk0A+VaCfoj7O99m3aJU=;
 b=Ecnb2nstzub4o2aSWBG83/+OFB2qGhuAIZuZSdEucX5N1Lk79h99M0eRlB9pqOHOWJ
 6K8x8y3D7xkfFQobs6vWG0aHaFaW77pUraZ4IDDTWE/kotBqB3ILDVmQXC3UD3pLKp7x
 4KQHbQFEt4QNMdTz0a0/BSXySzO1a0bNsZ8cLQDHMA6YNEHYeZhixjTmaxLAXyRqAwyV
 SdxzIXLfyzoMAj6ns+XaEcpkTH7jTax29IwTAAw1pTYFQSBpjuWUkf2PCwjAj6zam0Xq
 1BrPTGh9P15zgzXC7cpkLQESFGGlO5sTPzEAwg1e8UkMuNrUTFZtz4uX9XWM8Q91kOkO
 qaXg==
X-Gm-Message-State: AOAM533UdBr1EjFDpI/FS1E9GHqkeDFtyW/DJdl2QKTqu34bUz43RFx/
 29gzuw+oM4+l6D+ZPdiXT42JCEIfe0Q=
X-Google-Smtp-Source: ABdhPJystEv0Cn7c/tICY5XlHxYqVaUNT9N+6ppn444ag+u0FwCOKfY6qvouwamEVY5lr+BCA73hng==
X-Received: by 2002:adf:edd2:: with SMTP id v18mr10614122wro.104.1635025729319; 
 Sat, 23 Oct 2021 14:48:49 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 z26sm2160562wmi.45.2021.10.23.14.48.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Oct 2021 14:48:48 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/33] target/mips: Introduce generic TRANS_CHECK() for
 decodetree helpers
Date: Sat, 23 Oct 2021 23:47:39 +0200
Message-Id: <20211023214803.522078-10-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211023214803.522078-1-f4bug@amsat.org>
References: <20211023214803.522078-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Luis Pires <luis.pires@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similar to the TRANS() macro introduced in commit fb3164e412d,
introduce TRANS_CHECK() which takes a boolean expression as
argument.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 target/mips/tcg/translate.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/target/mips/tcg/translate.h b/target/mips/tcg/translate.h
index 6111493651f..3ef09cc50c9 100644
--- a/target/mips/tcg/translate.h
+++ b/target/mips/tcg/translate.h
@@ -224,6 +224,15 @@ bool decode_ext_vr54xx(DisasContext *ctx, uint32_t insn);
     static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
     { return FUNC(ctx, a, __VA_ARGS__); }
 
+#define TRANS_CHECK(NAME, CHECK_EXPR, FUNC, ...) \
+    static bool trans_##NAME(DisasContext *ctx, arg_##NAME *a) \
+    { \
+        if (!(CHECK_EXPR)) { \
+            return false; \
+        } \
+        return FUNC(ctx, a, __VA_ARGS__); \
+    }
+
 static inline bool cpu_is_bigendian(DisasContext *ctx)
 {
     return extract32(ctx->CP0_Config0, CP0C0_BE, 1);
-- 
2.31.1


