Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4B16693ECE
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:13:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSz0-0004qw-30; Mon, 13 Feb 2023 02:10:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSyP-0004Gx-US
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:10:03 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSyN-000258-3k
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:10:01 -0500
Received: by mail-wr1-x434.google.com with SMTP id a2so11055383wrd.6
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:09:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCofvFRozrpBRIR6kzkyhIQPbWbeiNV/KXSS7SVLec8=;
 b=DmjN9A8NmF78QSEwr/50ppyqm0pQQUOMfAO/KZGqKnHj6eet2/ggUCdnjMGltLz9Xl
 t+G+2Z8rExOZ3DR6NYrn6CefSivzueggKCjhxJcdfos8ka9vCuih0sHjtg46YOjgpEWo
 QRwV4JF8/3EUrFzXF3Sp79UbaplTiv+JdykmCICSH5LNZOv//oRm5lA+Ajk/nigXNBlf
 yWWkAkbCtZwNFr89RtBFMpQLcUPoMRpVaYgeEUIn5PWDPwwELiSa/CR0Ejn7c5aQD9Ga
 M4qFfnTHEpNa7Dj/A0Rhedv+VaceLwDR9SLLoAsZ2WKuqYZMm4yBzUj7QAK+oTwMdTwm
 D7YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BCofvFRozrpBRIR6kzkyhIQPbWbeiNV/KXSS7SVLec8=;
 b=oWo9fHx7APDQdKcZ14lIOUU0NHUVxfEUoc1e++COlkvSqqxmygQgcwgyEWL2wSgdjO
 6ESLmotj+eQoS5V6KtZ2+fYqH1xzUmudG1ub6T+MvGLkAqBk6JrGDHyxA0eDtvfLHa0S
 aMBxsRji8C2gSXP2swUFaGSDIOvV4Cz3gQ4AJ1BXEgGNHzNx+hxx+bK+9YeYJ8VKUGUG
 aul6ZAYnMyCdX2FjFW9/Ie5vjXFyTViXIdK015WwtcVnqXu3lbbavwscJqqv2G8X+Zg0
 ZpL70RDE5yxIzgcSaB6YoY4OGyiN4eWE39rpY7qhF2S3jL3mzD4Ks7R/fi9rA/OIqRuH
 EkTg==
X-Gm-Message-State: AO0yUKWiuP46M2+6wz07Ezyw8Np5ginOpQ0xh4op4e99aZp3zD5Ovibd
 M+a8ApWV0gAOQXVQEjgPC9HU4tk1HiDSNPaF
X-Google-Smtp-Source: AK7set8REWEl1bFta+67Tc9Dd4xnGUZiEhTx+RNTejtKecjWJASNMYyMJIvp5nK8bY54WPz7/SOKpg==
X-Received: by 2002:adf:fec7:0:b0:2c5:4cf1:a57b with SMTP id
 q7-20020adffec7000000b002c54cf1a57bmr6930067wrs.35.1676272196366; 
 Sun, 12 Feb 2023 23:09:56 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k6-20020adfe8c6000000b002c55551e6e9sm2958632wrn.108.2023.02.12.23.09.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:09:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v2 18/19] hw/usb: Replace DO_UPCAST(USBBus) by USB_BUS()
Date: Mon, 13 Feb 2023 08:08:19 +0100
Message-Id: <20230213070820.76881-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
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

Use the USB_BUS() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/usb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/usb.h b/include/hw/usb.h
index b2111bb1c7..f743a5e945 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -520,7 +520,7 @@ void usb_check_attach(USBDevice *dev, Error **errp);
 
 static inline USBBus *usb_bus_from_device(USBDevice *d)
 {
-    return DO_UPCAST(USBBus, qbus, qdev_get_parent_bus(DEVICE(d)));
+    return USB_BUS(qdev_get_parent_bus(DEVICE(d)));
 }
 
 extern const VMStateDescription vmstate_usb_device;
-- 
2.38.1


