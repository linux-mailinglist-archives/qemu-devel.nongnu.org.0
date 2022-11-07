Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C443620459
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Nov 2022 00:59:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osC19-0004NV-Oe; Mon, 07 Nov 2022 18:59:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC17-0004Lq-ME
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:01 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1osC16-00005u-7H
 for qemu-devel@nongnu.org; Mon, 07 Nov 2022 18:59:01 -0500
Received: by mail-wr1-x42a.google.com with SMTP id bk15so18472316wrb.13
 for <qemu-devel@nongnu.org>; Mon, 07 Nov 2022 15:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Pckt33PPODZuNupcZeqlhviriZe8sXmSXNtQ+5/qb8=;
 b=XRQnT74NSA5uP2sioen7RhVMKhDfOt0I1/Mhyc6VmyvkjjO+ZIu2X3srktJvg5K+oz
 SttyQNCXFSbnRpiZqJcl6lSROnLC1zLJ5kW1oFqyBE3/WVq/bwVMix+LIQ5Al4Wx+DRw
 wMpdaXORfli5jEJeVfGYy6uyTVf3FkKAwQqZrDKYHh4Oh1cyLXV7EpbCEChG6L1Zb2Vc
 yKtjxWNeedhXTc3tOkDyZwHvCQwK/kI+Nob26+bKejKVE1j1xREERaUhXqBl/0ctxBTZ
 nzPz+iUuBYnsh1xZNQsn/nKK1xIP84GTof91qgYfXsv8/nZLtF6zFKxZml+uPB/6KMWb
 Vm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Pckt33PPODZuNupcZeqlhviriZe8sXmSXNtQ+5/qb8=;
 b=JmLt7aacFCPtp/Mkq0es3uQem8fuxAGV2P1XjuzX4FSTh03AKTicRxphZPJfGXcCpT
 cYw0IPrmuC0iy9bPxSsC9sFFj/meGVskgLu4T8N1kMVcJDvDI1+ldQNmNhmIbdqRhSsa
 u3kEXzfvQlmcJKTIMea/4wOKB24bIdbD1DF+cR+qrvQkgwNO9PthyzlOCh8Fc5sI0jnW
 bVy8kKD9THvmK/Ulcd63AC76I7UD1twTwIk251Lp8LM/4VnKbsKkOxOuqugX78GPZIa8
 V/2TaGCRo/fpdQaiFUMDPdIBF8LiOAfvhAmK1PqHUhxLo/BUGpcL78MHBurGtaBLBrR7
 f5ug==
X-Gm-Message-State: ACrzQf3979OWkPBVA/udL+ouiS0xywdzdzcMgKYBQSXsUTJlSRlOVosc
 UnljcxNv5oiwOIhRPaBiIUzhvNhOdYJRkg==
X-Google-Smtp-Source: AMsMyM7jp/YC9EllINwlYLwwQCRGe+5qpprEDqnnVSAc3TUupSAbgl8cPe84zF1cNGJWBNvNdwNtMQ==
X-Received: by 2002:a05:6000:1143:b0:236:5ede:cdad with SMTP id
 d3-20020a056000114300b002365edecdadmr34057906wrx.410.1667865538433; 
 Mon, 07 Nov 2022 15:58:58 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 bk8-20020a0560001d8800b002366e3f1497sm8731873wrb.6.2022.11.07.15.58.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 15:58:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Stefan Weil <sw@weilnetz.de>
Subject: [PULL 07/14] disas/nanomips: Fix invalid PRIx64 format calling
 img_format()
Date: Tue,  8 Nov 2022 00:58:15 +0100
Message-Id: <20221107235822.71458-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221107235822.71458-1-philmd@linaro.org>
References: <20221107235822.71458-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
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

Fix:

  disas/nanomips.c:12231:62: warning: format specifies type 'char *' but the argument has type 'uint64' (aka 'unsigned long long') [-Wformat]
    return img_format("RESTOREF 0x%" PRIx64 ", %s", u_value, count_value);
                                               ~~            ^~~~~~~~~~~
                                               %llu

Fixes: 4066c152b3 ("disas/nanomips: Remove IMMEDIATE functions")
Reported-by: Stefan Weil <sw@weilnetz.de>
Reviewed-by: Stefan Weil <sw@weilnetz.de>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221101114458.25756-3-philmd@linaro.org>
---
 disas/nanomips.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/disas/nanomips.c b/disas/nanomips.c
index 6466c80dc5..e4b21e7c45 100644
--- a/disas/nanomips.c
+++ b/disas/nanomips.c
@@ -12235,7 +12235,8 @@ static char *RESTOREF(uint64 instruction, Dis_info *info)
     uint64 u_value = extract_u_11_10_9_8_7_6_5_4_3__s3(instruction);
 
 
-    return img_format("RESTOREF 0x%" PRIx64 ", %s", u_value, count_value);
+    return img_format("RESTOREF 0x%" PRIx64 ", 0x%" PRIx64,
+                      u_value, count_value);
 }
 
 
-- 
2.38.1


