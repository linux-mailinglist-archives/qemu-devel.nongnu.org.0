Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72262B53D8
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Nov 2020 22:33:09 +0100 (CET)
Received: from localhost ([::1]:51136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kem7Y-0006c7-8W
	for lists+qemu-devel@lfdr.de; Mon, 16 Nov 2020 16:33:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kem5u-0005Zr-PR; Mon, 16 Nov 2020 16:31:26 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:45770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <luoyonggang@gmail.com>)
 id 1kem5t-0008R4-7d; Mon, 16 Nov 2020 16:31:26 -0500
Received: by mail-pg1-x543.google.com with SMTP id 62so14357972pgg.12;
 Mon, 16 Nov 2020 13:31:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p4/hNbcX56EDyseyGHZB0+nkfctnbf9WrMJus08dGYs=;
 b=KEHz1ANp/w2tixJ10jvQ3vFm12kalBJOfBmOK5j450/rqe6b90lLK+Od3wpNF74jQr
 r7nLjA+Z1MmFunMkS56DVDzJmk03khb33JDm+3cNTQ3sSZeCZDPZA4wUCOxIUyBpvSIq
 7/l4XFvuInQODyMj5QooU0L1pBOYG8t8s/d4c8oK1kRrcVdvxPa0uoEceTWxuTWJs7ob
 Mn8bPQ1oENeLbNoiDPwl5oB/DoPlaihYVXaHBOTtV4Xyvnpg6H8bHP2HzZAVtgLKAYU3
 VC9F+1f1+qoHewP2PzBNxHj1hJ+2OmibP9t6SBKC80zUN6YmObbaIDHNK/9hq2ANvNaR
 KjAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p4/hNbcX56EDyseyGHZB0+nkfctnbf9WrMJus08dGYs=;
 b=GR4e30GEAykonjnAwhM/6goRYmKfe3cqSRZJvSSEPK3ymOJlTrl0yzgOtCXy0aLrGN
 j9fGPGzgBU2EKo7jiQAsDl0N8Gph54/W5O7yy9LLYmFCLNws4fyj6lz4d7XltLSE5D06
 A0pTJ2POekxh2C7h9ub/gGoDstEvfFgA8Eecznt8v+pwS1O9A1v+mjaPE3xRwOpLWBET
 101HdKtIAk9P3t+whN0zT8kErDm2w7HYJ2qjG5Zjm85qWa5IX4fZ77USPWJfRFVXSR/H
 bHn3qWRKpFmbDsUIwPeNX/xsq5NUt1qYwOqf8MykQvckzjT/BjGQjoXmOKa5yj4AXPdS
 woVA==
X-Gm-Message-State: AOAM533rxt9CQ8fy8Mgpo4thRKkyt8mqDlYuROLd53S962vXs14UWHhh
 IdQPKgh712Dbfx/1vz0J/mQ=
X-Google-Smtp-Source: ABdhPJwYFi0gobxoUXR4NkfRcF0GmJOlz/NAK1FsYxHDbIVkGfkq6IblmgcJzA2/kWwnqNEwIPxHyQ==
X-Received: by 2002:a17:90a:9385:: with SMTP id q5mr972525pjo.20.1605562282536; 
 Mon, 16 Nov 2020 13:31:22 -0800 (PST)
Received: from localhost.localdomain ([103.94.185.75])
 by smtp.googlemail.com with ESMTPSA id mm23sm345979pjb.31.2020.11.16.13.31.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 13:31:21 -0800 (PST)
From: Yonggang Luo <luoyonggang@gmail.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH] meson: Fixes curses detection on msys2
Date: Tue, 17 Nov 2020 05:31:06 +0800
Message-Id: <20201116213106.589-1-luoyonggang@gmail.com>
X-Mailer: git-send-email 2.28.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::543;
 envelope-from=luoyonggang@gmail.com; helo=mail-pg1-x543.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>,
 Yonggang Luo <luoyonggang@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Fixes regression on curses detection in msys2
by commit#925a40df2828d32d3aaaf022282cba81082fb263

Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
---
 meson.build | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/meson.build b/meson.build
index bbff0880f4..8695f7d1c2 100644
--- a/meson.build
+++ b/meson.build
@@ -494,10 +494,15 @@ if have_system and not get_option('curses').disabled()
       return 0;
     }'''
 
-  curses = dependency((targetos == 'windows' ? 'ncurses' : 'ncursesw'),
-                      required: false,
-                      method: 'pkg-config',
-                      static: enable_static)
+  curses_dep_list = targetos == 'windows' ? ['ncurses', 'ncursesw'] : ['ncursesw']
+  foreach curses_dep : curses_dep_list
+    if not curses.found()
+      curses = dependency(curses_dep,
+                          required: false,
+                          method: 'pkg-config',
+                          static: enable_static)
+    endif
+  endforeach
   msg = get_option('curses').enabled() ? 'curses library not found' : ''
   if curses.found()
     if cc.links(curses_test, dependencies: [curses])
-- 
2.28.0.windows.1


