Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 609424140ED
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 06:59:43 +0200 (CEST)
Received: from localhost ([::1]:48648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSuMA-0000zh-Ex
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 00:59:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJN-0006VM-AX
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:50 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:45010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSuJL-0007fV-G7
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 00:56:49 -0400
Received: by mail-il1-x12d.google.com with SMTP id x2so1342400ila.11
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 21:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4TdawYDZ/lZEP31De8eGpegR64sDlIeGOgg6kwvuUW4=;
 b=f8sP1VhJk4yTSYre/o0sw5Y7JYoGl8OrFPLpNXmZZ1tiLfzk5WFcafC93cf0M73fbP
 l/+XjVTIGbZEHOzEHBl+JMO1sshaIX4NR/b8yLdiLYWW9qFpwOoGdm45j8fojzCxGuts
 arCv7uxpXKPHzrFQfaXHI9jHmGqM6n/dBk0t8zPJoo3rrp86u3dcW6afaLA77DNoMfG1
 BasTZgfdy4vAeGUiaNJ+ACGqiTe9d0NIOT9n+A+737K/te9NvV+VcnRhcod3Od5/7hV0
 OLJlk5Ey+hmJm+grUtZaKBcBwQ7bqOHUmAZooAWtkZMf4/OGH83PM1W6JE1Vmau6542s
 /uiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4TdawYDZ/lZEP31De8eGpegR64sDlIeGOgg6kwvuUW4=;
 b=lOuWyUmexBlbT3Tptc7Z3IkyWz9YzjlH5pej0yYeJdostmDgdyBiVSTvYuRg74QuEs
 QBnZxBetLX9sTviNXNMn0OdKRkjBX3iy7T6R6e4DexEWEZMwTFp6aFTKziKpwubCcO/n
 eiohaFOqDD4EOYlS3WPmja8bcCI+/RHUQWYJNZ2rrWfT1keZcOG9XqwSmizRLEYv6tQ0
 zB72nFtE1qMmiv6Dn7Zb9dolTpJ2gMAz8NNTkFf4qxso2H5kqVAAHycTaLjoOjwzAhha
 XhCz3V6hQyt6Jaj+bcLjde5BqY7vnkDeLN8ohrQusXdCQKDOx5UDOOPM+t1uFiekviGw
 yFeg==
X-Gm-Message-State: AOAM532jCw9k+8Zwv8lDpEO9wXoGam8Yeac5tmW7d8xVZKJ0KQ7I0qPC
 kWzzBqhyt+xfQxk8ZWAm0dlLCB09h+Sc+JHTw18=
X-Google-Smtp-Source: ABdhPJy+oaYZKUbmur3MBU6ifGnbcjvbVzrObik57ykHEAuOWKgHUJCMntUbrZCbPuoufAr7Qs0DdQ==
X-Received: by 2002:a05:6e02:2141:: with SMTP id
 d1mr19602230ilv.242.1632286606036; 
 Tue, 21 Sep 2021 21:56:46 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j5sm512833ilk.58.2021.09.21.21.56.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 21:56:45 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 2/9] bsd-user/mmap.c: check pread's return value to fix
 warnings with _FORTIFY_SOURCE
Date: Tue, 21 Sep 2021 22:56:29 -0600
Message-Id: <20210922045636.25206-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922045636.25206-1-imp@bsdimp.com>
References: <20210922045636.25206-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12d;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12d.google.com
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
Cc: kevans@freebsd.org,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>,
 richard.henderson@linaro.org, f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mikaël Urankar <mikael.urankar@gmail.com>

Simmilar to the equivalent linux-user: commit fb7e378cf9c, which added
checking to pread's return value.

Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index fc3c1480f5..90b6313161 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -174,7 +174,8 @@ static int mmap_frag(abi_ulong real_start,
             mprotect(host_start, qemu_host_page_size, prot1 | PROT_WRITE);
 
         /* read the corresponding file data */
-        pread(fd, g2h_untagged(start), end - start, offset);
+        if (pread(fd, g2h_untagged(start), end - start, offset) == -1)
+            return -1;
 
         /* put final protection */
         if (prot_new != (prot1 | PROT_WRITE))
@@ -593,7 +594,8 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                                   -1, 0);
             if (retaddr == -1)
                 goto fail;
-            pread(fd, g2h_untagged(start), len, offset);
+            if (pread(fd, g2h_untagged(start), len, offset) == -1)
+                goto fail;
             if (!(prot & PROT_WRITE)) {
                 ret = target_mprotect(start, len, prot);
                 if (ret != 0) {
-- 
2.32.0


