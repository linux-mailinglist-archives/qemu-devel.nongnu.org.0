Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C478640101F
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Sep 2021 16:17:23 +0200 (CEST)
Received: from localhost ([::1]:56750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMsxW-0003FJ-G7
	for lists+qemu-devel@lfdr.de; Sun, 05 Sep 2021 10:17:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49090)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.junger@greensocs.com>)
 id 1mMsqM-0003sl-C8
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:09:58 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:38840)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lukas.junger@greensocs.com>)
 id 1mMsqI-0007Av-CS
 for qemu-devel@nongnu.org; Sun, 05 Sep 2021 10:09:56 -0400
Received: from fornax.fritz.box (b2b-109-90-5-113.unitymedia.biz
 [109.90.5.113])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 3765C21A87;
 Sun,  5 Sep 2021 14:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1630850991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RQrD4edJwFtfpEOqadBwYXICxJpsNChk0HjmsBC4KqM=;
 b=f31JP257xLtcEGT56BEr+VzI8PwdHMx8ZeacSv+26TpX+fBYNyai1SAV+uiCh7o23Lel5O
 VpXsP7JmicSdaTjcfJ/hCHCyguv3/h6q9GFt1ZJi598NZn+ih5MsNlwJx6xDnPZZMZRdve
 SInp0o9egmEfLR+fVPITYfe9zQPewAg=
From: =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.junger@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] plugins/: Add missing functions to symbol list
Date: Sun,  5 Sep 2021 16:09:39 +0200
Message-Id: <20210905140939.638928-2-lukas.junger@greensocs.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210905140939.638928-1-lukas.junger@greensocs.com>
References: <20210905140939.638928-1-lukas.junger@greensocs.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=lukas.junger@greensocs.com; helo=beetle.greensocs.com
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
Cc: erdnaxe@crans.org, ma.mandourr@gmail.com,
 =?UTF-8?q?Lukas=20J=C3=BCnger?= <lukas.junger@greensocs.com>,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some functions of the plugin API were missing in
the symbol list. However, they are all used by
the contributed example plugins. QEMU fails to
load the plugin if the function symbol is not
exported.

Signed-off-by: Lukas Jünger <lukas.junger@greensocs.com>
---
 plugins/qemu-plugins.symbols | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/plugins/qemu-plugins.symbols b/plugins/qemu-plugins.symbols
index 67b309ea2a..4834756ba3 100644
--- a/plugins/qemu-plugins.symbols
+++ b/plugins/qemu-plugins.symbols
@@ -1,11 +1,14 @@
 {
   qemu_plugin_bool_parse;
   qemu_plugin_get_hwaddr;
+  qemu_plugin_hwaddr_device_name;
   qemu_plugin_hwaddr_is_io;
+  qemu_plugin_hwaddr_phys_addr;
   qemu_plugin_insn_data;
   qemu_plugin_insn_disas;
   qemu_plugin_insn_haddr;
   qemu_plugin_insn_size;
+  qemu_plugin_insn_symbol;
   qemu_plugin_insn_vaddr;
   qemu_plugin_mem_is_big_endian;
   qemu_plugin_mem_is_sign_extended;
-- 
2.31.1


