Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE62F65D483
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 14:41:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD3zi-0003cE-S9; Wed, 04 Jan 2023 08:39:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD3zg-0003bo-1Y
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:39:48 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD3ze-0001Tq-CS
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 08:39:47 -0500
Received: by mail-wr1-x429.google.com with SMTP id j17so27622603wrr.7
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 05:39:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E0jD820lsyDetFSkA1XxZx75shSUmhMZjVO0KmjpJic=;
 b=C9+LCnUpiIhP7a3tMDtjoraBbXgzz/uAXZODg5+qaifgoAGd7rC6kuk3+WemmiGEgc
 2SIFfG2U8hlb6arfcB1Ffg8kuF9L3p+bQrmTP2S7s1MUE6cGXXOaNKakDAkQLzfewyse
 E7T3MJ02fvYrciBB4if6SKTbAxlT3m3T3LD+K+RknA+qJzLdPcasFSFdULUK0SS9MCC7
 uJBi0joYAOnhq6ZyDbeYIyRZjMm28M8vqz/XirdzQfWTjJ1otOOIREYoytDqtAXCV9+n
 GX0UREbUqIxNdfVXs0rmxYL3mmB5/J4Mn0hvfu/4iIWejW37Gz8COIplbiQmM4hZjNTY
 huGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E0jD820lsyDetFSkA1XxZx75shSUmhMZjVO0KmjpJic=;
 b=7kez+puHQ/0n/Xy+KdaTrQW34K2JKKmsL1vokIjuha3iy9eCBbYycgC+J46Yfeie65
 Sw53IPDEKbx0U7YnSQUXgAtL8lZ3xl8jHSpFw/LhJ+rHir4vT/wawbqfORKQbH8OxxQ1
 w0ajODEr6f45zpGg7OVjsYuTTxTuFuLoLasiEQ4Q2N8IiMAluSTxzv9HsZTDPEfnw7rb
 9BpHFhF6LrKsxHpr4JyJW5GNE2NsKPWjDh/XF1dhMzrSgRpHPGY5olDv/coLrVa2blZ/
 zM3JiivdpvCbvZU82ZGOnqO/plXNk/thFbqXIBgmnLx33LXCgQeq8+Kc45yiEy9nC9QX
 YEfg==
X-Gm-Message-State: AFqh2kq4tAxLK1UiLUW6rWAm6xnvCRdFeYfoeEwrx1QTzI3Mxdy9hPmE
 bHCPCt1G2xq2cqETqIeByzUKZ80egXuhtfMJ
X-Google-Smtp-Source: AMrXdXsqbtDae6U5EQLLG/6SNgJrsI8fT9ATwJLZrL33G9dKthgUqfONg99bPOa36CwfwlR+1YdALw==
X-Received: by 2002:a5d:6da6:0:b0:288:52a3:d0dc with SMTP id
 u6-20020a5d6da6000000b0028852a3d0dcmr25780321wrs.50.1672839583583; 
 Wed, 04 Jan 2023 05:39:43 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c17-20020adffb51000000b0027cb20605e3sm26091150wrs.105.2023.01.04.05.39.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Jan 2023 05:39:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bernhard Beschow <shentey@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/6] hw/pci/pci_host: Trace config accesses on unexisting
 functions
Date: Wed,  4 Jan 2023 14:39:30 +0100
Message-Id: <20230104133935.4639-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230104133935.4639-1-philmd@linaro.org>
References: <20230104133935.4639-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

Currently we only emit trace events for existing PCI functions.
In order to ease debugging PCI enumeration process, also emit
for unexisting functions:

  $ qemu-system-foo -trace pci_cfg_\*
  ...
  pci_cfg_read empty 00:0a.4 @0x0 -> 0xffffffff
  pci_cfg_read empty 00:0a.5 @0x0 -> 0xffffffff
  pci_cfg_read empty 00:0a.6 @0x0 -> 0xffffffff
  pci_cfg_read empty 00:0a.7 @0x0 -> 0xffffffff
  pci_cfg_read pcnet 00:0b.0 @0x0 -> 0x20001022
  pci_cfg_read empty 00:0c.0 @0x0 -> 0xffffffff
  pci_cfg_read empty 00:0d.0 @0x0 -> 0xffffffff
  pci_cfg_read empty 00:0e.0 @0x0 -> 0xffffffff
  pci_cfg_read empty 00:0f.0 @0x0 -> 0xffffffff
  pci_cfg_read empty 00:10.0 @0x0 -> 0xffffffff
  pci_cfg_read empty 00:11.0 @0x0 -> 0xffffffff
  pci_cfg_read cirrus-vga 00:12.0 @0x0 -> 0xb81013

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pci_host.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/pci/pci_host.c b/hw/pci/pci_host.c
index eaf217ff55..ead1d3e61c 100644
--- a/hw/pci/pci_host.c
+++ b/hw/pci/pci_host.c
@@ -118,6 +118,9 @@ void pci_data_write(PCIBus *s, uint32_t addr, uint32_t val, unsigned len)
     uint32_t config_addr = addr & (PCI_CONFIG_SPACE_SIZE - 1);
 
     if (!pci_dev) {
+        trace_pci_cfg_write("empty", extract32(addr, 16, 8),
+                            extract32(addr, 11, 5), extract32(addr, 8, 3),
+                            config_addr, val);
         return;
     }
 
@@ -131,6 +134,9 @@ uint32_t pci_data_read(PCIBus *s, uint32_t addr, unsigned len)
     uint32_t config_addr = addr & (PCI_CONFIG_SPACE_SIZE - 1);
 
     if (!pci_dev) {
+        trace_pci_cfg_read("empty", extract32(addr, 16, 8),
+                           extract32(addr, 11, 5), extract32(addr, 8, 3),
+                           config_addr, ~0x0);
         return ~0x0;
     }
 
-- 
2.38.1


