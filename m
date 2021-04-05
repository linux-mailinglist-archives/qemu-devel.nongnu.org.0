Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C661935424D
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Apr 2021 15:16:46 +0200 (CEST)
Received: from localhost ([::1]:59812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTP5x-00087d-7X
	for lists+qemu-devel@lfdr.de; Mon, 05 Apr 2021 09:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <basil@daynix.com>) id 1lTP3q-0006n9-Vh
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 09:14:34 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41833)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <basil@daynix.com>) id 1lTP3p-0005xd-Gb
 for qemu-devel@nongnu.org; Mon, 05 Apr 2021 09:14:34 -0400
Received: by mail-wr1-x42b.google.com with SMTP id a6so4886146wrw.8
 for <qemu-devel@nongnu.org>; Mon, 05 Apr 2021 06:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=fqiLovYvQuOlZXvGJXZzmuyGnZzzgfjs0PbRWtRKh/k=;
 b=POL4DjmXJ4nEV6PMgwiUxR3n2YiryPPzc5S83LnXmp6anQ4E8muozz20m8XgTWoftj
 cE77HW2o9jDbOYAr6cTR5X4uP8qBcqDdWT6Qg9XX8aT5aDi/AlVEjpoYDPCutkues+vp
 I1GF81nLgNPSbgdZ8HO73EjdPbov/QjF0Ly8u1nZo0iX1sJkOWESUKiANVBtd8MPSsya
 epzC9qaynlYmTpHzkZjE6PvO08NYazwxPJhrFCeMK+wJXOF6p0QzkmTPh6WwATeFzXZz
 J5qUE2TOO9lHwWePAvrezqJ6aFWX5rSrUrz74PfGHwmvMbxLtmW6uNqPx8dOrpd/AaCi
 PkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=fqiLovYvQuOlZXvGJXZzmuyGnZzzgfjs0PbRWtRKh/k=;
 b=puGCNctDpL/Um4rrufeyhk6uYui3C5gziLKetAmZpxlNzJ08guRMOEBoxD5KEqisOR
 yDt+HpJUZdFrHMuGiXf79F5+tPOeR+zwrww6C/a4woFJQ687DPhLS8TYelwz/Bh0hp4A
 IOoSHhqtcLGIu1wSxycTSp7QHydBbR/Zk1oEYVuH914Igv649yfQVT5Z1meIHF+ybA/1
 UW3m/emM4rXhlkWdCPQch8pltsrvBCzKicJXcBYpgYZ0m06UUdX6P8ycbQTexNqYFj3n
 jDMIQwsoRINqyhAgMArgn3+EyYvmd8SNrbOCYb8YZDU19qrsDKP9x0p+R6vo8cNXcIcB
 u7Og==
X-Gm-Message-State: AOAM530BcpeUSkRSgGkFaxX4GNJDi65ox0OmjsYjGLalFZdQFQVurXwO
 mSHi7j/dhdCoJDz6C5vH6+JAPTPABXFTDA==
X-Google-Smtp-Source: ABdhPJyiK+t94mJrHo83ZcAaX4kP3srNoclJNU6go6uyayIdEhbAL0kG/J2Jm+lgYNRZxkoimyy+Tw==
X-Received: by 2002:a5d:6048:: with SMTP id j8mr30169640wrt.115.1617628471556; 
 Mon, 05 Apr 2021 06:14:31 -0700 (PDT)
Received: from localhost.localdomain (bzq-84-110-34-91.static-ip.bezeqint.net.
 [84.110.34.91])
 by smtp.gmail.com with ESMTPSA id e9sm12661542wrv.92.2021.04.05.06.14.30
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 05 Apr 2021 06:14:31 -0700 (PDT)
From: Basil Salman <basil@daynix.com>
To: qemu-devel@nongnu.org,
	Michael Roth <michael.roth@amd.com>
Subject: [PATCH 2/3] qga-win: Fix build_guest_fsinfo() close of nonexistent
 handle
Date: Mon,  5 Apr 2021 16:14:19 +0300
Message-Id: <20210405131420.598273-2-basil@daynix.com>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20210405131420.598273-1-basil@daynix.com>
References: <20210405131420.598273-1-basil@daynix.com>
Received-SPF: none client-ip=2a00:1450:4864:20::42b;
 envelope-from=basil@daynix.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>, Kostiantyn Kostiuk <konstantin@daynix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On the current error path of build_guest_fsinfo(), a non existent
handle is passed to CloseHandle().
This patch add initialization of hLocalDiskHandle to INVALID_HANDLE_VALUE,
and checks for handle validity before the handle is closed.

Signed-off-by: Basil Salman <basil@daynix.com>
Signed-off-by: Basil Salman <basil@redhat.com>
---
 qga/commands-win32.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/qga/commands-win32.c b/qga/commands-win32.c
index 27baf17d6c..d51833ef15 100644
--- a/qga/commands-win32.c
+++ b/qga/commands-win32.c
@@ -1091,7 +1091,7 @@ static GuestFilesystemInfo *build_guest_fsinfo(char *guid, Error **errp)
     size_t len;
     uint64_t i64FreeBytesToCaller, i64TotalBytes, i64FreeBytes;
     GuestFilesystemInfo *fs = NULL;
-    HANDLE hLocalDiskHandle = NULL;
+    HANDLE hLocalDiskHandle = INVALID_HANDLE_VALUE;
 
     GetVolumePathNamesForVolumeName(guid, (LPCH)&mnt, 0, &info_size);
     if (GetLastError() != ERROR_MORE_DATA) {
@@ -1149,7 +1149,8 @@ static GuestFilesystemInfo *build_guest_fsinfo(char *guid, Error **errp)
     fs->type = g_strdup(fs_name);
     fs->disk = build_guest_disk_info(guid, errp);
 free:
-    CloseHandle(hLocalDiskHandle);
+    if (hLocalDiskHandle != INVALID_HANDLE_VALUE) {
+        CloseHandle(hLocalDiskHandle);
+    }
     g_free(mnt_point);
     return fs;
 }
-- 
2.17.2


