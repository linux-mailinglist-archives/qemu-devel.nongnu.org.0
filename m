Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1393C69D041
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:06:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7jf-0001eX-JP; Mon, 20 Feb 2023 10:05:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jY-0001YY-Gc
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:40 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jW-0008Pc-Px
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:40 -0500
Received: by mail-wr1-x434.google.com with SMTP id c5so2230289wrr.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9u15jpuOfwEVXLJzjPb3b2l90e4PtdG+UU4bHmgsE5o=;
 b=RMWeA/1DUNU/mSgesZKESsaWE52KJLBrIkDhh1pCFUt79cs1JsT/nDsjR2GYaP58Hh
 RfX72N1TNOT40w69PJbWrQTomzhIQudyKWB3vBuBKhFi4wTzSC5V6GxZv72MCdAd9X3G
 ZfgqdccPB1fJBJqNKcvIcR/i8sr48jeJFmXUrT4ugVP/gNGpqlyFvjcGN83nS8cFU9EE
 G+f2ZvEwVSbJ+xkrzdGP45EYJgoqUFnn9GR5urH5Z+zNyS6siUbEOLLjGH4Hu2noPj3o
 wHkUr/XjbR3UbBLWkQc/EdSulcWIzbXjwozdmZE/dM45SlIm+IGU3MXK5WsT0VdK7zdP
 dDRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9u15jpuOfwEVXLJzjPb3b2l90e4PtdG+UU4bHmgsE5o=;
 b=meqqfkxqgZytHSDfx9EpoTXd+4tBDjK5JFq6r/1FjoeMHB+U3RdAWy9jvwoBHDGM+1
 AFOYZuClORtC51su032yR/MBBNkmIKhdRQwld7FXAXLuWsOH/1tOfNq4EktS1CzLtxVy
 Xfno6QzWO6/T8h2i69h7yh7KlQNzAfaXvecjZ1OJON9d0dqPbGqmB67qwuIRSHj4ggQv
 x1Mr021+6Hcs94kiry41KMYL/K0aMHZrWk5X5UdtRkthMrwF5Jc6cWbYAlM4xPj5dCya
 dcQ1y1vFNgXJMOK4pGNP0i/Z6A+lfPMyeDsPgIzNTCWtwUc28FO0xSbCV3aawpPK9NXM
 GdEA==
X-Gm-Message-State: AO0yUKUOOa4LQmsDs2jtldJYAIOc7zU87moZ8CrNZmKgyWNYWpd4w2HG
 6izEwSU8IkJKAI4L4zctQ91QsqzKpfsE44fW
X-Google-Smtp-Source: AK7set8HLzg7NSMDXpDZ57qoK9yCAD7LIX3SYBPyoMK8yCBmoqe17Mozgr7+GqXTQrEw3JUzszqfzg==
X-Received: by 2002:a05:6000:2cf:b0:2c5:5313:9d19 with SMTP id
 o15-20020a05600002cf00b002c553139d19mr840769wry.26.1676905537867; 
 Mon, 20 Feb 2023 07:05:37 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j27-20020a5d453b000000b002c577e2fc87sm3633703wra.15.2023.02.20.07.05.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 07:05:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 4/9] hw/usb/hcd-uhci: Declare QOM macros using
 OBJECT_DECLARE_TYPE()
Date: Mon, 20 Feb 2023 16:05:10 +0100
Message-Id: <20230220150515.32549-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220150515.32549-1-philmd@linaro.org>
References: <20230220150515.32549-1-philmd@linaro.org>
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

The automatic conversion done during commit a489d1951c
("Use OBJECT_DECLARE_TYPE when possible") missed this
model because the typedefs are in a different file unit
(hcd-uhci.c) than where the DECLARE_INSTANCE_CHECKER()
is (hcd-uhci.h). Manually convert to OBJECT_DECLARE_TYPE().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-uhci.c | 2 --
 hw/usb/hcd-uhci.h | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/hw/usb/hcd-uhci.c b/hw/usb/hcd-uhci.c
index 30ae0104bb..f77ffda69a 100644
--- a/hw/usb/hcd-uhci.c
+++ b/hw/usb/hcd-uhci.c
@@ -60,9 +60,7 @@ enum {
     TD_RESULT_ASYNC_CONT,
 };
 
-typedef struct UHCIState UHCIState;
 typedef struct UHCIAsync UHCIAsync;
-typedef struct UHCIPCIDeviceClass UHCIPCIDeviceClass;
 
 struct UHCIPCIDeviceClass {
     PCIDeviceClass parent_class;
diff --git a/hw/usb/hcd-uhci.h b/hw/usb/hcd-uhci.h
index e0fdb98ef1..69f8b40c49 100644
--- a/hw/usb/hcd-uhci.h
+++ b/hw/usb/hcd-uhci.h
@@ -75,7 +75,7 @@ typedef struct UHCIState {
 } UHCIState;
 
 #define TYPE_UHCI "pci-uhci-usb"
-DECLARE_INSTANCE_CHECKER(UHCIState, UHCI, TYPE_UHCI)
+OBJECT_DECLARE_TYPE(UHCIState, UHCIPCIDeviceClass, UHCI)
 
 typedef struct UHCIInfo {
     const char *name;
-- 
2.38.1


