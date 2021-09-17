Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37AF040F01C
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 05:03:54 +0200 (CEST)
Received: from localhost ([::1]:60670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR4AL-0001lY-AK
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 23:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43W-0006fK-IY
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:50 -0400
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e]:44939)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mR43V-0005v7-1S
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 22:56:50 -0400
Received: by mail-il1-x12e.google.com with SMTP id x2so8734683ila.11
 for <qemu-devel@nongnu.org>; Thu, 16 Sep 2021 19:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZO8JmiDexvxr2bkytagXw9QqKDBdH9/0PrYHGp52LZE=;
 b=RCCfAVHLJsJpXqgNwHIREwEQYb+npyd1Vn7JlBXpLe0o2VyffXVQ2CfH/jveEQfyzL
 foi0ApUr3ZDHwXlnJ6HemOueY/kIkzeido8KQluXdnFUEWmnAGEqiwM4Pgu8/if1scDw
 In0L7klP7Lqe9oAORfilQPd+iFvXxWavj6HUztmQh1ABJWKwBiAdwRolYjkjqeqDFYFI
 0VII9l7EaJj4R2ucID4CzlNvwkYAoooGk4xdxcFLsJXEJAx7Fg7aILirdlkoQyOldJMq
 uENaYPqNKzKh9+yp2Gidz6SGFYa5LDNpnRZPOyLjTnHVhmz+sKWlcF9CK8kKZj4VnWsD
 95Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZO8JmiDexvxr2bkytagXw9QqKDBdH9/0PrYHGp52LZE=;
 b=bu4apsnS48qw1yndWStSR7jEx70s0qGq2dHX/EuefgFbL7wEE9Qr6ttY4B3AVwWKq+
 wnPY2HTY3CIQMm3MIpMk9QTMZ6GgYFRDt1Iu/O1wC2IZkAdFugDhcOt09JxkF0sjEPVp
 1vMUrc5yvjpiOrC8+O1wAkIExK5EsZrIULiblQoEjehuTXqbuwV962zUfqWbaW5hI7tW
 EWJCWVRYHvczIobaPaq+23VYwMy634gZIZexDljkybWWCBmL4oU6v4ZsbKd/hi/5v8L5
 pJY7jyuscnNjw6AxHz9eekeoiWov+Rye5uGqmtO9EqhAtK8yW/XCFBOGn4BoQi68Op5t
 scfA==
X-Gm-Message-State: AOAM5313j8kbj7ts8lHMyT8woT4RKwphgK1FZVMqxdG59vCf1vT9IgGH
 x8s3WgYs+pThQ/ordq4o+XItJ/Dk3iRYq92uyhY=
X-Google-Smtp-Source: ABdhPJyDiJx1JyIarVAH75qhEMyznNCpMD+jWkPsIPEwiSb9riNW+XACN72yDLTXA9NrikBbXx5Jow==
X-Received: by 2002:a92:da85:: with SMTP id u5mr6471621iln.213.1631847406784; 
 Thu, 16 Sep 2021 19:56:46 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id e10sm2603738ili.53.2021.09.16.19.56.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 19:56:46 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 8/9] bsd-user: Implement MAP_EXCL, required by jemalloc in head
Date: Thu, 16 Sep 2021 20:56:34 -0600
Message-Id: <20210917025635.32011-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210917025635.32011-1-imp@bsdimp.com>
References: <20210917025635.32011-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
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
Cc: Kyle Evans <kevans@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Kyle Evans <kevans@FreeBSD.org>

jemalloc requires a working MAP_EXCL. Emulate it by ensuring we don't
double map anything.

Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index 347d314aa9..792ff00548 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -387,7 +387,7 @@ abi_ulong mmap_find_vma(abi_ulong start, abi_ulong size)
 abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
                      int flags, int fd, off_t offset)
 {
-    abi_ulong ret, end, real_start, real_end, retaddr, host_offset, host_len;
+    abi_ulong addr, ret, end, real_start, real_end, retaddr, host_offset, host_len;
 
     mmap_lock();
 #ifdef DEBUG_MMAP
@@ -599,6 +599,14 @@ abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
             goto the_end;
         }
 
+        /* Reject the mapping if any page within the range is mapped */
+        if (flags & MAP_EXCL) {
+            for (addr = start; addr < end; addr++) {
+                if (page_get_flags(addr) != 0)
+                    goto fail;
+            }
+        }
+
         /* handle the start of the mapping */
         if (start > real_start) {
             if (real_end == real_start + qemu_host_page_size) {
-- 
2.32.0


