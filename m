Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 91ADF68A13C
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:10:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0VC-000747-CW; Fri, 03 Feb 2023 13:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0V7-00072O-Fs
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:29 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0V5-0008Ac-Ok
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:09:29 -0500
Received: by mail-wr1-x433.google.com with SMTP id h12so5377610wrv.10
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LAfKidwXqMyl+hQg1D5zpybmHVz62NdxFnrC9ga08Jw=;
 b=fCrQpY/B0WPvykR/ypTqqefxBK8DwNly0OXMnU2qMfqW5gm4/NtKE1gcc2kOGS4G+R
 K0K98fG/kenQ8SY4vt9EQKVU8myl/Ab48UmBjG1uu+m6hNrnsZ3vput7UHGf0EAcVMcK
 ZrcqGBUr6r24pN6eaPDMmy32xkEljZXdb2MpbWO/axaZrpYFGo0TrB+ALPAlLHmffVwh
 DvLJg0xdWHJOktZltFeByL2u7BYs1idlLzJjzWWdU3nHSXMOYyg97O6uEQuDL8juZWGO
 CVYtXvMXm89e7Z3onE50xKaZIToE9DDReA4m+Zaw6uC94zBpngm2DlSV9KM2J84TN4Yd
 rGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LAfKidwXqMyl+hQg1D5zpybmHVz62NdxFnrC9ga08Jw=;
 b=OykUf59fXfz1tvQm1YYG6BsxqNlUTx9H3iiKSdf41b8g7Ojl1RjcI7hayqSXgmys+Y
 xBbsGAE3KFDxFnAV9EE5wf3FS8wPFal+pIwC1p+ug26RsplgGiHjjb0+VcxnQT+ciO2h
 xtT6qOto0O5T6iCAxXHcuWUjWrgB/V/pDqWnjJFhEy6CpVaw1A1hhJ42k2isAAPzbohL
 FE6huRdFRqLsJBnG8D2ke/SNzJgOtm9jYka8cu1uJMUl4hP4N61QVu+DiQD+bhnOFdvP
 HgaXpLof9S7ZnyTue3rN+0y4kkWfZ7cj0ayvV3zeZ7gYyTL6Un/A33xw5S4eTbaoW1s0
 jxJA==
X-Gm-Message-State: AO0yUKW1eQF9iyIg3/N/jKBfCrqjDiCXPfhwmxK/uWj5s73n0t8o7HqN
 Z06Pn7YRtPza/Mo1klLuiEUNGDeAxbywb+d6
X-Google-Smtp-Source: AK7set9W3aK6n1hfLPEcZHdTYgkmNQeapXReOUFJDqF5aWpvMMnxPBElUKcvLLIgEyAsQJPLpPJqzg==
X-Received: by 2002:a05:6000:144f:b0:2c3:be89:7c22 with SMTP id
 v15-20020a056000144f00b002c3be897c22mr5197083wrx.5.1675447766299; 
 Fri, 03 Feb 2023 10:09:26 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a5d48cc000000b00241fab5a296sm2474545wrs.40.2023.02.03.10.09.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:09:25 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 02/19] hw/qdev: Introduce qdev_prop_set_link()
Date: Fri,  3 Feb 2023 19:08:57 +0100
Message-Id: <20230203180914.49112-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

Introduce qdev_prop_set_link(), equivalent of
object_property_set_link() for QDev objects.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev-properties.c    | 5 +++++
 include/hw/qdev-properties.h | 1 +
 2 files changed, 6 insertions(+)

diff --git a/hw/core/qdev-properties.c b/hw/core/qdev-properties.c
index 9789a2f5de..46236b1542 100644
--- a/hw/core/qdev-properties.c
+++ b/hw/core/qdev-properties.c
@@ -694,6 +694,11 @@ void error_set_from_qdev_prop_error(Error **errp, int ret, Object *obj,
     }
 }
 
+void qdev_prop_set_link(DeviceState *dev, const char *name, Object *value)
+{
+    object_property_set_link(OBJECT(dev), name, value, &error_abort);
+}
+
 void qdev_prop_set_bit(DeviceState *dev, const char *name, bool value)
 {
     object_property_set_bool(OBJECT(dev), name, value, &error_abort);
diff --git a/include/hw/qdev-properties.h b/include/hw/qdev-properties.h
index 21f399e9a3..c16dbefb2f 100644
--- a/include/hw/qdev-properties.h
+++ b/include/hw/qdev-properties.h
@@ -191,6 +191,7 @@ bool qdev_prop_set_drive_err(DeviceState *dev, const char *name,
  * Set properties between creation and realization.
  * @value must be valid.  Each property may be set at most once.
  */
+void qdev_prop_set_link(DeviceState *dev, const char *name, Object *value);
 void qdev_prop_set_bit(DeviceState *dev, const char *name, bool value);
 void qdev_prop_set_uint8(DeviceState *dev, const char *name, uint8_t value);
 void qdev_prop_set_uint16(DeviceState *dev, const char *name, uint16_t value);
-- 
2.38.1


