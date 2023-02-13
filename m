Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03AA2694FA5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 19:46:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRdoe-0001nB-ND; Mon, 13 Feb 2023 13:44:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdoc-0001hf-Bp
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:38 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRdoa-0008T9-Fz
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 13:44:37 -0500
Received: by mail-wr1-x42d.google.com with SMTP id m14so13242538wrg.13
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 10:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3YnlWYrFQuWXt1rppNJud8kwI6R078rMYORIY8x9Pr4=;
 b=BfsZ/BP4Bj77HitzpAxlAgqnSThR1vBBm4ORMLX3gPBBk+Yt9lLoiFO5JNcCQ/CrTQ
 5ZLRYeMaTkKUIZpiCo5h6WzLQwUf1UOFFiyIGdFE+FaRHVruAZFaQ1il4/10R0jz/yhR
 DunoSIYVsXnAXXQ+Uhl89HK6YJDbaKCdLR9emwlSoObFYTL9YvtSetyVVcK82f9C/FVU
 TzX8A7LPSwPlSWSg3JVfGUJMIPdq+X1VaftsTe3iGjOdTYDLkvGQNgTN0QFsNi9pEOv7
 ORjPr3HuW8kpgqHhaAa7KokUtEmdl0RDdSBp5W2DdLpBVAAzX5dUeUulpq23wNdmpjJE
 XVeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3YnlWYrFQuWXt1rppNJud8kwI6R078rMYORIY8x9Pr4=;
 b=nmw52/FNX6uSzEhb+kbb2a3avtTs6j1Zj5EQxsZRuXIYAkR4QrdEL6onFXPT5XxJKB
 W+Uq/0x1YIKvhuuRakgy+wUYO9//sHYwzxQx6ubMx/EdsdLWHgXRDm8pzEOSSJ20QfEk
 vfj6XoCKdUOtk/IPflBk9EItotDH2UJaqeeOhX6BNAaxsi3GOFUbnHZL2Cd/AJuJUDmn
 HDiLHxk8Vboa0ccav2+7Zuy1ht0xQnjrV5AcUuK9LX6mo6BKAHtZFqbCgrf54xlluwP4
 9O8QfuqsFMcl8Hdvh4Lv9Tkatakow0gc2vqV6hsUT4eO+Ele1eINxBKS0TdJH3MT/iIb
 lRjg==
X-Gm-Message-State: AO0yUKW6JU1teBBO80QXzEyOShs1686c326ZA4mtJ5W5sCOOP5NrhfMm
 r1+KQKycKSaFitTOwPp8FfHgJ7RtOQME+QJt
X-Google-Smtp-Source: AK7set+SNr4ZuTEvP/gd8VtjCUM0EEHTi7QjIKQsOuz3b7ITdDO+q7mpfZMBrbPVemy/B9OjZYrzFA==
X-Received: by 2002:a5d:5044:0:b0:2c3:eaff:aae9 with SMTP id
 h4-20020a5d5044000000b002c3eaffaae9mr21611803wrt.19.1676313875408; 
 Mon, 13 Feb 2023 10:44:35 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m17-20020a05600c3b1100b003df5be8987esm19080586wms.20.2023.02.13.10.44.34
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 10:44:35 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Hu Tao <hutao@cn.fujitsu.com>,
 Gonglei Arei <arei.gonglei@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Li Qiang <liq3ea@163.com>, Thomas Huth <thuth@redhat.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v3 10/14] hw/pci/pci: Replace DO_UPCAST(PCIBus) by PCI_BUS()
Date: Mon, 13 Feb 2023 19:43:34 +0100
Message-Id: <20230213184338.46712-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213184338.46712-1-philmd@linaro.org>
References: <20230213184338.46712-1-philmd@linaro.org>
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


