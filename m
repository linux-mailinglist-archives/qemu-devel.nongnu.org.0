Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D06D8564072
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 15:59:32 +0200 (CEST)
Received: from localhost ([::1]:56190 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7del-00014R-QB
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 09:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc9-0006iN-EC
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:49 -0400
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136]:46990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc7-0000aZ-U6
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:49 -0400
Received: by mail-il1-x136.google.com with SMTP id h20so3003363ilj.13
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 06:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kzAzIpUIXo+c189sqZVTv1xr+Ava31F6GIsxzJh2kq4=;
 b=i2JNKtNKEnsCZmC+n2absR5Y4LOzNoibpH44B9nJQ0gMB1SB/tZ9ykwXVRBgjb3tc6
 KaaVByd4nWmP1bYmeOGdOapNlEJY54Aq/Er9HaKBAI+eOw18kIB/NGCyAWvam/MBcZnl
 1R8FzCqjeYTipIUdDhlRfCq+zsJKJLsFwZbV9kQRSTM/pDOUpdI00G57OGBUc/5bZLrq
 Qqd5qJvRN3HcSTi+JZL+wZQg6zAmTJaeZ0w6QBjB3JVT4QroDmgeOR+gi7H4xnb/e4Pv
 hWqdgtAcOvXK3RDKZhgydsF0U9G2VhOz4/DMDJblABwtYJKxY29ULgUKPONOl19505VX
 wUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kzAzIpUIXo+c189sqZVTv1xr+Ava31F6GIsxzJh2kq4=;
 b=H4S2vytjFTeWaQJtuclmEltyhw8AIAgeicop57XdY4ir42SQ4KkY5aabzoNSr3QupL
 NJR77oL+P39VYa5c+5mQBPcnFQVn2cW3zXIawlus3KDuTZTVp7IcYP2X5udNt7pOTDD1
 +0sBm/jVZe6WjykUZMLX57Zuk8c2/D28efVeiCp1v7LVIXQEklpSZjSgklXOfbqJaGMY
 gpUDYV2YirnaJiY57lPPQYtlBPlEYufVjCZ10t68BNVLblWwNtv3TOtEW2YHEqKATI7s
 RVC875VvZd7sk2pH/ykBBCJFBbaWWanm+ujLQ89HctByBzm+eHZgDiYixj71VT0Q7p02
 qh4Q==
X-Gm-Message-State: AJIora9z1Nw8FnnbC2XN24++p6+NwjoMX2eqSbuXqsKYjyMKMy0tbL4o
 iQGovxpleAMP9p2GRqFMG8UIHN+NZPtXXg==
X-Google-Smtp-Source: AGRyM1sgrScmCLs6Sq95zwCUmFjbPheGATNeINYoYaOywwT5CwSoifaRHzt/Bdb9Yh/JBFks3wSDgQ==
X-Received: by 2002:a05:6e02:214a:b0:2da:a56a:c1cf with SMTP id
 d10-20020a056e02214a00b002daa56ac1cfmr11698081ilv.5.1656770205546; 
 Sat, 02 Jul 2022 06:56:45 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q189-20020a6b8ec6000000b0065a47e16f4esm11584278iod.32.2022.07.02.06.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 06:56:44 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 05/11] bsd-user: Implement chown, fchown, lchown and fchownat
Date: Sat,  2 Jul 2022 07:57:00 -0600
Message-Id: <20220702135706.73622-6-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220702135706.73622-1-imp@bsdimp.com>
References: <20220702135706.73622-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::136;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x136.google.com
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
 bsd-user/bsd-file.h           | 48 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 ++++++++++++
 2 files changed, 64 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index b05d3cbb717..ac171c409ca 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -768,4 +768,52 @@ static abi_long do_bsd_mknodat(void *cpu_env, abi_long arg1,
     return ret;
 }
 
+/* chown(2) */
+static abi_long do_bsd_chown(abi_long arg1, abi_long arg2, abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(chown(p, arg2, arg3)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchown(2) */
+static abi_long do_bsd_fchown(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    return get_errno(fchown(arg1, arg2, arg3));
+}
+
+/* lchown(2) */
+static abi_long do_bsd_lchown(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(lchown(p, arg2, arg3)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchownat(2) */
+static abi_long do_bsd_fchownat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4, abi_long arg5)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(fchownat(arg1, p, arg3, arg4, arg5)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index d3125f340f7..8090666b0d9 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -431,6 +431,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_mknodat(cpu_env, arg1, arg2, arg3, arg4, arg5, arg6);
         break;
 
+    case TARGET_FREEBSD_NR_chown: /* chown(2) */
+        ret = do_bsd_chown(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_fchown: /* fchown(2) */
+        ret = do_bsd_fchown(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_lchown: /* lchown(2) */
+        ret = do_bsd_lchown(arg1, arg2, arg3);
+        break;
+
+    case TARGET_FREEBSD_NR_fchownat: /* fchownat(2) */
+        ret = do_bsd_fchownat(arg1, arg2, arg3, arg4, arg5);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


