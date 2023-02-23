Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51F266A06B4
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 11:52:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pV9C6-00073r-D2; Thu, 23 Feb 2023 05:51:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV9C4-00073d-9Y
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:51:20 -0500
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pV9C2-0003eB-U1
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 05:51:20 -0500
Received: by mail-pj1-x1034.google.com with SMTP id
 q31-20020a17090a17a200b0023750b69614so3934018pja.5
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 02:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=01IaAKVWRL/Qzj7PsK1Wm+ssRudRuXKs5C9WWrNwR/o=;
 b=lT733mD5omkpWdu4CHCwwLS9GTxdRPGmbq8iBgq0VsAjQKjzhRqp/MmLzob2Skk/E3
 UiW7fnb4cweuySP6UTtnS8xE8KGGDe2lHy+euN2bHaTNui4GjFnnVdZOM6H7VfedOho0
 uYsAdlDWpnLw97y0q7VKkBpoFAt7cjkgDtF9eW50h5DpxTIaBusNONP+LZfHXw+E6jUM
 F5O6j0CR2woTujipk1Af3p6GPlVoJHtZCQGyI2LNXwI35JTPGy8SWxOm2CF3bY2qxR5P
 Dlo61SqtCxbY6NolhYzRiI/dMw4u5JYzciSTP+UlXKxsa/wiHa14Ft9ZZFsw20ksTDQM
 MS6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=01IaAKVWRL/Qzj7PsK1Wm+ssRudRuXKs5C9WWrNwR/o=;
 b=QWxbzsN1i2VTiV5A/LtnYLGLe0SAT+RmU3TNjU5p9M2EZbcySuQR7rqpQOwmWRH+Aw
 1iNeueO2s3BE97CQmAmLvnrmG9mxkTAHhdraHQVpxFIBfv/ypOAr/YwLXrfQmVWg7d9F
 qEeqA6rx6sTs+DqAdWCMgmqgtbgHunkLQCrlaZv2Mod8S56laNcMKwicf2lLsxsK8vyG
 HoUN62oDGznF4Zy5OgjNPLeHeCH0mKKXLtZSAJXBFbTN1r1OY8Rq1eagVMzdU6p+EGaJ
 +VsBQIyMoPNo804MTduWe0+VKqPbK5BYuN4M9gfvNv3jHhKpBr9Aa7RHmYzOaX5WXkSZ
 2p7Q==
X-Gm-Message-State: AO0yUKUQy0jOW0bKBxDrm0f4cfb/3706Cv8Ke2vgucm1CHR6CD+cSgke
 Bd7pNkmBP3PIHbNqtHt0y6cUYw==
X-Google-Smtp-Source: AK7set/lDiTZt1DlAW+48nu/pKrRtVy8zXuKTOJSc0Ys4yng+y8t2kPuN+fc2dyRcNuq1oOtoXrYOA==
X-Received: by 2002:a17:90b:38ce:b0:234:ba6f:c980 with SMTP id
 nn14-20020a17090b38ce00b00234ba6fc980mr13532460pjb.17.1677149477826; 
 Thu, 23 Feb 2023 02:51:17 -0800 (PST)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 k184-20020a6384c1000000b004fb26a80875sm4477692pgd.22.2023.02.23.02.51.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:51:17 -0800 (PST)
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
Subject: [PATCH v9 2/9] pcie: Introduce pcie_sriov_num_vfs
Date: Thu, 23 Feb 2023 19:50:50 +0900
Message-Id: <20230223105057.144309-3-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230223105057.144309-1-akihiko.odaki@daynix.com>
References: <20230223105057.144309-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::1034;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pj1-x1034.google.com
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


