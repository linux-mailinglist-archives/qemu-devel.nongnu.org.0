Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB7CF66B2A0
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 17:42:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH63y-0002j5-3P; Sun, 15 Jan 2023 11:40:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arthur.sengileyev@gmail.com>)
 id 1pH63w-0002iL-8n; Sun, 15 Jan 2023 11:40:52 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <arthur.sengileyev@gmail.com>)
 id 1pH63u-0008H8-Ns; Sun, 15 Jan 2023 11:40:52 -0500
Received: by mail-lf1-x129.google.com with SMTP id o20so7760701lfk.5;
 Sun, 15 Jan 2023 08:40:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=77fyOo11qGpgtddUeijkGShVQIa2unTWJaI2UjKZVUo=;
 b=af3RsYA3pKAIWNAmw7h7kOg3VYt6oncoSwOBsrP76tlBvIApoVFkycWovUJggLqFHr
 hn5Q0ZriHLSIy4ntoAbx397wEB2VE7izf8DL8KAEcENoTeGB5ws/nI/1Ox6y781ihoaJ
 yRTruJMlwp6Z5b/n+vTfURFzn2xtrN5HWIMlFjSimXLCRXmvy4p13Xcpf8gP3RktGVpd
 3OOOHgeIs0zgTCuKNyouqGVWay/NImzM24apkn44umQy0JDKW/VOBxWH00TmKaKVwbMb
 TVomoW1zoEFa+Z+i2BDeaAxliWV702lRKAFZdIM2o+f8/sio3OCDjMGLisGYq+7BivkR
 pkXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=77fyOo11qGpgtddUeijkGShVQIa2unTWJaI2UjKZVUo=;
 b=NimgA2OaYo27jN1RQASHQdLyM12LKL9RquG/Al+/slfqTj6HAI0kBdfjAfgYDRJPBt
 0aLbMntTlFFq8X1juzyBX6l5CQdVYlNjqPXMJdqTxbrJfTEpX+qI580bYi+aBtAB+zIy
 nfRHG/L6bYSumhFsGxRPGLl5giPiyZXeEXwk2UDxA/dUawdY1RxQEnIyBIN4uh169HgQ
 A3qqj/K2QsOBdJHpo9tkwuaSpdjIY0+Mdl4YtihVP4zjeLFvWiB6Bd2SV8rvMjxPCrA8
 Af5TV9HUOfgJJOopEmM4/hw9XN5X2QvTTuwNQfJRq3E4evPyjHOee1zBwnldZSjavOCK
 Ssdw==
X-Gm-Message-State: AFqh2kpAJHtfsc1wPLOwzUPlI/JqQlukt3cyqJavfbWJaMxCNUiWRggu
 Fjd13ukorWyK9B/rXWrDz8o=
X-Google-Smtp-Source: AMrXdXuiRo6pgb1ZYwaGV0y1xfkvybt7D2Rin01lYlt8BBdtKIlR7/uJetLWGBEQVm2fz0MZP+eLeA==
X-Received: by 2002:a05:6512:3e28:b0:4b6:fddc:1fcd with SMTP id
 i40-20020a0565123e2800b004b6fddc1fcdmr3610493lfv.23.1673800848532; 
 Sun, 15 Jan 2023 08:40:48 -0800 (PST)
Received: from Arturss-MBP-2.lan ([87.246.149.32])
 by smtp.gmail.com with ESMTPSA id
 v9-20020a056512048900b004cb43eb09dfsm4750772lfq.123.2023.01.15.08.40.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 15 Jan 2023 08:40:48 -0800 (PST)
From: Arthur Sengileyev <arthur.sengileyev@gmail.com>
To: arthur.sengileyev@gmail.com
Cc: sw@weilnetz.de, jsnow@redhat.com, crosa@redhat.com, qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org, bmeng.cn@gmail.com
Subject: [PATCH v3] Windows installer: keep dependency cache
Date: Sun, 15 Jan 2023 18:40:46 +0200
Message-Id: <20230115164046.93334-1-arthur.sengileyev@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=arthur.sengileyev@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

It should be possible to reuse cache built by previous iteration
to process next executables. Processed dependencies are already
skipped later based on dll name.

Signed-off-by: Arthur Sengileyev <arthur.sengileyev@gmail.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
---
 scripts/nsis.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/scripts/nsis.py b/scripts/nsis.py
index 03ed7608a2..7cffba70ff 100644
--- a/scripts/nsis.py
+++ b/scripts/nsis.py
@@ -91,12 +91,13 @@ def main():
         print("Searching '%s' for the dependent dlls ..." % search_path)
         dlldir = os.path.join(destdir + prefix, "dll")
         os.mkdir(dlldir)
+        deps_cache = set()
 
         for exe in glob.glob(os.path.join(destdir + prefix, "*.exe")):
             signcode(exe)
 
             # find all dll dependencies
-            deps = set(find_deps(exe, search_path, set()))
+            deps = set(find_deps(exe, search_path, deps_cache))
             deps.remove(exe)
 
             # copy all dlls to the DLLDIR
-- 
2.39.0


