Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FAA693A8E
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:48:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRL8I-0001Lx-MB; Sun, 12 Feb 2023 17:47:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRL8G-0001Lh-SI
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:47:40 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRL8F-0003Hw-CX
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:47:40 -0500
Received: by mail-wm1-x32a.google.com with SMTP id n33so1528880wms.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:47:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XKF2b7pEm6HyiNp404lQ+Vuu44DHRtt9tfJtec4bL+4=;
 b=QJQhtvzxYRjF2+O2PHDmhkguSW4JY1s5NkcHw4pZ4WzebGxrwpRpgO/zqF0VGJztf3
 uAeR1K9byj1Qng1ApxmHVgCPpWJ4kgwMAKBRGqA/Bx4JGet8T4PLeyxoWGyxswXLk7xK
 /L5F5HyuLgYpZtmY7r62mY7gMdbsknbBdRuI0Z3id7ZxI2wqoiFGpRob6kj8Rl2f5MP2
 PjFzzEQA1VB1wHczXfzYrKq0CfV1J/8cayZMbkj1ajrf8f+UGCRjTEzj7XUkMdU+fYo/
 H73u3p2u6jDO8txR5l8b/qWk/vajLlEFzrZNzTFQUWf82qgpe28Zj8I0JErlYMlg7ZhY
 9lQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XKF2b7pEm6HyiNp404lQ+Vuu44DHRtt9tfJtec4bL+4=;
 b=DBb01OQKIunQOE7q+PeZOdLRQBE8cIpxGp6OS4DRLpINdEyDP+GNiYKGWzoKW+8RnM
 VFEhvYsTvFFevLBD12sJdBxFeo4mnAI9dcdw/u9WG/cgRC+EdpSm1Wz4ZTG2V0w2klSd
 nVCNCoPMeZ5TNXdyaY0z+4qSkiv2Excx14tguSV6o5oL2oQBpW66k6tDzszKeTL1ebd1
 ez78U+iHZNyUq0JeACNs74Fso82Ar6QesjkHjbLyGz2Tbw0UuRHH+wa+J0YW7r45Fmm7
 bkwPX5ytlrkQShdVaABi+LDkLLFTGpB1rzPoUXdNHUEv5W+bpf6JEY8coMUF3ywA5oUf
 0LUA==
X-Gm-Message-State: AO0yUKVqJZD52g/E5Khil9PptAAUri6UZExz0c62/5FchuzGWb1rGvDT
 lMI3sexWF/fmE56fE3L14pZLOcOL0DH+wCCw
X-Google-Smtp-Source: AK7set/wlJIED7yItPydhY+PgHHa5yehGvcHNS/n6p7MHkSaTAAHusnlfmSYsdCdlfFnYyo0PYYQVA==
X-Received: by 2002:a05:600c:4485:b0:3e0:185:e93a with SMTP id
 e5-20020a05600c448500b003e00185e93amr17964854wmo.25.1676242057974; 
 Sun, 12 Feb 2023 14:47:37 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 w23-20020a1cf617000000b003db1d9553e7sm15139526wmc.32.2023.02.12.14.47.36
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:47:37 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Eduardo Habkost <eduardo@habkost.net>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 1/4] hw/qdev: Constify DeviceState* argument of
 qdev_get_parent_bus()
Date: Sun, 12 Feb 2023 23:47:27 +0100
Message-Id: <20230212224730.51438-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212224730.51438-1-philmd@linaro.org>
References: <20230212224730.51438-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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

The structure is accessed read-only by qdev_get_parent_bus().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/core/qdev.c         | 2 +-
 include/hw/qdev-core.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index d759c4602c..43d863b0c5 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -330,7 +330,7 @@ bool qdev_machine_modified(void)
     return qdev_hot_added || qdev_hot_removed;
 }
 
-BusState *qdev_get_parent_bus(DeviceState *dev)
+BusState *qdev_get_parent_bus(const DeviceState *dev)
 {
     return dev->parent_bus;
 }
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index 35fddb19a6..f5b3b2f89a 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -715,7 +715,7 @@ static inline void qdev_init_gpio_in_named(DeviceState *dev,
 void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
                      const char *name);
 
-BusState *qdev_get_parent_bus(DeviceState *dev);
+BusState *qdev_get_parent_bus(const DeviceState *dev);
 
 /*** BUS API. ***/
 
-- 
2.38.1


