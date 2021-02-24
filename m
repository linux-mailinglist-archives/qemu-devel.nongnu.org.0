Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C767C32449D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 20:28:48 +0100 (CET)
Received: from localhost ([::1]:60320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEzq3-0008II-Qd
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 14:28:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51508)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <koalinux@gmail.com>)
 id 1lEzhE-00024k-D0
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:19:40 -0500
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136]:35522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <koalinux@gmail.com>)
 id 1lEzhB-0003io-On
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 14:19:39 -0500
Received: by mail-lf1-x136.google.com with SMTP id e7so4787779lft.2
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 11:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U3k4OIfswW5rgZ2j+jxoAqaggBwfdC7HhIceJ+GNvtU=;
 b=n6g1VIzXOnOjLxcOJxEEu/mH15cjzsy5+0mWLjNMviyTKqfMixNyNYDVdmdctJus33
 MbKYKVoKSIDmyFcQ1wtU6pLPUmOhQ6eO18mOkDisxIOLSPe5YyraZfTay8kKDSDXGSFn
 IIKv+FJdr3vG1Pe/lCH5SJcWN/Xts4lZ6178NhWzDHiIUhkw7WSN0VvTgT1XrAUuCCU4
 VdO0n9bXAzBKB6hZcoO5XlEowQARMzdz8kb4ppeSrgDlREtAPQn779IwOaTKgA/vUQ4A
 5nRK987KTQVRakHeE1S6ZcrAhLWVdv0IrzHmRh0/g2OjWXXwVHYqRNMvv7UzrlZ36D1L
 lZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U3k4OIfswW5rgZ2j+jxoAqaggBwfdC7HhIceJ+GNvtU=;
 b=ERRzIHRlip+0ksIesh80xJXb/ML886HDq0D3sRzzTCDft+PeYoNhGdbcNtjuD+VwZw
 xyD5r17pcwOZApSFrZ3Uy8hiZ2x1RbV8/2p1pKfJt4ZsZymytj7zWD1cMXGXrRoAEqw9
 5xac9xJ9yfnpVeLro2hubE8rYkBltl2/YmAqQxCXMufQcvuc+CyilpQoDE/fIC2CZ8kG
 +zZoi8ycfl7siqRWZExdUVKJsI2jtObVA7Qo4j2npU5ww+jRL3u3r93zCZtpfeqmhrr0
 JRSqxkOtNTIrybpuEVOmwpYqjPjYIOKIMOhrr4Xqy7RKKvyidZSJr5Z5jpG+VMDSkcHw
 yq8A==
X-Gm-Message-State: AOAM5314v4e12WBxnYJidZkGoH4auH6JBeTKs0Oyoq//eojibk5oWdYB
 GBZjbGLB5zNcqgI5khywmV4=
X-Google-Smtp-Source: ABdhPJzTh6hsuCFWfWSynsdD1juJB+lc7ckwywrmtnn3Qx91d6/KAXz24/TWuliPWfo1XIsEXhtUkg==
X-Received: by 2002:a19:f101:: with SMTP id p1mr1173158lfh.597.1614194375512; 
 Wed, 24 Feb 2021 11:19:35 -0800 (PST)
Received: from woodpecker.foxhound.fi (82-181-249-174.bb.dnainternet.fi.
 [82.181.249.174])
 by smtp.gmail.com with ESMTPSA id k5sm652594ljb.79.2021.02.24.11.19.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 11:19:35 -0800 (PST)
From: =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <koalinux@gmail.com>
To: kraxel@redhat.com
Subject: [PATCH v2] Autoconnect jack ports by default
Date: Wed, 24 Feb 2021 21:19:27 +0200
Message-Id: <20210224191927.19271-1-koalinux@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::136;
 envelope-from=koalinux@gmail.com; helo=mail-lf1-x136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: geoff@hostfission.com, qemu-devel@nongnu.org, koalinux@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch provides a default value to connect
jack ports when the user don't specify connect-ports.

Buglink: https://bugs.launchpad.net/qemu/+bug/1908832

Signed-off-by: José Pekkarinen <koalinux@gmail.com>
---
 audio/jackaudio.c | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/audio/jackaudio.c b/audio/jackaudio.c
index 3031c4e29b..0a87d5e23a 100644
--- a/audio/jackaudio.c
+++ b/audio/jackaudio.c
@@ -369,14 +369,23 @@ static size_t qjack_read(HWVoiceIn *hw, void *buf, size_t len)
 
 static void qjack_client_connect_ports(QJackClient *c)
 {
-    if (!c->connect_ports || !c->opt->connect_ports) {
+    if (!c->connect_ports) {
         return;
     }
 
     c->connect_ports = false;
     const char **ports;
-    ports = jack_get_ports(c->client, c->opt->connect_ports, NULL,
-        c->out ? JackPortIsInput : JackPortIsOutput);
+    if (c->out) {
+        ports = jack_get_ports(c->client,
+            c->opt->connect_ports ? c->opt->connect_ports
+                : "system:playback_.*",
+            NULL, JackPortIsInput);
+    } else {
+        ports = jack_get_ports(c->client,
+            c->opt->connect_ports ? c->opt->connect_ports
+                : "system:capture_.*",
+            NULL, JackPortIsOutput);
+    }
 
     if (!ports) {
         return;
-- 
2.26.2


