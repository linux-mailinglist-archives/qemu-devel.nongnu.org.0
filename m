Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B80166BE93
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 14:03:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHP5I-0005JP-Ep; Mon, 16 Jan 2023 07:59:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP5F-0005FC-3V; Mon, 16 Jan 2023 07:59:29 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1pHP5D-00016o-J2; Mon, 16 Jan 2023 07:59:28 -0500
Received: by mail-ej1-x633.google.com with SMTP id vm8so67883277ejc.2;
 Mon, 16 Jan 2023 04:59:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HGFA1IAZGe7qEvZ3mo0CJqcNUUJ0fER/+h+Iq3ohYkY=;
 b=YoHcmawVVJYoZ/xrwe1bot5g9gk5c/5y5oOXkBWCZzNGaU0/vVwBgERLjsqfRc+M4J
 Df5vudY9rRAzeDq8JuRTT7aL4bmSuK6s21q7xVq7kNHlzvUcmVlXwRaytwq1F0AviwxZ
 HLkJf+L3+6JbdQ8K75sBeVA3AK/UhQMH2dhYjOxOwb+7nOSHd5HxuM4KnOLBD2A412qd
 GMHh8LtE6ZxUX9DB6AT1E8RLEwU4Ryv3Z8iGjzkYReqh/E8/9OtU3sHqYn7VJP45onBG
 jZmoX7SDU4xGVyP7wr9V+skqaH0sgatq+do0moM2zpR2AHcOeuRh0x6ILhlnu2+wxWhK
 mUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HGFA1IAZGe7qEvZ3mo0CJqcNUUJ0fER/+h+Iq3ohYkY=;
 b=Bp6dgBa6fC7X+ZdU5F8Cb1E2UxBujZgtoJGhi7ME/macnNlo7NKNdaC5TgSLdsJplo
 10YWwKxYTR8vWt2zRyW7R2mxE37cRoKorOXVhOn94gk/CmTcv9Js68jZvvCNaJShVZAT
 I2BzqGxj+kTa401XzYu7Qntps+G9dpVJ4ZlaTgCMbYgO4VqTGj+D7Dmff+cF6MSI9M0p
 Bff9mZxPrp3ebrwf3WCn4uIvJNM8smNJhIaiU+2/vHpPn87aLy1Iq8uT4DLMEGrKvYTt
 xSGvzAYaQSUu0gabi2kc1qGntMTNn4fIGzjfpsgmUZunFzdJLzPA2UNV/lS6gKnA6e/k
 T/bw==
X-Gm-Message-State: AFqh2kq4CFw5pwF0ehWPQI49QF03g97vCz/j7bepzvlWwF2PH4RI1SVA
 OB0Hp4g9FKZvofEZbtR7l3+UnTQ82NE=
X-Google-Smtp-Source: AMrXdXvKNr/TKo+mPQjGCVIho/bgmIyTLlM8UZgKNjMfqHzIfpMGM1T/fBIG6cxFLHubUVcDpJM0eg==
X-Received: by 2002:a17:906:fcc8:b0:863:e38b:5b0a with SMTP id
 qx8-20020a170906fcc800b00863e38b5b0amr16698142ejb.65.1673873965691; 
 Mon, 16 Jan 2023 04:59:25 -0800 (PST)
Received: from localhost.localdomain
 (dynamic-077-191-143-217.77.191.pool.telefonica.de. [77.191.143.217])
 by smtp.gmail.com with ESMTPSA id
 um41-20020a170907cb2900b0086c4fbb8507sm3201517ejc.225.2023.01.16.04.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jan 2023 04:59:25 -0800 (PST)
From: Bernhard Beschow <shentey@gmail.com>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Ani Sinha <ani@anisinha.ca>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-trivial@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Bernhard Beschow <shentey@gmail.com>
Subject: [PATCH v2 4/8] hw/acpi/piix4: No need to #include
 "hw/southbridge/piix.h"
Date: Mon, 16 Jan 2023 13:58:38 +0100
Message-Id: <20230116125842.66817-5-shentey@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230116125842.66817-1-shentey@gmail.com>
References: <20230116125842.66817-1-shentey@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x633.google.com
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

hw/acpi/piix4 has its own header with its structure definition etc.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
---
 hw/acpi/piix4.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 4d0d4fdeeb..2e19a55526 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -20,7 +20,6 @@
  */
 
 #include "qemu/osdep.h"
-#include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
 #include "hw/i2c/pm_smbus.h"
-- 
2.39.0


