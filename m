Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21DC36A43B3
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 15:06:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWe7T-0003KS-3y; Mon, 27 Feb 2023 09:04:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7N-00039a-Eg
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:41 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWe7L-00081h-T2
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 09:04:41 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 ay29-20020a05600c1e1d00b003e9f4c2b623so7238031wmb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 06:04:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=J75e6iaUq5SfZBqCcMITv6hWDAA6zO4plFjAUXOFWCk=;
 b=Qp+rZ60AVHSjydgOvgnScnhBt+eYngGNB0hHKjmIyH0+eAhLZ9sMFRfCQXlg2zQP60
 gmdAQTGzInbdDkG+ZQ1cvJLaWF0MX9Zjd99fOQZXG27zuC8VUyVf6CUSYJgbjGrhkkxO
 a73uEgo+S9uD8z5bJmodD5MWuMlkztAf4JcAxUdCfKNqSHapXZsxKWTPzhcr1nh59uvi
 xJTR9+g8PXXEIZAJFJw2tpgezmq2tcA/nFEpkjqPhX1PJGHjxt9jvBYr84ojR8mC8jj1
 QtSQWMUJzCrmHQmJGSFFBlilGKW4F5tD4YuwQ/KQfPEl6GcO6adZhh4qIdw9tqoQKqTo
 5Ilg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=J75e6iaUq5SfZBqCcMITv6hWDAA6zO4plFjAUXOFWCk=;
 b=Yz9tof8R1pSCiLJoot9+DFl81p6BkvtzAgC/zAuRDU6GJ9abdgL5OfcJmCFPsNRLJK
 j62GemcqRlxq9vviqNAvT/VXmgyl95BPV3ZR97D5WBC7GrQHhayjQW+0eNOakbPPh4Na
 Wd5DQHbi340+p+7LRTmiGDQjbZ4AKoUskDobi6gh3ZavyABrSaXEEhtwYZt74jED+PxU
 PwOOzZdabimzIFfCiyn3Nkl1Zg6Oz/R4qpLvNt9E8N0znfrKaJevtH9e/riS2X8BQJLx
 q926yXvE3gEMkp1DaVU9xrSltzknwk9CnVR5Ed/2BdrgUYjbkhHmLrL8VVrNghu2Qmk1
 AKvQ==
X-Gm-Message-State: AO0yUKUnslmfFe9rIHlj0f1otndabosTVMKAlgGhMJhp0VnNbfM46Ni9
 +EMDDsEELnlxTm0jc4Pd536prXP4QfE+uxZA
X-Google-Smtp-Source: AK7set/dDcBQVRctiB/GzOjg8U/iFMRw1ZVefcI5sm0rGOyXVOrolzmqdpyAwKsZwkIeIeJVeDQ6gg==
X-Received: by 2002:a05:600c:4aa7:b0:3e2:66b:e90e with SMTP id
 b39-20020a05600c4aa700b003e2066be90emr13600821wmp.10.1677506678275; 
 Mon, 27 Feb 2023 06:04:38 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k14-20020a05600c1c8e00b003eae73f0fc1sm10142742wms.18.2023.02.27.06.04.37
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 06:04:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 036/126] hw/nubus/nubus-device: Fix memory leak in
 nubus_device_realize
Date: Mon, 27 Feb 2023 15:00:43 +0100
Message-Id: <20230227140213.35084-27-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227140213.35084-1-philmd@linaro.org>
References: <20230227140213.35084-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Mauro Matteo Cascella <mcascell@redhat.com>

Local variable "name" is allocated through strdup_printf and should be
freed with g_free() to avoid memory leak.

Fixes: 3616f424 ("nubus-device: add romfile property for loading declaration ROMs")
Signed-off-by: Mauro Matteo Cascella <mcascell@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20221222172915.671597-1-mcascell@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/nubus/nubus-device.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index 0f1852f671..49008e4938 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -80,6 +80,7 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
                                &error_abort);
         ret = load_image_mr(path, &nd->decl_rom);
         g_free(path);
+        g_free(name);
         if (ret < 0) {
             error_setg(errp, "could not load romfile \"%s\"", nd->romfile);
             return;
-- 
2.38.1


