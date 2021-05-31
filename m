Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8375039552C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 07:58:40 +0200 (CEST)
Received: from localhost ([::1]:60420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnawh-0001Wn-J9
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 01:58:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapa-0005E6-LT
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:18 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:44939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapY-0003sN-Tn
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:18 -0400
Received: by mail-pg1-x52d.google.com with SMTP id 29so7524022pgu.11
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 22:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3+BI+nbaPKoWHm/U4VU/VNR8sz2T1YSSyUR4DMbZdYQ=;
 b=m9OxVrwiDG928ILBrr0wmVGm3v4IMmdVFZob2B76I7dHw7YIV8pOhG7VU4IxLJ9Vcd
 w5KOYU9py0tSnWrlz8y0S8/Pe4B1Se+CsGPzJJSbv/Tq3aCTAK37mbgm9AdzMSvK51XC
 GajBC95x9ik2LlF1hnbKspBNUKOmoO1ZUNuK8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3+BI+nbaPKoWHm/U4VU/VNR8sz2T1YSSyUR4DMbZdYQ=;
 b=TZzGJIBAtl7gDlz+5DTCDYWwpt0rfhCd/6B/xk+7s8Q/easw8/0jqzGpDG6QLhe+Us
 kGb961OG4ZLONJfVUnlpwxxHT9SFyni6CbCzBHI7u/qiTKSIpciw41jsOeNy/9rge9CS
 CVHGcZUgiZLrJyhl1apQSglza+uSMlYtffw09VtjDI5kgz6jaEPOMhJo3axeRhZHVgRm
 7gYUK/L6Iczlyx6Q9M4aaMOiGNbC/WvYJIcP+TMmJz6mnxCCheFt9hvRjxK+Ou7GQrPM
 0PcP0xvXwy+5GumXSfGAo3M5lJN5wvZK6XcY+GvSCVyfH2DePT8vyIq4LOZBB4JbEaJ0
 ossA==
X-Gm-Message-State: AOAM533LDp7VuqhxvpKXii0z6jzK+6fGHQ2FOr7JvArAWk2vBXznFLJ1
 RVPNXQFNAqY1bBUr0dakyLpdbg4AFEDrhg==
X-Google-Smtp-Source: ABdhPJy9N13/m6zW7EvfU4PW5SmbcYRrPB/cJPRoNWqy5/9VRgYGqvwB8hWk76DWT90gZEOPG43Uzw==
X-Received: by 2002:aa7:9a4f:0:b029:2e6:cf9a:f469 with SMTP id
 x15-20020aa79a4f0000b02902e6cf9af469mr15776116pfj.43.1622440275505; 
 Sun, 30 May 2021 22:51:15 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id b10sm4744058pfi.122.2021.05.30.22.51.14
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 May 2021 22:51:15 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 07/11] linux-user: simplify is_proc_myself
Date: Mon, 31 May 2021 14:50:14 +0900
Message-Id: <20210531055019.10149-8-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210531055019.10149-1-yamamoto@midokura.com>
References: <20210531055019.10149-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=yamamoto@midokura.com; helo=mail-pg1-x52d.google.com
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

Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
---
 linux-user/syscall.c | 23 +++--------------------
 1 file changed, 3 insertions(+), 20 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 999760448d..86b12cc8b4 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -8027,26 +8027,9 @@ static int is_proc_file(const char *filename, int *pidp, const char *entry)
 
 static int is_proc_myself(const char *filename, const char *entry)
 {
-    if (!strncmp(filename, "/proc/", strlen("/proc/"))) {
-        filename += strlen("/proc/");
-        if (!strncmp(filename, "self/", strlen("self/"))) {
-            filename += strlen("self/");
-        } else if (*filename >= '1' && *filename <= '9') {
-            char myself[80];
-            snprintf(myself, sizeof(myself), "%d/", getpid());
-            if (!strncmp(filename, myself, strlen(myself))) {
-                filename += strlen(myself);
-            } else {
-                return 0;
-            }
-        } else {
-            return 0;
-        }
-        if (!strcmp(filename, entry)) {
-            return 1;
-        }
-    }
-    return 0;
+    int pid;
+
+    return is_proc_file(filename, &pid, entry) && pid == getpid();
 }
 
 #if defined(HOST_WORDS_BIGENDIAN) != defined(TARGET_WORDS_BIGENDIAN) || \
-- 
2.21.1 (Apple Git-122.3)


