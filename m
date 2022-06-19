Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F16E3550C74
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Jun 2022 20:10:30 +0200 (CEST)
Received: from localhost ([::1]:34254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2zNV-0000QX-Oy
	for lists+qemu-devel@lfdr.de; Sun, 19 Jun 2022 14:10:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIV-0000st-1T
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:19 -0400
Received: from mail-io1-xd30.google.com ([2607:f8b0:4864:20::d30]:46043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o2zIT-0001L3-M6
 for qemu-devel@nongnu.org; Sun, 19 Jun 2022 14:05:18 -0400
Received: by mail-io1-xd30.google.com with SMTP id 19so9110256iou.12
 for <qemu-devel@nongnu.org>; Sun, 19 Jun 2022 11:05:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uedUQ2KHIZe9tCAw1aTgfSJGduq3Rf0+S18JxCMy0Hg=;
 b=ytdNeYZ8Qbd15JVJhZYzsuj1nzOAAWTtiKj4L70Ux6UOPmTyjEzBpo748DnCH2JCqg
 Pcsf24WUxBMblNv4G6R3ZBKD3flKzyZIXAu+gZPaBUpavBH5Wgbgrq4H+1ik3dLrdF8T
 bsvucryWv+0Tvi4cpvG2F+tL7Bg7XSHqeLeskn3zpLRgnx7LhwjNeHVUHbcvvbcP6AVt
 VG83tfk/7kuE6fXquUKxJlofJ4Jo9YBnbthOiG2Fmqfr5iRSnogXCpnroLVCEpuAg2Qw
 J2rII7d/wlotwrsH2bPpul45rvMZKO/l0vA7Deet65mgIfK6qPflVo4YCpn0EOFq1HNn
 2Kyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uedUQ2KHIZe9tCAw1aTgfSJGduq3Rf0+S18JxCMy0Hg=;
 b=U0EQbWPGUw57tgyZt/eX0whA+nGWq9DZ4FfSq8IgQLWBpMlSLon02xxyIE9Nmlgmf7
 NTyo+z2ycfeJxkrTR0Ox7xU7n/6N2qJTIhuDDz2A4i9TMnsJuKUSk6Q6t4fu8tOBc9m/
 wsqOUVFi4fYThEvk4zYlaP4ZkK7rm5ZTpV+wHSXqhgb9DCB94DrhDOg4qjU90Q31HO+/
 wWVo/DwKAMv99PpknnHp2t4NJIFCZbU94wMOmAUYNrcimRuHBfkcDjUk/i2mlrp9wDnS
 mBJYp8fpo2MRixNza+RJQNYLiVYaysRlVqEmHGGWqD1PCIr++z8wqKxTDRElTuPJ/jZI
 MFcg==
X-Gm-Message-State: AJIora+lFolPtTF6Voo0Jkk1tmdQxW85XKGFJijIuEDAoQNWfn5tkVyT
 D6Tmz++VHbuZZuNKEVSmdUGZQ2arNurWIg==
X-Google-Smtp-Source: AGRyM1uYQq1iHDqLs+V3tzdNxERSnfhVcUBYHKvOYSjBMDD3FlYOtm48qZ7SgX6NTl7V3iGwosRAsw==
X-Received: by 2002:a05:6638:238b:b0:332:2816:62f2 with SMTP id
 q11-20020a056638238b00b00332281662f2mr11283697jat.106.1655661916518; 
 Sun, 19 Jun 2022 11:05:16 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 63-20020a6b1542000000b00669b8999911sm5556897iov.15.2022.06.19.11.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Jun 2022 11:05:16 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, jrtc27@FreeBSD.org, arrowd@freebsd.org,
 def@FreeBSD.org, Stacey Son <sson@FreeBSD.org>
Subject: [PULL 03/11] bsd-user: Implement revoke, access, eaccess and faccessat
Date: Sun, 19 Jun 2022 12:05:23 -0600
Message-Id: <20220619180531.9161-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220619180531.9161-1-imp@bsdimp.com>
References: <20220619180531.9161-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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
 bsd-user/bsd-file.h           | 53 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 +++++++++++
 2 files changed, 69 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 94eb03df62e..6ff2be24e30 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -258,4 +258,57 @@ static abi_long do_bsd_closefrom(abi_long arg1)
     return get_errno(0);
 }
 
+/* revoke(2) */
+static abi_long do_bsd_revoke(abi_long arg1)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(revoke(p)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* access(2) */
+static abi_long do_bsd_access(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(access(path(p), arg2));
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* eaccess(2) */
+static abi_long do_bsd_eaccess(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(eaccess(path(p), arg2));
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* faccessat(2) */
+static abi_long do_bsd_faccessat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(faccessat(arg1, p, arg3, arg4)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index f7d09909925..7b7af914e49 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -285,6 +285,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_closefrom(arg1);
         break;
 
+    case TARGET_FREEBSD_NR_revoke: /* revoke(2) */
+        ret = do_bsd_revoke(arg1);
+        break;
+
+    case TARGET_FREEBSD_NR_access: /* access(2) */
+        ret = do_bsd_access(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_eaccess: /* eaccess(2) */
+        ret = do_bsd_eaccess(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_faccessat: /* faccessat(2) */
+        ret = do_bsd_faccessat(arg1, arg2, arg3, arg4);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


