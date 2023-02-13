Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960A1694261
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 11:11:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRVnT-0005D4-NP; Mon, 13 Feb 2023 05:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVnS-0005Cs-5v
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:10:54 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRVnQ-0003LE-AQ
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 05:10:53 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso10852428wms.5
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 02:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=o4H6riwtMA9+5M0vKpHD3dVPzw/4zpOBYGxVs0JPTRI=;
 b=j70ciKCKFLZfI8MJ0Vzskz0fLSg+HpTFzjJOj/3DcCairx35hAi/RucjH6wj18KigZ
 NIZoW7FiP7EXGq5czsud+l13IfvlS1a09x79JoOZx28XRbfCWS231iNwfZQHAxG8qQBC
 T7IUDGGWpvUxH8GCOOuPOwF5V81zFHksnGCkM6K6v4ab8+CWTtIJnxTL9gqtO9OAoGx5
 HI0gjoBln4t9UUvuYUvdpBgllO12aWIHsq2VBP/QEd3TG/mwIIAednptbtm93/JJS4zi
 jTfncYAT9IPjxcnfibYiSP6RIbSGaJwZV3NkJgf2wdxRz+9PG/NG6vKmsvYd0WpKj0Do
 phXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=o4H6riwtMA9+5M0vKpHD3dVPzw/4zpOBYGxVs0JPTRI=;
 b=cECP//rA4URVN3UXohENc/N0F9gFPMKjQ/KEL3Vg/IypIz6uofZurfCRHSL8SA1Laz
 Apt6ba1296jHBDARqZqemD5d3uEmcjG005x/vAUKoi22ftBXQv5NVhtv3DxmTeNtPrgU
 SRW/53IJ3etXhbQdVpO7GE/j575ZxohiKdlnyXXIdMtCu/89Ofa7zXxBoROFm1RJvEg3
 i+VRdEAU8D2UGOYmNbSwdl46CNqYQ+OG4tZF4gScQNiY6InIwRP6A9lQic8lQoxTODtr
 8OgVS/3YaBe551CBLYb8q4AU0sPPjlqlXaXsD1LoarBbsIf809rXH7lX8UJCO+91Kq2e
 kxQg==
X-Gm-Message-State: AO0yUKVgLzB+3YE4yqe8Avp2+AtCMkhowqTAamdWWnRXCTExruR0Zv/J
 r1vzCjTzecav3XPtoVR8Vljd4xHKk+08P+o8
X-Google-Smtp-Source: AK7set+6cUj+q+ilo9ywfBsU86RCb6LWlfuFOOAnr4Bi0edaOEkO4JgSjVyYBaF4gZ2wHred5neocQ==
X-Received: by 2002:a05:600c:3088:b0:3df:f860:3089 with SMTP id
 g8-20020a05600c308800b003dff8603089mr20829484wmn.32.1676283050531; 
 Mon, 13 Feb 2023 02:10:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 d15-20020a5d6dcf000000b002c3f9404c45sm10422635wrz.7.2023.02.13.02.10.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 02:10:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Jason Wang <jasowang@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 0/7] hw/net/eepro100: Finish QDev conversion
Date: Mon, 13 Feb 2023 11:10:41 +0100
Message-Id: <20230213101048.94519-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Convert EEPRO100 to use the latest QDev conventions / style.

v1:
https://lore.kernel.org/qemu-devel/20230213070820.76881-9-philmd@linaro.org/

Based-on: <20230213070423.76428-1-philmd@linaro.org>
          hw/qdev: Housekeeping around qdev_get_parent_bus()

Philippe Mathieu-Daudé (7):
  hw/net/eepro100: Abort if pci_add_capability() ever fail
  hw/net/eepro100: Introduce TYPE_EEPRO100 QOM abstract parent
  hw/net/eepro100: Convert reset handler to DeviceReset
  hw/net/eepro100: Pass E100PCIDeviceInfo as class init data
  hw/net/eepro100: Remove instance
    EEPRO100State::has_extended_tcb_support
  hw/net/eepro100: Remove instance's EEPRO100State::device
  hw/net/eepro100: Replace DO_UPCAST(EEPRO100State) by EEPRO100()

 hw/net/eepro100.c | 147 ++++++++++++++++++++++------------------------
 1 file changed, 69 insertions(+), 78 deletions(-)

-- 
2.38.1


