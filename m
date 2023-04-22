Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3874C6EB85E
	for <lists+qemu-devel@lfdr.de>; Sat, 22 Apr 2023 12:04:47 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqA5v-0003o1-KV; Sat, 22 Apr 2023 06:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>) id 1pqA5n-0003lA-4B
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 06:03:44 -0400
Received: from todd.t-8ch.de ([159.69.126.157])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thomas@t-8ch.de>) id 1pqA5j-0000f4-4X
 for qemu-devel@nongnu.org; Sat, 22 Apr 2023 06:03:41 -0400
From: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
 t=1682157813; bh=fXGTwsgoJEVjDUk4qyvsKAgrgaCs5TLuSvqVeEzmj9M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DzNavXaHU7B6pzyEav35tTgD8cilwryuBBLcjIsz8pxzaMBKi4ljxh3jRZKuo1dX/
 f2nu971eIPXc2lCzuh9F5NOjJCxwRri4Io7veP54KQ3iN6bBnzfadxyxRFECsHme4+
 Ccg8SKSluU0rfv2u31vMgrTXo5yZqTSMGlZELS5s=
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 "Laurent Vivier" <laurent@vivier.eu>
Subject: [PATCH v2 1/2] linux-user: Add new flag VERIFY_NONE
Date: Sat, 22 Apr 2023 12:03:13 +0200
Message-Id: <20230422100314.1650-2-thomas@t-8ch.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230422100314.1650-1-thomas@t-8ch.de>
References: <20230422100314.1650-1-thomas@t-8ch.de>
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

This can be used to validate that an address range is mapped but without
being readable or writable.

It will be used by an updated implementation of mincore().

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
---
 linux-user/qemu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/linux-user/qemu.h b/linux-user/qemu.h
index e2e93fbd1d5d..92f9f5af41c7 100644
--- a/linux-user/qemu.h
+++ b/linux-user/qemu.h
@@ -168,6 +168,7 @@ abi_long do_brk(abi_ulong new_brk);
 
 /* user access */
 
+#define VERIFY_NONE  0
 #define VERIFY_READ  PAGE_READ
 #define VERIFY_WRITE (PAGE_READ | PAGE_WRITE)
 
-- 
2.40.0


