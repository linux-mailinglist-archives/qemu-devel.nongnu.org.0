Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B20488AA1
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:41:26 +0100 (CET)
Received: from localhost ([::1]:42942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bG1-00063q-5N
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:41:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av9-0005tB-9r
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:51 -0500
Received: from [2607:f8b0:4864:20::d35] (port=42923
 helo=mail-io1-xd35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6av6-000792-Tw
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:51 -0500
Received: by mail-io1-xd35.google.com with SMTP id o7so14344500ioo.9
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Zb02sLCJzpt+9eV8e5SNqnK+bO9oNMK4sRt96jmqBiI=;
 b=YShUIeQKyBrE0BD3UkJHRnaFM7i6qtMfEReOC82lGKlOdtJnGkDSPjaUUSVehLk9zm
 7z42K7YvkA2pZWgpy88mr2vDvUTxkaKXl7dRTXHThtYgqo1GqQDJoXp0LtT2hGdsisqp
 15esNCII26elqkjVLc3EVP7Bi3ACqMBOlRXTXa3WspbZOlf6bqwepJlt4g6vmbfULoWz
 2FoMfypFPjoSgrFxkyWx1j4IPKcjGks2TjZ2/FGKJT9JAKieqOs/RW0SSWGDidGTwW7u
 zGK5+Kq0K0CdpsL0+wuZ7TlzehGeIMisRb70zzg+Zd0O1ClfpzkZ8M8q/Uzmm32vzCPi
 BIyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Zb02sLCJzpt+9eV8e5SNqnK+bO9oNMK4sRt96jmqBiI=;
 b=wq9cxttAOGZn/PEe++wa1NhkcqLNrgvaXM4Uh1gqD+guYDIjzgTO0XcMz0toWkFhT4
 bTvMS+RxNsR+E/nY9Upj8iR1ucFaAcsxdjINvHNKtMMl7WlXz7efFP0d5PLYfnK1CswP
 wB7K8DIHw3qoMTtfADn+OizGxWDDbCedlvTcYSRbNYeSEuJUHADNC8xeoAygdbbZPcq3
 ob4s6BhIDaZY4tZGbgrPXZ7AZok1xi3moSLMegk+vEtDEQIMON7mp20/ND/8Nb3j4y5x
 E9nZbxpMVVq28w+awCCKQGGT2f6SP9CeOhQnxjstLx8NfYRvfWtiR4w2r6r4C7+GpW4x
 szGg==
X-Gm-Message-State: AOAM5334pBkfwt5HDFD0K0E7qvVtU8p2lL9LLwogjPPH+1KEgJzFyhCT
 6KXlKBK2tbcN+I8Wr+cOglyEnaL3z08k0lMx
X-Google-Smtp-Source: ABdhPJxkOEYJj/ZPqFSP+wJohIc1vY95JK7k2yfLMSrn1ex1tZaKjTrswJRrnl6bmbx88Co1xnH4HQ==
X-Received: by 2002:a05:6638:142:: with SMTP id
 y2mr34591693jao.195.1641745187680; 
 Sun, 09 Jan 2022 08:19:47 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:47 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 16/30] bsd-user/signal.c: host_to_target_siginfo_noswap
Date: Sun,  9 Jan 2022 09:19:09 -0700
Message-Id: <20220109161923.85683-17-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d35
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d35;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd35.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Kyle Evans <kevans@freebsd.org>, Stacey Son <sson@FreeBSD.org>,
 Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement conversion of host to target siginfo.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 7168d851be8..3fe8b2d9898 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -43,6 +43,43 @@ int target_to_host_signal(int sig)
     return sig;
 }
 
+/* Siginfo conversion. */
+static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
+        const siginfo_t *info)
+{
+    int sig, code;
+
+    sig = host_to_target_signal(info->si_signo);
+    /* XXX should have host_to_target_si_code() */
+    code = tswap32(info->si_code);
+    tinfo->si_signo = sig;
+    tinfo->si_errno = info->si_errno;
+    tinfo->si_code = info->si_code;
+    tinfo->si_pid = info->si_pid;
+    tinfo->si_uid = info->si_uid;
+    tinfo->si_status = info->si_status;
+    tinfo->si_addr = (abi_ulong)(unsigned long)info->si_addr;
+    /* si_value is opaque to kernel */
+    tinfo->si_value.sival_ptr =
+        (abi_ulong)(unsigned long)info->si_value.sival_ptr;
+    if (SIGILL == sig || SIGFPE == sig || SIGSEGV == sig || SIGBUS == sig ||
+            SIGTRAP == sig) {
+        tinfo->_reason._fault._trapno = info->_reason._fault._trapno;
+    }
+#ifdef SIGPOLL
+    if (SIGPOLL == sig) {
+        tinfo->_reason._poll._band = info->_reason._poll._band;
+    }
+#endif
+    if (SI_TIMER == code) {
+        int timerid;
+
+        timerid = info->_reason._timer._timerid;
+        tinfo->_reason._timer._timerid = timerid;
+        tinfo->_reason._timer._overrun = info->_reason._timer._overrun;
+    }
+}
+
 /*
  * Queue a signal so that it will be send to the virtual CPU as soon as
  * possible.
-- 
2.33.1


