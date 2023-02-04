Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0823F68A835
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 05:38:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOAI7-0005Ud-18; Fri, 03 Feb 2023 23:36:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pOAI5-0005U5-2J
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 23:36:41 -0500
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pOAI3-0008O0-KN
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 23:36:40 -0500
Received: by mail-pj1-x1032.google.com with SMTP id
 t12-20020a17090aae0c00b00229f4cff534so9247386pjq.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 20:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01IaAKVWRL/Qzj7PsK1Wm+ssRudRuXKs5C9WWrNwR/o=;
 b=POAy0soLdU/D7rGF9aZXMhh2lJs5LOf0lyeIfiGgE6bymgDnhWZQ73NufwhArJVFFl
 +IdlSmlZ7E9KlQcp0OS40EMk8AjrMYdgRYD97wnvALNk4eIwJ6icTKip0DxRS+bI/qhu
 4/zOi0hPghmQpmSMMJCx0JNvjrnvQge3YNyFcOpvFQzCfC1xlq/QW22EoD+JxF0WXVya
 lWCl7QjpRIRTp/nUHzijok65QFulz6jefejQiRHaP2b9P7HEqaUn1BTPAfHDjUavURSE
 vE5/TQo4D7jugzizwudybTCaADUIgEjz675m8eRwc7r3tnY3jB8YXtfSBrXVkt1eil4P
 veMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=01IaAKVWRL/Qzj7PsK1Wm+ssRudRuXKs5C9WWrNwR/o=;
 b=nC69nUTVIJpiBZoyGzsD+E/mJvjwqZSspAlWk7K3ndTDCifJ6uZFABOJrw4SK5t+6Q
 G9mz94k5bHh8/txuTQMcISSOOcj3BfNFaDexsuaO4VjT+NdrseEDHH5oz73DDDPEpzMY
 PTtz39NILLKZVFng9EalZYigMqMM6xLFv8B1oiBWXqe+CIsiyaetJkI23rkwvllsbdxN
 BXh0XYCz9x2WS165YuRwm/l0PjCmDbZZHAQ5Y96IPaZTOMEwAa7brpM+LQNQWWG5sPDl
 lna1V3Jj5ZOw3LyqrxgNeo4Rmv/vkkaivsd27jOP7hhjdJmLS5dTqCZ1qTYGH2NZVW5Z
 9MVg==
X-Gm-Message-State: AO0yUKW95F4bNq7+ioSDsts0d6w2cZZYhGNbBE1xs/ipK++C0h+8VnBA
 r0oclAt5Zzq00S/VPgH4mkR8tQ==
X-Google-Smtp-Source: AK7set/LnxrZPhArnbe3USbjuRB6LVf3g+C8+n8DIQsK8Nfl6vhmxyxp4FWhwmgErhLsgjeMRh7HkQ==
X-Received: by 2002:a17:90b:33cf:b0:22c:1bd6:77de with SMTP id
 lk15-20020a17090b33cf00b0022c1bd677demr13649253pjb.3.1675485398314; 
 Fri, 03 Feb 2023 20:36:38 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 g7-20020a17090adb0700b002308f6e7f41sm225707pjv.55.2023.02.03.20.36.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 20:36:38 -0800 (PST)
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
Subject: [PATCH v8 1/8] pcie: Introduce pcie_sriov_num_vfs
Date: Sat,  4 Feb 2023 13:36:14 +0900
Message-Id: <20230204043621.13540-2-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204043621.13540-1-akihiko.odaki@daynix.com>
References: <20230204043621.13540-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1032;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=unavailable autolearn_force=no
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


