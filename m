Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D8662E828B
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:53:57 +0100 (CET)
Received: from localhost ([::1]:56100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6pQ-0006T1-4R
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:53:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lT-0001cM-Gr
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:51 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6lS-0006RG-4D
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:51 -0500
Received: by mail-wm1-x32c.google.com with SMTP id e25so8165677wme.0
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:49:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VwJCZ0fkM6seEv+et0rkbAeXeCRTJ+76lzeZJDFriQk=;
 b=VKMgTyN+SALsi9ty1hnEYlbPHAXViT49yYmC++uJX0Wsd9lxGlr+1ia+n9S5elSFlD
 YG8n8TcwsBstHQr42G+6S2OoBTyw7RpxDbp4/vyYMGb+6/6eOreVeB6epqF6QqcmK6EJ
 P8B1MmGQ9KNCSKttkC8SqTxUGVBQ6IydMV0CAf48PidCCggRQYkRUDx/2xjLMsrSxs6G
 0Vnm6GR6iK4yHQeRglcVWKThB2psGO40Y9OdG0LaYMioii0osmKTja/h/YwGSMRMC6Cx
 C5IUwuSxl5rkUnsdRLuKeDkyWjFHCnsSAgneqWiwtzUV++0eDvVSRvedZ20IbFXti+LE
 ZonQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VwJCZ0fkM6seEv+et0rkbAeXeCRTJ+76lzeZJDFriQk=;
 b=NGqY+Ja2UAQbhsjBqp5Shsfo2rBpEhkJbjGCnTh/OKa4gSxd7T5BKc8oz2Qm2m+mjV
 ZaA2BgtuV8bEcJAVnv7a8Ly8Ztz4yzjn3bZFZiURsNX72AHyHn2kOia0NZe1uTl4Wa4o
 MRNNg7yIdsO8ijVKiCjHdGc8RCqI0JLhHELxmMCwNkTdh/5pPDvk00Dt2WiEarYxBum6
 veFOrc5t4gzxTHS0JOFzpSCWz9qGmzSew2snxKsHN1MlqXadEEQLaI2G0QvZQqGUSXqn
 b5gVGZnVREOEicP+znWTVdeR05vX6+1hHOO2cMeB4EyVmyt81/ntM0LwlE1KPU+Q0ASx
 2dWQ==
X-Gm-Message-State: AOAM531PM2/1Rk3DmaYBtzZEa0I2GSEl8u+YtZkfZ47Hay2QnDhWYyXb
 ZZhcltpM/Qo0ucTy2q2zSjE2Kh6asTM=
X-Google-Smtp-Source: ABdhPJy/+AF34tldc1MxGNaofp7jdudFloTOt25dTJINQzxf1Lo8Db5gJzU6byrtOC6uZxGdu3xzsA==
X-Received: by 2002:a1c:3cd5:: with SMTP id j204mr13188258wma.53.1609454988707; 
 Thu, 31 Dec 2020 14:49:48 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id i11sm12371357wmq.10.2020.12.31.14.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:49:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/18] hw/pci-host/bonito: Make BONPONCFG register read-only
Date: Thu, 31 Dec 2020 23:49:00 +0100
Message-Id: <20201231224911.1467352-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Per the datasheet (Chapter 5.2. "Power-on settable configuration
register - bonponcfg"), the bonponcfg can only be modified using
"pull-up on the corresponding IOD0-15 signal". Do not allow
update of this register by the CPU.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 93820f69e49..29c0294d289 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -251,7 +251,6 @@ static void bonito_writel(void *opaque, hwaddr addr,
     DPRINTF("bonito_writel "TARGET_FMT_plx" val %lx saddr %x\n",
             addr, val, saddr);
     switch (saddr) {
-    case BONITO_BONPONCFG:
     case BONITO_IODEVCFG:
     case BONITO_SDCFG:
     case BONITO_PCIMAP:
@@ -292,6 +291,7 @@ static void bonito_writel(void *opaque, hwaddr addr,
         s->regs[BONITO_INTENCLR] = val;
         s->regs[BONITO_INTEN] &= ~val;
         break;
+    case BONITO_BONPONCFG:
     case BONITO_INTEN:
     case BONITO_INTISR:
         DPRINTF("write to readonly bonito register %x\n", saddr);
-- 
2.26.2


