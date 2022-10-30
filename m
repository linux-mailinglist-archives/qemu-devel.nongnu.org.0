Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6213A612DA3
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Oct 2022 23:51:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opH8A-0008Ho-5K; Sun, 30 Oct 2022 18:50:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opH88-0008Hg-C3
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:50:12 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1opH86-000561-HC
 for qemu-devel@nongnu.org; Sun, 30 Oct 2022 18:50:12 -0400
Received: by mail-wr1-x434.google.com with SMTP id y16so13662864wrt.12
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 15:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3TonNcvmzksgVXOJ3VQkzDm7w3oVf9Uw5MXnhJSmoe8=;
 b=Uj1mTHM3W77KqrwJwAW/TMI2odilQyivolkRWXCu/PGzOPnHEfZK/ZHJVqow2xo8AZ
 LOEsnGGQs3vxD2w3+FYCh1iXTrg5CDHhd4z52lCWPaiKxaZGsAgkyUuZw9v6XbOhjTy1
 mhCm9uLpSd39QPGjeCYjBPF+Fiedu0j9gj+NgUf3+Ts4fyPfst89LHJcL187kNSp/AC0
 5kTmy+li96/2Lwuhpt8+G7KaQHD/TQGaDm43/XwbnOeYfuJ6MpEGbf8O29xoV4RjhadX
 CrZdd+1U4vDqg1Xd9wYQ428ROS8UY09QciimIl+X2j0inNotdKJAD377iyWagYXtiEhW
 Zlzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3TonNcvmzksgVXOJ3VQkzDm7w3oVf9Uw5MXnhJSmoe8=;
 b=itpmbys6uFv0LO7x2TjEddNmIuhj9kK1/W2kToDwhzdUzkafLeVCbjx/CROuw+13c/
 MnigiVPxM6xe0RDuuG4LEtaFTuotLQVD1yuYcbkbGJ0tDl5tSwLxu8XhZzuZNm2M/9bf
 mcy0J8j35qQTAGjAMj/FNZAitns8QmXhb67ZPNEecO4Yy3dKOUWH+nIyfgRUKLg5aINo
 0FsdCclMAvKJHhRi/xX5ZhKUylgmcOL9j/3SSP5dVasYNU13SVnVklEpn5LUeqyGRAM0
 SsOH8SfXpTqULjj5GB5c6lee86Ats08GRKg2Ge8CBTk5vSsHXPh2miKTqYkN0I4dxtIZ
 41Bw==
X-Gm-Message-State: ACrzQf3/jWLS5EYo7lyhZODL58lha/PCEp0M8KJ6bMl8noyyLpTifiI+
 SDLy8m6sdA3SZECHNZvZDxW8EXeXmpWBdQ==
X-Google-Smtp-Source: AMsMyM7k97DhnBKohf3FEjarQdRrgmhhNUpt9pzXPmSodXMou8kANZ4EwUOq4y1a6rtRpWxyjUVxBQ==
X-Received: by 2002:a05:6000:808:b0:236:9822:718d with SMTP id
 bt8-20020a056000080800b002369822718dmr6130115wrb.254.1667170208090; 
 Sun, 30 Oct 2022 15:50:08 -0700 (PDT)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 o23-20020a05600c511700b003cf54b77bfesm5585348wms.28.2022.10.30.15.50.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 30 Oct 2022 15:50:07 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>,
 Thomas Huth <thuth@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Subject: [PATCH] MAINTAINERS: Inherit from nanoMIPS
Date: Sun, 30 Oct 2022 23:50:06 +0100
Message-Id: <20221030225006.43203-1-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

6 months ago Stefan Pejic stepped in as nanoMIPS maintainer
(see commit a 8e0e23445a "target/mips: Undeprecate nanoMIPS
ISA support in QEMU"), however today his email is bouncing:

  ** Message blocked **

  Your message to stefan.pejic@syrmia.com has been blocked. See technical details below for more information.

  The response from the remote server was:
  550 5.4.1 Recipient address rejected: Access denied. AS(201806281) [DBAEUR03FT030.eop-EUR03.prod.protection.outlook.com]

To avoid unmaintained code, I feel forced to merge this code
back with the generic MIPS section.

Historical references:
- https://lore.kernel.org/qemu-devel/TY0PR03MB679726901BD6C6BE40114A2FE2A79@TY0PR03MB6797.apcprd03.prod.outlook.com/
- https://lore.kernel.org/qemu-devel/b858a20e97b74e7b90a94948314d0008@MTKMBS62N2.mediatek.inc/

Cc: Vince Del Vecchio <Vince.DelVecchio@mediatek.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 MAINTAINERS | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 32e495e165..0ba3b589bf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -239,16 +239,10 @@ R: Jiaxun Yang <jiaxun.yang@flygoat.com>
 R: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>
 S: Odd Fixes
 F: target/mips/
-F: disas/mips.c
+F: disas/*mips.c
 F: docs/system/cpu-models-mips.rst.inc
 F: tests/tcg/mips/
 
-MIPS TCG CPUs (nanoMIPS ISA)
-M: Stefan Pejic <stefan.pejic@syrmia.com>
-S: Maintained
-F: disas/nanomips.*
-F: target/mips/tcg/*nanomips*
-
 NiosII TCG CPUs
 M: Chris Wulff <crwulff@gmail.com>
 M: Marek Vasut <marex@denx.de>
-- 
2.37.3


