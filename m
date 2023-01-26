Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A229B67C9B1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 12:21:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL0IZ-0001vU-My; Thu, 26 Jan 2023 06:20:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pL0IX-0001v9-Ln
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:20:05 -0500
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pL0IW-0001Wy-4T
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 06:20:05 -0500
Received: by mail-pj1-x1036.google.com with SMTP id 88so1223080pjo.3
 for <qemu-devel@nongnu.org>; Thu, 26 Jan 2023 03:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nZlB6YuuFFLe1JRaJyxgcOjzVGUTGnF5/BNvI7AcDYE=;
 b=TKZrDc7ek4lxAWvEhd2s9EPx0WZhy5wFd5rTo+kcDeQx8rMENWVg5qTwo5B94k53xP
 xEdumOvPkBIg1IsWM3fX7uMEzqU+TM8uE1/8KhKCMsYbREzeM3b79DENbQeRH8NymgKU
 UnN7YjvgKk/V5UVMN7kUnA13AdqDj7M6fvxtdfIJ35aVNFdxlOjcB0yZPn3g+pcJ9YvJ
 bUp+l5i775PkVw1JfCZoy6pM4cHewsePErBVSMzdp/lcjkjb55n8ZLo+ALGukxZKFYte
 vJsEgIKlSgK4bR3LCfCN2vOscpr9grgEDkd7HJJ5y8kXWhwoJIyerPxM7Ge0kgFyAGeg
 lG0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nZlB6YuuFFLe1JRaJyxgcOjzVGUTGnF5/BNvI7AcDYE=;
 b=nF0oH3RQZANtu5bUiYJKjONkVzC/bIU9VBmGO5K1nboGD0gWJVdOQs9WmcyK9GaVul
 ++KQOU32aOIIRehReNmPfk0nc9vKPtTu/XQ7Um7Vua5W4tfoRplIAh7ROIOXZeP4Sn6P
 u+sbbt0IX8/EBBTXt+DFbydzRLpeycAoGQdAdzuXFTybF/bQ1maEv18Hl8OpPqNc9DcN
 LSWVbd7WETGbfpPgJcxB+z9jTJ2N7wCDe07u2mezK9BkT6RZR0jAOhet2i1o2Ro8gNNt
 oNOI5EZqCVKPGCJ7J4V5S2YLB85f2kqWJUqOYXtqh9RtDJrOdIAFyAuXUL8RZA1QDSYW
 Qwxg==
X-Gm-Message-State: AFqh2kpOaVR1EWOqzjgk9EFn3d0Li7NwtfvYAZGslEDVeBxuJ9EMomOe
 0K48rmvQlQDXsyN4IJSlxY6lPw==
X-Google-Smtp-Source: AMrXdXvBxU+iYAJeMx1MZhm3aPHdXIq+aUtArsTjv8B9KBmGGR0MbVJYZTTJbBf4qH7Z/g/TWRa4Sg==
X-Received: by 2002:a17:90b:3905:b0:229:ff0a:bdfc with SMTP id
 ob5-20020a17090b390500b00229ff0abdfcmr25924688pjb.24.1674732002730; 
 Thu, 26 Jan 2023 03:20:02 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 z14-20020a17090a468e00b00229d7f2abd4sm849520pjf.54.2023.01.26.03.19.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 03:20:02 -0800 (PST)
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
 Akihiko Odaki <akihiko.odaki@daynix.com>, Gal Hammer <gal.hammer@sap.com>
Subject: [PATCH v4 02/13] pcie: Introduce pcie_sriov_num_vfs
Date: Thu, 26 Jan 2023 20:19:32 +0900
Message-Id: <20230126111943.38695-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230126111943.38695-1-akihiko.odaki@daynix.com>
References: <20230126111943.38695-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1036;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1036.google.com
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
2.39.0


