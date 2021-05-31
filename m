Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42369395524
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 07:53:24 +0200 (CEST)
Received: from localhost ([::1]:44340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnarb-0007f2-Ay
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 01:53:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapT-0004rE-9q
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:11 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:42749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yamamoto@midokura.com>)
 id 1lnapR-0003mJ-N9
 for qemu-devel@nongnu.org; Mon, 31 May 2021 01:51:11 -0400
Received: by mail-pf1-x431.google.com with SMTP id x18so8191393pfi.9
 for <qemu-devel@nongnu.org>; Sun, 30 May 2021 22:51:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=midokura.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PESTXN59EwLMWjjV5A2aXDktqX9ai+DunPJniUgY9VA=;
 b=oS3XReGyor7uDwlHLyZQhjNp4g7PElnFgzLAzwv7FGoqVvNVBkkeZGCt3/2NIKMqxF
 JLOsHojQwwCDTsZbrGEuD+dFjoVW1RSyYh/aGBOK+WnNta2ItzXeHdNOd7O+dmuzHwbV
 Bp6DuMDt2W9fUHI2LzpJ2Dr7p2OHrFgarXBbM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PESTXN59EwLMWjjV5A2aXDktqX9ai+DunPJniUgY9VA=;
 b=sDWgSlaYYXSMt1+6SfOpjrFdt5dHpfqeNKz0phnGU9hi7JEFx4nosWOAehMd1rgg6t
 PTnk/MB0IRL2R5McdFaReUnP4tRlWPlutvshxzmC42voo+pCtQqRDHSM9CgG2bfkn3Ea
 hh7TyjWbEq80XpgsEIwByu28iullLWbafdWfo3t2sriU9Ptuh+qfSTS0QU7whjzXlalj
 XpKXC9ByzbK/46DxVO/EWNC+8L9wjXj6nFx5ASG0Tmn/sTbvLN7lEroxtTeQ2M9Ng6B5
 EvlhBkHgmyT00lphQBmvy5/fwL2uy59NTVZGkI78K5GO5gcMkcRNrnXAoUf2EDPoGjme
 JqrQ==
X-Gm-Message-State: AOAM531GuRB1Q2tzrds6gMn9cVvS//CgbLqVwKS90QRXwsqtNwnojXPx
 Im1auxA9Vrs0/wprx2UOw0JI5YPMv0nAbg==
X-Google-Smtp-Source: ABdhPJw/uKDTW7aaRX0KdQoFeq+j6NjL9wUpcyPnd+Byg6DufJogMJKw4fdNoq71nFtCGaaKcupNzA==
X-Received: by 2002:a05:6a00:1a8b:b029:28e:7b62:5118 with SMTP id
 e11-20020a056a001a8bb029028e7b625118mr15333588pfv.49.1622440268384; 
 Sun, 30 May 2021 22:51:08 -0700 (PDT)
Received: from spacetanuki.lan ([202.12.244.32])
 by smtp.gmail.com with ESMTPSA id b10sm4744058pfi.122.2021.05.30.22.51.06
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 30 May 2021 22:51:08 -0700 (PDT)
From: YAMAMOTO Takashi <yamamoto@midokura.com>
To: qemu-devel@nongnu.org
Cc: YAMAMOTO Takashi <yamamoto@midokura.com>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PATCH v2 02/11] linux-user: Fix the execfd case of /proc/self/exe
 open
Date: Mon, 31 May 2021 14:50:09 +0900
Message-Id: <20210531055019.10149-3-yamamoto@midokura.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
In-Reply-To: <20210531055019.10149-1-yamamoto@midokura.com>
References: <20210531055019.10149-1-yamamoto@midokura.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=yamamoto@midokura.com; helo=mail-pf1-x431.google.com
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


