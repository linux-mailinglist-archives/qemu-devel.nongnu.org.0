Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAF1143275E
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 21:15:56 +0200 (CEST)
Received: from localhost ([::1]:52278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcY71-0004kz-Rg
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 15:15:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtR-00083e-Ei
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:53 -0400
Received: from mail-il1-x12d.google.com ([2607:f8b0:4864:20::12d]:44985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcXtP-0001iW-HQ
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 15:01:52 -0400
Received: by mail-il1-x12d.google.com with SMTP id j8so15935255ila.11
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 12:01:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AiUs/VfZosBnQlunZsNdKJI8UF+bB22/U8lGhyrKVwU=;
 b=4/mPdsFqGHatN1w73N+iPLH81J8bjQlExaAmO4nuJpw3sVPeUeKaOCYbriZnvj2F/d
 cHmhh8MBR7Iw+jSpwWft9Kr1GrrMED0XrHwAaTqByNfsuS2wz8ULuFEfRqi6G38y5Eey
 2ZoCKStlbufRfvVWjVrRQTx//k01vEo3s12V88pntlXuy9NQBZS9awCGL2wedCmIMGua
 N/HpY/gfjnBZC54ewrtSDHRfjExeY7OeVW+7xwCPYdENCm2ceeD1o2km8ZcuRHZcKzm1
 ryx/V8euNR5BcKYXnRtI/ZoOwFvmNxnZ46gcGZy+iu3dJdcKe+YIMbBBIH0iYyel6sDg
 r5EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AiUs/VfZosBnQlunZsNdKJI8UF+bB22/U8lGhyrKVwU=;
 b=O8A5uaHa94YK6D+lzJrZeKqOD0Cy6YWR+z3pGHFiQ9gHZzikgrI0oD0EkCvFmFxbgy
 ZLB24JpmAMcCneoIfx5GSsX5sZ0zG6Jxz5AwHzgFpopJPts8B9PGy0QsffR2KPjoIEhm
 o9U/M7WMdYgLbuq+zXWkZRo5TkmEa9hAaHAPMKQUa6YlcSoi41W4gHMk+5vmkkTyeA+M
 79llMKv71+UdSHLLgwkOk1B7lBcGrs7dAEGfiZNEATrgwMUGbEk96+ZUFMRyua7zEn8V
 3vRCKwCh1FhmCgzXr4BLCSCDh2lygK5ESfkt/1cExOKv/k3CWBiOflEqzvt0zYAp/oQt
 ol3Q==
X-Gm-Message-State: AOAM532Y39DUUbqmRbnNxjNLfW7ktb8rSWYvZcGLeSztRrersZ0breC4
 41I7jO/kc/te77vGxLVyKTqmjiY2ac/mLQ==
X-Google-Smtp-Source: ABdhPJyd49AfGJhMymTSfq++65DqH/jRdpvZzqy6h3+kWniOsERwiwG7wrr4VBU2ZM6CLkatgq/UmQ==
X-Received: by 2002:a05:6e02:bc9:: with SMTP id
 c9mr15649319ilu.309.1634583710195; 
 Mon, 18 Oct 2021 12:01:50 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a8sm6945151ilh.5.2021.10.18.12.01.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 12:01:49 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 12/23] bsd-user/strace.list: Remove support for FreeBSD
 versions older than 12.0
Date: Mon, 18 Oct 2021 13:01:04 -0600
Message-Id: <20211018190115.5365-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018190115.5365-1-imp@bsdimp.com>
References: <20211018190115.5365-1-imp@bsdimp.com>
MIME-Version: 1.0
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
Cc: Kyle Evans <kevans@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
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


