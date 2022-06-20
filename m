Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D27F5522EB
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 19:48:59 +0200 (CEST)
Received: from localhost ([::1]:58128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3LWE-00054v-3T
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 13:48:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPm-0005PR-3i
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:19 -0400
Received: from mail-io1-xd33.google.com ([2607:f8b0:4864:20::d33]:34316)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o3LPk-00081g-He
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:42:17 -0400
Received: by mail-io1-xd33.google.com with SMTP id p128so11845481iof.1
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:42:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=i5fJrgungaspLDb/UzsKPN+C5C6kK/KV/rxEAxS2HOs=;
 b=UWipyA4CfxGN5rBJXYu8QsQqdOPMAQla5Cq/oshXd+ww+WtYE0Ipyqm3aTPedU7YPe
 QLzRWlTot/sxVDxlTx5XX8o/n9vcbVVQb97KmvLJy6+WZFT9No5EDy4jfosFQKbCT26s
 WgowNE6lw/2bNdKsr9HJPzsf0prweNIji+TsMi99FbLgs3/HsPROBN/Hlsai8k6aZAei
 crQO/0TT7nbYNGvLWK9FnHeYx5xNj8pxzu32eel619utC6uI1ZBuISvdxNV/RpyRypdh
 4l60/0oMfG0C2DoCzyl+XZ8zO9SUf/iVfa3KYUq8jczq6LjTUhsWBzH5O6BvNasM4LRO
 zM9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=i5fJrgungaspLDb/UzsKPN+C5C6kK/KV/rxEAxS2HOs=;
 b=xpKjKQpKA6OpBEAUVho+anrJI5kRhsASxx7wsrAgurdZJEhkh9pAPWd45c2m9vHO3Z
 AdlP3SHFPcq5TwkpuMnEfGkWt1RcTCpQuOgbTE5v7cD62Ms1yp8BHh1vbiawqm3yOVEm
 zkjt2PLOBu19TavSQPhe7e3/7upfOfS2yRdMOate2SyaGpaiMWJtTw04YVlUMCyjTCTR
 6g8EL6PIB9NLo0i3SZZLU6r1hj3tsNiXq920UWuqzHQuvSr26IJMkxn8IIB2Ae0+kct0
 z8EtdQspIiLRCGk2wQEvRKDEWIbgQeVDk8Np6mjGIYvII9esqLjaV4E63XztBS7u7irZ
 8nrg==
X-Gm-Message-State: AJIora9333vo8Cj0znD34lNZqX4AxtgzpJ2UPZdVhYen3vx2w0G1o92l
 CSdBNQY3tfjHXfPO4ngGwMglc0OITJk61Q==
X-Google-Smtp-Source: AGRyM1sbEOjSrx95ToRXKiA1Q6n9L3GeWg4DbfYhZax+9U940yX/Kuw7TsQgfdD3hXyExGdkHBWvXQ==
X-Received: by 2002:a05:6638:204d:b0:332:292d:9a06 with SMTP id
 t13-20020a056638204d00b00332292d9a06mr14307744jaj.39.1655746935586; 
 Mon, 20 Jun 2022 10:42:15 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 k19-20020a02c773000000b00331e4e4fac9sm6202953jao.47.2022.06.20.10.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:42:15 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>, Kyle Evans <kevans@freebsd.org>,
 Stacey Son <sson@FreeBSD.org>
Subject: [PATCH 07/10] bsd-user: Implement chroot and flock
Date: Mon, 20 Jun 2022 11:42:17 -0600
Message-Id: <20220620174220.22179-8-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220620174220.22179-1-imp@bsdimp.com>
References: <20220620174220.22179-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/bsd-file.h           | 19 +++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 27 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index f5375a39a2c..f11369655a0 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -861,4 +861,23 @@ static abi_long do_bsd_fchflags(abi_long arg1, abi_long arg2)
     return get_errno(fchflags(arg1, arg2));
 }
 
+/* chroot(2) */
+static abi_long do_bsd_chroot(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(chroot(p)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* flock(2) */
+static abi_long do_bsd_flock(abi_long arg1, abi_long arg2)
+{
+    return get_errno(flock(arg1, arg2));
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index d10635eae05..f3fb585b7ec 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -461,6 +461,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_fchflags(arg1, arg2);
         break;
 
+    case TARGET_FREEBSD_NR_chroot: /* chroot(2) */
+        ret = do_bsd_chroot(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_flock: /* flock(2) */
+        ret = do_bsd_flock(arg1, arg2);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


