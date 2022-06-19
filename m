Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F61550C7C
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 20:14:29 +0200 (CEST)
Received: from localhost ([::1]:44350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2zRM-0007Iw-R1
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 14:14:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIe-0000yv-7k
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:28 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:46822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIc-0001LO-Jp
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:27 -0400
Received: by mail-il1-x132.google.com with SMTP id y16so6064399ili.13
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 11:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gMytXGUn22yDNlAtdSy95841H0sZIx/2Jw4ZsIHWhmc=;
 b=aw68Pl7PoYK2sDTyJ84xD3EErFfvb8iDv8qL4NqgNpUjOXr4l8GwIpdFdcYtKF2kbc
 PVh84ZEn3RL7vmsaRLrHztS6Md2VoeaOixQ8Aace8IPg6xy6rq9TqxPcP+CLyzB31Zd4
 WfqQmL3iq2Tv9h3KfDCddZrH5Wur6j4iotvTmd4du1R2+kbqU83TPnBlBzdVJcZPNV5h
 9UhkQwrLkQQTKujdgxZD/9ABD1T2V/ab3T6Wq8cFZ2ro0JWyu98vEww90PGBnb+/wutV
 5eAkfvGrvCmoJio79XAG6s7VWkL3d1psMdbu7pj0+LRbxcFIAOhAmYbbHjOktReoUOyG
 0s+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gMytXGUn22yDNlAtdSy95841H0sZIx/2Jw4ZsIHWhmc=;
 b=USRMK6IsrwXXBIk+ndir+Zpv5dH+mekokpQ2/Xzehk/5nLjBZcNd7G3pm0hcotmkXZ
 DW0UyjLjQDG7hCvEOCPHce90ljwDYggvbZyF2gIuR3iaWxdlqfUjN0VnORJcJx12VLTD
 RLkWW7UvzweXCrPz/wrmKjxlSGDliRwCAq8y5UQb57/5kEKa6x30jqJ64zktkV62/30q
 VVxJOtESWOJBiks5A0uCiyN8TnbFw9ZCeoD3wWH3nTO/HpE3RUddy81N3F3TTd5jbHZd
 vYimJ5GHPMg/Pj7B7qUtPQds3e9uZIxzXYR03KqHk/plcZDEpyti+ROBm0Jg6fpwYy9+
 WwRw==
X-Gm-Message-State: AJIora8zaighgIVFy+H33mkdtG4El1GR9er73jwkEPDJNpLqLC76pe5V
 izurvESkO6WOlClkDu7+cPeKojDoaTl95w==
X-Google-Smtp-Source: AGRyM1twUKQsEZJt/6r21fATNyyQchS4eiSKacXiDp1++Tpb73R70p6Z/kWM/fm5J0mlRR0Frp/ZYg==
X-Received: by 2002:a92:dc88:0:b0:2d5:118c:a3f6 with SMTP id
 c8-20020a92dc88000000b002d5118ca3f6mr11289053iln.204.1655661925754; 
 Sun, 19 Jun 2022 11:05:25 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 63-20020a6b1542000000b00669b8999911sm5556897iov.15.2022.06.19.11.05.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 11:05:25 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, jrtc27@FreeBSD.org, arrowd@freebsd.org,
 def@FreeBSD.org, Stacey Son <sson@FreeBSD.org>
Subject: [PULL 11/11] bsd-user: Implement acct and sync
Date: Sun, 19 Jun 2022 12:05:31 -0600
Message-Id: <20220619180531.9161-12-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220619180531.9161-1-imp@bsdimp.com>
References: <20220619180531.9161-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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
 bsd-user/bsd-file.h           | 23 +++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index fda36894605..b2dca586129 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -526,4 +526,27 @@ static abi_long do_bsd_ftruncate(void *cpu_env, abi_long arg1,
     return get_errno(ftruncate(arg1, target_arg64(arg2, arg3)));
 }
 
+/* acct(2) */
+static abi_long do_bsd_acct(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    if (arg1 == 0) {
+        ret = get_errno(acct(NULL));
+    } else {
+        LOCK_PATH(p, arg1);
+        ret = get_errno(acct(path(p)));
+        UNLOCK_PATH(p, arg1);
+    }
+    return ret;
+}
+
+/* sync(2) */
+static abi_long do_bsd_sync(void)
+{
+    sync();
+    return 0;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 3c8f6cad0e8..2623caf8007 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -365,6 +365,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_ftruncate(cpu_env, arg1, arg2, arg3, arg4);
         break;
 
+    case TARGET_FREEBSD_NR_acct: /* acct(2) */
+        ret = do_bsd_acct(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_sync: /* sync(2) */
+        ret = do_bsd_sync();
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


