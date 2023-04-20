Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B586E98EC
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 17:59:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppWf8-0000CO-A9; Thu, 20 Apr 2023 11:57:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf3-0000Ab-SR
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:29 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ppWf2-0007uD-15
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 11:57:29 -0400
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-2fc3f1d6f8cso485724f8f.3
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 08:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682006246; x=1684598246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qYO+kvYzx9y+m5senjguoiZ6X2J42iIij0ImX9gESJE=;
 b=BqZCICpchzY2N2hVapKo04csHRSKXTcYZsKGuudQCG57D2E/GuYwYuV6UBZollkFo7
 PW0RnRvSmo4Cvt1VynzLvcoUnrnre44HAowgjGK+fgTecSgZixPP39ZeChbKc6C/O13q
 mGj2nnmhb/DON85upR1Z9wbbrFurMpidzwsYTY7wgK498Vf1zStYIa1gbAMDG482kjxM
 hb1K3HGer9S/SJd2qZL94y/CLwWqedG01yeWc9qmtMjHYctp1s+5WjnGml59sx51JuRT
 91qk/W8fL/Ifgyc6GRU1sgu4RTnLYQMUoJEvrFI9RUav0NiqKmS56k7soZV6B7w/EzGR
 H9Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682006246; x=1684598246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qYO+kvYzx9y+m5senjguoiZ6X2J42iIij0ImX9gESJE=;
 b=N5hPMTImI98Qr9vuBLUHkSA+xkoIvuHrHDlqjB/kmum5P9ot5giBIx+ZwittcJJL17
 UBilLsr0qqRkdgMmbNnLaIlcTgmAWVMSbU7Cw8kFNtU0VJ226BbubWm3SHa6C4rSl7Ec
 UWgMVBmn3tkWhIAtypmn4tE7mQRNe4vSesrIKvjhS52j4L2AXfsJGs/ECcUhvO4unIxh
 46g8rYUmCv4yYSGyuehB0R1Gw+i6PdYndyFVNMVV+suR5BfH0A0iDZ9C0F7PvbPArUHC
 Ixi2JLC748fI2dJl5T6U0LM8MRK6lTJ22vyGDDBffR3YypvUGOqUsOQ6E9x0tPkD2QHj
 x7vQ==
X-Gm-Message-State: AAQBX9cxWSsf80MT1SX8kAt1ueUlN97g43r2Y+bSxJ10CI07E4u0xxSo
 o7mJqSev1E80RS2QqEgzkbq7GQ==
X-Google-Smtp-Source: AKy350Ztt3gNp7PaCt16DmKFKDCx5q4FsNHGUit/mMvsOh+cAJeTnocfnb49Gkm6n8NY9ece00OrHw==
X-Received: by 2002:adf:e268:0:b0:2f5:9aa2:e5fc with SMTP id
 bl40-20020adfe268000000b002f59aa2e5fcmr1328060wrb.28.1682006246075; 
 Thu, 20 Apr 2023 08:57:26 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a0560001b0400b002ffbf2213d4sm2257630wrz.75.2023.04.20.08.57.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 08:57:24 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id B1A891FFBA;
 Thu, 20 Apr 2023 16:57:23 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 peter.maydell@linaro.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Alexandre Iooss <erdnaxe@crans.org>,
 John G Johnson <john.g.johnson@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>, Yohei Kojima <y-koj@outlook.jp>
Subject: [PATCH 2/9] qemu-options.hx: Update descriptions of memory options
 for NUMA node
Date: Thu, 20 Apr 2023 16:57:16 +0100
Message-Id: <20230420155723.1711048-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230420155723.1711048-1-alex.bennee@linaro.org>
References: <20230420155723.1711048-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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

Related documantations:
[1] https://wiki.qemu.org/ChangeLog/5.1#Incompatible_changes
[2] https://www.qemu.org/docs/master/about/removed-features.html

Signed-off-by: Yohei Kojima <y-koj@outlook.jp>
Message-Id: <TYZPR06MB5418D6B0175A49E8E76988439D8E9@TYZPR06MB5418.apcprd06.prod.outlook.com>
---
 qemu-options.hx | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index 59bdf67a2c..174f0d0c2d 100644
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


