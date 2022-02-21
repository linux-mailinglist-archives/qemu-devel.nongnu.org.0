Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 015AF4BDAB9
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 17:03:27 +0100 (CET)
Received: from localhost ([::1]:44654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMB9q-0002SE-DK
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 11:03:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMB2G-0006cb-PK
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:55:37 -0500
Received: from beetle.greensocs.com ([5.135.226.135]:35542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nMB2D-0002At-MO
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 10:55:36 -0500
Received: from crumble.bar.greensocs.com (unknown [172.17.10.6])
 by beetle.greensocs.com (Postfix) with ESMTPS id B46CF21C36;
 Mon, 21 Feb 2022 15:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1645458931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zDC9u9lt816558qvQ9zL3iwMJrJG4eLRj8Dgvj9bAM0=;
 b=ROLmkmxqyOTK9XOTfCKXt5z7e61sPx4keR5EVNW6B3EoEbVRORcM2STu+0zThKaRU0U+SI
 UgfTCRdRuak4AQlh07Hru6lJuLG/eD+aBSYQAty+6xqgfMTv3BP8tfV2rrIFxhxFxIA51W
 TgG0Y/bt/9OV/M6BjgXxLXPQmxLXAac=
From: Damien Hedde <damien.hedde@greensocs.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] python: qmp_shell: don't prompt when stdin is
 non-interactive
Date: Mon, 21 Feb 2022 16:55:15 +0100
Message-Id: <20220221155519.2367-2-damien.hedde@greensocs.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220221155519.2367-1-damien.hedde@greensocs.com>
References: <20220221155519.2367-1-damien.hedde@greensocs.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Eduardo Habkost <eduardo@habkost.net>, John Snow <jsnow@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In that case, there is no echo anyway. So the prompt is just
garbage.

Signed-off-by: Damien Hedde <damien.hedde@greensocs.com>
---
 python/qemu/aqmp/qmp_shell.py | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/python/qemu/aqmp/qmp_shell.py b/python/qemu/aqmp/qmp_shell.py
index d11bf54b00..a6e0f5af42 100644
--- a/python/qemu/aqmp/qmp_shell.py
+++ b/python/qemu/aqmp/qmp_shell.py
@@ -367,6 +367,8 @@ def prompt(self) -> str:
         """
         Return the current shell prompt, including a trailing space.
         """
+        if not sys.stdin.isatty():
+            return ""
         if self._transmode:
             return 'TRANS> '
         return '(QEMU) '
-- 
2.35.1


