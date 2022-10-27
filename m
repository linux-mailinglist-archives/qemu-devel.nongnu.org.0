Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B48610150
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 21:15:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oo7nY-0002ca-9f; Thu, 27 Oct 2022 14:40:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kQ-0001SH-P1
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:58 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oo7kG-0003Lq-VT
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 14:36:58 -0400
Received: by mail-wr1-x42c.google.com with SMTP id l14so3700526wrw.2
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 11:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QqBhpviWM7Tr3buMaeROL2/NOOiB4kCmWYZZ1xMVnXQ=;
 b=hZqAXAspu5AASpvWJ4Rqhm/whojargirDT3WGIuMGL5+HRzj42T24oULSvG9AUqlBR
 yZ1QsgEH8v/ay8NtAXbKOOcD1nzKxQsrDRGDFDSynaKKEDK84RszOHc+hbhe2SOor3D+
 JBguiqN1brTB46xEx8YPWKSSxhHqKTaEsCJC/T2OvDYZWXGo66d6SIPMMSWwwC3vJfzb
 WTiYGzgOrNV+fkbQi69+0ehmZafRC/M8Fm4bJrGES+1Fz6C9oZTMV0Rxmm33LVn4KFE5
 3bxY54VSdSg2Byc0U0Dt7+dCeO+XJJaA44A2G8a6s+EVvdFjDN4A9ZV2YMrXIf33JTl1
 XDKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QqBhpviWM7Tr3buMaeROL2/NOOiB4kCmWYZZ1xMVnXQ=;
 b=EXmtSKlJ4n9jdY/s1G24JtM6IWz6TrpZ5t6+z0w3VlwNivhE0ot8J94UAwe2usMOwg
 N3eQJ0NSWroZTtU1y2JFBzuoA5ZJA33h+vGyWk7si1VwjpJqy2+G7GmP4G6gGgl3S/rR
 BgmEUculfcr4yq5OtaLNrmB7TgZAr5KxQc4pocMV3zrj4thunbpf4ShXoUQocNTxT0YG
 ajs1NoQ2RjndvG7HtLmjsyjq1jeewuV7p4IyhZr1VGGLz5Ghfm6b4agRoKOVB/XkQkY+
 48UZ7SUa0ktM4MNCtWOLhqFc0vdcmfLCx0OIhGnGdQVgKIyH0d+5uoWA49T6rksO3yEb
 7+KA==
X-Gm-Message-State: ACrzQf0fK7ahKvtkeYnZrzRk51IFRaY4jbHzCsQvaJt9uU0ULjJD6koK
 XgO9n+QfEc7hBf6tTm+xW9EsaQ==
X-Google-Smtp-Source: AMsMyM578GG8+IL8LrOy/EvR3Wh+oNsHo+NlXON14TvmHHrWRXnx6HplUCa6Mn0qs8JVh8AXPOlmWQ==
X-Received: by 2002:adf:9c87:0:b0:232:a0fb:ea5f with SMTP id
 d7-20020adf9c87000000b00232a0fbea5fmr33496741wre.473.1666895807004; 
 Thu, 27 Oct 2022 11:36:47 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a5d453a000000b0022cd96b3ba6sm1966196wra.90.2022.10.27.11.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 11:36:41 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 7A0F51FFC3;
 Thu, 27 Oct 2022 19:36:38 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 12/30] util/qemu-sockets: Use g_get_tmp_dir() to get the
 directory for temporary files
Date: Thu, 27 Oct 2022 19:36:18 +0100
Message-Id: <20221027183637.2772968-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027183637.2772968-1-alex.bennee@linaro.org>
References: <20221027183637.2772968-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Bin Meng <bin.meng@windriver.com>

Replace the existing logic to get the directory for temporary files
with g_get_tmp_dir(), which works for win32 too.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20221006151927.2079583-4-bmeng.cn@gmail.com>
---
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


