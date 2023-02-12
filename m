Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0109F693AA5
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 23:53:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRLDY-0007En-BO; Sun, 12 Feb 2023 17:53:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDL-000754-Fb
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:56 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRLDJ-00049i-Ph
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 17:52:55 -0500
Received: by mail-wr1-x42d.google.com with SMTP id a2so10446543wrd.6
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 14:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3YnlWYrFQuWXt1rppNJud8kwI6R078rMYORIY8x9Pr4=;
 b=LW4lyb/sy8EE9i2fRD6VtwV+RBA2vgAB56vsAPYxb/2SaNwrv7+qhrb2xUWvswm96h
 ZNO6XfAY6l842ROdmxk4rJgtw0pEl2fmYq7bJZOE+Q4hatAfN6Zmjcr5HCduFemk8Let
 7PGfJBTzJsjd0V0CU1A3e4ZTxh13C+G/sbyiVzFxnne9pyXhcvVTTwD5CbpJG1mEoc24
 UvEGK1Q5MsYqL+WW/+KPvDJjOXiGqDj+OZakyAO/1u6+kgTYfXya/gPG2BFAS+jjZu+c
 e36BrIN/K1mQPgaUPmgTxicWgk5zAWAl/g6EZPFdKhUddv9Y3yipNVtsHUUJGRbRDSJe
 qsuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3YnlWYrFQuWXt1rppNJud8kwI6R078rMYORIY8x9Pr4=;
 b=NwKCPEBGTX8+7d5/Fr6e0e74P7NlcSu4fj/CuqTJjxD62UVATRAEpni5VaB1McUeTt
 pWdjyp0xTm8ayGue6pgL9yUdaUe3PQnFfcCs4RnTzDBpogNB4VsnDCjOYpqsRVZaGFbe
 TncIqgxfPdU5UnFBNHJM2zennSb/Ot2CT4OOBUhwQBD8IgmbKDnMpzPB3xrFlbQGD+Nv
 OU8QnKYXjmzujSa7+mYd4B5ce1IxUtSp8wrj1jERvVYVlzYd/5W+dx9MK/p6nR041d2l
 NKZiyfIjIDtE1Ln+h2HOxZZ1golmmaSAlOi8dHLc1jXUSaYZk5fj95C5UQ1GwDiCJhJr
 4UFQ==
X-Gm-Message-State: AO0yUKUflW/LLMQeJDNNB1rwn9cU/7OQ9aeKJ1JRGVAkTUqMsDNpPWih
 WiX5n7+qhjzMJkZnEoZSeCHw1w==
X-Google-Smtp-Source: AK7set+A4VYFc0jcoJXDMk4zWasBFts2ZQcwznWF2UZNAM8veX+hsFqfOj+lKv1w66Ce/F4RIxI7uA==
X-Received: by 2002:a5d:5150:0:b0:2c3:f971:ae1 with SMTP id
 u16-20020a5d5150000000b002c3f9710ae1mr16057077wrt.29.1676242372161; 
 Sun, 12 Feb 2023 14:52:52 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h8-20020a5d5048000000b002c54d97b1ecsm4929144wrt.72.2023.02.12.14.52.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 14:52:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 xiaoqiang zhao <zxq_yx_007@163.com>, Hu Tao <hutao@cn.fujitsu.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 qemu-s390x@nongnu.org, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Li Qiang <liq3ea@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH 12/19] hw/pci/pci: Replace DO_UPCAST(PCIBus) by PCI_BUS()
Date: Sun, 12 Feb 2023 23:51:37 +0100
Message-Id: <20230212225144.58660-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230212225144.58660-1-philmd@linaro.org>
References: <20230212225144.58660-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

Use the PCI_BUS() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pci.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 2e785e3aef..ae5c33adb6 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -391,7 +391,7 @@ void pci_device_reset(PCIDevice *dev)
  */
 static void pcibus_reset(BusState *qbus)
 {
-    PCIBus *bus = DO_UPCAST(PCIBus, qbus, qbus);
+    PCIBus *bus = PCI_BUS(qbus);
     int i;
 
     for (i = 0; i < ARRAY_SIZE(bus->devices); ++i) {
-- 
2.38.1


