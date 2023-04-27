Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4561D6F08A1
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Apr 2023 17:47:06 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ps3op-0002aB-2d; Thu, 27 Apr 2023 11:46:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3oD-0001sZ-EQ
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:25 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ps3o7-0004lv-Vg
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 11:45:25 -0400
Received: by mail-wr1-x42a.google.com with SMTP id
 ffacd0b85a97d-3047ff3269aso3163153f8f.0
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 08:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682610317; x=1685202317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gd3Al4GBqCr5ZtQERTG0wvZGPUvV+r+DB1fF+uG5JLY=;
 b=Q3sJqljFJVOyMUOPUZPzxWFAJdUgkOAHkfiU2M+EERCzRytsuM/lpB/tKcLPZc8c7I
 SuX0dx7mo2X0PujEu0pVlQnncx2A8ypYaZARqRoNJ/voYYGd93sz5Eh0qBMFqUuGcSvH
 CE26nWmupoxSBChLwMw+9bqMWX04gSjEF/0EX6c3lE0Yg7QQCeIz4gPqteyjZNl5iA9N
 vmYtNSAwED3hYML0rQhLLE8dee8TbbHIKHoI1xLYDo6kt55cQ37wA79GNa1u6dMBrH6K
 vbIsLEgVKzmyObkIwPmdXUg/uwGPaHy9CAhRBKsfY2upNzn9vm585gKUUmjDIc3DBjFo
 b6aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682610317; x=1685202317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gd3Al4GBqCr5ZtQERTG0wvZGPUvV+r+DB1fF+uG5JLY=;
 b=Cu1EbDddjhhUfxfQjYhIv7tBd7Melaobn5sV2wjMbqiwiREOHarRxr1G5BzIt33P5u
 0aj1XeXVycUR3pIO9EEkkZKJiApHafYrE990yureF5Tceu+AkeMi0TjwiQv4ZeIr/lhL
 6HCQFy8flPOTtKaT93n16XbloxgSjfaMvZDXqY8xnp9Nwi4l5dlW9ryV9R7VB6LSzaZl
 yaYfZ+4a2Sh4bm2ylew5u5uXXcJGm5yOa5Ujwj1OgOXgrJBTCae9fUFgTprbxnXUN5lq
 GSE+fBVvRaIqmG6wrmtpe3ne0Z2oT4OhMzLQtZESW0J6QMVGJdHWSCFuG76tcT5OmYiO
 s30Q==
X-Gm-Message-State: AC+VfDyfW9N+GQSXBcKQSKi7wl/lamNbc9uZxYwsfZuGubPxQFDQ4kAU
 SJ600V9xRLOHwMBcKquwp7UICA==
X-Google-Smtp-Source: ACHHUZ75UqpWmSGqVHtUI6dtcbjdRhjg6rfYmj0bxj6JMJbKXDbdKJYyJabWOtfvCDEMB/6wQHnbQg==
X-Received: by 2002:adf:f7c1:0:b0:2f5:5d74:4f9f with SMTP id
 a1-20020adff7c1000000b002f55d744f9fmr1706289wrq.11.1682610317228; 
 Thu, 27 Apr 2023 08:45:17 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l14-20020a7bc44e000000b003f195d2f1a9sm17205876wmi.15.2023.04.27.08.45.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 08:45:16 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 31D231FFC3;
 Thu, 27 Apr 2023 16:45:12 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, Yohei Kojima <y-koj@outlook.jp>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 14/18] qemu-options.hx: Update descriptions of memory options
 for NUMA node
Date: Thu, 27 Apr 2023 16:45:06 +0100
Message-Id: <20230427154510.1791273-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230427154510.1791273-1-alex.bennee@linaro.org>
References: <20230427154510.1791273-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Yohei Kojima <y-koj@outlook.jp>

This commit adds the following description:
1. `memdev` option is recommended over `mem` option (see [1,2])
2. users must specify memory for all NUMA nodes (see [2])

This commit also separates descriptions for `mem` and `memdev` into two
paragraphs. The old doc describes legacy `mem` option first, and it was
a bit confusing.

Related documentation:
[1] https://wiki.qemu.org/ChangeLog/5.1#Incompatible_changes
[2] https://www.qemu.org/docs/master/about/removed-features.html

Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
Message-Id: <TYZPR06MB5418D6B0175A49E8E76988439D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
[AJB: fix documentation in commit message]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20230424092249.58552-15-alex.bennee@linaro.org>

diff --git a/qemu-options.hx b/qemu-options.hx
index baa0589733..b5efa648ba 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -405,15 +405,22 @@ SRST
         -numa node,nodeid=0 -numa node,nodeid=1 \
         -numa cpu,node-id=0,socket-id=0 -numa cpu,node-id=1,socket-id=1
 
-    Legacy '\ ``mem``\ ' assigns a given RAM amount to a node (not supported
-    for 5.1 and newer machine types). '\ ``memdev``\ ' assigns RAM from
-    a given memory backend device to a node. If '\ ``mem``\ ' and
-    '\ ``memdev``\ ' are omitted in all nodes, RAM is split equally between them.
-
-
-    '\ ``mem``\ ' and '\ ``memdev``\ ' are mutually exclusive.
-    Furthermore, if one node uses '\ ``memdev``\ ', all of them have to
-    use it.
+    '\ ``memdev``\ ' option assigns RAM from a given memory backend
+    device to a node. It is recommended to use '\ ``memdev``\ ' option
+    over legacy '\ ``mem``\ ' option. This is because '\ ``memdev``\ '
+    option provides better performance and more control over the
+    backend's RAM (e.g. '\ ``prealloc``\ ' parameter of
+    '\ ``-memory-backend-ram``\ ' allows memory preallocation).
+
+    For compatibility reasons, legacy '\ ``mem``\ ' option is
+    supported in 5.0 and older machine types. Note that '\ ``mem``\ '
+    and '\ ``memdev``\ ' are mutually exclusive. If one node uses
+    '\ ``memdev``\ ', the rest nodes have to use '\ ``memdev``\ '
+    option, and vice versa.
+
+    Users must specify memory for all NUMA nodes by '\ ``memdev``\ '
+    (or legacy '\ ``mem``\ ' if available). In QEMU 5.2, the support
+    for '\ ``-numa node``\ ' without memory specified was removed.
 
     '\ ``initiator``\ ' is an additional option that points to an
     initiator NUMA node that has best performance (the lowest latency or
-- 
2.39.2


