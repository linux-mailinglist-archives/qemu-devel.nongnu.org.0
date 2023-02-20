Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E459569D035
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 16:05:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU7jH-0001RE-IW; Mon, 20 Feb 2023 10:05:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jF-0001R2-Gr
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:21 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU7jD-0008JH-LQ
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 10:05:21 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 o4-20020a05600c4fc400b003e1f5f2a29cso1377624wmq.4
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 07:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xacn9p68pkt2j2BpyFa3Hb/Son2i5YKqQIFsg1rRCpw=;
 b=bn8jXA//Iqltdoa+lkIfV/fhjPceh4tx5WPN4NmO1f71DgHIUCzhGsNtz+YGcSIRJi
 Q8kmYZvShi+SsTOJc9LRTQWGkhMJzUmNcRVSWtxQEJTlM4yvksOh5naAU8/1Rr9OCE7J
 KHkJ7tv1xCWOGP3VGVOn6xY8KSHQRlug7vuODGluGgQdHr9Txd2KV+TgdXh8qmUb5tmq
 2s8oHItTrDObo8osVMxPPv8FYii0yfX6LE/pqEYKgoKu8jcXSzpqeuW7pf0VWrbk7HMR
 E53mDJOe3KqkCfb+2dOHZUUXju8xSRg0XAZWgo9JDUshxUxtD3c2XmKaDfAzbgjibqcf
 4rQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xacn9p68pkt2j2BpyFa3Hb/Son2i5YKqQIFsg1rRCpw=;
 b=QX89KsnvnyqPV4FcX935IhfvrGQl12rga9zVcDkOJFferW+I/iuoRQIAanyIyrDgYF
 LjzHdJx4PtmiqNbNyXDOJshL8UKck/rffp+W2W3jGa95gFVxaz5JMochp7VFU1WXcQC9
 fgFFj13sqz+Wie4Dbf74oU2uzopb99HA0pBVNNMP8gGJ5YwnXMm/vX2Q9X+r9Ox+nZjT
 VrdMQDASv+469vWValtnS6itvpRLMh4+d99fxBS6N+FoUjgoW7GYuS1g67EdUBr5Qf04
 GdmCICgvBpngYJ6wd0S9yubKRI4vt+v8kJGvwB3poqtTihzp+UqGSIKO9cwMiF8rbayK
 8ckQ==
X-Gm-Message-State: AO0yUKX/tRCPp6boZL6GN0JCDFRHGE+MSDZNEGpnaPm/38zBjVKBsj4j
 OPruXT3BM9Racg/nFeqVx1I8hyN8P5KF7qbf
X-Google-Smtp-Source: AK7set82nbU5eesMbcPSEnXBYxePZLDqy1B5tP7FAKY3+pOaz0SLLzSY4XaB8V6PMpotspgFQMSnYA==
X-Received: by 2002:a05:600c:2ed3:b0:3dc:2137:d67d with SMTP id
 q19-20020a05600c2ed300b003dc2137d67dmr1061251wmn.16.1676905517660; 
 Mon, 20 Feb 2023 07:05:17 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a05600c1d8d00b003e1f6e18c95sm977654wms.21.2023.02.20.07.05.16
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 07:05:17 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/9] hw/usb: Cleanups around QOM style
Date: Mon, 20 Feb 2023 16:05:06 +0100
Message-Id: <20230220150515.32549-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

- Use QOM's OBJECT_DECLARE*TYPE() to declare typedef / macros
- Use QOM cast macros instead of container_of()

Philippe Mathieu-Daudé (9):
  hw/usb/dev-smartcard-reader: Avoid forward-declaring CCIDBus
  hw/usb/hcd-ohci: Use OHCIState type definition
  hw/usb/hcd-ohci-pci: Use QOM type-safe cast conversion macro
  hw/usb/hcd-uhci: Declare QOM macros using OBJECT_DECLARE_TYPE()
  hw/usb/hcd-uhci: Replace container_of() by UHCI_GET_CLASS() QOM macro
  hw/usb/hcd-xhci-nec: Declare QOM macros for NEC_XHCI
  hw/usb/hcd-xhci-nec: Replace container_of() by NEC_XHCI() QOM cast
    macro
  hw/usb/u2f: Declare QOM macros using OBJECT_DECLARE_TYPE()
  hw/usb/u2f-passthru: Use QOM type-safe cast conversion macros

 hw/usb/dev-smartcard-reader.c |  7 +++----
 hw/usb/hcd-ohci-pci.c         |  4 ++--
 hw/usb/hcd-ohci.c             |  2 +-
 hw/usb/hcd-ohci.h             | 10 ++++++----
 hw/usb/hcd-uhci.c             |  7 ++-----
 hw/usb/hcd-uhci.h             |  2 +-
 hw/usb/hcd-xhci-nec.c         |  8 +++++---
 hw/usb/u2f-passthru.c         |  7 ++++---
 hw/usb/u2f.h                  | 16 +++++-----------
 9 files changed, 29 insertions(+), 34 deletions(-)

-- 
2.38.1


