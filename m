Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF4B3B8AFB
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 01:34:18 +0200 (CEST)
Received: from localhost ([::1]:57092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyjij-0002Tj-F0
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 19:34:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45278)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lyjch-0003Rc-3U
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 19:28:03 -0400
Received: from smtp-out1.suse.de ([195.135.220.28]:45208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jziviani@suse.de>) id 1lyjcf-0001HB-C5
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 19:28:02 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D126822772;
 Wed, 30 Jun 2021 23:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625095679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9A+AtnUL9DzZOYMf3oNED1kNPLHxWYTOKQR7UgxLlSk=;
 b=YS1q5v65HJ6uXtV1iBv75UIrcjO66YPjxty45S5wuwZYae/qIuX6G/CBofIdu+67EgTcpZ
 ej2dwrcPBdryF6PpT/Kr5S7D+fez8VPpZz4xokcqnAxxJNher7q1/bhQdWTfuTXIxtDAbR
 wNTGIGCFot2N3uwzwM4geYtsae+2XfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625095679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9A+AtnUL9DzZOYMf3oNED1kNPLHxWYTOKQR7UgxLlSk=;
 b=mAwzjpICG64BNbXWgRECz9XiZ9pPNVRq86sOjuzlmzCFuPfwp/OzQLk4u2/LRfJunWnyyb
 p0xSCociMWU8bXBA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 86737118DD;
 Wed, 30 Jun 2021 23:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625095679; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9A+AtnUL9DzZOYMf3oNED1kNPLHxWYTOKQR7UgxLlSk=;
 b=YS1q5v65HJ6uXtV1iBv75UIrcjO66YPjxty45S5wuwZYae/qIuX6G/CBofIdu+67EgTcpZ
 ej2dwrcPBdryF6PpT/Kr5S7D+fez8VPpZz4xokcqnAxxJNher7q1/bhQdWTfuTXIxtDAbR
 wNTGIGCFot2N3uwzwM4geYtsae+2XfU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625095679;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9A+AtnUL9DzZOYMf3oNED1kNPLHxWYTOKQR7UgxLlSk=;
 b=mAwzjpICG64BNbXWgRECz9XiZ9pPNVRq86sOjuzlmzCFuPfwp/OzQLk4u2/LRfJunWnyyb
 p0xSCociMWU8bXBA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id wIcKEv393GA/IQAALh3uQQ
 (envelope-from <jziviani@suse.de>); Wed, 30 Jun 2021 23:27:57 +0000
From: "Jose R. Ziviani" <jziviani@suse.de>
To: qemu-devel@nongnu.org
Subject: [RFC 1/3] modules: Add CONFIG_TCG_MODULAR in config_host
Date: Wed, 30 Jun 2021 20:27:47 -0300
Message-Id: <20210630232749.21873-2-jziviani@suse.de>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210630232749.21873-1-jziviani@suse.de>
References: <20210630232749.21873-1-jziviani@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.28; envelope-from=jziviani@suse.de;
 helo=smtp-out1.suse.de
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com,
 "Jose R. Ziviani" <jziviani@suse.de>, kraxel@redhat.com, pbonzini@redhat.com,
 cfontana@suse.de
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

CONFIG_TCG_MODULAR is a complement to CONFIG_MODULES, in order to
know if TCG will be a module, even if --enable-modules option was
set.

Signed-off-by: Jose R. Ziviani <jziviani@suse.de>
---
 meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meson.build b/meson.build
index 2d72b8cc06..c37a2358d4 100644
--- a/meson.build
+++ b/meson.build
@@ -277,6 +277,9 @@ if not get_option('tcg').disabled()
 
   accelerators += 'CONFIG_TCG'
   config_host += { 'CONFIG_TCG': 'y' }
+  if is_tcg_modular
+    config_host += { 'CONFIG_TCG_MODULAR': 'y' }
+  endif
 endif
 
 if 'CONFIG_KVM' not in accelerators and get_option('kvm').enabled()
-- 
2.32.0


