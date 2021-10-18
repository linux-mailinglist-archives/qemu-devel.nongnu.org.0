Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08439432395
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:15:11 +0200 (CEST)
Received: from localhost ([::1]:58592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVI6-0000vE-4G
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:15:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57918)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8e-0007eA-Dg
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:25 -0400
Received: from mail-il1-x129.google.com ([2607:f8b0:4864:20::129]:44723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8b-0007r0-6t
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:24 -0400
Received: by mail-il1-x129.google.com with SMTP id j8so15400641ila.11
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/esxzvTZAXy1d5qeSy++Yncrcqbi68O1hcQTBHEcYg0=;
 b=topXQk2fuK3yIIdzuuReNfSpJOlV3rEKJu5AdfTfjBwkyO/Cnc2+L0/L5ZZezzw/j2
 iSZFTih/HZXVaY1AvSdHAxHHbKQZp1h7CoF0pJ4ya8YLiYjKynlNWcJtc102jBmnZ3ok
 edbkwA/bDINCSrXP6Od6DxCz0t+JrZPXTrypdZ6HoSyZvOkXnPCCp1PwGfj/hj0+RrK6
 cO+euWwTsFHg5sBtYwcQQVme8cWU3OrddmT+Ol+fFLA4vKUnyYNm7aDRYNshTvlhO3nj
 UbaE4pGx+xQgTbbV1W5NkbxmuOIhX7tn3Pj0RxiVX2aOOEi7Xq91hvZ+Rt4cRAF6P6hk
 Gj5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/esxzvTZAXy1d5qeSy++Yncrcqbi68O1hcQTBHEcYg0=;
 b=4rCvDApzle1Ii3hKHHbcu5/hTMaYUsst0BHw3NyC8XvRmEoj7pfXyc+t75tQYoc54b
 w/x24ouZLgdIsl7oUrNjnqWPTNAhHZpCvMvYQtE1Wl2mgbsIRziDZpZt+KTktrE2/IlE
 YVM1Op+1tE3gIelTKUaXKSxn4rEWP0wuLqHxkM0rLxJKI2PYWFv4x0O6lQWR3rt/utgq
 lHmehBnDxkMIng3spKNHDN+gxn2k77BmaSQK/CiHTfIWG8/eOU8SY4QHbPn+LP5WOyaN
 Y9gsbmhoskpxbti5XNmIE1v6HuMOebZhR0OLLkz6c40R4VFEf1sjMyiNEF36whrxxLK4
 IQ2Q==
X-Gm-Message-State: AOAM531Qlu3GsNCNkMkyYTnR97AFl7NNyINWDcH67u85LCjEA5vTdf1Z
 sMRO0/iSXFak5CTsBaa4h5mRlcZY7Pc6UQ==
X-Google-Smtp-Source: ABdhPJy7uPW9JFP15a9PKfSJLqgh0/N1Q8DzSagVh9hFuPVeYTJXXUgNfJ5+I3oS+x0ocbGKQBfXrg==
X-Received: by 2002:a05:6e02:1a86:: with SMTP id
 k6mr14874081ilv.192.1634573116963; 
 Mon, 18 Oct 2021 09:05:16 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:16 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/23] bsd-user/mmap.c: check pread's return value to fix
 warnings with _FORTIFY_SOURCE
Date: Mon, 18 Oct 2021 10:04:37 -0600
Message-Id: <20211018160458.1976-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::129;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x129.google.com
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Warner Losh <imp@bsdimp.com>,
 =?UTF-8?q?Mika=C3=ABl=20Urankar?= <mikael.urankar@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mikaël Urankar <mikael.urankar@gmail.com>

Simmilar to the equivalent linux-user: commit fb7e378cf9c, which added
checking to pread's return value. Update to current qemu standards with
{} around the if statement.

Signed-off-by: Mikaël Urankar <mikael.urankar@gmail.com>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
---
 bsd-user/mmap.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index fc3c1480f5..4f4fa3ab46 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -174,7 +174,9 @@ static int mmap_frag(abi_ulong real_start,
             mprotect(host_start, qemu_host_page_size, prot1 | PROT_WRITE);
 
         /* read the corresponding file data */
-        pread(fd, g2h_untagged(start), end - start, offset);
+        if (pread(fd, g2h_untagged(start), end - start, offset) == -1) {
+            return -1;
+        }
 
         /* put final protection */
         if (prot_new != (prot1 | PROT_WRITE))
@@ -593,7 +595,9 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                                   -1, 0);
             if (retaddr == -1)
                 goto fail;
-            pread(fd, g2h_untagged(start), len, offset);
+            if (pread(fd, g2h_untagged(start), len, offset) == -1) {
+                goto fail;
+            }
             if (!(prot & PROT_WRITE)) {
                 ret = target_mprotect(start, len, prot);
                 if (ret != 0) {
-- 
2.32.0


