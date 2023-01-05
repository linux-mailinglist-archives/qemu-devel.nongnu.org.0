Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D25E65F2E1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 18:37:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDTN6-0001gZ-7S; Thu, 05 Jan 2023 11:45:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMG-0000lm-Vh
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:50 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pDTMA-0007Lt-Cw
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 11:44:45 -0500
Received: by mail-wm1-x334.google.com with SMTP id g10so14661381wmo.1
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 08:44:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sMnAfCWZCLNwdcWgdCth6k3nhxTM77vAKQFc00HifCI=;
 b=w7VsZh2YUNU4Wq1EFuQTzpyVpJPsB61JAmd++c74Z31nGpzj114JqAdtbtA86UoQd8
 RkwfzZHS/U2VnD+tJgfOjXOcxBRG04i3QH7pZ9iWzGCX8e7Ha+Ky3Y6wVIcVCX5I74Lu
 ox5HDg9tjJZqPYoRqtWhTitl9VmpWbaC+xJ4J2kgVJ39FC1gLAnH79UiEhXDA00I50uy
 JiU8fxk1Uzf48mmu9j8TepfGnvKK3gckvFETGRcqDj1ebjC9gwKFQ8SncaqdD7K8nQuD
 3bWCf8JyCXWbmzrR6RvxaXvrIEs6wmsCGC6hZ2mY6dfM5E9Ib7Ssc/dZ3KCh7t6RXb8K
 CMTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sMnAfCWZCLNwdcWgdCth6k3nhxTM77vAKQFc00HifCI=;
 b=0s3HM4J2YB3IEbr9A9JJLVGF9FJvTouataV6CNW7RHJDAjdRtkkhzaXJSNPiJAIkpL
 ikA+UpAwaLvtZ1hli9NYmmj7tqXOY3SWHqZmvryTsjF7D87s02Toho8Ehy2KtXThpSaT
 X1fyy1oi1fqw7/IRN+cdcgnYPBsSqbfZimVjec4HMeYAs9txYXqDTNiWxI57ea+7fR0w
 2nz7eM+EW6/oSHRJGeEVIBdO2xlCzFfRLDpjHNc97eDFtqemdexcNa0wGgDwzinOSJTn
 f56RT3WYSnZUjr14S7iktYBeYLwH+forjh+2A9l4GMWvUrQjNFZtxdFQs99Nyyjotdp9
 qSLA==
X-Gm-Message-State: AFqh2kr+oUgG+XgigPye7PHA4r7r/lpsKkOdfdKYWHf32iEzEaaOPKGh
 qWGEBNugm5RODI08o+6H5zgK72ygkwx6LsvH
X-Google-Smtp-Source: AMrXdXuk0xfhs6wbDaw+bTiIPDk7k0RGsgNsjQZ80wIS4mGofs2n+GUMy1nrfIwEwdVpo9cfBD1lZg==
X-Received: by 2002:a05:600c:c8a:b0:3d9:7062:e0b7 with SMTP id
 fj10-20020a05600c0c8a00b003d97062e0b7mr31050441wmb.33.1672937080962; 
 Thu, 05 Jan 2023 08:44:40 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 hg9-20020a05600c538900b003cf71b1f66csm3055547wmb.0.2023.01.05.08.44.40
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 08:44:40 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 26/34] hw/arm/nseries: Silent -Wmissing-field-initializers
 warning
Date: Thu,  5 Jan 2023 16:44:09 +0000
Message-Id: <20230105164417.3994639-27-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230105164417.3994639-1-peter.maydell@linaro.org>
References: <20230105164417.3994639-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x334.google.com
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Silent when compiling with -Wextra:

  ../hw/arm/nseries.c:1081:12: warning: missing field 'line' initializer [-Wmissing-field-initializers]
      { NULL }
             ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-id: 20221220142520.24094-4-philmd@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/nseries.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/arm/nseries.c b/hw/arm/nseries.c
index 2ff29f52e2d..c9df063a082 100644
--- a/hw/arm/nseries.c
+++ b/hw/arm/nseries.c
@@ -1078,7 +1078,7 @@ static const struct omap_gpiosw_info_s {
         "headphone", N8X0_HEADPHONE_GPIO,
         OMAP_GPIOSW_TYPE_CONNECTION | OMAP_GPIOSW_INVERTED,
     },
-    { NULL }
+    { /* end of list */ }
 }, n810_gpiosw_info[] = {
     {
         "gps_reset", N810_GPS_RESET_GPIO,
@@ -1099,7 +1099,7 @@ static const struct omap_gpiosw_info_s {
         "slide", N810_SLIDE_GPIO,
         OMAP_GPIOSW_TYPE_COVER | OMAP_GPIOSW_INVERTED,
     },
-    { NULL }
+    { /* end of list */ }
 };
 
 static const struct omap_partition_info_s {
@@ -1113,16 +1113,14 @@ static const struct omap_partition_info_s {
     { 0x00080000, 0x00200000, 0x0, "kernel" },
     { 0x00280000, 0x00200000, 0x3, "initfs" },
     { 0x00480000, 0x0fb80000, 0x3, "rootfs" },
-
-    { 0, 0, 0, NULL }
+    { /* end of list */ }
 }, n810_part_info[] = {
     { 0x00000000, 0x00020000, 0x3, "bootloader" },
     { 0x00020000, 0x00060000, 0x0, "config" },
     { 0x00080000, 0x00220000, 0x0, "kernel" },
     { 0x002a0000, 0x00400000, 0x0, "initfs" },
     { 0x006a0000, 0x0f960000, 0x0, "rootfs" },
-
-    { 0, 0, 0, NULL }
+    { /* end of list */ }
 };
 
 static const uint8_t n8x0_bd_addr[6] = { N8X0_BD_ADDR };
-- 
2.25.1


