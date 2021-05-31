Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7FC39552D
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 07:58:45 +0200 (CEST)
Received: from localhost ([::1]:60976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnawn-0001uF-2p
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 01:58:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapd-0005Pu-Iu
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:21 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:38451)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapb-0003uU-LZ
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:21 -0400
Received: by mail-pf1-x42a.google.com with SMTP id z26so4200807pfj.5
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 22:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WqynZrm202cJ+1KbwogFv1gd7AynKLBgDPVt0umzdNg=;
 b=snEmV1QNyoBNT7PpX8XL0MQ03TpBMqXcOZ9XvW+goZR7tiMdoY8mgjrq2/Ub+fEKNY
 KMc1f28+AHGliTS32hp20LarQ5A8XIkwK4oAH4WaKul2p8KTK5dbupeZQnWv928VbP5R
 AdeUobxs42kuTk+BMUFNCdRSPvTNW31+rbbEk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WqynZrm202cJ+1KbwogFv1gd7AynKLBgDPVt0umzdNg=;
 b=UQVJykyc1m6llJnsrkuAldorIbZYq5rMdz0TtO8iS0gSgV+6L5V2H242Nwvt3ClAbr
 t6OT/cELt/5I/vaAxi8Nw//6rDrNmhTQMUHxEIIqSo0p6lUDrfs1eEEbmgsjl6l7tKrL
 HK1P3HIKYe8cto4DbIDP5puumk9my9ZMW5bAk386XB5C6JSErZyoC4aalgXVb7Hnubys
 VpljHBSZ1LSmkT2c64OT9/HPHWX/oN5QBB4SkgbJayWLHrKtlKoDuOB78kmbAmNL5lco
 Lf8J24mLQ/U3KQP5prgFL0Oe4XRp1pb+2WKTx4SbgH33nSH3hLt53R2Q5/+UEOqo/Gdb
 KxNw==
X-Gm-Message-State: AOAM533dTQ5hmEjExli72vU/0G3MbcjJYulyTYSAsLTsnRgECYpo2u4U
 V0wOH1RaiQGj9O8g1+S73/0FyyI2vwpHQg==
X-Google-Smtp-Source: ABdhPJyzp2QGV2PnoohXGMnbunHtvrTvB2ikPDvuXjsjiDa3p2h7jPps2yPh9OFpqt1o/hFxJe7q9A==
X-Received: by 2002:a62:3106:0:b029:25c:cd66:3be1 with SMTP id
 x6-20020a6231060000b029025ccd663be1mr15373233pfx.29.1622440278341; 
 Sun, 30 May 2021 22:51:18 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id b10sm4744058pfi.122.2021.05.30.22.51.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 May 2021 22:51:18 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 09/11] linux-user: Make the qemu detection for
 /proc/$pid/exe a bit conservative
Date: Mon, 31 May 2021 14:50:16 +0900
Message-Id: <20210531055019.10149-10-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210531055019.10149-1-yamamoto@midokura.com>
References: <20210531055019.10149-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=yamamoto@midokura.com; helo=mail-pf1-x42a.google.com
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

Perform the qemu special case only when the binary seems the same as
our own executable.
This is enough for my use case (docker and runc) where the involved
qemu binaries are always for the same arch.

Signed-off-by: YAMAMOTO Takashi <yamamoto@midokura.com>
---
 linux-user/syscall.c | 38 ++++++++++++++++++++++++++++++++++----
 1 file changed, 34 insertions(+), 4 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 6f9161dbe4..56a3c37d83 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -7986,6 +7986,26 @@ static int open_self_auxv(void *cpu_env, int fd)
     return 0;
 }
 
+static int is_same_qemu(const char *their_exe)
+{
+    struct stat our_st;
+    struct stat their_st;
+
+    if (stat("/proc/self/exe", &our_st) != 0) {
+        return 0;
+    }
+    if (stat(their_exe, &their_st) != 0) {
+        return 0;
+    }
+    if (our_st.st_dev != their_st.st_dev) {
+        return 0;
+    }
+    if (our_st.st_ino != their_st.st_ino) {
+        return 0;
+    }
+    return 1;
+}
+
 static const char *get_exe_path(int pid, char *buf, size_t bufsize)
 {
     ssize_t ssz;
@@ -7996,6 +8016,20 @@ static const char *get_exe_path(int pid, char *buf, size_t bufsize)
     }
 
     /* dockerd makes runc invoke dockerd using "/proc/${dockerd_pid}/exe". */
+
+    /*
+     * Check that it's the same qemu binary as ours
+     * to avoid false positives.
+     *
+     * While ideally we want to allow different qemu binaries,
+     * (E.g. linux-user for a different arch)
+     * I can't think of any reliable way to detect the cases.
+     */
+    snprintf(buf, bufsize, "/proc/%d/exe", pid);
+    if (!is_same_qemu(buf)) {
+        return NULL;
+    }
+
     snprintf(buf, bufsize, "/proc/%d/cmdline", pid);
     fd = open(buf, O_RDONLY);
     if (fd == -1) {
@@ -8033,10 +8067,6 @@ static const char *get_exe_path(int pid, char *buf, size_t bufsize)
             }
         }
 
-        /*
-         * XXX a bit too loose detection of qemu.
-         * maybe we can compare /proc/$pid/exe with ours.
-         */
         slash = strrchr(argv0, '/');
         if (slash != NULL) {
             argv0 = slash + 1; /* basename */
-- 
2.21.1 (Apple Git-122.3)


