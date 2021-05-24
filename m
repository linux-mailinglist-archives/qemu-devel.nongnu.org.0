Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9482838E088
	for <lists+qemu-devel@lfdr.de>; Mon, 24 May 2021 06:58:01 +0200 (CEST)
Received: from localhost ([::1]:57814 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ll2fA-0000Bl-N6
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 00:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1ll2cV-0002mG-3g
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:55:15 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42988)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1ll2cT-0003cH-EA
 for qemu-devel@nongnu.org; Mon, 24 May 2021 00:55:14 -0400
Received: by mail-pg1-x52a.google.com with SMTP id f22so18267974pgb.9
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 21:55:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PESTXN59EwLMWjjV5A2aXDktqX9ai+DunPJniUgY9VA=;
 b=YAdC5XJSbjP3uhZ+k+kdd3Y6JLo0X/lX5Y8iF88i2V34zpPn48vyah2BSR1qSyNnNE
 lvncEFX4piLaHu5LAOlMeEueDn6BTLN+WJbnlSrf5IIxxv58fcmiigmwHBVYVqAKDkyH
 MRJRh7ty6h0HznsY/Bi0ZEKQsdaFigjRCYBEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PESTXN59EwLMWjjV5A2aXDktqX9ai+DunPJniUgY9VA=;
 b=Sns5qTqoZRv5Im+XeFxwjCzcb3IZg5/u/MC7tXZ7DZllbkXy5I7ntWDU0IsJbmu8IN
 hJp5WeunSiUuImXsaUGIb1hoJL++p6rI9XANrdufdJsFRKzsQRLiO418NyLTgu6WcL4Y
 ol+xgCDVa/ES2Ka1iD/lcAompgeh+qRtKwurZElT+l+Gvkbw9mWa3xU+FA9ixDSIKLDa
 +P63zWDVwisImy476aLJw9jqJXLJn1IG3MHL/C7wSXzf/Zze0CX0p8xF18BcJb/ziGD5
 AMJJSjpjNJr1XJtbiQ4/x1EHzIjHpeAvX7pHBfJSztk2Vb0h9JwvnkBnEGOhD+kiRKWS
 CUSQ==
X-Gm-Message-State: AOAM531vef4FG8DUSMFcUChPgzanUR5L8dY/k1oLtFex8lRedi49WK02
 jyWdyH0XThYPf8UHAvkLr2Z7137yW0u4EA==
X-Google-Smtp-Source: ABdhPJx4nk9h4hHKYmp/zHWK9adDZvY5ZFpDEx7MxxjjHaC5jvJ/MH/Neaz1J413PdpO+s+Vic0LYQ==
X-Received: by 2002:a05:6a00:23c6:b029:28f:d463:17ba with SMTP id
 g6-20020a056a0023c6b029028fd46317bamr22992343pfc.65.1621832112054; 
 Sun, 23 May 2021 21:55:12 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id 24sm10040142pgz.77.2021.05.23.21.55.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 23 May 2021 21:55:11 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH 3/5] linux-user: Fix the execfd case of /proc/self/exe open
Date: Mon, 24 May 2021 13:54:09 +0900
Message-Id: <20210524045412.15152-4-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210524045412.15152-1-yamamoto@midokura.com>
References: <20210524045412.15152-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=yamamoto@midokura.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

It's problematic to return AT_EXECFD as it is because the user app
would close it.
This patch opens it via /proc/self/fd instead.

Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
---
 linux-user/syscall.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index a2b03ecb8b..14a63518e2 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8118,7 +8118,17 @@ static int do_openat(void *cpu_env, int dirfd, const char *pathname, int flags,
 
     if (is_proc_myself(pathname, "exe")) {
         int execfd = qemu_getauxval(AT_EXECFD);
-        return execfd ? execfd : safe_openat(dirfd, exec_path, flags, mode);
+        if (execfd) {
+            char filename[PATH_MAX];
+            int ret;
+
+            snprintf(filename, sizeof(filename), "/proc/self/fd/%d", execfd);
+            ret = safe_openat(dirfd, filename, flags, mode);
+            if (ret != -1) {
+                return ret;
+            }
+        }
+        return safe_openat(dirfd, exec_path, flags, mode);
     }
 
     for (fake_open = fakes; fake_open->filename; fake_open++) {
-- 
2.21.1 (Apple Git-122.3)


