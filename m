Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 549EA6EBCEF
	for <lists+qemu-devel@lfdr.de>; Sun, 23 Apr 2023 06:24:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqREU-0007FI-Px; Sun, 23 Apr 2023 00:21:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDy-0006ia-QJ
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:21:18 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1pqRDw-0001NT-UW
 for qemu-devel@nongnu.org; Sun, 23 Apr 2023 00:21:18 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1a69f686345so28312845ad.2
 for <qemu-devel@nongnu.org>; Sat, 22 Apr 2023 21:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682223676; x=1684815676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WhEhy4Jd1mKN670RG/ec6toCTEp/s9C7PmGHjJRti/0=;
 b=JVxEwiQO7Y1Mx9omv/pAUCQLVj/ZFN0eXsvUpGu4jRxyzcpeo/A2tsSYFHQ5dQnzBh
 KyQsxDcUnna68zpFHCtCmbyeo6udUzugkpcWsrauCfOQGwALYR/FNCRQD0daH5dxR9rg
 nmVAM/Womq9EVJkDSyDLn6UmSzMO1Z2na5uF5S+Flj9R6hRg32+Uox5cVDFqNjDHbSiM
 36Q823vcZJWXd+bmxKfkHhgrMeJbNsq7hTaF2eCy5J4ckM2/Y5K1NNrQSz4846+9l2bZ
 xEI3c1IVzrXzwlE9DqaBukSLYsvH7/L30+72LrZ5YxyCklgPTvUfA7+EEgbYEP2mduT1
 YxZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682223676; x=1684815676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WhEhy4Jd1mKN670RG/ec6toCTEp/s9C7PmGHjJRti/0=;
 b=brVqDwg2rKLt4NaA5uBgB2EWXoUHAgjoRELFuIKw9rvOwRNtdgV7d9hL1DVA+7fyjD
 NBHaA7ehgIwe9ydjbKAtB74Dqa/wEBId81LvxIboM2y1d0T6DW7kpSIC2ZuAAzZIlUUW
 /64CdbzvV1MNU5skCEjkMd7RE4apdwHXBkGOUs9/HEPlWMJBwMHv/6hJW7c7Aui2CGk5
 /4Age2nE3u0t14xa5qoaxtVcFl9s80jBeG4H5lFKCyXNuHIdzdJSIjrUisKrGrfcDuYu
 c868doChTznC8RUsOJcu9UpTtoqn+cIMTQML7fukWtXU1CAnfehChq7xQ7jUlnjr6qr5
 aJDg==
X-Gm-Message-State: AAQBX9cLc2Zo6oTrZZ+e17CiV3sQZH8NPafOJKlPKVsnzYgXm2RfpAA7
 WQaVpczbEswl88dKNTQCyJoq5w==
X-Google-Smtp-Source: AKy350abonmMS0L6t+DvqTljvMOv4V+vgB+82k9LnfdYAV1lBQOAjNPXv3GC+NL1kQ4ZWFAwpJpU7w==
X-Received: by 2002:a17:902:db12:b0:1a6:e1ac:ecb8 with SMTP id
 m18-20020a170902db1200b001a6e1acecb8mr12612962plx.43.1682223675795; 
 Sat, 22 Apr 2023 21:21:15 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 f1-20020a170902ff0100b001a5059861adsm4596996plj.224.2023.04.22.21.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Apr 2023 21:21:15 -0700 (PDT)
From: Akihiko Odaki <akihiko.odaki@daynix.com>
To: 
Cc: Sriram Yagnaraman <sriram.yagnaraman@est.tech>,
 Jason Wang <jasowang@redhat.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org, Tomasz Dzieciol <t.dzieciol@partner.samsung.com>,
 Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH v3 45/47] vmxnet3: Do not depend on PC
Date: Sun, 23 Apr 2023 13:18:31 +0900
Message-Id: <20230423041833.5302-46-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230423041833.5302-1-akihiko.odaki@daynix.com>
References: <20230423041833.5302-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

vmxnet3 has no dependency on PC, and VMware Fusion actually makes it
available on Apple Silicon according to:
https://kb.vmware.com/s/article/90364

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/Kconfig b/hw/net/Kconfig
index 18c7851efe..98e00be4f9 100644
--- a/hw/net/Kconfig
+++ b/hw/net/Kconfig
@@ -56,7 +56,7 @@ config RTL8139_PCI
 
 config VMXNET3_PCI
     bool
-    default y if PCI_DEVICES && PC_PCI
+    default y if PCI_DEVICES
     depends on PCI
 
 config SMC91C111
-- 
2.40.0


