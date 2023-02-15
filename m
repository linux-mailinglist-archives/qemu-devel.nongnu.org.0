Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0D8697D49
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Feb 2023 14:28:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSHnc-0002ZY-QX; Wed, 15 Feb 2023 08:26:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSHnY-0002VA-MC; Wed, 15 Feb 2023 08:26:14 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSHnU-0006Di-SV; Wed, 15 Feb 2023 08:26:12 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 15C7B60066;
 Wed, 15 Feb 2023 16:26:01 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:b4bf::1:2e])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 nPk8g80UxeA1-2jJXVwBo; Wed, 15 Feb 2023 16:25:59 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676467559; bh=IKeqSfH0nYTKbyo+3Gpwbo88G/FIpSjB1bLtuFBlPV4=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=aRuf3lvZEZ0wONq1rAtch0D9i4kcIX0TW9woW5sq3UoyNTGqmkMlBl/i36FaJggsL
 v5x5QNpd+ldq2SLK4pElfPwkZHtHO/nsXi1uiBxOqDFB0Q7skAy0mxMcAuTJokB8rJ
 5HuS9NBz30paBKaNQNRk3IxOSMlp9KOYw7TbSZjk=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, vsementsov@yandex-team.ru, jsnow@redhat.com,
 crosa@redhat.com, kwolf@redhat.com, hreitz@redhat.com
Subject: [PATCH v5 05/16] scripts/cpu-x86-uarch-abi.py: use .command() instead
 of .cmd()
Date: Wed, 15 Feb 2023 16:25:36 +0300
Message-Id: <20230215132547.1620575-6-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230215132547.1620575-1-vsementsov@yandex-team.ru>
References: <20230215132547.1620575-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Here we don't expect a failure. In case on failure we'll crash on
trying to access ['return']. Let's better use .command() that clearly
raise on failure.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 scripts/cpu-x86-uarch-abi.py | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/scripts/cpu-x86-uarch-abi.py b/scripts/cpu-x86-uarch-abi.py
index 82ff07582f..893afd1b35 100644
--- a/scripts/cpu-x86-uarch-abi.py
+++ b/scripts/cpu-x86-uarch-abi.py
@@ -69,7 +69,7 @@
 shell = QEMUMonitorProtocol(sock)
 shell.connect()
 
-models = shell.cmd("query-cpu-definitions")
+models = shell.command("query-cpu-definitions")
 
 # These QMP props don't correspond to CPUID fatures
 # so ignore them
@@ -85,7 +85,7 @@
 
 names = []
 
-for model in models["return"]:
+for model in models:
     if "alias-of" in model:
         continue
     names.append(model["name"])
@@ -93,12 +93,12 @@
 models = {}
 
 for name in sorted(names):
-    cpu = shell.cmd("query-cpu-model-expansion",
-                     { "type": "static",
-                       "model": { "name": name }})
+    cpu = shell.command("query-cpu-model-expansion",
+                        { "type": "static",
+                          "model": { "name": name }})
 
     got = {}
-    for (feature, present) in cpu["return"]["model"]["props"].items():
+    for (feature, present) in cpu["model"]["props"].items():
         if present and feature not in skip:
             got[feature] = True
 
-- 
2.34.1


