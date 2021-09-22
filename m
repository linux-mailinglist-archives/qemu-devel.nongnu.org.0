Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5361441418F
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 08:17:55 +0200 (CEST)
Received: from localhost ([::1]:39634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSvZq-0004Dd-Ck
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 02:17:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWp-0001Hy-3N
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:47 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:43788)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mSvWm-0007SL-Fs
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 02:14:46 -0400
Received: by mail-il1-x132.google.com with SMTP id b15so1543070ils.10
 for <qemu-devel@nongnu.org>; Tue, 21 Sep 2021 23:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o5dcZNS1jB3ij2bEKaW3MxKb1lTCx5+fcPK9f+WD9ww=;
 b=plXpElKUms2eEC3v0dBvr81tIgtX4g3HyvS4TwZZ1IwE0GlEdV8zm+mjUr9ICQ7fvi
 fBb7oAWTFWtXwOQukpr5K7e5i0vfNPlQcgKrIa8SNxgPtY/xq/2kZh8lFPDcyF2VhpZT
 zZIJdLSw8OG89pf1aN3zgTvwu4huw+n+6JqdEmhttRKkaaZDkpQ+qLqPAJakna0kjZRb
 YAnO9u38bR+YfRgdCzoBqtWb0f5LvsxWsTgAWybv2miABLCAFrO2EmotPMH1HMbkghNG
 XsU4bIyVigy5xjVlKCaFl3QDCw51B3DtJnWKapEea+Bu5zGqJ0rboNhjlTdRpL7Q/e10
 KFqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=o5dcZNS1jB3ij2bEKaW3MxKb1lTCx5+fcPK9f+WD9ww=;
 b=mS9yYRLiR9Zjk2JwTiYtrfLl7UUEff0TGh+kOhGu7A3bAhTPkIzvnJZBnFlipPJVdF
 KFv3WqHE4p8ofpUlgUztVhzF1ofOjBZoEiIj/xpY4AwUX7yPgFvRredrwSKA2HQtcDZ7
 KSkDtfu621PwLb4l4Nx1YRPY+1B+9MqZKEKKM80aaCXJbZpIFoedG+up4MaoMERmdfbq
 P0lRfu0sR9fpmFhn7IGtAe9uQEv4Kmyc+browBKp6rJr1ZNF7ENqU1CPJroFX07AxNWw
 jI0daCn7xLBfuP0KOzN1VSBjZ0jt68qk070C1kE0HwdTHWu1VU4K98z/I95He2MA2bLS
 isVQ==
X-Gm-Message-State: AOAM530GIto97JeBYAIZ4boM1Cxv3SZGZ1tEIEpao8sp6bziFcsWv/OU
 nRE6tZijG1KE/oFck10UPxTt7+8E9a6vn39bI/g=
X-Google-Smtp-Source: ABdhPJyBhPGsRl9OOFcdtA+NRpCrgUqBhLxxQGSpKVQZl1rS6i5jfAeOH4QS981jcnPqnHLY1lpd0g==
X-Received: by 2002:a92:4a10:: with SMTP id m16mr24785957ilf.91.1632291283198; 
 Tue, 21 Sep 2021 23:14:43 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a25sm540817ioq.46.2021.09.21.23.14.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 23:14:42 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 02/14] bsd-user/strace.list: Remove support for FreeBSD
 versions older than 12.0
Date: Wed, 22 Sep 2021 00:14:26 -0600
Message-Id: <20210922061438.27645-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210922061438.27645-1-imp@bsdimp.com>
References: <20210922061438.27645-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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

Signed-off-by: Warner Losh <imp@bsdimp.com>
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


