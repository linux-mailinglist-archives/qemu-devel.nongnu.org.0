Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D389662194
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:29:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoQs-000478-4Q; Mon, 09 Jan 2023 04:27:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQp-000462-50
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:27:03 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoQn-0005Z6-Kw
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:27:02 -0500
Received: by mail-wr1-x429.google.com with SMTP id co23so7491583wrb.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3c81/r3f4BHMA2UcmTrC4gW71kQeV9J9AnuU6KcX7cM=;
 b=lNMK5BLP7m+MR7LK2BDg17KICwcpqwV8y50VOE7CPXpZs77u5Fgzqo1+kwaK2EZoA6
 Yt+bZXYcJth3kZZmIIFrBprwvnnrW/FsXbBkK7GgkP3yD+jnL8YTAfr6WH1Wcrye5ATH
 BA8bYsT3TH2F/TvDZbk1gh0BKq5ZXkJcDriaEoQArufzo1bfpL7OkdjI45gYMfAlfqY3
 i8r1IjYZRKvvSSAKLm0kzM3Y3l9+PM1cgZKYzN0oZZUvduzpW/Zs0bbJfz20WmUVj6+e
 FkxDOB1l4x7jDd0OYrO0mSudJzOsiwwhFa5QMESoFEt0+j4o2eao+iLQLt6oQ/KAt4WT
 sGSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3c81/r3f4BHMA2UcmTrC4gW71kQeV9J9AnuU6KcX7cM=;
 b=eq/AbaIyGrtAfmrKaCet+mgkkgeRUfLeGBQUx5WJAjQXSAf1+IGS4lZGb6eVhTJJDh
 ixgBq7EU07CzhYJ3+5UgDq88ERohWWZgFSXiisHOcQCV2xLsSCcC6KsdlVSu5YBu4Ri+
 XbczDtUuoz4qFFNFl/ltm1Mv3TBfcRFqMxp1l1aOu4NYicNdvm4REUaaaC8F7vlrLJGZ
 7nETHMBJmXoIvLuTdVnZ7o5d8U5vqiDb/OR8bM891+zSdx6cSaSEaEcqW510rX0wtRd4
 uxo3qApc7cTj9UnFf0coNkDDLAhnwHJYkINkpAqDwwZUDhorHXY4FHm+oBg6a1/jlgze
 4F3Q==
X-Gm-Message-State: AFqh2krfT6o4Yv0E0/DkLQ3Ix9sRnTYTytv0s6ejpveeDc+1/Ou6yNlh
 K7WoGOqtLyAP5VdflkCeLWgZ32SXpAz2gmFC
X-Google-Smtp-Source: AMrXdXu9wAlv7+krYXTSMfRycBllNlI89kc/pL55TC9T0LsIG/oNU97yloEIl1s219zalYBpef0Xkg==
X-Received: by 2002:a05:6000:4002:b0:298:4baf:ac8a with SMTP id
 cy2-20020a056000400200b002984bafac8amr18210285wrb.44.1673256420106; 
 Mon, 09 Jan 2023 01:27:00 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a5d6546000000b002bc371a08adsm1823062wrv.101.2023.01.09.01.26.59
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:26:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org,
 Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 8/9] hw/arm/tosa: Convert TYPE_SPITZ_MISC_GPIO from SysBus to
 QDev
Date: Mon,  9 Jan 2023 10:26:16 +0100
Message-Id: <20230109092617.80224-9-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109092617.80224-1-philmd@linaro.org>
References: <20230109092617.80224-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Nothing in TYPE_SPITZ_MISC_GPIO access the SysBus API,
convert it to a plain QDev.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/spitz.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/hw/arm/spitz.c b/hw/arm/spitz.c
index 6605d658ed..31445329ff 100644
--- a/hw/arm/spitz.c
+++ b/hw/arm/spitz.c
@@ -819,7 +819,9 @@ static void spitz_akita_i2c_setup(PXA2xxState *cpu)
 OBJECT_DECLARE_SIMPLE_TYPE(SpitzMiscGPIOState, SPITZ_MISC_GPIO)
 
 struct SpitzMiscGPIOState {
-    SysBusDevice parent_obj;
+    /*< private >*/
+    DeviceState parent_obj;
+    /*< public >*/
 
     qemu_irq adc_value;
 };
@@ -883,7 +885,9 @@ static void spitz_misc_gpio_init(Object *obj)
 
 static void spitz_scoop_gpio_setup(SpitzMachineState *sms)
 {
-    DeviceState *miscdev = sysbus_create_simple(TYPE_SPITZ_MISC_GPIO, -1, NULL);
+    DeviceState *miscdev;
+
+    miscdev = qdev_create_simple(TYPE_SPITZ_MISC_GPIO, &error_fatal);
 
     sms->misc_gpio = miscdev;
 
@@ -1260,7 +1264,7 @@ static const TypeInfo spitz_lcdtg_info = {
 
 static const TypeInfo spitz_misc_gpio_info = {
     .name = TYPE_SPITZ_MISC_GPIO,
-    .parent = TYPE_SYS_BUS_DEVICE,
+    .parent = TYPE_DEVICE,
     .instance_size = sizeof(SpitzMiscGPIOState),
     .instance_init = spitz_misc_gpio_init,
     /*
-- 
2.38.1


