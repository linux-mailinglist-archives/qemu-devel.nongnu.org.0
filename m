Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 660BA65E979
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 12:02:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDNzS-0007zy-Hj; Thu, 05 Jan 2023 06:00:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDNyx-0007q9-PC
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:00:39 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pDNyu-0006IG-NO
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 06:00:23 -0500
Received: by mail-wr1-x42b.google.com with SMTP id az7so11327396wrb.5
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 03:00:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jotmgFSSkAQdKEvxUU2nbxy7Dj2hKPDzRWMaloLL1Vk=;
 b=QA4doyzt2HJSoZHJD3UIjXR4E/iB8DUePnfXhpeyZ4+5rImHjomlBfhhWSH56nO9ZT
 YLDW0s66XRwBuGNfuT5Wtpt15+Q0n9icWoKUWIXHgg22wWU+hMvYawpQ3bX6v6UV2PC8
 Alf2d8zNeG9ZyI2ni07QMeanhBbZXHc6CXBIEnAuumKKtarjtXe2jc4eLNJMkpoeH7Tg
 0pufMjv52Z9ZtofJg1h8yBioAL/zJt/5gYrIp+EcL/AwGwTvyyiX7Z2KKVQx2bMvgqxw
 luRDoCrX8aw8uYf3MrePp45+IbYgxTwgEhd96TaosW8uBG1kBrdstdtihvYV8X7fn0+k
 EFPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jotmgFSSkAQdKEvxUU2nbxy7Dj2hKPDzRWMaloLL1Vk=;
 b=Qsdx5T+RjmrUcSQIsUXMkmJ9zO+Z+CtfdOgj1sWwVriEUsYsG+JqjgTBvC8Ic5HWzY
 73NTAfhD/Fv/fs7sQ5H/BmdbjpibxbWK8OsvVXF7tJ58dQfLuUuY6evtBGjIs+ghVE8j
 KHn4n+ofWRnRDNmtagNE4RwnhrqUHSvEFZ0qVPgN2cXy8js38n1ssamfg4tvJMgqESlr
 kDlA515xqh6Vey66dEvdMKfArxXjv2eQRz65UhJQmIMNEF6lguJ3ArWLcmrP9t5dOW1K
 2WPlyzzJzjT1BbMvo7wMsFMjpzofJMch4B8JI3XgLa5SRcgrLV+KrZorkXEj6EnjlMSR
 IO8w==
X-Gm-Message-State: AFqh2krct3ld7jR2RlAcB18A4Mx4OyVbYKVV3IFIkYFo63oMEcReQHmn
 3xRlQE+a/ZbBmcvPBKVmF7pNbx90t1D7oL5P
X-Google-Smtp-Source: AMrXdXsBL/CzkUrc1H06qgUOvBCRklcFwLJu+YgRosgigdLUeHuXpCD3Jf4hl8RUlrqu32FML4+RRA==
X-Received: by 2002:a05:6000:18c3:b0:288:ca2e:7d74 with SMTP id
 w3-20020a05600018c300b00288ca2e7d74mr16146339wrq.14.1672916409972; 
 Thu, 05 Jan 2023 03:00:09 -0800 (PST)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 k6-20020adff5c6000000b002a01e64f7a1sm6392861wrp.88.2023.01.05.03.00.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 03:00:09 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B317E1FFBC;
 Thu,  5 Jan 2023 11:00:07 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 4/4] Makefile: explicitly disable -net for our -M virt runs
Date: Thu,  5 Jan 2023 11:00:07 +0000
Message-Id: <20230105110007.1977399-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230105110007.1977399-1-alex.bennee@linaro.org>
References: <20230105110007.1977399-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
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

At some points in the bisect history this stops the default virtio-net
complaining when it can't find "efi-virtio.rom".

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 Makefile | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/Makefile b/Makefile
index 6905b8d..a8cae07 100644
--- a/Makefile
+++ b/Makefile
@@ -126,22 +126,22 @@ run-usertest-a64: usertest-a64
 	$(QEMU_AARCH64) usertest-a64
 
 run-systest-a32: systest-a32.axf
-	$(QEMU_SYSTEM_ARM) -M virt --display none --semihosting -kernel $^
+	$(QEMU_SYSTEM_ARM) -M virt -net none --display none --semihosting -kernel $^
 
 run-systest-t32: systest-t32.axf
-	$(QEMU_SYSTEM_ARM) -M virt --display none --semihosting -kernel $^
+	$(QEMU_SYSTEM_ARM) -M virt -net none --display none --semihosting -kernel $^
 
 run-systest-a32-hlt: systest-a32-hlt.axf
-	$(QEMU_SYSTEM_ARM) -M virt --display none --semihosting -kernel $^
+	$(QEMU_SYSTEM_ARM) -M virt -net none --display none --semihosting -kernel $^
 
 run-systest-t32-hlt: systest-t32-hlt.axf
-	$(QEMU_SYSTEM_ARM) -M virt --display none --semihosting -kernel $^
+	$(QEMU_SYSTEM_ARM) -M virt -net none --display none --semihosting -kernel $^
 
 run-systest-t32-bkpt: systest-t32-bkpt.axf
 	$(QEMU_SYSTEM_ARM) -M microbit --display none --semihosting -kernel $^
 
 run-systest-a64: systest-a64.axf
-	$(QEMU_SYSTEM_AARCH64) -M virt --display none --semihosting \
+	$(QEMU_SYSTEM_AARCH64) -M virt -net none --display none --semihosting \
 		-cpu cortex-a57 -kernel $^
 
 run: run-usertest-a32 run-usertest-t32 run-usertest-a64 \
-- 
2.34.1


