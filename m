Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3C1564071
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Jul 2022 15:59:30 +0200 (CEST)
Received: from localhost ([::1]:56010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7dej-0000xG-Rl
	for lists+qemu-devel@lfdr.de; Sat, 02 Jul 2022 09:59:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc6-0006dm-HQ
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:46 -0400
Received: from mail-io1-xd35.google.com ([2607:f8b0:4864:20::d35]:45895)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1o7dc4-0000a8-VQ
 for qemu-devel@nongnu.org; Sat, 02 Jul 2022 09:56:46 -0400
Received: by mail-io1-xd35.google.com with SMTP id y2so4697625ior.12
 for <qemu-devel@nongnu.org>; Sat, 02 Jul 2022 06:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eBqWqkQgsRng63/sJNZmq8NBH7vr2Z23dtkmb5w8maI=;
 b=D1qL1/jnMuEmqxflPA5UJuGRtgWaLmQvUBcq7DJGN1pj7iVNEkCh/BgFeAVexfHjiC
 rJ/8R+6oi2TfbvVew46mv9KlhG5JWT2l1U1NUuzYVPYkt7r7P4RWH02ViA0IfFXgfwVM
 5+98tXnW/cofUzgNrV6eO1PYxHF+vfOmsVsjhqQmf0pfoqCdQaHTXYl4kQaANXuM6DFA
 c5fr1+X97fKPj0BrPmRd08Q5e3bGzaPJ8PK6yAV5aNdKCubigU2k2lQKcXuqdWan0qH1
 RwQ6hrdwFjGWreoalNj9+Tla4auh1XYDyBERjVCQWVSJKoz8EMbQyLZyWBL1JfzMuiha
 +37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eBqWqkQgsRng63/sJNZmq8NBH7vr2Z23dtkmb5w8maI=;
 b=D5EGmMOGzfXYEE2JZlWfp/5ZAwX/ZR9Bafe9baxrOVqHOzg7DpJaOzM/VGoqiuCbr0
 k15WJ71G7puRZRSWe+rKWxepn0Tv/yS+X805zVQly5dusPi9TSharHYlLOiRDD9GX8xL
 fsK9azxSDoOBaYlRGwc6S+O4/Ohs0C+lwFUNfwcCSvMlWtlbxx7Is0K5bg/k4XtC4LsE
 AXy0oAG7hM02cgFL9sxHEjl1hDru7mIDsOpx735aiQC+3nzaUgL7qXZkg2Fh1aMYgU6D
 8wvz9g5nL42Heta8YaREGafWKyDfdpwYpbNmx+tkjC+ro5lR36UPnnrzpJWUso5Z6xxe
 J4OQ==
X-Gm-Message-State: AJIora+TFCYB+qAka5TV4wYbIRPhUOKU2ABb+a8lO2eB8axFDICH29hZ
 iAgZrAHLnykWvn3dcRRTTAkLA6H4ejHBAw==
X-Google-Smtp-Source: AGRyM1sqlWAOojKinBw187nhHLR4x7B4Ae0KrUL6HRc59OR6M4djQDkS8ucKHyKtggrVD8BKVMVchQ==
X-Received: by 2002:a02:6a1e:0:b0:331:f9b9:a920 with SMTP id
 l30-20020a026a1e000000b00331f9b9a920mr11163674jac.44.1656770203530; 
 Sat, 02 Jul 2022 06:56:43 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174]) by smtp.gmail.com with ESMTPSA id
 q189-20020a6b8ec6000000b0065a47e16f4esm11584278iod.32.2022.07.02.06.56.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Jul 2022 06:56:42 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: Kyle Evans <kevans@freebsd.org>, Warner Losh <imp@bsdimp.com>,
 Stacey Son <sson@FreeBSD.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 03/11] bsd-user: implement chmod, fchmod, lchmod and fchmodat
Date: Sat,  2 Jul 2022 07:56:58 -0600
Message-Id: <20220702135706.73622-4-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220702135706.73622-1-imp@bsdimp.com>
References: <20220702135706.73622-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
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
 bsd-user/bsd-file.h           | 46 +++++++++++++++++++++++++++++++++++
 bsd-user/freebsd/os-syscall.c | 16 ++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/bsd-user/bsd-file.h b/bsd-user/bsd-file.h
index 635ac8d0e62..1af79866fc6 100644
--- a/bsd-user/bsd-file.h
+++ b/bsd-user/bsd-file.h
@@ -675,4 +675,50 @@ static abi_long do_bsd_readlinkat(abi_long arg1, abi_long arg2,
     return ret;
 }
 
+/* chmod(2) */
+static abi_long do_bsd_chmod(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(chmod(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchmod(2) */
+static abi_long do_bsd_fchmod(abi_long arg1, abi_long arg2)
+{
+    return get_errno(fchmod(arg1, arg2));
+}
+
+/* lchmod(2) */
+static abi_long do_bsd_lchmod(abi_long arg1, abi_long arg2)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg1);
+    ret = get_errno(lchmod(p, arg2)); /* XXX path(p)? */
+    UNLOCK_PATH(p, arg1);
+
+    return ret;
+}
+
+/* fchmodat(2) */
+static abi_long do_bsd_fchmodat(abi_long arg1, abi_long arg2,
+        abi_long arg3, abi_long arg4)
+{
+    abi_long ret;
+    void *p;
+
+    LOCK_PATH(p, arg2);
+    ret = get_errno(fchmodat(arg1, p, arg3, arg4));
+    UNLOCK_PATH(p, arg2);
+
+    return ret;
+}
+
 #endif /* BSD_FILE_H */
diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index 80ec9dd4954..b33d548a4b6 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -402,6 +402,22 @@ static abi_long freebsd_syscall(void *cpu_env, int num, abi_long arg1,
         ret = do_bsd_readlinkat(arg1, arg2, arg3, arg4);
         break;
 
+    case TARGET_FREEBSD_NR_chmod: /* chmod(2) */
+        ret = do_bsd_chmod(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_fchmod: /* fchmod(2) */
+        ret = do_bsd_fchmod(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_lchmod: /* lchmod(2) */
+        ret = do_bsd_lchmod(arg1, arg2);
+        break;
+
+    case TARGET_FREEBSD_NR_fchmodat: /* fchmodat(2) */
+        ret = do_bsd_fchmodat(arg1, arg2, arg3, arg4);
+        break;
+
     default:
         qemu_log_mask(LOG_UNIMP, "Unsupported syscall: %d\n", num);
         ret = -TARGET_ENOSYS;
-- 
2.33.1


