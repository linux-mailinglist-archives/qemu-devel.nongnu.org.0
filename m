Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F31DF685E66
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Feb 2023 05:27:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pN4hm-0003am-QU; Tue, 31 Jan 2023 23:26:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4hg-0003aJ-64
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:26:36 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pN4he-0003Kn-NS
 for qemu-devel@nongnu.org; Tue, 31 Jan 2023 23:26:35 -0500
Received: by mail-pl1-x635.google.com with SMTP id b5so10010475plz.5
 for <qemu-devel@nongnu.org>; Tue, 31 Jan 2023 20:26:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01IaAKVWRL/Qzj7PsK1Wm+ssRudRuXKs5C9WWrNwR/o=;
 b=FeucdJls4j9YeuF/yAJO1lONgGNyvJBszC4X/s0c9+w+tzo1OmVdv/QsSIlrAbgfTI
 E9n0cIRInUhUSEYKJVgPCMakaj7nI2hSzLYC5zDpDm9oGYsjhKHMG3C1MB1vsF1dDCer
 SGLbwkNPwWeC2vS6qzx7P0wa0fLTwv1eKZwm1AUM5SYLNYn307HYJx+7aCDa2wBAaOM5
 Q69Yq1yiIKld96bVLiT/IM0n8e6Q3TPPP3bl2z2i4D74GThIvEjUdFHFXVzEirXPThmd
 RLbEs2W0OIhWyfTc7p2aUm2HLr4Fbua8QxnyIbuyJfbSxCEcz8iQieHdmLgyZCW/TL6+
 PgnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=01IaAKVWRL/Qzj7PsK1Wm+ssRudRuXKs5C9WWrNwR/o=;
 b=mKbp5fjtgltZ0NTFWWfY0Qmgeb1ti7r9xalmHtNA1/nGgvccSWzp+vYpXiD+A8z8Sv
 WvjAY6C49lII9pfx9/NuGikXi5wZ52dmM2XTTqN6of2sXnKWsYCTREcqy1uWh9AkpejH
 XqH6+zKq+nFpcyK/X5HGUPklj0LfxLjIb99p9T8LBIBQZDIFVuMyW7om/mwjZ2CXSKOo
 dvsHNleE1Czsf0PC90Xw7xA2rHNq/i1tczO0A+3fjpLT8l16Cx9BJwq3u+Xu3ViRhzuZ
 52daMRo5/gFTfgehdpE6VQFi/vwn7WxKbgx0vi8BKAqzS9p5QZsgwpo9f7M9/0JGYy96
 OlvQ==
X-Gm-Message-State: AO0yUKVzsYt1mObK236SZNxJ2fbb28juB/BwIckOaI+8ZZBIlsSFlmOc
 RTPuvCpBYjyt3DH+XH9vp+fXfQ==
X-Google-Smtp-Source: AK7set9D9KLwEA73e+L6rwJwhaWUdeaLKu1UHi/gJm9r6fhcoSlmtLOePMT1crGxpexlZuAx56RyCA==
X-Received: by 2002:a17:902:cf51:b0:198:9e29:cc64 with SMTP id
 e17-20020a170902cf5100b001989e29cc64mr990480plg.66.1675225593430; 
 Tue, 31 Jan 2023 20:26:33 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c62-20020a624e41000000b0058bb0fb6295sm9235316pfb.26.2023.01.31.20.26.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Jan 2023 20:26:33 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alexander Bulekov <alxndr@bu.edu>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Qiuhao Li <Qiuhao.Li@outlook.com>,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, devel@daynix.com,
 Yan Vugenfirer <yvugenfi@redhat.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>,
 Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Gal Hammer <gal.hammer@sap.com>, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v7 2/9] pcie: Introduce pcie_sriov_num_vfs
Date: Wed,  1 Feb 2023 13:26:08 +0900
Message-Id: <20230201042615.34706-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230201042615.34706-1-akihiko.odaki@daynix.com>
References: <20230201042615.34706-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::635;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x635.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

igb can use this function to change its behavior depending on the
number of virtual functions currently enabled.

Signed-off-by: Gal Hammer <gal.hammer@sap.com>
Signed-off-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/pci/pcie_sriov.c         | 5 +++++
 include/hw/pci/pcie_sriov.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index f0bd72e069..aa5a757b11 100644
--- a/hw/pci/pcie_sriov.c
+++ b/hw/pci/pcie_sriov.c
@@ -300,3 +300,8 @@ PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n)
     }
     return NULL;
 }
+
+uint16_t pcie_sriov_num_vfs(PCIDevice *dev)
+{
+    return dev->exp.sriov_pf.num_vfs;
+}
diff --git a/include/hw/pci/pcie_sriov.h b/include/hw/pci/pcie_sriov.h
index 96cc743309..095fb0c9ed 100644
--- a/include/hw/pci/pcie_sriov.h
+++ b/include/hw/pci/pcie_sriov.h
@@ -76,4 +76,7 @@ PCIDevice *pcie_sriov_get_pf(PCIDevice *dev);
  */
 PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n);
 
+/* Returns the current number of virtual functions. */
+uint16_t pcie_sriov_num_vfs(PCIDevice *dev);
+
 #endif /* QEMU_PCIE_SRIOV_H */
-- 
2.39.1


