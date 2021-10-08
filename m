Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFC49427414
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:18:50 +0200 (CEST)
Received: from localhost ([::1]:47422 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYz8b-00048b-Dc
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:18:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33870)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5L-0008Sn-8z
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:27 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:41912)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5J-0006hl-9z
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:26 -0400
Received: by mail-io1-xd2e.google.com with SMTP id q205so12406403iod.8
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZrY4IzgmSGF5kPEVygHrEE3pWr9J6Uh1T3Fv8vVqhP0=;
 b=3cZPnxKGWxmKm5CLZC8v+fi71QVQf97v8ylQ0bqGVxczUFKcOm2fXLryejrJ8dYTD6
 NFMwah1wKGq49QN7/BduW91MgoeXbpvRlcpOIV5wpg4ovOwXC/hyWvn7KD3SX2A+yATd
 K2csMFwrh6t2Yx3vrS+pOJugLz3oo+Q0JUvTM0fNqsZeje08xoR7xx+RHv8aL8keM5Xl
 dzNJPzxBIaYQcNQIsw8Z/Ec00HzVQEllJs9p6yjU/QDb9ECsDWxEbTRS8cUs6PqdbFH3
 MzpyM11VhULiyQ7RA3ZC7yOToy6fxurNV/lGY8eifuG5ShttUfLg+mSLmSL8H17Ck0fv
 OmnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZrY4IzgmSGF5kPEVygHrEE3pWr9J6Uh1T3Fv8vVqhP0=;
 b=hVvsttiPP8wRKrgw9spl3+Z5GokhRfhJ8NktnX3yeg+Fx+Gt3NorwEtlMvlOO8fQg+
 1jz87c5tjgmQm/gKoOxdnpFubUHilO1qsKHi6kQsoGssnRbQGY9DS9YMb3NbbGltNaD6
 nPg79XOeOg4SASo6bffzJSjRwc6Y+VVv7CQ8qS4GAKPPwngjld5eM+1tZB0eUq8Z63Xi
 EAfRfZSg7FrQePHnk+6VLvB4NJOIeo39JUPGR8fuRWWIuSNvyyMVZMXoNtEWw8sL+lBP
 qNTX7M+t4wEKEsZK55KBlPq48iZvrCWo2MD/0FB4xauAod6twcGjg29PdXbojcnEH0uF
 PZFg==
X-Gm-Message-State: AOAM5317q8anfi914Hq8wBySLiAK1DzH/6Fgbp1pp4nkWPfOyT7LqqE0
 ucyQ7u4uEuZA6699p9JKWx2aQ5eFeab1Uw==
X-Google-Smtp-Source: ABdhPJzwYZ2eDXIDUtnM/Wbzy+S4xjsEkQLAiDPirevkZFIwh1he7JyXwio5IAa8EgP3ceO+Fl07og==
X-Received: by 2002:a6b:3e04:: with SMTP id l4mr8300772ioa.19.1633734924050;
 Fri, 08 Oct 2021 16:15:24 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:23 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 05/15] bsd-user: export get_errno and is_error from
 syscall.c
Date: Fri,  8 Oct 2021 17:14:56 -0600
Message-Id: <20211008231506.17471-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008231506.17471-1-imp@bsdimp.com>
References: <20211008231506.17471-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>,
 f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make get_errno and is_error global so files other than syscall.c can use
them.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 bsd-user/qemu.h    |  4 ++++
 bsd-user/syscall.c | 10 +++++-----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 522d6c4031..3b8475394c 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -235,6 +235,10 @@ extern unsigned long target_dflssiz;
 extern unsigned long target_maxssiz;
 extern unsigned long target_sgrowsiz;
 
+/* syscall.c */
+abi_long get_errno(abi_long ret);
+bool is_error(abi_long ret);
+
 /* user access */
 
 #define VERIFY_READ  PAGE_READ
diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index 372836d44d..2fd2ba8330 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -33,18 +33,18 @@
 static abi_ulong target_brk;
 static abi_ulong target_original_brk;
 
-static inline abi_long get_errno(abi_long ret)
+abi_long get_errno(abi_long ret)
 {
-    if (ret == -1)
+    if (ret == -1) {
         /* XXX need to translate host -> target errnos here */
         return -(errno);
-    else
-        return ret;
+    }
+    return ret;
 }
 
 #define target_to_host_bitmask(x, tbl) (x)
 
-static inline int is_error(abi_long ret)
+bool is_error(abi_long ret)
 {
     return (abi_ulong)ret >= (abi_ulong)(-4096);
 }
-- 
2.32.0


