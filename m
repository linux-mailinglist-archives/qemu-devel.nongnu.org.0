Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A431395081
	for <lists+qemu-devel@lfdr.de>; Sun, 30 May 2021 12:55:04 +0200 (CEST)
Received: from localhost ([::1]:37266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnJ5z-0004Uh-Dj
	for lists+qemu-devel@lfdr.de; Sun, 30 May 2021 06:55:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1lnJ0o-0002IN-Sq; Sun, 30 May 2021 06:49:42 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:35074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.juenger@greensocs.com>)
 id 1lnJ0m-0001KT-Uy; Sun, 30 May 2021 06:49:42 -0400
Received: from fornax.fritz.box (b2b-109-90-5-113.unitymedia.biz
 [109.90.5.113])
 by beetle.greensocs.com (Postfix) with ESMTPSA id D6DD52077E;
 Sun, 30 May 2021 10:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1622371772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lq9dNQ+DGxMJ/gKm3Mn8gXSMiqZjgZ+iW8o/Q3KmJhE=;
 b=24Y0FaZulVsZxXpwbOJPMi1cILvOFGUvof6tZ3ehWiZ/7jcnH2qUyYEFgcHenWBW19Beb/
 hKQr4zWSHcgBN8ibW1GXHMiZIy97YGAcX5eBuzfeF9LjTdEAQvpBUrThH34rdlWNVQ9Ot5
 jhHPtWgWmwqzEn2eM4Ehzu12JcOgBlQ=
From: =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] QOMify Sifive UART Model
Date: Sun, 30 May 2021 12:49:20 +0200
Message-Id: <20210530104922.466175-1-lukas.juenger@greensocs.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=lukas.juenger@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-riscv@nongnu.org, bin.meng@windriver.com, mark.burton@greensocs.com,
 marcandre.lureau@redhat.com, palmer@dabbelt.com, pbonzini@redhat.com,
 alistair.francis@wdc.com,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.juenger@greensocs.com>,
 luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

I have updated the commit messages and cleaned up the other function
names as requested by Bin. I hope this is acceptable now.
I did not add the migration fields as requested by Philippe as migration
is not supported by several devices in the sifive_u machine and was not
supported by the UART model before.
If I understand correctly, I would not be able to test it.
It should probably be a different patch set adding migration for the
entire machine.

I hope that's okay.
Best regards,
Lukas

Lukas Jünger (2):
  hw/char: sifive_uart
  hw/char: sifive_uart

 include/hw/char/sifive_uart.h |   6 +-
 hw/char/sifive_uart.c         | 110 +++++++++++++++++++++++++---------
 2 files changed, 84 insertions(+), 32 deletions(-)

-- 
2.31.1


