Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25982693EC5
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:10:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSyC-0002u5-Q8; Mon, 13 Feb 2023 02:09:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxs-0002pT-DE
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:28 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSxq-0001yb-FN
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:28 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 j32-20020a05600c1c2000b003dc4fd6e61dso10536204wms.5
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3YnlWYrFQuWXt1rppNJud8kwI6R078rMYORIY8x9Pr4=;
 b=ZSanReyF0SBsFI0wzV6A/ny79s0DghjZiGjdjjTSj6b3YE5MVqJHj+eWMgBAzDtXMi
 T9IPaWLo72d24Cx7e6AwBKAYTUyqALec+zvpOHNcg/S7pdt23W31wh4AaN8a7mhVNOzu
 Z6KJiJVAHNM9Uq4LpeQoOQ8hTzqXrBNnutRinhPi7Tk+2l3c6g448AzUVMJ3TxM4hml+
 2vLdIhsFsq9JC8/m1QqU6z82WCA+olaK1AhmNhOiZ6o+QYn1aGe8aA8KtV1kiX/Os4fo
 pVeUqZj8CmDZjcltYWSDUm73FfhDp6Nk9f15EEGQH1kZDD5Z9qTnw1X/b5O79jMOJCPx
 YPbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3YnlWYrFQuWXt1rppNJud8kwI6R078rMYORIY8x9Pr4=;
 b=ZxAolnZGL/Cj/nFoAu85SiCNHsEOvdNXKdwwnjr71gRldBIUiTivXNMOuodFXd7hrF
 VgOW8s+qy2vRpAdOejiH8mYL8pA5WfsfV0b35mvB3LZoxEqDbRTAbiPTuqK0wsnGmKWD
 TOYCUCvlU7MsPdg5VBz6dBswUiM+LoBG9gFHU5TNwq8zUOPrLoyPxLDMC+3BRRyQZBtI
 SNeSPF4pUonM+D46/szS+3+4JoL+W1JD+Nh3VrWdbcZMkJwT1y+fnG4lqbnwfuIurOxh
 P0mXGeBsAl1YZri6CgFqlbneriDj/oZ7jMAfkK+NHUZu2gJuwk83Wm187zhsKQjorYzP
 zTHA==
X-Gm-Message-State: AO0yUKW8ajQG/1q14Cx7/IyAH6Khfz30SHuddpsX6WqCVrgGUi99Da1R
 CFmrXsfHnpT2mcX52qAsAT2SyAOWf0sLClui
X-Google-Smtp-Source: AK7set/iABc0CPTQFdUyFb2MNZsPMiDQHz/uqY3Dz8gdOJj3jfBDzS8D1YZUbFzn+6AKA0xBccy7Xg==
X-Received: by 2002:a05:600c:4b1b:b0:3df:fbc7:5b10 with SMTP id
 i27-20020a05600c4b1b00b003dffbc75b10mr17580759wmp.0.1676272164922; 
 Sun, 12 Feb 2023 23:09:24 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a05600c198e00b003dff870ce0esm17259160wmq.2.2023.02.12.23.09.23
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:09:24 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 12/19] hw/pci/pci: Replace DO_UPCAST(PCIBus) by PCI_BUS()
Date: Mon, 13 Feb 2023 08:08:13 +0100
Message-Id: <20230213070820.76881-13-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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


