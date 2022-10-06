Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 00AC55F6B1C
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:00:21 +0200 (CEST)
Received: from localhost ([::1]:56052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTIK-0004kj-Fz
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:00:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSey-0003x0-Lb
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:19:41 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:42646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSex-0005yR-8J
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:19:40 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 l1-20020a17090a72c100b0020a6949a66aso2083292pjk.1
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RLZhLFQlc54ZoIwBF61gB7xfiWSNWDubi3/EBtm1pD4=;
 b=VUkaCOFrL64mmvI6wCYhS3tgfZFNaHj+Od66k1dPEhrG8O3VU/UkZNX/bjN4ULIQTR
 7sNV+mjFMaH+/+PTvXqjlAWu7gxNbHJq/pMvnqLmCKuAuwTbu6iCIk8KGWh4X1qGbleH
 tooNbDWXtj+toafiXkM6/T8W8O5t/tJRi63eUOf7UQDmUBr+OTVD1BVd7cmHdPeKgmQH
 lbY6BDvG0tLhji92dtkc2if9FaDnN0gRLthK0uVxA1qcTt4pU/He0sA7Z7iMAXo4ewPn
 PH3xQmUkDfoj35UF++eXxkvpIl82FMB9qvc4wX1V8HT//Zkgo0ZwZInKPJzdr/UVJjch
 N4Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RLZhLFQlc54ZoIwBF61gB7xfiWSNWDubi3/EBtm1pD4=;
 b=WcJQHFmXdOgYxtsUQk6KzYsMGNxGSYxI4bfRpTxIldeFDldYXuGfuL4RKQ8jBN5Bat
 9vqVCVFIuw4TSLNSWwpb+K9O/Cv6O7WRXBIPh/ApOXFxJlaIoyfNRHSNmLkSPbntSCts
 caHxXuT5rPnFy6PwjQbAH/+OG61X7rCODRT08Z/wKC0A8p38WRsS5o7WEHqLS5BWw21P
 5rXBJlenHB6czC+Cc7drXQ6JSArtytDvQJwlhF/Qk1gaPBh0AVK20WnURUdFZfJxOjt4
 e5QeiXuQz+vTIw/qwiP8vjYAzQ8MpkHpVTJEuTyiq0oRQd7nA6cF1sjEtIwC4CugWzyj
 0ozg==
X-Gm-Message-State: ACrzQf3lvYZOdqAyK2Z4Pw9xvGvtCF0397qt9aLgRtZdIM4UAXQX5LCI
 vW3qytL4wdI8MTdusHAiFta2UgeO/R8=
X-Google-Smtp-Source: AMsMyM401s11T3tTndWbGxt3INQYKzosx24pYskaXjTx9LqzKxYaoz6efeYUjL6BnDvr5hBIBjJp3Q==
X-Received: by 2002:a17:90b:4d0d:b0:1fb:a86d:e752 with SMTP id
 mw13-20020a17090b4d0d00b001fba86de752mr248187pjb.120.1665069577742; 
 Thu, 06 Oct 2022 08:19:37 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:19:37 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v5 01/18] semihosting/arm-compat-semi: Avoid using hardcoded
 /tmp
Date: Thu,  6 Oct 2022 23:19:10 +0800
Message-Id: <20221006151927.2079583-2-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

From: Bin Meng <bin.meng@windriver.com>

Use g_get_tmp_dir() to get the directory to use for temporary files.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
---

(no changes since v1)

 semihosting/arm-compat-semi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/semihosting/arm-compat-semi.c b/semihosting/arm-compat-semi.c
index bfea9e9337..62d8bae97f 100644
--- a/semihosting/arm-compat-semi.c
+++ b/semihosting/arm-compat-semi.c
@@ -503,7 +503,8 @@ void do_common_semihosting(CPUState *cs)
         GET_ARG(0);
         GET_ARG(1);
         GET_ARG(2);
-        len = asprintf(&s, "/tmp/qemu-%x%02x", getpid(), (int)arg1 & 0xff);
+        len = asprintf(&s, "%s/qemu-%x%02x", g_get_tmp_dir(),
+                       getpid(), (int)arg1 & 0xff);
         if (len < 0) {
             common_semi_set_ret(cs, -1);
             break;
-- 
2.34.1


