Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6191666F1B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 11:10:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFuN1-000475-PP; Thu, 12 Jan 2023 04:59:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMz-00045e-5h
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:37 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pFuMx-0004U5-Lp
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 04:59:36 -0500
Received: by mail-pl1-x634.google.com with SMTP id y1so19737445plb.2
 for <qemu-devel@nongnu.org>; Thu, 12 Jan 2023 01:59:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jr40F9vIhXN24Z2eK9R5w/EFRpttBsVu/dvj/G/e+nM=;
 b=gW6fsIw0t2Lmfo5amLL02QFfbO8ug4GxaNlL5ZA61/CNMj9UacCRf+HnOgyKovS9B3
 cyemZzyGzOn59lzir+G5FxCPsaPABfM0Jm+msiy4433SaQPNe3DDzy47rn1PCbsWRLVQ
 +doFL1oUMWfblz/qOURQLwA6Wqt3cddCAycw73XAO1AeVUv7u/c+xJwHXtRGeizv77uX
 PxAov3EuOep0clKy0HzPBQV56trrW2Eqx5T9q4xHI8vwCUQYo0AlDjTqUnDWFY0FGl7C
 PDlPo9YIppa9Vb6R9YvDAZGcpL5inaRKWxe1/7p4PBevXMrShONNNf9m+Y15Gwgg9KTz
 oAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jr40F9vIhXN24Z2eK9R5w/EFRpttBsVu/dvj/G/e+nM=;
 b=V5pOmqRRPIwddx0EIpKCFbnKWll72Uof4Y41JY64h4K+65mQzEUJ12GqeiveAD6esI
 TZoU+VtLwA2NlR+aeQ2SeLJN9xEroGjXDwkSXrPFP2nkQN1Zioq1G0sjql4j2ThosWHN
 CB+iNC+Ww1R/joKTxe7dSbnUYGFJZMLGqQSB7D1F3sdWMiqOkuZ5tAUy6rYf0yIR8PKW
 uYON3z0owuW6EtpcaEZ8hHylZ8sxGU5LEp3K5G5eKEtMnNUgJZIz//nNcCmXuKItwg/r
 QUWAp3z5tXxmh9H8oZcDzQwUT/Djk6zilYnGUdfJnKWIEVFgyI85E0CMNCQY4M9M06tl
 CZDQ==
X-Gm-Message-State: AFqh2koNhHsrk4LPPGrAfwYjjjcUZmN5hcrbSJAWQNfgr7nQ4flL2KlQ
 7GKQP/4WZ4IHojy0GX5TdcMYfA==
X-Google-Smtp-Source: AMrXdXvWokvDhThSR8hMIA5+ghSnhLg0II823WrXtCxO40CIZSX0V8WYK+uXgS4g01y+n+bVoa2Www==
X-Received: by 2002:a17:90a:dd90:b0:228:e263:f873 with SMTP id
 l16-20020a17090add9000b00228e263f873mr6124698pjv.44.1673517575053; 
 Thu, 12 Jan 2023 01:59:35 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k13-20020a17090a3ccd00b00219025945dcsm12095450pjd.19.2023.01.12.01.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:59:34 -0800 (PST)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
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
 Gal Hammer <gal.hammer@sap.com>
Subject: [PATCH 20/31] pcie: Introduce pcie_sriov_num_vfs
Date: Thu, 12 Jan 2023 18:57:32 +0900
Message-Id: <20230112095743.20123-21-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230112095743.20123-1-akihiko.odaki@daynix.com>
References: <20230112095743.20123-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::634;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x634.google.com
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
---
 hw/pci/pcie_sriov.c         | 5 +++++
 include/hw/pci/pcie_sriov.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/hw/pci/pcie_sriov.c b/hw/pci/pcie_sriov.c
index 8e3faf1f59..5796654b98 100644
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
index 80f5c84e75..072a583405 100644
--- a/include/hw/pci/pcie_sriov.h
+++ b/include/hw/pci/pcie_sriov.h
@@ -74,4 +74,7 @@ PCIDevice *pcie_sriov_get_pf(PCIDevice *dev);
  */
 PCIDevice *pcie_sriov_get_vf_at_index(PCIDevice *dev, int n);
 
+/* Returns the current number of virtual functions. */
+uint16_t pcie_sriov_num_vfs(PCIDevice *dev);
+
 #endif /* QEMU_PCIE_SRIOV_H */
-- 
2.39.0


