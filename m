Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 494116EF241
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Apr 2023 12:40:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prcZG-0001at-Ss; Wed, 26 Apr 2023 06:40:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcZF-0001Wg-0g
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:40:09 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <akihiko.odaki@daynix.com>)
 id 1prcZD-0003fj-8Q
 for qemu-devel@nongnu.org; Wed, 26 Apr 2023 06:40:08 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63d2ba63dddso5515406b3a.2
 for <qemu-devel@nongnu.org>; Wed, 26 Apr 2023 03:40:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1682505606; x=1685097606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WhEhy4Jd1mKN670RG/ec6toCTEp/s9C7PmGHjJRti/0=;
 b=nWPG0fIaXAOok87aZZM5erlTRTPvxxe8r38c5hDXiu/k7n1BgeOee1QfeWuE/CijyK
 k1YmdoIr6sZ8bjsFt0Ss2R22i4NoJg6cTBWWwPEWw3ldbGbVaHbRkFyrP6In1AxBT5c4
 d7/WJusvGLS/kDw1d+zsvQbCMl1eYXD13E7XadGoeAsszbO+THW0sQ0wAwz/G67zaoNB
 VJMWTT8nmMPuYoi6h/Bs0B7SSoU3wrruotaJ608tlVlOeamQtI4ISlMdJ7wnZjQNgYlQ
 T1fWntViCNyQWcYaTdI0IRfd2svVxF/AKFfNR5M+JEuiWJminGK8pWmKgFreNscZvu3T
 vGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682505606; x=1685097606;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WhEhy4Jd1mKN670RG/ec6toCTEp/s9C7PmGHjJRti/0=;
 b=NAByMGMod7kvtiVl48wNUGjs5Frt8tyyPU94ga8M0oGUyw6vt3QZBz/AMUGP08tv/D
 dZ9PQxDr3FlRf6sMGF6+EcHl50K42ZS9k1+wwZQrRUrDyIbF0SrTmoClWYP0m3zOXR52
 SMvib35DT7CkdotuLS7NZJnerc99bSCweBZgyd5UF1s+ya8UzMHKvTKEsM6MYsy3iQA5
 tPbyaxPkuebsq4pTvErwSqY8H05lZJiqIROPxeJWGkXwuKcp/X+RDWXAGCj54CZmrYUE
 INHFEmK5iBFVkSsO5irOCsBaDyQ1a8R4uC9E+O7SXoolu+PJw7GSxilSXlpEREX1tv1V
 dLGw==
X-Gm-Message-State: AAQBX9f6c0rq3QHJzZgGQKRPTVx9E07SPhzNkaRl0yjtcyp/icLCyUMq
 tlkGCUpPmhOBAgwEsAc6XGUlOw==
X-Google-Smtp-Source: AKy350Yrf1PF0xhb24gDL9BwbuSM3lCet104sfFpiWEuEGtX25Z9itgr0fMgqh+177rFjlcYxgOZNg==
X-Received: by 2002:a05:6a20:43a8:b0:ef:7d7b:433a with SMTP id
 i40-20020a056a2043a800b000ef7d7b433amr21540933pzl.47.1682505606161; 
 Wed, 26 Apr 2023 03:40:06 -0700 (PDT)
Received: from alarm.u-tokyo.ac.jp ([157.82.194.15])
 by smtp.gmail.com with ESMTPSA id
 m11-20020a63580b000000b0051322a5aa64sm9317919pgb.3.2023.04.26.03.40.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Apr 2023 03:40:05 -0700 (PDT)
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
Subject: [PATCH v4 46/48] vmxnet3: Do not depend on PC
Date: Wed, 26 Apr 2023 19:37:14 +0900
Message-Id: <20230426103716.26279-47-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230426103716.26279-1-akihiko.odaki@daynix.com>
References: <20230426103716.26279-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::432;
 envelope-from=akihiko.odaki@daynix.com; helo=mail-pf1-x432.google.com
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


