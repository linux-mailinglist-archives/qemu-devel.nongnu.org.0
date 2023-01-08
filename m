Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA236616D7
	for <lists+qemu-devel@lfdr.de>; Sun,  8 Jan 2023 17:49:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEYqJ-0006md-0G; Sun, 08 Jan 2023 11:48:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYqH-0006jk-5p
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:48:17 -0500
Received: from mail-qt1-x835.google.com ([2607:f8b0:4864:20::835])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cota@braap.org>) id 1pEYqF-0000RF-Kc
 for qemu-devel@nongnu.org; Sun, 08 Jan 2023 11:48:16 -0500
Received: by mail-qt1-x835.google.com with SMTP id a16so6066010qtw.10
 for <qemu-devel@nongnu.org>; Sun, 08 Jan 2023 08:48:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=braap-org.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aaox4hWeUonfLH9h27CRl8dbbaN6wq8FriB4sD8Tzls=;
 b=cs8ThutuSniVZr9lXiuMr2nxzejs1YJPLGfk+HJmL6t9qhUUdTAjOX2tg6AEqsNYKH
 0xTjWBn9PmRwHWfdfnPLlLwUuPo5f30gPA+cGIi2M8bsSsKD6G3sy/QvIorKZuezZ2Si
 z1awLF/QNaz+p+e1PJO/ups7/zXSRwJvFlDznslzwAldP1Q8aSs6Fs+AmteM+atq0xt4
 O+zRT6jW8F6XzhMVN95tKM8BSmrEbYiaspxDqBN813IgK4cA4AAA7k48iGrum8+BF1d8
 /m0KYLv5ssn+HuuBc+9GDD/xtCUXdcA57uT/vRBHUyiLakBdxmeN4KqZnGsVBafzzFMX
 5mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aaox4hWeUonfLH9h27CRl8dbbaN6wq8FriB4sD8Tzls=;
 b=fShNzRmicXQT5+r6igJR8uh0FJXTYFvSkjnm/VqJnSCexiw5wpwNndHsjZp2VLSavy
 W3FmuQ3OPtHH/VU+q1ulfRp2E9vp72nYWOgKf8aqalTPYgQzXZOVLPq/HQ57WGDqYB5B
 /oBkyfEN72/fWrLBbhVAW7CX3VNn97RzxRd+yZuoiHOjJcZdI+sUoiA4CZTxvUk04KmH
 zH7dDY8VqSGERQiLG4g1s/nXTqF0/+Io6dnsIsnV8WcgwqOV3jiKsEAtzNT//5bzOTUv
 XZdVIJSus7VfCMHRpsDXHfB6HQztzSCLl2plFsBAWDkheLL00cd+8N+Pd0uoxjWvQq1H
 gBvg==
X-Gm-Message-State: AFqh2kpt3OkdIiBagonitNde3ElHKSiXI09pEML1NSvm7GrwY/HQjX9Z
 T1JZCeyxNSl2HG6Rr6H2iY3wTeZo4mmRF6aBd9N08Q==
X-Google-Smtp-Source: AMrXdXsKSaneRLjlZbHZ+fJdM1mwTrjxWbk5PMBpMBqTyf82ZPlERlEAn8LNuiWMSOOddKjpm4+i4A==
X-Received: by 2002:ac8:4a93:0:b0:3a7:ec9b:e00b with SMTP id
 l19-20020ac84a93000000b003a7ec9be00bmr84094402qtq.68.1673196494520; 
 Sun, 08 Jan 2023 08:48:14 -0800 (PST)
Received: from localhost ([185.156.46.146]) by smtp.gmail.com with ESMTPSA id
 d8-20020ac84e28000000b0039c7b9522ecsm3423049qtw.35.2023.01.08.08.48.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 08:48:14 -0800 (PST)
From: Emilio Cota <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Aaron Lindsay <aaron@os.amperecomputing.com>, Emilio Cota <cota@braap.org>
Subject: [PATCH 3/4] tcg: exclude lookup_tb_ptr from helper instrumentation
Date: Sun,  8 Jan 2023 11:47:30 -0500
Message-Id: <20230108164731.61469-4-cota@braap.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230108164731.61469-1-cota@braap.org>
References: <20230108164731.61469-1-cota@braap.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: softfail client-ip=2607:f8b0:4864:20::835;
 envelope-from=cota@braap.org; helo=mail-qt1-x835.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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

It is internal to TCG and therefore we know it does not
access guest memory.

Related: #1381

Signed-off-by: Emilio Cota <cota@braap.org>
---
 tcg/tcg.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tcg/tcg.c b/tcg/tcg.c
index da91779890..ee67eefc0c 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1652,8 +1652,10 @@ void tcg_gen_callN(void *func, TCGTemp *ret, int nargs, TCGTemp **args)
     op = tcg_op_alloc(INDEX_op_call, total_args);
 
 #ifdef CONFIG_PLUGIN
-    /* detect non-plugin helpers */
-    if (tcg_ctx->plugin_insn && unlikely(strncmp(info->name, "plugin_", 7))) {
+    /* flag helpers that are not internal to TCG */
+    if (tcg_ctx->plugin_insn &&
+        strncmp(info->name, "plugin_", 7) &&
+        strcmp(info->name, "lookup_tb_ptr")) {
         tcg_ctx->plugin_insn->calls_helpers = true;
     }
 #endif
-- 
2.34.1


