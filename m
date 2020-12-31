Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F1882E827D
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Dec 2020 23:51:00 +0100 (CET)
Received: from localhost ([::1]:47076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kv6mZ-0002Hv-M5
	for lists+qemu-devel@lfdr.de; Thu, 31 Dec 2020 17:50:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6l5-0000dY-G0
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:27 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52903)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kv6l4-0006IV-68
 for qemu-devel@nongnu.org; Thu, 31 Dec 2020 17:49:27 -0500
Received: by mail-wm1-x332.google.com with SMTP id a6so8153396wmc.2
 for <qemu-devel@nongnu.org>; Thu, 31 Dec 2020 14:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DaTE72cdZaTjtjdnfodb65w5ACl9PUYleicR63q1RfQ=;
 b=I0QCXiBBrAukbla5jow0+Mq0n69wiMOjPlbeba/3f70bY1U14iy+pcleLExbawmEPv
 3i94uYcb+UUm3gmV8/RB2OkKsvIb/9/3DJdGupGJQGFTSSzHrnRaFeWWrDrKHCpXTYJV
 7TkE36qMsJS4x8fTc+OBGr3mDMFyHpo+xFNMfvDhqokVoYAExBEtu38qE5FVWFORZKv0
 uGyijMYs4NdCx9enZyE+5rezmd6aUXr8UxhzfdLxfFS4CsuRsbQhyPdjf/lay83fSnVw
 yiEbQQllr9/2m0j1gsAssY0QdcRAei7tzDQnBX8IduXnNO89tAHJam46Y652vnNjMBC1
 1AEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=DaTE72cdZaTjtjdnfodb65w5ACl9PUYleicR63q1RfQ=;
 b=TwImYpyF30UylwdXlXOedIPmKGhSrQHW+6sZsdSLBB8jRddf0lyiSQ9dS/C5Vq7F2N
 alV8gTlbhs5NXLyMWZqJi5RAqiGIdU+UrDX44CWJ9i0NtohZFOMG2SsUqp4I99+oUB/U
 3aClwIUyOBqkSZN9u8LV1/K7MT9/3CM3zUvDm9QHeYAdHTsJBxaLc4pNgRDpPvm79zvV
 peFhMkXh3bIg3Xe0HOyUZf9wGeo+WKRn5Fc4lmURe6NdNkT6ySs7ecpcsbtkuk6rw1eW
 T7nqgOMs+zDXNsUB8/1H6bihBJkRlfaRuuODcIRQ7qYfVsy8zXCMr4WCisngRBseYuJn
 wHLA==
X-Gm-Message-State: AOAM533XSJb2voXcTdXHvm1H4InxJWXdce3xHBWThl6mnxiYor7IE3lM
 o2V2BrIndvqxWt6dI0gRGEuZNdVwuGI=
X-Google-Smtp-Source: ABdhPJxP4l4HTBzKIBuvYdBFKzxkPIGRvq18P6sNPc/uBbZesEITGrVjdbntgHGWKW7vwach7BAgYQ==
X-Received: by 2002:a1c:98c7:: with SMTP id
 a190mr13453260wme.184.1609454964330; 
 Thu, 31 Dec 2020 14:49:24 -0800 (PST)
Received: from localhost.localdomain (239.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.239])
 by smtp.gmail.com with ESMTPSA id o8sm70616044wrm.17.2020.12.31.14.49.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Dec 2020 14:49:23 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/18] hw/pci-host/bonito: Display hexadecimal value with '0x'
 prefix
Date: Thu, 31 Dec 2020 23:48:55 +0100
Message-Id: <20201231224911.1467352-3-f4bug@amsat.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201231224911.1467352-1-f4bug@amsat.org>
References: <20201231224911.1467352-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/pci-host/bonito.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/pci-host/bonito.c b/hw/pci-host/bonito.c
index 0634f3289c4..efeba29011f 100644
--- a/hw/pci-host/bonito.c
+++ b/hw/pci-host/bonito.c
@@ -463,8 +463,8 @@ static uint32_t bonito_sbridge_pciaddr(void *opaque, hwaddr addr)
     regno = (cfgaddr & BONITO_PCICONF_REG_MASK) >> BONITO_PCICONF_REG_OFFSET;
 
     if (idsel == 0) {
-        error_report("error in bonito pci config address " TARGET_FMT_plx
-                     ",pcimap_cfg=%x", addr, s->regs[BONITO_PCIMAP_CFG]);
+        error_report("error in bonito pci config address 0x" TARGET_FMT_plx
+                     ",pcimap_cfg=0x%x", addr, s->regs[BONITO_PCIMAP_CFG]);
         exit(1);
     }
     pciaddr = PCI_ADDR(pci_bus_num(phb->bus), devno, funno, regno);
-- 
2.26.2


