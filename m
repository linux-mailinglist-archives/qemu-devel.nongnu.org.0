Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ACE3B3135
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:24:25 +0200 (CEST)
Received: from localhost ([::1]:39630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQHI-00082U-8o
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:24:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFE-0005aH-32; Thu, 24 Jun 2021 10:22:16 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lwQFC-000895-Gx; Thu, 24 Jun 2021 10:22:15 -0400
Received: by mail-wr1-x431.google.com with SMTP id j2so6851513wrs.12;
 Thu, 24 Jun 2021 07:22:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9fDhOuoTDP65jer/p/rZd3XMpOfdk+Ubz9QqpYoysz8=;
 b=B2TIZaO64ShCTqT/wLUvwBB7Dw46AgtglgQxzGHvWj2OIsOlJXtaezaTepAi9qKiOq
 lzx3soozU7+1ZrBomxsoPsBvR9GJtvK7KSInUzuAWhNlUJF3Wk7P6kA4atf5UI0S75jy
 hSDMLf6atZSb7nmwVuYajoEnimX9U+6IBLSppCR5Wfn1glswF3obkilAzGSyK/7cmwV4
 lXoIo+P14w2LQaA12yzsJmTAUjg2P6zdPTWTCt9sMp+O8M1222lwfXJOpg9ITQ8peD8G
 FmAkWg0LTQ/VSjqC9vJ2RXI4dktQzqViNz33NpSEUz6TKh5XmKgLgGuHLwLqkwEwb1Ly
 fwQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=9fDhOuoTDP65jer/p/rZd3XMpOfdk+Ubz9QqpYoysz8=;
 b=lQRjPTn2HnaD0M59ZkQooGAbrXoT28LnEmpYnZJN4haJSr964DZ2bA2WnIzonZUTOK
 ScydXOORisajuOF2PbE2Qbff3RLb3ArKYhvxryU+zo3rqyLaMeLD+t9Uyn8mKbFjNd0I
 SOXGqpYoh3nEvNVMEA2MByS8xaJLOFcugsv4xYqzsKyP/f+3jqoGhl4uNZsbd6S62z0Y
 gHF5ZMB2wHj8feqOrQpnEdaA0eI15h4mG1olR72FFU1Ys+QeH4mvqIgKnbbw1U27T4z/
 NQLIzQQAg9984ExC2qw2xdcyPvslp8mdELPWPKow9sqt1K7eJykEI2wxGZmyIEyuZ8X1
 AsRw==
X-Gm-Message-State: AOAM532yDeHfx6McKUjshfDCdssKg1OQJVxN0oDbM/glRFd3UcoT/Dwy
 jLPDQRjHGn6SiPC+liVsNxOnBLmRkooogg==
X-Google-Smtp-Source: ABdhPJxTTX0hXnnBva1yrAcsyfzqnJ9ZljLkm5rg0ZwXcxeqh3vRepoQ7AziBAdSZpzyzAMqOq+zww==
X-Received: by 2002:a5d:6b82:: with SMTP id n2mr4773648wrx.206.1624544531493; 
 Thu, 24 Jun 2021 07:22:11 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id z5sm3513891wrt.11.2021.06.24.07.22.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:22:10 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/10] hw/sd: Start splitting SD vs SPI protocols
Date: Thu, 24 Jun 2021 16:21:59 +0200
Message-Id: <20210624142209.1193073-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x431.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: qemu-block@nongnu.org, Andrew Jeffery <andrew@aj.id.au>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi C=C3=A9dric,=0D
=0D
After our discussion yesterday about how to add support for MMC=0D
(and eMMC) I looked at how to easily add these bus protocols,=0D
which might have commands quite different, avoiding to have big=0D
unreadable if/else statements.=0D
=0D
I'm not yet happy enough with the result but it is a starting=0D
point which keeps things still simple.=0D
What I'm wondering is if we could include the command classes=0D
(as another dimension in the array). Also if we could use the=0D
older spec version supported as base set of commands, and if the=0D
user asks for more recent spec version, for each version we=0D
overwrite the array of commands. Thoughts?=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (10):=0D
  hw/sd: When card is in wrong state, log which state it is=0D
  hw/sd: Extract address_in_range() helper, log invalid accesses=0D
  hw/sd: Move proto_name to SDProto structure=0D
  hw/sd: Introduce sd_cmd_handler type=0D
  hw/sd: Add sd_cmd_illegal() handler=0D
  hw/sd: Add sd_cmd_unimplemented() handler=0D
  hw/sd: Add sd_cmd_GO_IDLE_STATE() handler=0D
  hw/sd: Add sd_cmd_SEND_OP_CMD() handler=0D
  hw/sd: Add sd_cmd_ALL_SEND_CID() handler=0D
  hw/sd: Add sd_cmd_SEND_RELATIVE_ADDR() handler=0D
=0D
 hw/sd/sd.c | 251 ++++++++++++++++++++++++++++++-----------------------=0D
 1 file changed, 143 insertions(+), 108 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

