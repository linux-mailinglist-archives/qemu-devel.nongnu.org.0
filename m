Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A8BC68A14A
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 19:11:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pO0Vy-000091-8O; Fri, 03 Feb 2023 13:10:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Vu-0008EN-2J
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:10:18 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pO0Vr-0008VI-C1
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 13:10:17 -0500
Received: by mail-wm1-x32c.google.com with SMTP id n13so4494952wmr.4
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 10:10:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ok2EOjmCsX5+0JFRDcAc0OAjSODkQVsQacDzbNlLsUU=;
 b=OOnbn6JlbCfgbp0zvxoEEPom4S1zlra/nWKhZprQuQcB93S0slNfRCPfqQhtYlnw/o
 ziKsKkqNan8Vfv5imJgY4Jw7CasKv/EDzEQonEC2w8VtX91IqBkBrbQ3nP0k8ECdRZlx
 R/TfnZUhQJOkSzr+x0A3B2UVWfVOIo1cRc8D80NXPEI7HiRBmb3HwYbGF64FTMn00nhx
 skysicGeHnqJcEc8skdRheNE+blwx/89csVZX37Cd7NCnnbepduw21g3mxjtenVuvuRJ
 z9yKkyA1i85aXJb3NlBkYAJlgSEMOXGsCb0pplDWz+R59y/MZoiVH4xbL5Ma0YDBj7QY
 /DJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ok2EOjmCsX5+0JFRDcAc0OAjSODkQVsQacDzbNlLsUU=;
 b=aovGCnrfiD/wF4yRNjS8bDxh7CXDAdPQ342Iuu7PYMdseVQRoC9GKgnkeh7VmYKQ/b
 hUV71UQt9Yo8bVZ7VJO3GSCGJO5H86ApCI8rpTTS7EUjIjr/cqSNFSOmNwQ0EVu8SPfX
 Q/2cHULZ7bY1IPiJQGPrM/6EElbH++vLgkTqot4GaxeYFFWSoyW/oqSUQxoodiE730ho
 GlA2+Onu7PlAG/tLd80UkEfyLfUEj9Zt0Vhbp9IGAmOINm0EoPXF0CtHDxuN9cR+oYzG
 9NS9kCszUz1dK4qaBRNjexZQoQWEY4Sj0kI7uCq8pv1hlWpOLrFm1egWzV/oVLT3P2tI
 BrTg==
X-Gm-Message-State: AO0yUKXXrYLQ571fxKpDPxF/vA2AkCiv2NI+zUZnDBP97xSwAu/QBsYx
 hqZl6pvNz6GVYNNEY/eHYKBLuH8PHvmzBEcQ
X-Google-Smtp-Source: AK7set8WLpr7q1W4zDI/xQvknkuw4cSasu+VD9XCEH2MDAA+6sXp+vYcq/1ZT3Y8feaiwmCY56CiEA==
X-Received: by 2002:a05:600c:3d1b:b0:3db:fc3:6de4 with SMTP id
 bh27-20020a05600c3d1b00b003db0fc36de4mr10822625wmb.35.1675447813544; 
 Fri, 03 Feb 2023 10:10:13 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 m5-20020a7bcb85000000b003de8a1b06c0sm8588291wmi.7.2023.02.03.10.10.11
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 10:10:13 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-riscv@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PATCH 11/19] hw/hppa: Set QDev properties using QDev API
Date: Fri,  3 Feb 2023 19:09:06 +0100
Message-Id: <20230203180914.49112-12-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203180914.49112-1-philmd@linaro.org>
References: <20230203180914.49112-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
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

No need to use the low-level QOM API when an object
inherits from QDev. Directly use the QDev API to set
its properties.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/hppa/machine.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index de1cc7ab71..6bd6a8d722 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -166,8 +166,7 @@ static DinoState *dino_init(MemoryRegion *addr_space)
     DeviceState *dev;
 
     dev = qdev_new(TYPE_DINO_PCI_HOST_BRIDGE);
-    object_property_set_link(OBJECT(dev), "memory-as", OBJECT(addr_space),
-                             &error_fatal);
+    qdev_prop_set_link(dev, "memory-as", OBJECT(addr_space));
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     return DINO_PCI_HOST_BRIDGE(dev);
-- 
2.38.1


