Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EBAC74141F7
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:34:21 +0200 (CEST)
Received: from localhost ([::1]:43632 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSvpl-0001a0-00
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:34:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWv-0001N0-DL
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:53 -0400
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34]:39547)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWt-0007Yu-U3
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:53 -0400
Received: by mail-io1-xd34.google.com with SMTP id m11so1954241ioo.6
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:14:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LRVf8eRwHcSE1hfiNUjlVhgdMLRdbXotbexroQwEg1Q=;
 b=XsdcHrF0wVtolPWTjXXv55eINZFlI+u18Gt3EW8TNxVek+41mSECZxZbuyxOjlz79d
 EWF6oQkLTED/j4YrdpVQwLnM6ve43p3SwmOvIatuJFkyu+gdNDF/e5KwccJ2KsCT2g1N
 wsh8w8Q23/01gGcY1okqzGxK1wZ7VuBr9OklrAsMEcwS/cVSJ5FzGj+42gdRBaXQHMUp
 n1mZIDxgdVwldbAh4QOU/+F5JMAOl92qGWJZmQX5iRzvc8zWgbsyk3X4WDPKlGyS6rJL
 H6mQmlc6pBYXM3ovkcY8x7mFC++cVLkYfuikvR25Lu1RFEQ8zCf4zZWWzuY9Xyv85ebz
 75lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LRVf8eRwHcSE1hfiNUjlVhgdMLRdbXotbexroQwEg1Q=;
 b=p4Wp7vbf3RIo/ySn5yhN6B9VLvZsjugDgsresF6IYSE1MIsehThLorDHTdULJYGr5E
 DKY6RESGq7QH+RSZX/V2kQsHcvk6E+OPjAxlv6DpQTBqJ0sozLpaGygJ+nwh/Fm/U0Sh
 fuZbx15G8/HpNjTr3hhgkH3rvQgeFc1rcj84+O5NRuF106M2AYZzZcvkOPn797QZiLQi
 Zna8QjDfx+7gKZNFVLmUL6SIRjANondpWRZY4kVKdME0bqPJj05eWGQW276U0ZQZ7z8Z
 VJwoBtVXstDldui+EzCMRrr/hY8okkn/wu48tOE8FIZgRFKoAg811o5mCEnsE+JZksid
 030w==
X-Gm-Message-State: AOAM532grWOaGa4eGqLCmXWqdcwl0zPrfqel35J4trC5y7bpk8ASZZMT
 zKvb7I8AEFAYoiE6CIxuEDhEl3paQUVu9nLN5z8=
X-Google-Smtp-Source: ABdhPJxSwP/9o2g2iAZTDUFGyOMMmkNIAlZM83c3S+3lkBZuNKtQFNUK+HnhkFULWAx+Ids6sqVlYA==
X-Received: by 2002:a02:90d0:: with SMTP id c16mr3432217jag.106.1632291290334; 
 Tue, 21 Sep 2021 23:14:50 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a25sm540817ioq.46.2021.09.21.23.14.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:14:49 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 11/14] bsd-user/sysarch: Move to using do_freebsd_arch_sysarch
 interface
Date: Wed, 22 Sep 2021 00:14:35 -0600
Message-Id: <20210922061438.27645-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922061438.27645-1-imp@bsdimp.com>
References: <20210922061438.27645-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d34;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd34.google.com
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
 f4bug@amsat.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert the #ifdef'd i386 code to calling the i386 sysarch code we have
living in i386,x86_64/target_arch_sysarch.h do_freebsd_arch_sysarch
rather than having a separate copy. This is in preparation to remove it
entirely.

Signed-Off-By: Warner Losh <imp@bsdimp.com>
---
 bsd-user/syscall.c | 45 +--------------------------------------------
 1 file changed, 1 insertion(+), 44 deletions(-)

diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
index a579d52ede..9bc72501b2 100644
--- a/bsd-user/syscall.c
+++ b/bsd-user/syscall.c
@@ -91,50 +91,7 @@ static abi_long do_obreak(abi_ulong new_brk)
 #if defined(TARGET_I386)
 static abi_long do_freebsd_sysarch(CPUX86State *env, int op, abi_ulong parms)
 {
-    abi_long ret = 0;
-    abi_ulong val;
-    int idx;
-
-    switch (op) {
-#ifdef TARGET_ABI32
-    case TARGET_FREEBSD_I386_SET_GSBASE:
-    case TARGET_FREEBSD_I386_SET_FSBASE:
-        if (op == TARGET_FREEBSD_I386_SET_GSBASE)
-#else
-    case TARGET_FREEBSD_AMD64_SET_GSBASE:
-    case TARGET_FREEBSD_AMD64_SET_FSBASE:
-        if (op == TARGET_FREEBSD_AMD64_SET_GSBASE)
-#endif
-            idx = R_GS;
-        else
-            idx = R_FS;
-        if (get_user(val, parms, abi_ulong))
-            return -TARGET_EFAULT;
-        cpu_x86_load_seg(env, idx, 0);
-        env->segs[idx].base = val;
-        break;
-#ifdef TARGET_ABI32
-    case TARGET_FREEBSD_I386_GET_GSBASE:
-    case TARGET_FREEBSD_I386_GET_FSBASE:
-        if (op == TARGET_FREEBSD_I386_GET_GSBASE)
-#else
-    case TARGET_FREEBSD_AMD64_GET_GSBASE:
-    case TARGET_FREEBSD_AMD64_GET_FSBASE:
-        if (op == TARGET_FREEBSD_AMD64_GET_GSBASE)
-#endif
-            idx = R_GS;
-        else
-            idx = R_FS;
-        val = env->segs[idx].base;
-        if (put_user(val, parms, abi_ulong))
-            return -TARGET_EFAULT;
-        break;
-    /* XXX handle the others... */
-    default:
-        ret = -TARGET_EINVAL;
-        break;
-    }
-    return ret;
+    do_freebsd_arch_sysarch(env, op, parms);
 }
 #endif
 
-- 
2.32.0


