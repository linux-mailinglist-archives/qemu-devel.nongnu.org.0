Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6E4356409E
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 16:07:49 +0200 (CEST)
Received: from localhost ([::1]:47588 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dmm-00063g-UP
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 10:07:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dcD-0006rZ-Jw
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:53 -0400
Received: from mail-il1-x12b.google.com ([2607:f8b0:4864:20::12b]:33563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dcB-0000bB-3M
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:53 -0400
Received: by mail-il1-x12b.google.com with SMTP id p13so3064705ilq.0
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 06:56:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=guUnp9hZinCJOwjoZiIYjs2izQAW1BB4o6jwqxF1ChQ=;
 b=symEcLE/iM3Fat/jrFRd8gDYCjnjCAcObRsN0IC71AVEdkOc3ExR7gfpePwLzaD6YP
 A4bM2qhnwEuNehjSDoeDx1LCraoEsoXCUJjnJeUc4mo86ALTZT5lrsOzn0JHQ4NCPSef
 N88qeaLgFszZdO0LuItm/9pw3Lg0L5RwciAdZ0tOUB9kcEgq7s16Ka1szA9PiLUgYRgd
 1SwXOy55iYBc4PP8Ac+xBiybXJPrWSIeVXvAZEtbhttM3VX5d8XFdWgCTUkQvVJwMhz5
 MOXyZqfsNu55GW93GA3+VwzEgDZtPRuFLjLXhnR2zfv8yR7FyGQ+7hEpUR+5T7vMHuxX
 Fbsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=guUnp9hZinCJOwjoZiIYjs2izQAW1BB4o6jwqxF1ChQ=;
 b=ZiHdwQKm6lLuoEiFHL35GnslfWMnz0NOeB+JheFJ/ApebrVkH5astLr+JCVzR2H576
 Zr3xFzFygs7ymE4xXzUNRP0QG2EGEwDIXBiwJX99RITNQM1/0SMteB/OQMvPxAk8N26m
 NudS8/vvSOfGdCEtK5bjVG6kDb7luQfoSjEIN8KEntFNcZPSYxYs7qAUbifnlc42TksJ
 hGKSMjMoAfTF/yz889GzCDL/NfXt4NJpd2vuiwVESkzT6wdhrJoOa5ignLzZlB+K5wN2
 qVJ21hTozMeomgM9pkJamjB4s0bUiXMXu5euQIibW0Qwv8B7kcUev0/iYryHCp0div/Z
 ZR3A==
X-Gm-Message-State: AJIora8UX5PfYfGinvJ1u5q3ttUpLJAhJAfSHzIwdedazSfFg+HnrZuL
 HmvGF2lfmLCrWigKMkk/UQt0PzMhSPxMOA==
X-Google-Smtp-Source: AGRyM1t/heXUB2TCdYvRXwOXNpAox4g3gypQklJ6Fe4Hxi6HMj+qGeDcTQ2X/SHvIhODmrKUckQr/A==
X-Received: by 2002:a05:6e02:1647:b0:2d9:532c:d799 with SMTP id
 v7-20020a056e02164700b002d9532cd799mr10949156ilu.323.1656770208853; 
 Sat, 02 Jul 2022 06:56:48 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q189-20020a6b8ec6000000b0065a47e16f4esm11584278iod.32.2022.07.02.06.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 06:56:48 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 08/11] bsd-user: Implement mkfifo and mkfifoat
Date: Sat,  2 Jul 2022 07:57:03 -0600
Message-Id: <20220702135706.73622-9-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220702135706.73622-1-imp@bsdimp.com>
References: <20220702135706.73622-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12b;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12b.google.com
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
 bsd-user/bsd-file.h           | 27 +++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c |  8 ++++++++
 2 files changed, 35 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index c24054fed11..4b2f6dcc1dc 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -867,4 +867,31 @@ static abi_long do_bsd_flock(abi_long arg1, abi_long arg2)
     return get_errno(flock(arg1, arg2));
 }
 
+/* mkfifo(2) */
+static abi_long do_bsd_mkfifo(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(mkfifo(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* mkfifoat(2) */
+static abi_long do_bsd_mkfifoat(abi_long arg1, abi_long arg2,
+        abi_long arg3)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(mkfifoat(arg1, p, arg3));
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index d252fb40737..be225195fbd 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -467,6 +467,14 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_flock(arg1, arg2);
         break;
 
+    case TARGET_FREEBSD_NR_mkfifo: /* mkfifo(2) */
+        ret = do_bsd_mkfifo(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_mkfifoat: /* mkfifoat(2) */
+        ret = do_bsd_mkfifoat(arg1, arg2, arg3);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


