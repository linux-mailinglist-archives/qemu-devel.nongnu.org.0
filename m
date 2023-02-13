Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E653693EA6
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:06:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRStU-0000oy-GW; Mon, 13 Feb 2023 02:04:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRStS-0000o9-U8
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:04:54 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRStR-0000mm-5C
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:04:54 -0500
Received: by mail-wm1-x334.google.com with SMTP id n13so7993863wmr.4
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5xw6YWbqYTi/Ye8J2dXQn81KMiMRy7Drw2jaWnSC+88=;
 b=ioPYMvi68OXe3G4515y+qHdHiDU8Fhk1Fr7O9At1ahbzlE27TqKTifQOxvdKmuqEwT
 oaMkcU6hWZZtlfE67Nggeg47hsr1IiK3hhaV4LNg9X3JAb0HyM51fB34/8wpGziQVuxo
 kp7fsFt83eOJ+h+QVlG3T690LJx6dzR3qeLbif9Pg3AkeNaCQ4eOs07V20DpiqJ5XN62
 r2R34eJbqILz0O8naTtPLKXmb8D9YDyo3OuJhYunaeLTqRKbHYh1aDCSqgq0dOwmSam0
 MviowIQph6WrPn4tb363rpSJNDZwyK9kIG3aHrN8lCJQgv4W2akFfafsvE60yy4se+0w
 BRCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5xw6YWbqYTi/Ye8J2dXQn81KMiMRy7Drw2jaWnSC+88=;
 b=E1Gw2i7uizEdiJ6nU8ZLwS2ZHo4oG4TedjJL/ewwjjEsWquMl76GGWNu6hgR6MGM0l
 XqIpsgdEDpj8c1TWOUc38l6lQnA6D7OdCl3QXE0+9ACSessQIBPs/yWfHEBI5aRACCQp
 LjS6C4y6JFVb4AJB68KCdye84pw3Co3rapo/eHmY35TIl17jIhroXkYz4wHMa/YNZSOS
 RPJ92Rw/7O2QgxSp2vgUVwPiwwRd478Kx7hCgEhOGwkzcr6iXxm8vnPehsqTFw9+8svL
 MSVqY0hbvyUEDFH2kTlmAJFgitHgHOntfL5ycXP600AnImvmTRaq8dnzyArnC85ULUy2
 MQ4Q==
X-Gm-Message-State: AO0yUKVoSfuvN/ZW0mTQkAwLVktAUFJ0tXRFRw8El/JQZdPt/Cdj/Mh2
 caxxZ54tItstOCZlOyj+rVcAN9BbYtO2vJF1
X-Google-Smtp-Source: AK7set8cwylg4ojUMzs2HVrufnV579dAZnrv+noo9OVylwZLCmnAyTCkMvBHASFlwqc5XHyC3kqwzQ==
X-Received: by 2002:a05:600c:810:b0:3df:f7e7:5f01 with SMTP id
 k16-20020a05600c081000b003dff7e75f01mr17762961wmp.15.1676271891413; 
 Sun, 12 Feb 2023 23:04:51 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 az10-20020a05600c600a00b003dc3f07c876sm16543292wmb.46.2023.02.12.23.04.50
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:04:51 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: Gonglei Arei <arei.gonglei@huawei.com>, Li Qiang <liq3ea@163.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, Hu Tao <hutao@cn.fujitsu.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 xiaoqiang zhao <zxq_yx_007@163.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH v2 5/9] hw/pci: Replace dev->parent_bus by
 qdev_get_parent_bus(dev)
Date: Mon, 13 Feb 2023 08:04:19 +0100
Message-Id: <20230213070423.76428-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070423.76428-1-philmd@linaro.org>
References: <20230213070423.76428-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

DeviceState::parent_bus is an internal field and should be
accessed by the qdev_get_parent_bus() helper.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci-bridge/pci_expander_bridge.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-bridge/pci_expander_bridge.c b/hw/pci-bridge/pci_expander_bridge.c
index e752a21292..8c0649c071 100644
--- a/hw/pci-bridge/pci_expander_bridge.c
+++ b/hw/pci-bridge/pci_expander_bridge.c
@@ -151,7 +151,7 @@ static char *pxb_host_ofw_unit_address(const SysBusDevice *dev)
     assert(position >= 0);
 
     pxb_dev_base = DEVICE(pxb_dev);
-    main_host = PCI_HOST_BRIDGE(pxb_dev_base->parent_bus->parent);
+    main_host = PCI_HOST_BRIDGE(qdev_get_parent_bus(pxb_dev_base)->parent);
     main_host_sbd = SYS_BUS_DEVICE(main_host);
 
     if (main_host_sbd->num_mmio > 0) {
-- 
2.38.1


