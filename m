Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59C36E89CD
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 07:53:03 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppNCV-0004hu-Hd; Thu, 20 Apr 2023 01:51:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNBg-0004C4-55
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:50:32 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1ppNB3-0001Uy-63
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 01:50:06 -0400
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1a814fe0ddeso8065545ad.2
 for <qemu-devel@nongnu.org>; Wed, 19 Apr 2023 22:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1681969792; x=1684561792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WhEhy4Jd1mKN670RG/ec6toCTEp/s9C7PmGHjJRti/0=;
 b=Zhy5lCgiVC+hEUnS0z7MqEHlZoNhhSnbK7EtVfXvKwciLpk9LpTxXHDcC2K61sZ1l5
 PKDQwqnLHafDRGHBhXILdye7lM/YxgwlHlkN9IKGyExu8TbIwHc9Qr6+9BUYUFx2Lsi9
 e4mhgCEHtiiLYIWVSuWh7TyG598iBgZxC2z71pgd4b1e0mhIf+AXNv56SLATjeRPQA+4
 hk+bk/jDkZ1HELdmoNuZZjBJBNcr4dsYo5evnlSg02jh6wdqGxCuxLB9zTz6hV1sNVFx
 qcrKl11XatbV2+X5hDQJT8EI7gqNtkosPYJG/UMdv2hg3AM9bEGgTbZhSb5twf2gpLtP
 kVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681969792; x=1684561792;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WhEhy4Jd1mKN670RG/ec6toCTEp/s9C7PmGHjJRti/0=;
 b=kP6ThU38ni/xSsg1khsu4CpQU2Eu7292tinsnrWVH4r1qkey+2iSxofikqKaKqWKgL
 lvaI/7eJt7HxlidykjYWaLvUlvfH4/nrU5VFvfOymvgRURrVf3Vk/wAgmJfCqEk0yWmS
 khuoJtTnRM35KJqVkRJvMl5E6ttHSE4LzyQDCpJO3s1FK/9SOl3ndSpZeEvCrS3jt3T2
 z9EU3m2+ovV0zhyrri6omVaOheY8zfpC7IZoImq3Ej8ip2wGdy2vTLrlJsU58troXl6c
 DrAM7Z0ghXphfhkp7S527OZdUDyN5lYjhU/LtF4R9ad32OpOsniDirQcuM+TvJTTUTiN
 3M3A==
X-Gm-Message-State: AAQBX9cFYlOTVHGb+2XY7wLOhVJHvY0rZZ1APtWrJXtCswucqRcLmCfY
 kebFGe/TZZd27zWzCdFdjCwDGg==
X-Google-Smtp-Source: AKy350bBYe7fkV/JUbnmxertOCVx5jWHO3M251DMkBjKofIcOa5V4Vf85PfZ7CsEiE2S/YU7XJbIrw==
X-Received: by 2002:a17:902:e5d1:b0:1a6:f0d5:3e21 with SMTP id
 u17-20020a170902e5d100b001a6f0d53e21mr616421plf.32.1681969792565; 
 Wed, 19 Apr 2023 22:49:52 -0700 (PDT)
Received: from alarm.flets-east.jp ([2400:4050:a840:1e00:4457:c267:5e09:481b])
 by smtp.gmail.com with ESMTPSA id
 x15-20020a17090a46cf00b00247164c1947sm2769255pjg.0.2023.04.19.22.49.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Apr 2023 22:49:52 -0700 (PDT)
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
Subject: [PATCH v2 39/41] vmxnet3: Do not depend on PC
Date: Thu, 20 Apr 2023 14:46:55 +0900
Message-Id: <20230420054657.50367-40-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230420054657.50367-1-akihiko.odaki@daynix.com>
References: <20230420054657.50367-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::631;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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


