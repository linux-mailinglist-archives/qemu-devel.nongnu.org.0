Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 680BD49A21B
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 02:47:04 +0100 (CET)
Received: from localhost ([::1]:35388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCAvH-0008Hu-A5
	for lists+qemu-devel@lfdr.de; Mon, 24 Jan 2022 20:47:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAer-00020M-Oi
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:06 -0500
Received: from [2607:f8b0:4864:20::12e] (port=45900
 helo=mail-il1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nCAeq-0001OV-0z
 for qemu-devel@nongnu.org; Mon, 24 Jan 2022 20:30:05 -0500
Received: by mail-il1-x12e.google.com with SMTP id h30so15509977ila.12
 for <qemu-devel@nongnu.org>; Mon, 24 Jan 2022 17:30:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iCsKA4kDQTvpLyBCS5CIeJJTF7x2VsyKrnhUovgahmE=;
 b=0wsUT0mGXxZSxaL98MEGwGxwwcM+aewrDnUfasx1CP8wy92AAjfx6su497DMSY5/mb
 LSNVm55cTttZXG21Kp9f5G9QP/OWCunLMau7BtjeJfFlZnJ+8kmBv/hGV4I96GpM7DE7
 VS8udWtjHWpCKtO2S+zQ38jAZl1KROnZ5JYEAm0bOMT123nAwJRGgajI7xjwC2WryFiS
 +kp3vHnk0f+QYQKU+WK/iXJJuG7sHzdXFCclP462TyQ16RmhkDCzYPEM6c6nx8OSxMJo
 2lt8vUH3HEev3wveBja7R4xcYI5HDnG65cNFSUXtwva9+pDT4QU8NEYeiBC/GCjz3zfp
 npmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iCsKA4kDQTvpLyBCS5CIeJJTF7x2VsyKrnhUovgahmE=;
 b=F+NQDZjiLmFOte6xqFEpQOjeHZHIv6pLd2yX0eOvS07zQSFgDl8JkIpDf3iWXCE7GB
 jzBOtMykcYkHLNPKgfCjDCPj5IDsy4Il7CcuKVBpg+l3A7QrnL3I/cmZ/11f9MbZ8nzb
 nGWEWNsYoYJ30I465Nx1ZA6hDP1oO1ttvfxhH29vNM8TW6Ah9lUZkZha3s+O/jlAiSVA
 f7vnouGQ4JSPaCh1Yf//Hhaq7pNd4YVBBFa30c2y4i7nwqs317eAILcnK2aL82NuXxLb
 U+1sCk/30WZSjD2aJqrUlttK12TRGt0f26dpmjoW8Bym24r1U+dSDzvErvaHzViSwAk1
 WUJw==
X-Gm-Message-State: AOAM530Uw6ModoVJMeRgRxdlJ6IZo4PsOIaqHT6+TbnenSG9crQJIi4j
 cQeWORXVjdWMwueek/fDbKJTCHnGUTzRRA==
X-Google-Smtp-Source: ABdhPJylM9MXxwwVMPcHHNwJisr3PktKTHuZdYDrdHTOu5cueXijxGpfxoc6KQJQfQDZrv1SN9D0Mw==
X-Received: by 2002:a05:6e02:1be6:: with SMTP id
 y6mr9475389ilv.12.1643074201537; 
 Mon, 24 Jan 2022 17:30:01 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id q14sm2061687ilo.63.2022.01.24.17.30.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 17:30:01 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/40] bsd-user/signal-common.h: Move signal functions
 prototypes to here
Date: Mon, 24 Jan 2022 18:29:16 -0700
Message-Id: <20220125012947.14974-10-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220125012947.14974-1-imp@bsdimp.com>
References: <20220125012947.14974-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12e
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::12e;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12e.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/qemu.h          | 8 --------
 bsd-user/signal-common.h | 6 ++++++
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 671b26f00cc..99c37fc9942 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -199,14 +199,6 @@ print_openbsd_syscall(int num,
 void print_openbsd_syscall_ret(int num, abi_long ret);
 extern int do_strace;
 
-/* signal.c */
-void process_pending_signals(CPUArchState *cpu_env);
-void signal_init(void);
-long do_sigreturn(CPUArchState *env);
-long do_rt_sigreturn(CPUArchState *env);
-void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
-abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
-
 /* mmap.c */
 int target_mprotect(abi_ulong start, abi_ulong len, int prot);
 abi_long target_mmap(abi_ulong start, abi_ulong len, int prot,
diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
index 6207417d39e..f9a9d1e01aa 100644
--- a/bsd-user/signal-common.h
+++ b/bsd-user/signal-common.h
@@ -9,6 +9,12 @@
 #ifndef SIGNAL_COMMON_H
 #define SIGNAL_COMMON_H
 
+long do_rt_sigreturn(CPUArchState *env);
+abi_long do_sigaltstack(abi_ulong uss_addr, abi_ulong uoss_addr, abi_ulong sp);
+long do_sigreturn(CPUArchState *env);
 void force_sig_fault(int sig, int code, abi_ulong addr);
+void process_pending_signals(CPUArchState *env);
+void queue_signal(CPUArchState *env, int sig, target_siginfo_t *info);
+void signal_init(void);
 
 #endif
-- 
2.33.1


