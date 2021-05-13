Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 240B537FC0F
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:04:01 +0200 (CEST)
Received: from localhost ([::1]:45150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEki-0007Of-6S
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:04:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42830)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhENN-0003C8-A4
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46121)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhENL-000183-MJ
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3WadOX/ZSMqkQkMfPHC0fuGiD0zW0hwXcxoICsAvYPk=;
 b=FD1d6/wY3njUvAzG2sV37fWZDNQzD32o6PPLFi2ucfsGGbrTs92dZga0nCcCUjmzvRETIY
 rxmKNF7dMU52GGNf46qEJMjvFZoLxFIlqqw3rnEWcK0o8m4JGYvFd56Ip5V2Mp41r4QYIB
 u+/U+hbUap0jekauZOIo7Y9oQPeo3TU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-91oD0jYBPdWjLFsDJzg_bg-1; Thu, 13 May 2021 12:39:49 -0400
X-MC-Unique: 91oD0jYBPdWjLFsDJzg_bg-1
Received: by mail-ed1-f71.google.com with SMTP id
 g7-20020aa7c5870000b02903888f809d62so15018066edq.23
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3WadOX/ZSMqkQkMfPHC0fuGiD0zW0hwXcxoICsAvYPk=;
 b=TcROoNXKNmzAU3dK78cho8gb341mAS99SisHkiPyJtfC6CoLB1osqnQz/DD8Yl83X6
 apV9Dk1gMC5XrTzHSEhR9YHMVq9PNeX7GsqjOWSYrw9yvoqFIW34kcX5IB2ludhLtXlW
 WHMKZRwnfDwckr1zV2TglY6tWbQywvAQRmKqk64w3VSMRt5Uf3MQIRvV6wdUA5xyEnvB
 Z+/tggtI94uRPu9Ppqq03VpdG1TUb9/CIQ1iNa+SO2XJuA4xL+xd5DkEgiB6KDIDEgbL
 rcAxC0fokedKaULZVD7uQdAMy0svYTdehUt3AlcRqLFU5TSLQBRt7Sp/E7IFcY5Qz8Bw
 eSJg==
X-Gm-Message-State: AOAM533HjXS2QYY7C2dLjkpo8LNloNTvbFRG25qnqbDkkbZYS/WgvVEp
 kQWA9VNksDzrvLwRAl2DnffpmV41ORj7Fq+hOVtLLEBuFGqXrVdSGv0B1dwkbGPkcRz4J0oMoEX
 TWY8WmGiX/PcB0PhWsiaGzSXWyyan7Y4xxt5eoUJx68nt9vjacOlBvl+o0PkfFW6y
X-Received: by 2002:a17:906:a20b:: with SMTP id
 r11mr44939268ejy.323.1620923988267; 
 Thu, 13 May 2021 09:39:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMJ6G/mXyzvazrhxsdibSvEBgHlW+rXnAT9XNGvaw1X6w45ziPOwXYaDQ3/XElNOsKdyU9Iw==
X-Received: by 2002:a17:906:a20b:: with SMTP id
 r11mr44939248ejy.323.1620923988073; 
 Thu, 13 May 2021 09:39:48 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id h9sm2661538ede.93.2021.05.13.09.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:39:47 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/10] default-configs/devices: Clarify
 ARM_COMPATIBLE_SEMIHOSTING is required
Date: Thu, 13 May 2021 18:38:58 +0200
Message-Id: <20210513163858.3928976-11-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513163858.3928976-1-philmd@redhat.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ARM_COMPATIBLE_SEMIHOSTING is not optional on these targets.
Move the variable assignment out of the block documented with
"Uncomment the following lines to disable these optional devices".

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 default-configs/devices/arm-softmmu.mak     | 4 +++-
 default-configs/devices/riscv32-softmmu.mak | 4 +++-
 default-configs/devices/riscv64-softmmu.mak | 4 +++-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
index 341d439de6f..2713e5e9eb7 100644
--- a/default-configs/devices/arm-softmmu.mak
+++ b/default-configs/devices/arm-softmmu.mak
@@ -1,5 +1,8 @@
 # Default configuration for arm-softmmu
 
+# TODO: semihosting is always required - move to default-configs/targets/
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
+
 # TODO: ARM_V7M is currently always required - make this more flexible!
 CONFIG_ARM_V7M=y
 
@@ -41,5 +44,4 @@ CONFIG_MICROBIT=y
 CONFIG_FSL_IMX25=y
 CONFIG_FSL_IMX7=y
 CONFIG_FSL_IMX6UL=y
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 CONFIG_ALLWINNER_H3=y
diff --git a/default-configs/devices/riscv32-softmmu.mak b/default-configs/devices/riscv32-softmmu.mak
index 5c9ad2590ef..7219f9749ad 100644
--- a/default-configs/devices/riscv32-softmmu.mak
+++ b/default-configs/devices/riscv32-softmmu.mak
@@ -1,9 +1,11 @@
 # Default configuration for riscv32-softmmu
 
+# TODO: semihosting is always required - move to default-configs/targets/
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
+
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
 #
diff --git a/default-configs/devices/riscv64-softmmu.mak b/default-configs/devices/riscv64-softmmu.mak
index 8a92f0a2c74..1d1b8bb9f68 100644
--- a/default-configs/devices/riscv64-softmmu.mak
+++ b/default-configs/devices/riscv64-softmmu.mak
@@ -1,9 +1,11 @@
 # Default configuration for riscv64-softmmu
 
+# TODO: semihosting is always required - move to default-configs/targets/
+CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
+
 # Uncomment the following lines to disable these optional devices:
 #
 #CONFIG_PCI_DEVICES=n
-CONFIG_ARM_COMPATIBLE_SEMIHOSTING=y
 
 # Boards:
 #
-- 
2.26.3


