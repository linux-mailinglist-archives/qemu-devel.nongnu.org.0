Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECC564323AF
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 18:20:06 +0200 (CEST)
Received: from localhost ([::1]:46940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcVMs-0003iW-2B
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 12:20:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV92-0007k0-Gm
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:48 -0400
Received: from mail-io1-xd2c.google.com ([2607:f8b0:4864:20::d2c]:38891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mcV8p-000800-Eq
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 12:05:48 -0400
Received: by mail-io1-xd2c.google.com with SMTP id d125so16902873iof.5
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 09:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AiUs/VfZosBnQlunZsNdKJI8UF+bB22/U8lGhyrKVwU=;
 b=JgXeRP5XZ/g3f6ECBZhp0nlbEHP46YH4PL8VksIuIZItocPi5P4HXn1YMOKqQGKdh6
 hv2V9f9knu/qzNROUaYZs8CvLCi+koqgV1cNWwgO9j18BKaHMxrTJwhs5JEs3B+3qBZL
 lDpMTF3SzSu1m12omYeTfPZYbyxW0L0cR4tgqwExqRrtfbxwKdnG5sdNNfXzgFgFLpAM
 g9TZMJ5yuOA7xz85IbfcwzemqzYBZvXIaPCYnQXymoUx0jkdf2K8SakGWylt+vrNnN4r
 kBKjozQgOER8CT8K3owW3caqKU//uTw6HqQGOq3RazG2VeLug1Akk9+g6IN4hTsV27DO
 LuNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AiUs/VfZosBnQlunZsNdKJI8UF+bB22/U8lGhyrKVwU=;
 b=GialVNUjf2mn8UYCiYersjcywqkNbax56E7qKzxhyY0vnbilUmfRPmxArIB4ZeBly+
 iavcGQSL8lO8z97mVwRKjTfXr2/KZNRXsh9X5VYnfY9O5riFaWWzA9KZSyJ9hOsY6tGB
 uRduKlKHQwT663gPHjd00g5mLAW9zXzSFlsA06rBtyreQsXXJOEsSq+YoPq90wkjYycN
 S+4wZtL07h6XnCfpuc5hCBef0MQX9mi4aX0TRmlGQr05h/HnjEmJmiQyRWsp4proH4Cb
 WUbOdiLmqq86Bsz51osp/prog8AJoub8ZasSsUe7eOMHATjzAm9zh+7luoCroWiZC4PM
 9mjg==
X-Gm-Message-State: AOAM53173e8tv1Dx9gy7W2EWT6FGjOv3Bi/jcxmyBuLxUCrqLFt6EBgi
 GZT5TuEkvdTnHz4CNf2031zhKz1g80HYMA==
X-Google-Smtp-Source: ABdhPJwFnJhCTzLxtRsSNP0Hz5yYXtnMzsNbVISU6UCHVks751K77WR0DCdk+ztkc0u5FUjgE+Au/w==
X-Received: by 2002:a02:77cf:: with SMTP id g198mr499913jac.6.1634573126502;
 Mon, 18 Oct 2021 09:05:26 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a4sm7240936ild.52.2021.10.18.09.05.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 09:05:25 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 12/23] bsd-user/strace.list: Remove support for FreeBSD
 versions older than 12.0
Date: Mon, 18 Oct 2021 10:04:47 -0600
Message-Id: <20211018160458.1976-13-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211018160458.1976-1-imp@bsdimp.com>
References: <20211018160458.1976-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2c;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2c.google.com
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


