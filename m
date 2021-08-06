Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F1A3E2C4D
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 16:14:21 +0200 (CEST)
Received: from localhost ([::1]:59788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mC0c8-0001kr-DQ
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 10:14:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mC0YJ-0004sJ-P7
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:10:23 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33463)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mC0YH-0008Eo-Tl
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 10:10:23 -0400
Received: by mail-wr1-x42f.google.com with SMTP id k4so11306969wrc.0
 for <qemu-devel@nongnu.org>; Fri, 06 Aug 2021 07:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KuuTtPGMwAVo25QsuYA2XGY+9yV6r/Lp4YSi1ojpHU4=;
 b=Pr8Jfm7DrfLHR/OHvuRR1n7QRLGa9SiuZnfyMcmWZ1KDxsIEMu/54VXjgDG23Q6h+e
 uWhueKD84dLf5jwXWzdN3TApiduqdX8Z+rAgs88C1LY0w3e4rVjy2/fMl3LwDjWFcCSS
 oWDSjjvkWNu3Hitm/B/rK0s9Bu2zg002V0vzRWY1/UpaAkPAHU12OCBe3zyWn6MT2Pi8
 w6HlwmO+l9yrF8+GHotc9//MWbqXMiLk+SdXPbYjYjBmZ49psYNQnd0uqztpzINL/eku
 nS6m8wezzDbS4bQdP/QEZY0ZBQPyQQMs3+GAlGu/D0u5mjl1Os2TTw9SyULq6ElJDnMO
 udRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KuuTtPGMwAVo25QsuYA2XGY+9yV6r/Lp4YSi1ojpHU4=;
 b=A8QRnGaVU09vSJhGhyM2jY+YAbEoq1q9FPQGvJ9hC1GMwswy5ghmr8akrDeldgCCd1
 qH8W0h6FIOJaNNIId8RS2gNK7kuB5p27FexTQKqLyvgGHj6cn1XO3rVgNf9Yr1iB20Ww
 2TUeS4/1j2nRt+ycrH+Jyk1itinUZykU5JWBXUiFy2x0y44T5voRAJCt8U9jM7FHoamY
 hF3lt14kfSrFw7ay9boqaJEUfDKaWBN2ukHJxuOy7lTVgkD6YI7pBfSkdo7ca/0nr30H
 Oh8YYahpXTicRvtHDeKTVSjMW1Pw19B8tQ3jV/bmiC3k/KWbDp4c6MbPFdi7DyOP34MK
 w4Aw==
X-Gm-Message-State: AOAM533ucJjeHXTZM7pWvPk5MUbxPZUcMXMESt55OiFtDy7Pew+RsSkl
 cgmVjjBqVNGS138172jJXlQ0yQ==
X-Google-Smtp-Source: ABdhPJzy8FtoRquwZ7fSM+NKhB0Cx5LuUb4N3lhSg1pFcoYeQ3iPGfm2jvW3S0KoIxr7cJHczqVbJQ==
X-Received: by 2002:a5d:4a4c:: with SMTP id v12mr10830665wrs.256.1628259020572; 
 Fri, 06 Aug 2021 07:10:20 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id d15sm9390765wrn.28.2021.08.06.07.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Aug 2021 07:10:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CBAFE1FF98;
 Fri,  6 Aug 2021 15:10:15 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 1/4] plugins/execlog: removed unintended "s" at the end of
 log lines.
Date: Fri,  6 Aug 2021 15:10:12 +0100
Message-Id: <20210806141015.2487502-2-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210806141015.2487502-1-alex.bennee@linaro.org>
References: <20210806141015.2487502-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42f.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, stefanha@redhat.com,
 crosa@redhat.com, pbonzini@redhat.com, Mahmoud Mandour <ma.mandourr@gmail.com>,
 Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mahmoud Mandour <ma.mandourr@gmail.com>

Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20210803151428.125323-1-ma.mandourr@gmail.com>
---
 contrib/plugins/execlog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/contrib/plugins/execlog.c b/contrib/plugins/execlog.c
index 2de9f0d7d4..a5275dcc15 100644
--- a/contrib/plugins/execlog.c
+++ b/contrib/plugins/execlog.c
@@ -67,7 +67,7 @@ static void vcpu_insn_exec(unsigned int cpu_index, void *udata)
     /* Print previous instruction in cache */
     if (s->len) {
         qemu_plugin_outs(s->str);
-        qemu_plugin_outs("s\n");
+        qemu_plugin_outs("\n");
     }
 
     /* Store new instruction in cache */
-- 
2.30.2


