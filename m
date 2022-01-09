Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02B3488AB5
	for <lists+qemu-devel@lfdr.de>; Sun,  9 Jan 2022 17:56:10 +0100 (CET)
Received: from localhost ([::1]:36584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6bUH-0004ej-RC
	for lists+qemu-devel@lfdr.de; Sun, 09 Jan 2022 11:56:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50746)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avH-00068D-8E
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:20:00 -0500
Received: from [2607:f8b0:4864:20::133] (port=46621
 helo=mail-il1-x133.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1n6avF-0007An-RB
 for qemu-devel@nongnu.org; Sun, 09 Jan 2022 11:19:59 -0500
Received: by mail-il1-x133.google.com with SMTP id e8so9250308ilm.13
 for <qemu-devel@nongnu.org>; Sun, 09 Jan 2022 08:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lCK1OHSQl9Im63sCA2nGuP0lIosQYGcMtjnevAY5QWY=;
 b=zGl1r8b7hJqY0CNcHh6s3ZTmt1PGSbtT89B0dJjsQu7KTwvJN8PJFilKhW1NdWJ47q
 5tMmBXLnBibzq58VLmz6T0y4E1LHepHp5h8D9S6q26G5bUsPC3JOP/JId0H17KWeRnwr
 y4M6F4NrtrLL982CgQFvH0OKIeHxBDqRUZRG8g4aQmym3PCDsXhyflxBE5M1jXHn0vpM
 xTjT8oia864Yr1O2IoTsx8KL9ckfh6UnV19RT3KqEfznl9kvtatpOk6EIxqToxItzZCz
 pKmeFLDg/iG9kaXbHC0/sk+q25HINfjYBm8w+tItQb+T+cB6K6VpFVQnUOtp1SWqZyDN
 UM0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lCK1OHSQl9Im63sCA2nGuP0lIosQYGcMtjnevAY5QWY=;
 b=D8bFMVHSseBWj5TqfVSmxAQgzmrdmzgWEYjIui1YuGLnPUjBp9pT8ZIf2O0W0urgAF
 42X0WbohbzY+Vpc3mPjqMemHAuvKpqryWFKv3uSYzggyyKGcqSIKuIQvZvWtTr34sGzX
 aFhpq1g/4syRMOsl5HkijyhgKaxGZmomg8STm0y2PfJtaC0YYfI1zQfEKpBRzWCAuYfW
 /EFBSbVEbpMcnR6hQObEAolRJY9ebdk4g6jH3QjvndmUl5CEiLySVRTpQRpcajKdpmOW
 3rdgd0Z2bPAzWiExniehuywRElcgZ1Xrkvf0Pb3dILujvGSTQB3FUu3fdjsv6FM4EUpt
 wOPw==
X-Gm-Message-State: AOAM530ZOSV3sD5Rv9zGrgK2IVhz2zEQ5Zfx4iHKt8Opt/wUo4UK7PEC
 PJiWJbU7uQ1hxVDMQ9BY6aeee6OUJhLav/di
X-Google-Smtp-Source: ABdhPJxuaDs9GUeKRXAchpa00FQYwlGHQjSF/qY0D3MKlaihcI4m/qI8JyZ6amADiq+4X6wicp912g==
X-Received: by 2002:a05:6e02:b45:: with SMTP id
 f5mr35815937ilu.131.1641745196531; 
 Sun, 09 Jan 2022 08:19:56 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id u10sm2683386ilq.76.2022.01.09.08.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 08:19:56 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 26/30] bsd-user/signal.c: tswap_siginfo
Date: Sun,  9 Jan 2022 09:19:19 -0700
Message-Id: <20220109161923.85683-27-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220109161923.85683-1-imp@bsdimp.com>
References: <20220109161923.85683-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::133
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::133;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x133.google.com
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

Convert siginfo from targer to host.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 934528d5fb0..c954d0f4f37 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -197,6 +197,40 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
     }
 }
 
+static void tswap_siginfo(target_siginfo_t *tinfo, const target_siginfo_t *info)
+{
+    int sig, code;
+
+    sig = info->si_signo;
+    code = info->si_code;
+    tinfo->si_signo = tswap32(sig);
+    tinfo->si_errno = tswap32(info->si_errno);
+    tinfo->si_code = tswap32(info->si_code);
+    tinfo->si_pid = tswap32(info->si_pid);
+    tinfo->si_uid = tswap32(info->si_uid);
+    tinfo->si_status = tswap32(info->si_status);
+    tinfo->si_addr = tswapal(info->si_addr);
+    /*
+     * Unswapped, because we passed it through mostly untouched.  si_value is
+     * opaque to the kernel, so we didn't bother with potentially wasting cycles
+     * to swap it into host byte order.
+     */
+    tinfo->si_value.sival_ptr = info->si_value.sival_ptr;
+    if (SIGILL == sig || SIGFPE == sig || SIGSEGV == sig || SIGBUS == sig ||
+            SIGTRAP == sig) {
+        tinfo->_reason._fault._trapno = tswap32(info->_reason._fault._trapno);
+    }
+#ifdef SIGPOLL
+    if (SIGPOLL == sig) {
+        tinfo->_reason._poll._band = tswap32(info->_reason._poll._band);
+    }
+#endif
+    if (SI_TIMER == code) {
+        tinfo->_reason._timer._timerid = tswap32(info->_reason._timer._timerid);
+        tinfo->_reason._timer._overrun = tswap32(info->_reason._timer._overrun);
+    }
+}
+
 /* Returns 1 if given signal should dump core if not handled. */
 static int core_dump_signal(int sig)
 {
-- 
2.33.1


