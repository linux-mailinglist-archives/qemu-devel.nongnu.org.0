Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 950324D4705
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Mar 2022 13:31:26 +0100 (CET)
Received: from localhost ([::1]:49748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSHwz-0005zF-Lo
	for lists+qemu-devel@lfdr.de; Thu, 10 Mar 2022 07:31:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0m-0002Vt-OI
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:17 -0500
Received: from [2607:f8b0:4864:20::1029] (port=34518
 helo=mail-pj1-x1029.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nSH0l-0008Sq-8Y
 for qemu-devel@nongnu.org; Thu, 10 Mar 2022 06:31:16 -0500
Received: by mail-pj1-x1029.google.com with SMTP id
 k5-20020a17090a3cc500b001befa0d3102so6097687pjd.1
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 03:31:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aUIv8mPilapal9RFUm8fJDHj8xhqXeKP3105ESvQPFk=;
 b=rJQWPPJXwXzp9TRp24MRTjirq45N7llzkfCJ+J7PrKc0wAgDdUm7iJ36QOEAz91ed5
 qy9CySuBpZJKUVt0T5ho7SdjC/7o5cdka+t/ZAzGP29Q1OxVvAORXGVe1mZ5RKvP8s2k
 F7+A7m0Sri8sCUWRoNlK7/+j8y+dlZzykRZA/EnPa47Lr73L/5N1XyKhE0MzKGpPj41B
 z6nwkYeDiRwdgROUOOuCHPd+GTu5SZAkfBkOyI/k8vDNl62UVaN14TGPuZO2QEJOEvdI
 FdTLYyPKcGLYTsyM4ByASPZQTW/4ZRORHKZL6v9E8VxhAbR6swi2VCq7ntiTqEZ4l54f
 YOEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aUIv8mPilapal9RFUm8fJDHj8xhqXeKP3105ESvQPFk=;
 b=eZ49sl2iTPp6bQZtJRQWvYyUc8f0FlEKpCw0LsqrG+SZ5+NCIGYympcDs/YlSWRAu/
 YdXHAj5xLZectueDAHlzX3EjqNMtM6AtjuUWrkniJM0IRKcHxGDrGqPaoEktZbQdzQfi
 SvRB9GLkOdN388NALnBJ8p/gUQDTLXEmijHJXvvxqIIqzjR7blp/8mlJmNNtT3mQj/Rh
 rGVhCItq98JYHI/4R3BEM/YpKtOUn8EZMBgQrZhjYFm/479q8vdyIR5XDCJJieaDNmbJ
 4PnDneJcyu9n1dW5OGLiMymr3Sj7Gvwl0kpjw6o0tWQ1J4Sdbm+83CiOrEn6uNxHpb0g
 wgcw==
X-Gm-Message-State: AOAM530FfE6WvjJnIS8ZRmgi6iOMmWXjxTX29PJZuQVgl74jJ7aq7UkM
 KpJaIk+fpmj5Nz8KF/gqgGunmfSzQRcwzQ==
X-Google-Smtp-Source: ABdhPJxJcA/W6qSp82qiQIuUQFf+lrlAGAMBCva/Z+u1AS2sLmaSCqs4/9DOwzrh9mavO/g2mbqYMA==
X-Received: by 2002:a17:90a:9ac:b0:1bf:a3e2:3f5c with SMTP id
 41-20020a17090a09ac00b001bfa3e23f5cmr4506913pjo.105.1646911872818; 
 Thu, 10 Mar 2022 03:31:12 -0800 (PST)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 e14-20020a056a001a8e00b004f75cf1ab6csm6011246pfv.206.2022.03.10.03.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Mar 2022 03:31:12 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 40/48] linux-user/nios2: Handle various SIGILL exceptions
Date: Thu, 10 Mar 2022 03:27:17 -0800
Message-Id: <20220310112725.570053-41-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220310112725.570053-1-richard.henderson@linaro.org>
References: <20220310112725.570053-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1029
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: marex@denx.de, peter.maydell@linaro.org, amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We missed out on a couple of exception types that may
legitimately be raised by a userland program.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/nios2/cpu_loop.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/linux-user/nios2/cpu_loop.c b/linux-user/nios2/cpu_loop.c
index 67220128aa..f223238275 100644
--- a/linux-user/nios2/cpu_loop.c
+++ b/linux-user/nios2/cpu_loop.c
@@ -49,6 +49,14 @@ void cpu_loop(CPUNios2State *env)
                             env->ctrl[CR_BADADDR]);
             break;
 
+        case EXCP_ILLEGAL:
+        case EXCP_UNIMPL:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_ILLOPC, env->pc);
+            break;
+        case EXCP_SUPERI:
+            force_sig_fault(TARGET_SIGILL, TARGET_ILL_PRVOPC, env->pc);
+            break;
+
         case EXCP_TRAP:
             switch (env->error_code) {
             case 0:
-- 
2.25.1


