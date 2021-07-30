Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650DE3DBF8C
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Jul 2021 22:20:58 +0200 (CEST)
Received: from localhost ([::1]:56922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m9Z05-0006eX-Aq
	for lists+qemu-devel@lfdr.de; Fri, 30 Jul 2021 16:20:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9YyG-00043t-Sp
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:04 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:43629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1m9YyF-0000nz-7M
 for qemu-devel@nongnu.org; Fri, 30 Jul 2021 16:19:04 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 pj14-20020a17090b4f4eb029017786cf98f9so5384832pjb.2
 for <qemu-devel@nongnu.org>; Fri, 30 Jul 2021 13:19:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Gfhflo12UGoXr97Ilr5PTd+AyNfqb0V7Rdiv5SvS+aE=;
 b=gKNPncPJmmnoFTo/BE5gkoQS1mC5Bg6ssSG4asfujdHLB5EKAOOukNcKHbzEyiMtaX
 Yj048Z8NEOCVhD8urxa3ILelis9XoJnI/i1omrdWeDKkKJfTw1sM5cQzWeQYxUFNUFd3
 5Dh+JVTmKuhiyxEW4Mm09eLZFoqcsrVZo5q/5i5rI5ML/1SkHPW9HYBV42GGXp1D/lV9
 dOruKuR+oi6F0pFjEgQD7p3DJXJdP2/f25nPjURMjVs7KIcpRXhEcQiwNIsyU/MSlUvU
 SlAZnY/SEtZsb58pwARfjZ07l/pptSJ2qztUQMwIEnoBJAEOJh6S6ftEtb+yxzsa/Tfz
 ATzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Gfhflo12UGoXr97Ilr5PTd+AyNfqb0V7Rdiv5SvS+aE=;
 b=ASdKaywAp6hgB2yl+QF52vIsMr8//CjKpMDc0aFhBI4OMdREl+6U5C4P8lja36Eb6k
 Uf68KxjSsJc5o2RhcmH9jjYcoc8TjJ527ypA/KAMJyGbRe3ySWuTSnq/zUhka+AA06zM
 qB6K2AUJPNROIAdzwYuMALuAYMRGzmilxJy6g7zDXGrdTBpWAgwMU/pB/ZKjQMdUHxSa
 IagG6hEOpWi3EdO4FW3no53oCYEhavpFVtWsG1Nn3BCw2p+he4GTFVwzgPGNNJzTCzdq
 MILm0Rr+tzfRBieVa8Ek3KMKWKCRndSxBA7+xFn7owBGgp43eKlFwVP00p+G4IJPNVqL
 GCrw==
X-Gm-Message-State: AOAM532JE7vUzWi0CAUtWgfh1U4X2K7oTjpW6TaJ4UEoz4GIMRsVfj67
 wZay0eRVmneIxEzvU8p9wYNdwggDPj9MoQ==
X-Google-Smtp-Source: ABdhPJxN2W3AuV1wXR0rGQxRkVqT4HldzmLyUjHjMvWdV6aNVxqz1IhMxvWbnM9tR81wRprCuDDBpA==
X-Received: by 2002:a17:90a:d918:: with SMTP id
 c24mr5037191pjv.104.1627676341748; 
 Fri, 30 Jul 2021 13:19:01 -0700 (PDT)
Received: from localhost.localdomain ([120.138.12.243])
 by smtp.gmail.com with ESMTPSA id s50sm3256842pfw.212.2021.07.30.13.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jul 2021 13:19:01 -0700 (PDT)
From: G S Niteesh Babu <niteesh.gs@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 01/13] python/aqmp: Fix wait_closed work-around for python
 3.6
Date: Sat, 31 Jul 2021 01:48:34 +0530
Message-Id: <20210730201846.5147-2-niteesh.gs@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210730201846.5147-1-niteesh.gs@gmail.com>
References: <20210730201846.5147-1-niteesh.gs@gmail.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pj1-x1034.google.com
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
Cc: ehabkost@redhat.com, kchamart@redhat.com, jsnow@redhat.com,
 armbru@redhat.com, wainersm@redhat.com,
 G S Niteesh Babu <niteesh.gs@gmail.com>, stefanha@redhat.com, crosa@redhat.com,
 eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Before this patch the wait_closed work-around for python 3.6
fails during disconnect.
This is a temproray work around for which might be fixed in the
future or will be completely removed when the minimum python
version is raised to 3.7.

This patch was originally written by John Snow <jsnow@redhat.com>

Signed-off-by: G S Niteesh Babu <niteesh.gs@gmail.com>
---
 python/qemu/aqmp/util.py | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/python/qemu/aqmp/util.py b/python/qemu/aqmp/util.py
index de0df44cbd..eaa5fc7d5f 100644
--- a/python/qemu/aqmp/util.py
+++ b/python/qemu/aqmp/util.py
@@ -134,7 +134,17 @@ def is_closing(writer: asyncio.StreamWriter) -> bool:
 
     while not transport.is_closing():
         await asyncio.sleep(0)
-    await flush(writer)
+
+    # This is an ugly workaround, but it's the best I can come up with.
+    sock = transport.get_extra_info('socket')
+
+    if sock is None:
+        # Our transport doesn't have a socket? ...
+        # Nothing we can reasonably do.
+        return
+
+    while sock.fileno() != -1:
+        await asyncio.sleep(0)
 
 
 def asyncio_run(coro: Coroutine[Any, Any, T], *, debug: bool = False) -> T:
-- 
2.17.1


