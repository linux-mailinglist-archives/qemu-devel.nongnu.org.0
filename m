Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 504373ADB21
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:35:09 +0200 (CEST)
Received: from localhost ([::1]:54452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lues8-0000wo-AW
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:35:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lueju-0003ZR-Du
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:38 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:40923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejs-0003cL-Pw
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:38 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 bb10-20020a17090b008ab029016eef083425so9627050pjb.5
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=05sVd1F+Ix/u+8NKnSPBhFMXamB4skG8gTScN8uxiH8=;
 b=AXBQDc28bNasD4agIVKpc76xFn6tcl4Cr5sHDUQtkBeVzcgrpVLQRKKVzAbb0wGwzq
 FdHPAHSo0ZeYpflYYiqQDSrPdrcAtGrjVRTKrV3feKK8gnatFIuMbIusIVr2BMt435di
 v0rE2kbLjETSosM9xmW+kITpoypxR/uZGSaAysUUk5quZwAfhywEsxMFUxySY7B77VKA
 XtdYqT3pINUOCMdu3wsw2TZJdUw5vsATXrateTINJE6OFq2TyrkywQ9e+aLNhkuFN8+Y
 Er3ecRILeXIyNSzkvoK4onVQjwjDEU+iEBlri4P/TT1YINnF5tXWeNwEvk0dD5q4GdRZ
 Ggqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=05sVd1F+Ix/u+8NKnSPBhFMXamB4skG8gTScN8uxiH8=;
 b=ZdJt+sa1O0sAK5CRyiMSdjAqsHzpqEPkgrBKWCqd9Sy+MNpUAJY9+JHu7WlzhxSZcP
 UkLFbFym1B7P701oe+CNwpSdUd8sZzlr49KqHPfOrpc7oXvFkS+6tmTfX7ZK1nhtpkh3
 58cfmwsd0P7GGhBR169Q7CgpFHZ86d/S/UWdJIBC1lik0VMh9ryHV+jhEOdXqsTitvBf
 XVGxFvXmUYuogg2BK1yxOm6fqAwpy/SktFXAEOJ5qzooF6WJ1G1UUEiVEAd1cmuUETK+
 oQLg2CPyu1maJQ0elY6QQjfCrETFEYBTeH/tWeGbCgi6oYDPgLRCfK+KbW3QHdlitLuE
 fXew==
X-Gm-Message-State: AOAM530Jd5/nRC62H5P7aiIIgImauDfFGUbh9mmOj8sH8/gzI+inuc1w
 Ak8CExGtu6uc6JYYy/0s+oYY7cjUSgoHXw==
X-Google-Smtp-Source: ABdhPJyd4OR3J7DsGkbm7yc3h1f2sacCZuZ2bOd3gnfDHsGQlgIL+hdMimQBvVn+W4q8J8+CNJ2Yaw==
X-Received: by 2002:a17:90a:c093:: with SMTP id
 o19mr17618829pjs.6.1624123595514; 
 Sat, 19 Jun 2021 10:26:35 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/15] hw/scsi/megasas: Fix megasas_mmio_ops sizes
Date: Sat, 19 Jun 2021 10:26:22 -0700
Message-Id: <20210619172626.875885-12-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, mark.cave-ayland@ilande.co.uk, f4bug@amsat.org,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All of the megasas mmio registers are 32-bit not 64-bit.

Cc: qemu-block@nongnu.org
Cc: Fam Zheng <fam@euphon.net>
Cc: Hannes Reinecke <hare@suse.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/scsi/megasas.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index 8f2389d2c6..c98cb7a499 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -2163,8 +2163,8 @@ static const MemoryRegionOps megasas_mmio_ops = {
     .write = megasas_mmio_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
-        .min_access_size = 8,
-        .max_access_size = 8,
+        .min_access_size = 4,
+        .max_access_size = 4,
     }
 };
 
-- 
2.25.1


