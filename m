Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD0B6EB85B
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 12:04:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqA5u-0003lB-MI; Sat, 22 Apr 2023 06:03:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>) id 1pqA5l-0003hh-DI
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 06:03:41 -0400
Received: from todd.t-8ch.de ([159.69.126.157])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>) id 1pqA5i-0000ev-6W
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 06:03:40 -0400
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1682157813; bh=DtV9DcukIMSnEFBWQBePVNYBJufLt1ovfV5qTUzfrEM=;
 h=From:To:Cc:Subject:Date:From;
 b=azqNgrWTIjBPKB4Hb/wFK15vmRR/9datiSloV8KNXA1NjCXu0MB3ErMpm+WgeXdT5
 yt7Z//Rco3Pnn8143heQ/PVt7HLnVPWxpumSFtQRErfHbnPHwjecgbEr0ag+TyJGuO
 a1C9kWFimueBeMX4hUHOabe5bTw8zAB+/XXppErg=
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 "Laurent Vivier" <laurent@vivier.eu>
Subject: [PATCH v2 0/2] linux-user: Fix mincore() with PROT_NONE
Date: Sat, 22 Apr 2023 12:03:12 +0200
Message-Id: <20230422100314.1650-1-thomas@t-8ch.de>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=159.69.126.157; envelope-from=thomas@t-8ch.de;
 helo=todd.t-8ch.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The kernel does not require PROT_READ for addresses passed to mincore.

v1: https://lore.kernel.org/qemu-devel/20230416195103.607948-1-thomas@t-8ch.de/
v1 -> v2:
* Introduce symbolic flag VERIFY_NONE instead of hardcoding "0"

Thomas Weißschuh (2):
  linux-user: Add new flag VERIFY_NONE
  linux-user: Don't require PROT_READ for mincore

 linux-user/qemu.h    | 1 +
 linux-user/syscall.c | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)


base-commit: 1cc6e1a20144c0ae360cbeb0e035fdee1bd80609
-- 
2.40.0


