Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6174B5F6A7F
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:25:08 +0200 (CEST)
Received: from localhost ([::1]:41020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSkF-00015Z-7Y
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:25:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXS-0002t4-H0
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:11:54 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:43549)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXQ-0004ZE-UU
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:11:54 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 g1-20020a17090a708100b00203c1c66ae3so2045544pjk.2
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ptPSCcbuG++AcglR+Ify0H9lkcBvjcAqRFsbcccQhHg=;
 b=mzKd3Md0Xjn7z54cmD+ZGV6/gK7BzhJKiTmjtMq6Ied4FZKH+Ze0krCBmKVM37YrNH
 cETVp1L4uuqhanjfKBFMAqTgDkq18JIM7wCJPMbDqJcRmYQ/w9xvFx0VXXYAR+i9Iamc
 qHVgyd905KmtC2ep4aTFeHWAG2TLq2f1aptuC9UyTqpmt+gqa0Qecah2kDzuv3/4a2DX
 n76QQOnzu6Lv6yWQTu/iXQneRpQaXF5WQa3tjbZqs3zkUezQ4BpQHbVJYNCfUmOD8c3K
 CugWVn5IlUvKaswVBGMt3vvTsUHeiwwb05m4hWwPFMPk60LbagOtqWliXeFKKaICkgZM
 0Ldg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ptPSCcbuG++AcglR+Ify0H9lkcBvjcAqRFsbcccQhHg=;
 b=twgKYTMh3TIV/lKF3cbfRz97sxOwMBih7aA1wLCLQQMW+4vDROp+rYxD4mxrTpSEYj
 A3dclVjf1JSDtbit4EY5WLPnA0KuAibHzZEa4DUo0zbAFyJEKgaBAg2yjRYTERHFgoHy
 nJJ4RIueBpYJBnkC7aFeB4myQqHBZeGKc04RrUFoZ13U4TjQXWzlM2HU0Uc3sSIFvBdO
 kWoRkl6W4wEW6oGkj7Pw5GgNeCMK8j5eYARHOSZXEvVAYvvCaekGFhVekB1/2AOHykGC
 tCCTup3LwYIr5+27Nao2kLNENzq/K4xk+DY7nohXt1eXdfCdMiatO0txr/2K1SCc28gy
 Xr0A==
X-Gm-Message-State: ACrzQf3scsOGNnwIMY+b3IIfO6HDqylXgDfdOLvdCNdrFxqogwV+LClM
 hSvY0NaN71qrvW6yiD7ki+jSahy+xNY=
X-Google-Smtp-Source: AMsMyM4nSzOGDQOYXl0oOEJzitAl9bRUu1CW+8LEx8qQYdrVHNpPCduYGknXMJQN6tC4kkurUWCbiw==
X-Received: by 2002:a17:90a:a512:b0:209:9b31:5f2f with SMTP id
 a18-20020a17090aa51200b002099b315f2fmr222594pjq.146.1665069111444; 
 Thu, 06 Oct 2022 08:11:51 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.11.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:11:50 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH 03/18] util/qemu-sockets: Use g_get_tmp_dir() to get the
 directory for temporary files
Date: Thu,  6 Oct 2022 23:11:20 +0800
Message-Id: <20221006151135.2078908-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1031.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Replace the existing logic to get the directory for temporary files
with g_get_tmp_dir(), which works for win32 too.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 util/qemu-sockets.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index 83f4bd6fd2..0c41ca9e42 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -919,9 +919,8 @@ static int unix_listen_saddr(UnixSocketAddress *saddr,
     if (saddr->path[0] || abstract) {
         path = saddr->path;
     } else {
-        const char *tmpdir = getenv("TMPDIR");
-        tmpdir = tmpdir ? tmpdir : "/tmp";
-        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX", tmpdir);
+        path = pathbuf = g_strdup_printf("%s/qemu-socket-XXXXXX",
+                                         g_get_tmp_dir());
     }
 
     pathlen = strlen(path);
-- 
2.34.1


