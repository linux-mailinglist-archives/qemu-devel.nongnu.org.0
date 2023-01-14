Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C2966A928
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Jan 2023 05:15:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGXsS-0006Ai-Q5; Fri, 13 Jan 2023 23:10:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXsO-00062p-30
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:10:41 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pGXsM-0007MG-FT
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 23:10:39 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 u1-20020a17090a450100b0022936a63a21so2397056pjg.4
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 20:10:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nZlB6YuuFFLe1JRaJyxgcOjzVGUTGnF5/BNvI7AcDYE=;
 b=YUffdrf52tu6bdA60lJUcw37RwBqVIEhB7Sqk9J+UodwrwDBEXihzns/ywg1e3ML8a
 6I2aj+j3N2vqxLqc0VlLSTWLYYqA2MtOkHQS1VFLi/lLM+tepzJ/yBBRbV0ye7p6lfs7
 hUfI4kFQoPnXMRBVjCbOGh4PB2/Uxk56FJfDGDS7uN/XA/3sFvbNBvKCsWNfDheD3E5Q
 s6v+jpaXSh6UuRVZCe2HGb4A0UmC46hSvtTiPiMucYzSdPlJesSIYviQz+R8Qap+Bbzj
 ilXc0YiZ7LYHS4ZPvOAcp9PQ+BUleKggOFaftV/gX47FapR3/uIl8alvPqBmuODYJ4Rm
 oAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nZlB6YuuFFLe1JRaJyxgcOjzVGUTGnF5/BNvI7AcDYE=;
 b=VQybci6E0YqtZ5K6kopYUeUWHJp5ziEWieABrW5oV+R2memaRZLmZ7dLKqh5N+QR/p
 uDzYSabsjDsj2YHOk68YiwKWqV9JgQcDcWqH70wBDkScF1sFtnuc2WHN/Wj2Cshq6wKC
 76RhmUR1kxb8KVN6mNdq2rW2Un/flYahC8jjOZxlSNb5E4L8R7nNNhollR6UjMgUnSql
 dLJkpzFg40cADiByTe17LYNf8vMVGNwl5JiiN7F9bT4+N5HmVcL9pBVwja7lOvD9XBKD
 PBHa6DS33BAzOYljlREGgpNXw3+doDqQgB2U57oBQb97T6UFSCLwvP4n3CYmOU73XNt7
 cCig==
X-Gm-Message-State: AFqh2ko6L8rQLoUwHblrji4Rs+JkXSxGXU5XLcgc6xccgTL8pJSK3GRR
 rrqcZXjQq4EiA5iijM80xKfXxw==
X-Google-Smtp-Source: AMrXdXtlhk69oxPWLSLSK6a0Rw7qaD14QWzvnEXikKZDMxVRO0hDz/+8QhDqQIiDA4kJNcamRQqbWQ==
X-Received: by 2002:a17:90b:358f:b0:229:1f66:97a with SMTP id
 mm15-20020a17090b358f00b002291f66097amr5910365pjb.12.1673669432709; 
 Fri, 13 Jan 2023 20:10:32 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 c21-20020a63ef55000000b00478bd458bdfsm12244535pgk.88.2023.01.13.20.10.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 20:10:32 -0800 (PST)
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
 Gal Hammer <gal.hammer@sap.com>
Subject: [PATCH v2 02/13] pcie: Introduce pcie_sriov_num_vfs
Date: Sat, 14 Jan 2023 13:09:53 +0900
Message-Id: <20230114041004.36459-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230114041004.36459-1-akihiko.odaki@daynix.com>
References: <20230114041004.36459-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::102c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x102c.google.com
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


