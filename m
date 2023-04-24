Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0FED6EC8D2
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 11:26:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqsQ6-0007eH-B4; Mon, 24 Apr 2023 05:23:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPl-0007Ng-Ip
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:25 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1pqsPS-0004oY-Ee
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 05:23:16 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-3f1950f5676so29975545e9.3
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 02:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682328177; x=1684920177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E75ZWyiqIVTxUEOaQt09ssb12BxYvniNvmSS7shhmvE=;
 b=MKJBRs77kBxBCvrH4zO9hHK6RV8e7Hvetk8obi8rkNcg/kd5paHhW4tXyvsoY1uq9I
 z+W2qFE6FYIPiJz6WvTSmEbwkiT0krFydvB78NLzVi1zFJDWt94RQeiwxoHRVKzTEnly
 bxbvYw7QosRy0JsHVmjyg/SSsgwyCulrsWWAMAtoMDQRPdIijq2UbjPE64YB7AL7Z+fl
 V56mo4NUbW6RaXYW0h/zrP5uIgeQewkouyXmEhiJR+RTBZBPM9rueKWGxyz790CUkYTb
 6umdJ1pJxlySZm1unCUMsIDDyC046VKBdPkNhkamm/Bs3ZyC4gXSHL/WkR5wQbaZ6Rwy
 dZKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682328177; x=1684920177;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E75ZWyiqIVTxUEOaQt09ssb12BxYvniNvmSS7shhmvE=;
 b=amCU5s2+8/HE5eFr8XkilJ9DRaCD6uZT1clUxIcmZnubVGg6zTYzvknsrhZoLJ6i+o
 umsxjotNSWPRJicfNDjj9k2Qqf4KTSPUsW7oHm0JoNDv/ESWQfhK8L2ztb0T/RiuIjdk
 Od5u25xiqtV14Oh2FgSszEJ3lpRjEYX0aIIXeECNbz2i8QhPqeNai4MbMUE8EMRA/cWd
 mj5/npHqX7ChqLkQ+Ssvmkfzm6oAFISprIkoFcbZdfYn4c6HVqirj9+A5eobs0cevtpO
 y2TGK97YOlv7RhZUr6KFzPgY7Q4lmcQEYZ3l4egmPd5c43tmEeiY3WOzdifA3dbTT2TK
 opYg==
X-Gm-Message-State: AAQBX9c/yE1/FPrPRhcx72JgP2WkBGyw0sL9DOcKUV9f5VrZMrNm/eJ4
 4tvlKopDJ7i/KeXjSB5lcrTZYg==
X-Google-Smtp-Source: AKy350a2O8vkW47u53CpXyr2SfQxK4sGOvj6p1bo0XEkxtqmCHmvzHHFE81Sz0XHqxe8BIvy2dIFNQ==
X-Received: by 2002:adf:db4e:0:b0:2f2:3dbf:6922 with SMTP id
 f14-20020adfdb4e000000b002f23dbf6922mr7989880wrj.22.1682328176753; 
 Mon, 24 Apr 2023 02:22:56 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 h3-20020a5d5043000000b002c70ce264bfsm10315847wrt.76.2023.04.24.02.22.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Apr 2023 02:22:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 1E71F1FFB7;
 Mon, 24 Apr 2023 10:22:51 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Peter Maydell <peter.maydell@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Leif Lindholm <quic_llindhol@quicinc.com>,
 Markus Armbruster <armbru@redhat.com>,
 Radoslaw Biernacki <rad@semihalf.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 John Snow <jsnow@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-s390x@nongnu.org,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Ilya Leoshkevich <iii@linux.ibm.com>, Yohei Kojima <y-koj@outlook.jp>
Subject: [PATCH 14/18] qemu-options.hx: Update descriptions of memory options
 for NUMA node
Date: Mon, 24 Apr 2023 10:22:45 +0100
Message-Id: <20230424092249.58552-15-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230424092249.58552-1-alex.bennee@linaro.org>
References: <20230424092249.58552-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Message-Id: <20230420155723.1711048-3-alex.bennee@linaro.org>
[AJB: fix documentation in commit message]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 qemu-options.hx | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

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


