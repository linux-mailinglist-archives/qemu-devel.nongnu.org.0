Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 58470681146
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 15:11:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMUqO-0002Bj-PY; Mon, 30 Jan 2023 09:09:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUqJ-0002AK-DI
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:09:07 -0500
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pMUqG-0007mG-U6
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 09:09:07 -0500
Received: by mail-pj1-x1030.google.com with SMTP id
 e10-20020a17090a630a00b0022bedd66e6dso15551974pjj.1
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 06:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01IaAKVWRL/Qzj7PsK1Wm+ssRudRuXKs5C9WWrNwR/o=;
 b=FtvT5Nd1lJaT8t5A8lep/idx2lOeR2Hs/BhGHCwbxJvyDYUxYiG0ckdMYw8vQu4c34
 r+0wIBzefZjsXLOpA3Fp1OEdfdOQdvJXJ15ADrZyMpEl+qAayjtYJXT5uloHVJOr+W2F
 R2ugjM74Ma5+h19CuWH1FwIopLyyNEI7pXzdOU/Ku7LNW+cwmGBG0wWIrlVaYP5BM4VO
 qHo4gw7xpDZzxBMBem2hFv6xUkEBhXaQJJuXmfVX2S94YFUrFoRm/Udq+22DtVLuE2qb
 PY58Qlhk587Xq8sKqSvtvPc+Tkec0eYB8iAHHUerfrNfvoCqzfQPkOcO3iyYJVwNGv0N
 XL4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=01IaAKVWRL/Qzj7PsK1Wm+ssRudRuXKs5C9WWrNwR/o=;
 b=22+vnODt9PfVEpWs5dEHSCyaOmfjTVqjBEvZrhDod5qeTl12GqyBTHN6Omy0I2W8+V
 a5RUHFSyIdy5Iv2cGLhJGqVpzF+1yO3gxlWOZSYXzjok7jBA/WgLN2qvuAlvvF8dUFfa
 adOSTKK9F97YXwgFNhqB41corJxbtuKycQC1IcKwada059Y/vWplg0Sj+/Ywe8St21m5
 eWSORIz+mSEMgEqzdi5nkbSuiwZTdE7s4o8WD1sRseHzFv4zNXJUoDYqauc6PhjnyEkS
 6haKJmj6ladrmK+cj7cem11X2NA8+L8+CaaApKi187dXVDvOIZhxW59yHdx45pcTaTSV
 kO8A==
X-Gm-Message-State: AO0yUKX+pW/tQiC2crXOLQ0f5eaDjrWwkUGoaNOW9FN08M9EkPCzmhZK
 22HjncfDAbpcxOS7jC7aDtXkJg==
X-Google-Smtp-Source: AK7set+S/Rr26hXWrLiK8diqKyvCpbHNq7VKZIj2lC8WRF5SY0XCIOZ+6wXuy/KX3VPzmCOQy0ngQQ==
X-Received: by 2002:a05:6a20:8f04:b0:be:b878:6d78 with SMTP id
 b4-20020a056a208f0400b000beb8786d78mr760244pzk.50.1675087743798; 
 Mon, 30 Jan 2023 06:09:03 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 u70-20020a638549000000b004468cb97c01sm6962977pgd.56.2023.01.30.06.08.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 06:09:03 -0800 (PST)
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
Subject: [PATCH v5 2/9] pcie: Introduce pcie_sriov_num_vfs
Date: Mon, 30 Jan 2023 23:08:02 +0900
Message-Id: <20230130140809.78262-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230130140809.78262-1-akihiko.odaki@daynix.com>
References: <20230130140809.78262-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1030;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1030.google.com
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


