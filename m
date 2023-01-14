Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AB9266AE4B
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 23:29:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGp0T-00015B-A6; Sat, 14 Jan 2023 17:28:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0P-000145-6T
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:28:05 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1pGp0J-0003iR-GQ
 for qemu-devel@nongnu.org; Sat, 14 Jan 2023 17:28:04 -0500
Received: by mail-ej1-x632.google.com with SMTP id ud5so60067119ejc.4
 for <qemu-devel@nongnu.org>; Sat, 14 Jan 2023 14:27:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+zSOZJsBppn3t1Lm0Gh6s/YJ/fxcXIeync0E72eGIe8=;
 b=fROJa/j2ez0y4TKCEIOyZIOO760XvNukGBFBUz7xnSBhAEcqF42oRivd8kyBgjwSjO
 UDDhPcMYcJuD5o/sMseW7/44T08l7DZZQIiIrGBs7qwMchxVJG0Qvp+SaFH0/wpUpAhg
 FVUghSgYgAj+wily2ZEsxVcfcvCZS2OJc1rMggDyMSm3htoKjULAND/Ywa6xqBNlvHr1
 8FdtP75eLe+Om02s+0UVXKIWr1jasvQ6pF3qtLDLHTOi+zdBTweMr5PqZBuG1FReFilc
 SERvp4+fwxjH3N865L2mKTY/pRGS7WEfJTBI/b8mrFRybPPBugpv4xiQLhuxsBVinWpu
 VKQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+zSOZJsBppn3t1Lm0Gh6s/YJ/fxcXIeync0E72eGIe8=;
 b=zLTXY2DKBu9BHKFKtzpiRMJmcJ54EK5TyswWMIcs45ors6ybtbvvwPDuy6cCOB7Tpl
 EqKmulTOBJ9GK9BhhfVfOkJHKNWtpAOW47UjSHhzSmH4xT0BmrqbSGlwywZf2KSO68sa
 Y3/xQOLw4AIQXCWX9Ydfez5nElobu8VZssoEwh4QJ1wv5wC7bVDqrrA7O+zT932pb44f
 iZADRFLjMTlcr2BwbLzqTiQgopX7yCoYLY36cJDUxlnGC0SCl38WJwzkxdO2EHSegdLc
 /zNudKhtkYs3BWkddisA8CYCq51whV5D2tul+Mjtuigphosz1BeQH2343vxxf1rYqnHn
 CfNQ==
X-Gm-Message-State: AFqh2koAgIjSWf1BcMEzLk8jEZx+v9b8GG+VWDfuxckYuRyNwgI8aOj/
 WseF05+F58zp/WGu65doaGbR6ww1epY=
X-Google-Smtp-Source: AMrXdXtlz1dPbFl7D/EebiTTUkpHtIUKZgNER9l/ktM14i+Wn/c8VpRMdaSTAz/yQPiXMoTFgXhBPg==
X-Received: by 2002:a17:907:6e05:b0:7c1:235d:2a2b with SMTP id
 sd5-20020a1709076e0500b007c1235d2a2bmr95271840ejc.24.1673735277837; 
 Sat, 14 Jan 2023 14:27:57 -0800 (PST)
Received: from Provence.localdomain
 (dynamic-077-013-123-004.77.13.pool.telefonica.de. [77.13.123.4])
 by smtp.gmail.com with ESMTPSA id
 og5-20020a1709071dc500b0084d420503a3sm8324840ejc.178.2023.01.14.14.27.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Jan 2023 14:27:57 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH 4/7] hw/i386/acpi-build: Remove unused attributes
Date: Sat, 14 Jan 2023 23:27:35 +0100
Message-Id: <20230114222738.282478-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114222738.282478-1-shentey@gmail.com>
References: <20230114222738.282478-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x632.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ammends commit 3db119da7915 'pc: acpi: switch to AML API composed DSDT'.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/i386/acpi-build.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 0be3960a37..428328dc2d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -117,8 +117,6 @@ typedef struct AcpiMiscInfo {
 #ifdef CONFIG_TPM
     TPMVersion tpm_version;
 #endif
-    const unsigned char *dsdt_code;
-    unsigned dsdt_size;
 } AcpiMiscInfo;
 
 typedef struct FwCfgTPMConfig {
-- 
2.39.0


