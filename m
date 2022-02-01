Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B354A5BEB
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 13:10:56 +0100 (CET)
Received: from localhost ([::1]:50618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nErzq-0007mr-Fu
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 07:10:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7s-0005C0-Iz
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:11 -0500
Received: from [2607:f8b0:4864:20::d36] (port=44954
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEr7p-0003bB-LW
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 06:15:08 -0500
Received: by mail-io1-xd36.google.com with SMTP id p63so19849326iod.11
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 03:15:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=G4Vpw/I6iiWTN4s+j93oyFd2/tcBHu47g5sAn9S/ES0=;
 b=isHEHkKiNNbHew016kZen0+Heg2bYJTdAxx0ILhH3e4noiZquiUMsdG6AwQgBocnjH
 FtaL68tNyfEWG7LbC5+4mP/RRHEpdBGhkTvDRMO2fVnNSSB+CqJx9TPghEWAmQ0s0ZIQ
 7e9QVPHaV9e7vE1GC/Cjmt7CqRSdBebB4Djg2LA6d70MVgtYmNFGKkxgbrkiSh4CbcTj
 H4FwQL0F5G4axVoFr32qdxrqPmsu2fU2sQYYKoL9/8M0xdVu+cMFrmdizTrQLgvzOhZc
 zCebBt4r8r74otYM47yU2AOpPCYCESF+86lGNSCVL6Z4fbbIINtFwbx7460CYEzAvXwq
 0Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=G4Vpw/I6iiWTN4s+j93oyFd2/tcBHu47g5sAn9S/ES0=;
 b=jN/mGemUGH5VVW0bhftrv1Pt/mHtODKritpbOMBCyRPDJa8HFcpd9iD5C9CguAtep6
 dtNVKPC/i47mAclF2HQFTdyt9WeDeHbIg2laW9eYgEX3CeNQI3auLnsnoZpkGIPVVv6n
 PJAMwYtvo0qmdBP82Nb+veV8cNo4BjqiTrvRtfEamfg7gxJf6onFuZjhF34Tl93V3Rws
 H4FDsW1tP0PPwuuAAzwGLTEK4Pm8eo/YpU/95er79pjeht6ZgbOUsPTTp2ewBEG6rNuh
 qgqeUMg5AwxohRGKbQffqFt543es0zTa3ODnnFE4j5dGGoZODx4kfaW5nryWNNqTx4o4
 bfuA==
X-Gm-Message-State: AOAM533NutajzIEraFoQ1aQSEX4gZCaPojNQ4m39FSHYi6DNWmr5HgmI
 QWAmZf43ciaQqs4HZ0YRvz6JxoQ4siOyAg==
X-Google-Smtp-Source: ABdhPJz20TFEqs3iRwKAEzaVD5lpnAoDmYZIX2S2QddPXiD1ekd5DoSFKoWfHxQpEdam6qzrn/Q2nA==
X-Received: by 2002:a05:6602:72f:: with SMTP id
 g15mr13365435iox.25.1643714104307; 
 Tue, 01 Feb 2022 03:15:04 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id w5sm13526852ilu.83.2022.02.01.03.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 03:15:03 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/22] bsd-user/freebsd/os-syscall.c: Tracing and error
 boilerplate
Date: Tue,  1 Feb 2022 04:14:49 -0700
Message-Id: <20220201111455.52511-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201111455.52511-1-imp@bsdimp.com>
References: <20220201111455.52511-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d36
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d36;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd36.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, arrowd@FreeBSD.org,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add in the tracing and this system call not implemented boilerplate.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/freebsd/os-syscall.c | 27 ++++++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/bsd-user/freebsd/os-syscall.c b/bsd-user/freebsd/os-syscall.c
index d49945f0fcc..fcfa6221182 100644
--- a/bsd-user/freebsd/os-syscall.c
+++ b/bsd-user/freebsd/os-syscall.c
@@ -200,7 +200,32 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
                             abi_long arg5, abi_long arg6, abi_long arg7,
                             abi_long arg8)
 {
-    return 0;
+    CPUState *cpu = env_cpu(cpu_env);
+    abi_long ret;
+
+#ifdef DEBUG
+    gemu_log("freebsd syscall %d\n", num);
+#endif
+    trace_guest_user_syscall(cpu, num, arg1, arg2, arg3, arg4, arg5, arg6, arg7, arg8);
+    if (do_strace) {
+        print_freebsd_syscall(num, arg1, arg2, arg3, arg4, arg5, arg6);
+    }
+
+    switch (num) {
+    default:
+        gemu_log("qemu: unsupported syscall: %d\n", num);
+        ret = -TARGET_ENOSYS;
+        break;
+    }
+
+#ifdef DEBUG
+    gemu_log(" = %ld\n", ret);
+#endif
+    if (do_strace) {
+        print_freebsd_syscall_ret(num, ret);
+    }
+    trace_guest_user_syscall_ret(cpu, num, ret);
+    return ret;
 }
 
 void syscall_init(void)
-- 
2.33.1


