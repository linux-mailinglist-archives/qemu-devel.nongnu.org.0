Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F397669CD4
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:49:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMHj-0002a3-9Q; Fri, 13 Jan 2023 10:48:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHd-0002YJ-1O
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:00 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMHb-0006Rg-4R
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:47:56 -0500
Received: by mail-wm1-x32c.google.com with SMTP id
 f25-20020a1c6a19000000b003da221fbf48so1347634wmc.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:47:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3WSU7eqoou0ND/hnMQSDXwNv2R4bWt5GFJigtA+wKxc=;
 b=U713nI2UYw0noBPlVXlb02z38asf3xlxabCS99/Z+USeGqPNGUOJdFfci31YAHV4Dp
 3nZS08TUIC2EvotWnkydnxuZSJdwoHwuQ1jsC73OIev/mYdtEZEMlf7xbra7tfaeM0D+
 UQbz4cyX/C/KAvrEk+3UZoCIbdGqAEzNgsnOBVbuZyL9yrWl6SIeHHrfX0jjmrXUFQi3
 amzJQDhk2uRAXiMmGWI9h182oDWuo65Y6Bt0ukaSSY9wGrSxfICWOldj7yBx5FyW8BMz
 uNGCT3ISvpcQ+QYaMrR8zocb87bOvv/PT5pTP8et2kQVZBJqbDk1JZ1veq745y34NXGd
 /LQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3WSU7eqoou0ND/hnMQSDXwNv2R4bWt5GFJigtA+wKxc=;
 b=A7rPRPSCqCvrk0ht9IS4LDVNNnB504QCfKWWIxEylKfHrHw1rNT2+1Jr4/flJPnMAW
 WQmnqydYIdpJ64ld1vQM91KvjDt9TyaUKKZ/TBZsDyUb5iBDR37COShjgYBnWhtrZwg7
 dRoJniKOoApW5fQ2P2j7zFP27R6YAXaJS6EL5ZowiVaikwdDRUa5Ns8bHChmo8oaxool
 JTwCI1XJfXgwZko7v+RkyCmrFJYmwL9qG5G1LUS0GcPeHyKHtU79oLiPRBUI+ztxYows
 +I5d63itS/YtLVBiij3VmfUWdWg8eHvld+ukkLsUsIfffZXnDC6TtL3Flq6N6ffAyC7L
 3Cxg==
X-Gm-Message-State: AFqh2kr1iBsSAFLnp8bq7H1WSFyhIitvovxtqoFw4Mnn10hbkrFvr++V
 WsCXR5cUwo5HyU0FpUj5EmJdpA6Q+/pmK1G/
X-Google-Smtp-Source: AMrXdXu5ICu5pZc1+mU9+dWd8LZfcKF5JWki+iA0tASmxy3jF1xJo4pxtSwDZARIuA1QiInEuBHJ4w==
X-Received: by 2002:a05:600c:4f84:b0:3d9:f758:e280 with SMTP id
 n4-20020a05600c4f8400b003d9f758e280mr13055657wmq.24.1673624874274; 
 Fri, 13 Jan 2023 07:47:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a1ce901000000b003b3307fb98fsm24452136wmc.24.2023.01.13.07.47.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:47:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 29/46] hw/pci/pci_host: Trace config accesses on unexisting
 functions
Date: Fri, 13 Jan 2023 16:45:15 +0100
Message-Id: <20230113154532.49979-30-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20230104133935.4639-2-philmd@linaro.org>
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


