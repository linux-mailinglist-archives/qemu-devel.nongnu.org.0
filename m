Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CD3550C72
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 20:08:22 +0200 (CEST)
Received: from localhost ([::1]:54996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2zLR-0003mj-9j
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 14:08:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIW-0000ui-GW
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:21 -0400
Received: from mail-il1-x133.google.com ([2607:f8b0:4864:20::133]:36486)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIV-0001LD-2O
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:20 -0400
Received: by mail-il1-x133.google.com with SMTP id h5so3946343ili.3
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 11:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9QIqkwwLRQpn8xMyw5K6t843YHf8OffHXasVl+JrrV8=;
 b=mw0blYWmkjfQOzIBxuoLPTDkWqKNUMfutAJUJiMyh+xTBWLdrQkdZVBvltloQNmxg4
 SyqMYnfPgcwA6lukkuUXOYCyu9PwP56Ca3kcYbaDdtnRdt0zk8W1VBcOwC3RvXIKBaMA
 sUy4OC3t2CvO7nAzKHzGqesAlk5BNBCJ1V6iHJIYyhyShvSD8XurCMuj8uWd7CJxfJvX
 8ZMEwE6k5DT+Cb1nKLkkB025fswR7niKHgfuSloFJSywsUMrTI1Gw9IeziUzBuu7Mned
 yGgWBXCE0m89cSGU1nnyTcp9WCZCmNHtwJjqZDRd/OfEtpTyhATonalwMA086I+z+hIA
 mUYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9QIqkwwLRQpn8xMyw5K6t843YHf8OffHXasVl+JrrV8=;
 b=JYRmLQwVud4x3u6P26VU3BuvNj4P/p9Yr+z8kpIXNvuJ0awFKzVU9X5TiWsyGREX0n
 WO07XzkAQ6a8Mk2xjZ64awHUXiaYcfBjbfk+Pd1Z6AfDai/raCnz/uGaolgv3zCo0gnj
 T6xp7NyD5RV9GX07rMWfYvw9Hbz+ARGO5QywY44SMe7UzVmcfLH+w7GA8/NT1+9f067A
 aNP8EALxHtmmu2lhnkl+DYmv2wmnQU2HgmsJ4qxd/g/8UAiQ7tHLhdk/2n/Z9S37ZHBX
 m7Arz6DVZS0znQ7lu92FYinQZlChB32we4WmBjRQ81F0WKP5PGVO9oNbWmcCTaUgQVmx
 gAKQ==
X-Gm-Message-State: AJIora9cMYr57v2o82/DSCb674teNX/mbOCS6dZ59AE3iI8UQ+Tvgvlv
 lfNRkbFfg4JlqV1RCKrAz3MhDnXPcFrUTg==
X-Google-Smtp-Source: AGRyM1t//G0Ky/dQkssWs3lJ57hmGDZEsBJAGAppGtFNkCnbjPe9dD+Ncho42dL7+3szrXR2diIaCg==
X-Received: by 2002:a05:6e02:1ca6:b0:2d8:f599:dbf0 with SMTP id
 x6-20020a056e021ca600b002d8f599dbf0mr4782077ill.200.1655661917755; 
 Sun, 19 Jun 2022 11:05:17 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 63-20020a6b1542000000b00669b8999911sm5556897iov.15.2022.06.19.11.05.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 11:05:17 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, jrtc27@FreeBSD.org, arrowd@freebsd.org,
 def@FreeBSD.org, Stacey Son <sson@FreeBSD.org>
Subject: [PULL 04/11] bsd-user: Implement chdir and fchdir
Date: Sun, 19 Jun 2022 12:05:24 -0600
Message-Id: <20220619180531.9161-5-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220619180531.9161-1-imp@bsdimp.com>
References: <20220619180531.9161-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/bsd-file.h           | 19 +++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 27 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 6ff2be24e30..bc0a0c08d55 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -311,4 +311,23 @@ static abi_long do_bsd_faccessat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* chdir(2) */
+static abi_long do_bsd_chdir(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(chdir(p)); /* XXX  path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchdir(2) */
+static abi_long do_bsd_fchdir(abi_long arg1)
+{
+    return get_errno(fchdir(arg1));
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 7b7af914e49..8698db358c1 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -301,6 +301,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_faccessat(arg1, arg2, arg3, arg4);
         break;
 
+    case TARGET_FREEBSD_NR_chdir: /* chdir(2) */
+        ret = do_bsd_chdir(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_fchdir: /* fchdir(2) */
+        ret = do_bsd_fchdir(arg1);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


