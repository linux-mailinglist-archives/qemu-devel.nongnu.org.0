Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0035C427411
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 01:18:17 +0200 (CEST)
Received: from localhost ([::1]:45448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYz84-0002ne-Es
	for lists+qemu-devel@lfdr.de; Fri, 08 Oct 2021 19:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5J-0008QJ-QM
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:25 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:46002)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mYz5H-0006cr-Nn
 for qemu-devel@nongnu.org; Fri, 08 Oct 2021 19:15:25 -0400
Received: by mail-il1-x12b.google.com with SMTP id i11so10490266ila.12
 for <qemu-devel@nongnu.org>; Fri, 08 Oct 2021 16:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nemaLJ3YI2rLMZki8aqe2bhWUhXyuEblpfd7VRz22Jc=;
 b=sLZlDwtRbR3t+EoiqnVTo6UNCR83KNi7vewdIgREymvRNkvumNPbh4N45s8GM73bMg
 3NdRzKJTvXpX2g3bbpBEElsrPsftZqgOS65z1BvXWwL5c6yY1VZVfDOLsRv7QcQYNQeN
 uugWwUffKZQaGWvLRPhovXhneOTjhwhdWkNDF/Bv+nurjQPxB3bYd71psoYUL6Cnecjq
 h/5EcGuyBBwDt/XPWxoWKqb+wKkVBDBa4a3rTAFSsrb7c/Ux7HznizceuKvb2KDjNz5i
 m/Kyj5FgRUajuyfHmDr46UPjyHguOdS1qzzhGrS+j4IVO4qt0xgvffrRvtEgHPLWcQni
 ASMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nemaLJ3YI2rLMZki8aqe2bhWUhXyuEblpfd7VRz22Jc=;
 b=SIcYBcwFoGc82+D1UIAtlLOVCm1fWnuKiwIiWoB0XRwQ2fxQYMo/EykZvG4Tcc0F02
 tRWDfDglP0YOq5WCOFxv8CrD/Xg1XE7v8IxBUlyyP3KnOEAWJKsKoATPnvsN18egA1R7
 ekME/PtvuAduJI4g+tdDSEoM2oCk2Wju0cPfZ1KbtaJHE07JSLOh8IeIh4gb5EQszKrC
 HR5IFLQFDUnLtSHXbcupeqBByJj155yp61aiaNwOFa6O0RNQWnZnMUkTbuJXP+waT7tH
 QsFa8VYkayQ82mbopEmk40ebtpg9gefwEEVyx8C1TMBGPgnvYaozoYNOJ7KbfwISuxHM
 TwuA==
X-Gm-Message-State: AOAM5322y973C1woKggd1+V0xV0s6XH3RJwAlIb+hNFHS8UUbRCOycKU
 vAwIFB4cB0GVaoeGZvolh0BRpScNR/3a5g==
X-Google-Smtp-Source: ABdhPJyJUmyvOwf/UINZfBP+AE1awboJFEtY1RWT2eoZ94A+L7kyVIRmBgOaDn//elifbgu0G5waMA==
X-Received: by 2002:a05:6e02:1bae:: with SMTP id
 n14mr10499659ili.253.1633734922450; 
 Fri, 08 Oct 2021 16:15:22 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id b15sm293628ion.8.2021.10.08.16.15.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Oct 2021 16:15:21 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 03/15] bsd-user/strace.list: Remove support for FreeBSD
 versions older than 12.0
Date: Fri,  8 Oct 2021 17:14:54 -0600
Message-Id: <20211008231506.17471-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211008231506.17471-1-imp@bsdimp.com>
References: <20211008231506.17471-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/freebsd/strace.list | 11 -----------
 1 file changed, 11 deletions(-)

diff --git a/bsd-user/freebsd/strace.list b/bsd-user/freebsd/strace.list
index b01b5f36e8..275d2dbe27 100644
--- a/bsd-user/freebsd/strace.list
+++ b/bsd-user/freebsd/strace.list
@@ -33,10 +33,6 @@
 { TARGET_FREEBSD_NR___syscall, "__syscall", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR___sysctl, "__sysctl", NULL, print_sysctl, NULL },
 { TARGET_FREEBSD_NR__umtx_op, "_umtx_op", "%s(%#x, %d, %d, %#x, %#x)", NULL, NULL },
-#if defined(__FreeBSD_version) && __FreeBSD_version < 1000000
-{ TARGET_FREEBSD_NR__umtx_lock, "__umtx_lock", NULL, NULL, NULL },
-{ TARGET_FREEBSD_NR__umtx_unlock, "__umtx_unlock", NULL, NULL, NULL },
-#endif
 { TARGET_FREEBSD_NR_accept, "accept", "%s(%d,%#x,%#x)", NULL, NULL },
 { TARGET_FREEBSD_NR_accept4, "accept4", "%s(%d,%d,%#x,%#x)", NULL, NULL },
 { TARGET_FREEBSD_NR_access, "access", "%s(\"%s\",%#o)", NULL, NULL },
@@ -49,10 +45,6 @@
 { TARGET_FREEBSD_NR_cap_fcntls_get, "cap_fcntls_get", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_cap_fcntls_limit, "cap_fcntls_limit", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_cap_getmode, "cap_getmode", NULL, NULL, NULL },
-#if defined(__FreeBSD_version) && __FreeBSD_version < 1000000
-{ TARGET_FREEBSD_NR_cap_getrights, "cap_getrights", NULL, NULL, NULL },
-{ TARGET_FREEBSD_NR_cap_new, "cap_new", NULL, NULL, NULL },
-#endif
 { TARGET_FREEBSD_NR_cap_ioctls_get, "cap_ioctls_get", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_cap_ioctls_limit, "cap_ioctls_limit", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_cap_rights_limit, "cap_rights_limit", NULL, NULL, NULL },
@@ -146,9 +138,6 @@
 { TARGET_FREEBSD_NR_freebsd11_kevent, "freebsd11_kevent", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_kevent, "kevent", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_kill, "kill", NULL, NULL, NULL },
-#if defined(__FreeBSD_version) && __FreeBSD_version < 1000000
-{ TARGET_FREEBSD_NR_killpg, "killpg", NULL, NULL, NULL },
-#endif
 { TARGET_FREEBSD_NR_kqueue, "kqueue", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_ktrace, "ktrace", NULL, NULL, NULL },
 { TARGET_FREEBSD_NR_lchown, "lchown", NULL, NULL, NULL },
-- 
2.32.0


