Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5849B6897E2
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 12:39:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNuNf-00089j-EV; Fri, 03 Feb 2023 06:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNc-00088b-QT
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:37:20 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNb-0001Fl-2m
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:37:20 -0500
Received: by mail-wm1-x32d.google.com with SMTP id u10so586676wmj.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 03:37:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xiDeXbO3Wi4lEH6eghooUNVxGrmUdWjhAaUA++lBEzM=;
 b=ff+VGQZQ13YwSMQ+FoXRoribBtneMRHw6VroiUCYdcwqAwNSnbwWhZV6Lmx+WDWmTy
 KXsqFBuN8RMKNffCIbIlYtmzAqp0DSDJ73+YZSTlnlNTzTc47a074mnEasMqqc8Uh2u7
 xQHxcP49kGASgBAfeKyrKxM5WJGYC7gmy6eOXenBSWPDBui2Mq372LHf7w1wbxogwIHL
 8yIRWGG3QwPeUFlmeMCFoltogKKdhFPlOUBEsxHj7a3pCk3JlQTnK16NSrwpEjT+gAQv
 QQtviELZxF0kI8mtv5C4Vex+kIj/WWknpn9vKF/zKLmAYcDWv1DrTeDXkkpEe3sZdZIV
 kKRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xiDeXbO3Wi4lEH6eghooUNVxGrmUdWjhAaUA++lBEzM=;
 b=B75sVcR+NFsWTdJ/6wcak7hWgEv6YPnDJ30UUXTrx/alrFQG1EVwhamJ6Jif5ca8t3
 NDh0kGtnKZO2XhgkI6uA8ycAaBN3rJ/TDGKfKpskjubkyyU8+Wvo1f/xE4nUQILgB6VY
 UkEN6Jioc6l2ZEwUyPMiE1NXASSY28pL1EhoDKeNY/URHEmt8IDb6aaoQhL4t0Ygjk44
 D++0dSSiSHeOtmgi250Jsjn/fjYD9HFKkxdab3bPZd6s6hLxcdsQc2VcXLyTRvxXgUA6
 gTMlV6ZFd/ZDRIfvy15EPNuWmte9dCMcgyOEYFtAEFEhYH9F8WH3n2MCgitSF+V0x/+I
 j2ZA==
X-Gm-Message-State: AO0yUKXSSHz2ExjK3za6YEEw3mETmcPVgY4s5RMpckUNsd9z7E9ZFoWs
 qHqgFr+XrMub0/eftOqL4W1IKwpM2uN1DhNN
X-Google-Smtp-Source: AK7set+n9f4V7XWXqnUU8TnnNmr/xglLZ/EhOMuCL6L1YGIp663ioKmSmtRXrqAqYY29n+c9mi7wjg==
X-Received: by 2002:a05:600c:4f46:b0:3dc:557f:6124 with SMTP id
 m6-20020a05600c4f4600b003dc557f6124mr9772875wmq.5.1675424237412; 
 Fri, 03 Feb 2023 03:37:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v16-20020a05600c471000b003dd1bd66e0dsm2772651wmo.3.2023.02.03.03.37.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 03:37:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH 5/9] hw/usb/hcd-ohci: Include missing 'sysbus.h' header
Date: Fri,  3 Feb 2023 12:36:46 +0100
Message-Id: <20230203113650.78146-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203113650.78146-1-philmd@linaro.org>
References: <20230203113650.78146-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
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

Avoid when including "hw/usb/hcd-ohci.h":

  hw/usb/hcd-ohci.h:100:5: error: unknown type name 'SysBusDevice'
      SysBusDevice parent_obj;
      ^

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/usb/hcd-ohci.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/usb/hcd-ohci.h b/hw/usb/hcd-ohci.h
index 11ac57058d..e5e6b434fd 100644
--- a/hw/usb/hcd-ohci.h
+++ b/hw/usb/hcd-ohci.h
@@ -21,6 +21,7 @@
 #ifndef HCD_OHCI_H
 #define HCD_OHCI_H
 
+#include "hw/sysbus.h"
 #include "sysemu/dma.h"
 #include "hw/usb.h"
 #include "qom/object.h"
-- 
2.38.1


