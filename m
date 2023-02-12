Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 79662693AA7
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:53:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLDu-0001Ki-KR; Sun, 12 Feb 2023 17:53:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDs-0001E8-FF
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:53:28 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDp-0004E7-Qz
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:53:28 -0500
Received: by mail-wr1-x433.google.com with SMTP id bu23so10432791wrb.8
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:53:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=pQvt0NVqKQRnGWvOIKjTRBY46uNvNG89/oXED2HfaRM=;
 b=BheFvmqQeN4YY4MY9Iok1QofNVvjoYfVCmL3wRsf/3VwDQDPIyhhqhCanffPUqIWm3
 Ye5TiNdL2tv7gxLvyQZD7dp6SdxmXgiq3ZTuVlae+zEl57f0mf2b1epkvBESDKF8/sX9
 g5NqdBXPUeGmjukfGReg9HE0LJUbCiKvdShr2ehqrECWBRk65DCJomIIlGvdEzKUnNhz
 q0fbydOjP76o6rr/bdvWrIfablZThSFWYjxcdrSlRqZgA7a7jHX/d2Upd4tjcptswd99
 INKvGIuV1dS+dLlIswLkcHApoXUbW0uWGq+zPTWd3w2bCS5Fl+6maSkFuq36l1akqdpq
 qwNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pQvt0NVqKQRnGWvOIKjTRBY46uNvNG89/oXED2HfaRM=;
 b=Qv84Nan8wvIUZ4GKgTzztd5PZA0iogQjRHwAiHqL87MtUSYhf5r48YxTaZURfrNg/8
 eTZ9uDh23rJlB2/6cIdmkycf6RBWEYT8FEk20O8cyG2xeTfFbBirA+JDYFGACsCpfs8Y
 HJtnOHMPnsjuphtr6mwa+J6+DAlOsAIBIb634ZTbM9XAy9dSVO6+gEADujgqTgnEi6ur
 TEOJjn4Xo4WylsIbdUZSuBrTVq2RPjuCXWdoZbl5fPcREzeJ3ssvPfWJkuZjEibk/4Wg
 j6myKP4i8nGaiAFST55GBZ7hpjUGRazObFAnwdSoLCUM1IMIFRUaT0Z1MPnDRSnEdSoW
 fZiw==
X-Gm-Message-State: AO0yUKXBsRR8+6X1IaRII6XcHjRfqqdNzV8LkM6yIZxfY0bfC30X4d/6
 0oKQ6jnSGLDUS1slT8Yh47ICFg==
X-Google-Smtp-Source: AK7set8Jb5xmutZHP0jBQDVW2ykbAnGrZv10UT88eS/p+9DZtJx9WA+ByxNyxLrPYjzDmnjRrgRm/Q==
X-Received: by 2002:adf:f301:0:b0:2c5:52b7:8436 with SMTP id
 i1-20020adff301000000b002c552b78436mr3518656wro.21.1676242405168; 
 Sun, 12 Feb 2023 14:53:25 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 u13-20020a5d514d000000b002c3f50228afsm8940260wrt.3.2023.02.12.14.53.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:53:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 18/19] hw/usb: Replace DO_UPCAST(USBBus) by USB_BUS()
Date: Sun, 12 Feb 2023 23:51:43 +0100
Message-Id: <20230212225144.58660-19-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
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

Replace accesses to qdev->parent_bus by qdev_get_parent_bus(qdev).
Use the USB_BUS() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/hw/usb.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/usb.h b/include/hw/usb.h
index 32c23a5ca2..f743a5e945 100644
--- a/include/hw/usb.h
+++ b/include/hw/usb.h
@@ -520,7 +520,7 @@ void usb_check_attach(USBDevice *dev, Error **errp);
 
 static inline USBBus *usb_bus_from_device(USBDevice *d)
 {
-    return DO_UPCAST(USBBus, qbus, d->qdev.parent_bus);
+    return USB_BUS(qdev_get_parent_bus(DEVICE(d)));
 }
 
 extern const VMStateDescription vmstate_usb_device;
-- 
2.38.1


