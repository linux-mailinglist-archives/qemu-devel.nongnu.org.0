Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1B4F694FA4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:46:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdp1-0002gm-MN; Mon, 13 Feb 2023 13:45:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdoy-0002al-Qq
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:45:00 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdow-0000Am-Ty
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:45:00 -0500
Received: by mail-wr1-x42a.google.com with SMTP id co8so9513364wrb.1
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=BCofvFRozrpBRIR6kzkyhIQPbWbeiNV/KXSS7SVLec8=;
 b=H8Jzcy26pGsu1nLmy1m7SaZmtNpDEoeb1Q+k9YDdSc8habOWsCapzngown3yprPtis
 Sf0OXtLkXRnZYh+de5+UzPr2MzXDtdzc63AhZFZ5xu7ni0QFww/NN3xBD/E3Xx0L03pA
 nw4gq0pmkg/66RsJ6HxpzzCjSW3szBEGPCk8D4Ks4B4mugByqXs0OGb5wRe6Yh/ndADb
 lV7bCubTP8EvZ7+7Vxo5dOOPQcFh2gZFQRf0YGcghLJDVv534BUemr4s/75JPOAsiZwA
 xUYetQp8R5SDt+Q1yzbhE5YGTqhS52qPLyvjnuROukRWMyMP7KNh05o9cGN9DUmNhtim
 hlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BCofvFRozrpBRIR6kzkyhIQPbWbeiNV/KXSS7SVLec8=;
 b=EPKPZODjwgeBMbMftHn/Z8ONviFuNh+u3Vs4aMc7XXHiRd3WmAuSL+r6LHhPyu116R
 eGrQ5QYJ7KVdF0Dw7ueybLZnh8VcvEEzj9YoSyCFxYsIyURVh6cKoS4Jeqw7Sqjs3rh0
 KGQ8pZ3USuyjV4xCvm3tV1bJwPv2b/fq7mbusYFW+7QThOSq9w/5dR/O+7mtKXwLjEeJ
 gMXTAXPybrfQ1WudPcWBVrcUWyW9NBXVGEyXRULfuixEpeM63zbXT3HgDxrQ1Zu0xYF4
 ms6KZxid76rn8/mZZRnnF742eT2BU7x4iYndP5LPb/A805+3hUtt5GRPpfEmdOaIT8LF
 u0+A==
X-Gm-Message-State: AO0yUKW0flCkAJVBbfJdlgP9N59D4LjgeT9SgKvH0QLv9y9lTj78JgK7
 mZmDOOctLfkaAx+01kHmC9jhAGUw6N+FkXJW
X-Google-Smtp-Source: AK7set9iO04TRNbFszaXuMnkby4d2ldMBGfb02J/veA7yT949CLIwZdMnESjOK0n2axtwPhVQLzkFw==
X-Received: by 2002:a05:6000:1816:b0:2c5:5a63:ae07 with SMTP id
 m22-20020a056000181600b002c55a63ae07mr2561832wrh.23.1676313897398; 
 Mon, 13 Feb 2023 10:44:57 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u14-20020adff88e000000b002c56046a3b5sm1165934wrp.53.2023.02.13.10.44.56
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:44:57 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li Qiang <liq3ea@163.com>, Thomas Huth <thuth@redhat.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 14/14] hw/usb: Replace DO_UPCAST(USBBus) by USB_BUS()
Date: Mon, 13 Feb 2023 19:43:38 +0100
Message-Id: <20230213184338.46712-15-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213184338.46712-1-philmd@linaro.org>
References: <20230213184338.46712-1-philmd@linaro.org>
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


