Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0773550C75
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 20:10:32 +0200 (CEST)
Received: from localhost ([::1]:34440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2zNX-0000Y0-SE
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 14:10:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41912)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIY-0000vc-I6
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:22 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f]:35693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIX-0001Kf-5E
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:22 -0400
Received: by mail-io1-xd2f.google.com with SMTP id y79so9138565iof.2
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 11:05:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4lp3jEo9v2BadFnXv+3JFzH727s9UtBSFIowCjnWXXo=;
 b=BwT403YBjYVJSA6WGHPiTdAc/NiWpg8+UHQ3NGsPvncztoFKQObaPXQvKdKgSUkkOC
 44NDQ1Yfv7HbU2h5I4yA4gZgf4SfUFklGBdUiNDrLjS/nQsoc1Hdb9xW1R2gryyA6v8S
 t1MsRu4txALx/kAnKocWTOxV1xs1avm0ZeCmz1j11Yy7/ssHBDKfMVhmAoEULi/fOb5u
 qIXl4Ep6FChcye++nvzIj8j2IamS+zKe7kgw1SDb2gikAmOsrl2f92Ei3hKYDn9F8bKL
 A86clHn/XyicUqx+kCThVr2JzOgwFZtLkOlGKp2FCCGwLi3h76yyfu+jtbNfKn9gM5ob
 E7cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4lp3jEo9v2BadFnXv+3JFzH727s9UtBSFIowCjnWXXo=;
 b=Y/WARtvSurecHuOXgGFCcAzloPUPm9wd3DGggACEaL2ozMhHdrsGoG1D/knf5v1evA
 IpCtTrcmJ6LbNJqw7bYrYwVQmchieTIaLMhR8aDL1cUQT2pVR3LcvqGse8qmpUTSdIKw
 CJtZdIkekdfbjrUcHU8b0U+yE4OjHKWUZgMCZeyUw1tWO5GNTK+ihaPl2ec4sOfC9nvm
 Y14TpGifKKFYUxOr8WiY5m4iLqgRtjE0ZiPInLcQA4+xli/C9XPXWoRKk0pSyWl93nZG
 pqUvVi9KVt5K74laIHLCWKFQlIStCqoC8jFZJUJ0ugKQCcJYt3fakYY7lAHfp278m6Zi
 4N3w==
X-Gm-Message-State: AJIora9jorWCf3BqM96RCKv7LR7RQmBJSQZA95na7vVaV0j1/kwelicv
 S8bvUnTAEZpfF3QqpYJ5xbmfYJruA4zsvQ==
X-Google-Smtp-Source: AGRyM1txXX3XMqqP8ytvDCZ1WWuNfzblEFuty26sCOKf+8c8yJyu57p6/ODcgJRM6Rgs6cQTT5MP3A==
X-Received: by 2002:a05:6638:25c8:b0:332:1f0e:3e50 with SMTP id
 u8-20020a05663825c800b003321f0e3e50mr10890509jat.5.1655661920157; 
 Sun, 19 Jun 2022 11:05:20 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 63-20020a6b1542000000b00669b8999911sm5556897iov.15.2022.06.19.11.05.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 11:05:19 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, jrtc27@FreeBSD.org, arrowd@freebsd.org,
 def@FreeBSD.org, Stacey Son <sson@FreeBSD.org>,
 Jung-uk Kim <jkim@FreeBSD.org>
Subject: [PULL 06/11] bsd-user: Implement link, linkat, unlink and unlinkat
Date: Sun, 19 Jun 2022 12:05:26 -0600
Message-Id: <20220619180531.9161-7-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220619180531.9161-1-imp@bsdimp.com>
References: <20220619180531.9161-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2f.google.com
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
Signed-off-by: Jung-uk Kim <jkim@FreeBSD.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 54 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 +++++++++++
 2 files changed, 70 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index fd8aba96180..93e142d46e7 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -375,4 +375,58 @@ static abi_long do_bsd_renameat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* link(2) */
+static abi_long do_bsd_link(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg1, p2, arg2);
+    ret = get_errno(link(p1, p2)); /* XXX path(p1), path(p2) */
+    UNLOCK_PATH2(p1, arg1, p2, arg2);
+
+    return ret;
+}
+
+/* linkat(2) */
+static abi_long do_bsd_linkat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    abi_long ret;
+    void *p1, *p2;
+
+    LOCK_PATH2(p1, arg2, p2, arg4);
+    ret = get_errno(linkat(arg1, p1, arg3, p2, arg5));
+    UNLOCK_PATH2(p1, arg2, p2, arg4);
+
+    return ret;
+}
+
+/* unlink(2) */
+static abi_long do_bsd_unlink(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(unlink(p)); /* XXX path(p) */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* unlinkat(2) */
+static abi_long do_bsd_unlinkat(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(unlinkat(arg1, p, arg3)); /* XXX path(p) */
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 2d62a546328..c847e4d20c6 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -317,6 +317,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_renameat(arg1, arg2, arg3, arg4);
         break;
 
+    case TARGET_FREEBSD_NR_link: /* link(2) */
+        ret = do_bsd_link(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_linkat: /* linkat(2) */
+        ret = do_bsd_linkat(arg1, arg2, arg3, arg4, arg5);
+        break;
+
+    case TARGET_FREEBSD_NR_unlink: /* unlink(2) */
+        ret = do_bsd_unlink(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_unlinkat: /* unlinkat(2) */
+        ret = do_bsd_unlinkat(arg1, arg2, arg3);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


