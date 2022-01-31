Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 436F34A505C
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:42:34 +0100 (CET)
Received: from localhost ([::1]:34472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdVR-0007ho-AB
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:42:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnj-00053h-TI
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:25 -0500
Received: from [2607:f8b0:4864:20::d2d] (port=38805
 helo=mail-io1-xd2d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002fs-O7
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:23 -0500
Received: by mail-io1-xd2d.google.com with SMTP id w7so18427240ioj.5
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r5D/XxRSLmmsB5rAEeVEsKXhTzCrfhyXP8EzMrhJHxQ=;
 b=VS7zOHLD5xKHelvh4Yc4YzIcLjD2iCzTWU1DQB5H1lgiv+g/WmRsiikr4ECwEVBj/J
 MbAT3Gh743EnOdRNa0CRM5cTFdIgiAmuHZnYofa/7phiQygNurF6wSJgXX05KlapVICx
 1vfAslZ8QTey4IGffietANscoX56YwCCWp18+0q114akDvj4RBT71eNWM1/iq4ACe/Q8
 Uqy3Hp3Ymn/rNNc/Uf+WUlHnadt8da+UCm4WWg7IrqBChMixcqdubu3yfGOMiSKAzGBq
 o9aOrf3jN9yTJ09RWv8bjdxPdfmMWTpcUpIwYZTkpmmXiyJeOrmwomfI5YEPbwUXFSbs
 rREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r5D/XxRSLmmsB5rAEeVEsKXhTzCrfhyXP8EzMrhJHxQ=;
 b=lruOAq/E2NM7UKr0/hVgfZFMRduoi9J7griXI1q2XsRyFGQVjFH8p7Qm9h0eOAvkfb
 1RgBCgg0zrG6EK4urOf4wY/NX4Fhsjk/FDTkQ5WPj1bGmSVIW6ZupjbXsMyTqJ+CILCF
 Q/jQ+zSxPcBZ3LCWPckoDuhfIxhBAWoYe6nn0QVQ89stUvkwsVlITJWKAlmUN3K3eAQY
 RMriyRQFKSgNb8zdxWxYIYVpKrhI/DvJDjSsDhitenZ8Qaa1bUB32a1s30cdu4LWbYu2
 iXN0s72amhK/xB2wFXAcOS3E9S06Qfnf0rfHGUPKnRl9PO5sRRTR44eL1ZzsUoxTMlGQ
 fEWw==
X-Gm-Message-State: AOAM532TdX+LPdlbHmTqKlF1FQAg/XdiEQpq2o1NT3rPmqba3n8IPl5R
 LwnDAmMmoouLSHzlfwV2/jlqQsbIOp5vvw==
X-Google-Smtp-Source: ABdhPJzHaY0h5y+du0Ki/IG1kF92I0XQx9+AENqXlVo5eKb7RbXu0F9w4fbq/4Pt5Fo44NQZV0TGaQ==
X-Received: by 2002:a05:6638:38a0:: with SMTP id
 b32mr10157240jav.228.1643659023766; 
 Mon, 31 Jan 2022 11:57:03 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.57.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:57:03 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/40] bsd-user/signal.c: tswap_siginfo
Date: Mon, 31 Jan 2022 12:56:29 -0700
Message-Id: <20220131195636.31991-34-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d2d
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Stacey Son <sson@FreeBSD.org>,
 Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Convert siginfo from targer to host.

Signed-off-by: Stacey Son <sson@FreeBSD.org>
Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal.c | 53 +++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index 366e047cccc..34e8c811ad6 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -256,6 +256,59 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
     tinfo->si_code = deposit32(si_code, 24, 8, si_type);
 }
 
+static void tswap_siginfo(target_siginfo_t *tinfo, const target_siginfo_t *info)
+{
+    int si_type = extract32(info->si_code, 24, 8);
+    int si_code = sextract32(info->si_code, 0, 24);
+
+    __put_user(info->si_signo, &tinfo->si_signo);
+    __put_user(info->si_errno, &tinfo->si_errno);
+    __put_user(si_code, &tinfo->si_code); /* Zero out si_type, it's internal */
+    __put_user(info->si_pid, &tinfo->si_pid);
+    __put_user(info->si_uid, &tinfo->si_uid);
+    __put_user(info->si_status, &tinfo->si_status);
+    __put_user(info->si_addr, &tinfo->si_addr);
+    /*
+     * Unswapped, because we passed it through mostly untouched.  si_value is
+     * opaque to the kernel, so we didn't bother with potentially wasting cycles
+     * to swap it into host byte order.
+     */
+    tinfo->si_value.sival_ptr = info->si_value.sival_ptr;
+
+    /*
+     * We can use our internal marker of which fields in the structure
+     * are valid, rather than duplicating the guesswork of
+     * host_to_target_siginfo_noswap() here.
+     */
+    switch (si_type) {
+    case QEMU_SI_NOINFO:        /* No additional info */
+        break;
+    case QEMU_SI_FAULT:
+        __put_user(info->_reason._fault._trapno,
+                   &tinfo->_reason._fault._trapno);
+        break;
+    case QEMU_SI_TIMER:
+        __put_user(info->_reason._timer._timerid,
+                   &tinfo->_reason._timer._timerid);
+        __put_user(info->_reason._timer._overrun,
+                   &tinfo->_reason._timer._overrun);
+        break;
+    case QEMU_SI_MESGQ:
+        __put_user(info->_reason._mesgq._mqd, &tinfo->_reason._mesgq._mqd);
+        break;
+    case QEMU_SI_POLL:
+        /* Note: Not generated on FreeBSD */
+        __put_user(info->_reason._poll._band, &tinfo->_reason._poll._band);
+        break;
+    case QEMU_SI_CAPSICUM:
+        __put_user(info->_reason._capsicum._syscall,
+                   &tinfo->_reason._capsicum._syscall);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
 /* Returns 1 if given signal should dump core if not handled. */
 static int core_dump_signal(int sig)
 {
-- 
2.33.1


