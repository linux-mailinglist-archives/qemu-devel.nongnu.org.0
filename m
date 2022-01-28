Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189834A04B2
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 00:57:11 +0100 (CET)
Received: from localhost ([::1]:54194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDb78-0002x6-5H
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 18:57:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDag4-0000tN-4C
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:12 -0500
Received: from [2607:f8b0:4864:20::d33] (port=46962
 helo=mail-io1-xd33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafi-0001bI-UU
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:08 -0500
Received: by mail-io1-xd33.google.com with SMTP id e79so9638143iof.13
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=r5D/XxRSLmmsB5rAEeVEsKXhTzCrfhyXP8EzMrhJHxQ=;
 b=dS7yuikl/7GIkxCvhMCpTYOeybrf4dW+O3VbTrkgvAPvrzu8zEd0p57yBfax9CVu4B
 pn79n6+ZnRqU9JyABMUlRNv+hlIP71edCn9yq+UN84peqmzGMu2WKBF4iYRoho02uOv+
 TahXxh9+RzZQqGMKt7sCDSnL2S+Nd7tw7QUG1sAu8L/DwHRU3uCoSBeH92rd2Ivlri2i
 nyESiySds6Y0axmzNGzFx0EObM/jfs86x2Ks8ZcwFUiqtlR+PTUx1UdWlGdGFFvtySdS
 ito4VEsU/EC9dd61IfUFoNbm6IFyx3NLq8cjC4P8lL+qU0OW0dyn+KvVUPZaQKmiS3+h
 pghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=r5D/XxRSLmmsB5rAEeVEsKXhTzCrfhyXP8EzMrhJHxQ=;
 b=rp9Z2jJcLA4Eoqf/D+Oo59uqVkD/tl+KFzcrKdpz6Eyi3UstZb31Tz6oabW+CW/Lj4
 F/mY00KNzSiX2jyueU8s/xpB89In3C8RZcpzxKvi06bskoj6ArwTpF4WysBIPXwoVg4i
 xwuACLSeF+rrDZLqNvy2zzst8AQk81I24dFfDTPU9XIVhWF/FvPqxm+FVF3sKQtVZEYo
 ePK2cQPrsV9l9hb9vx0/tv4Sw6Pg0hmoP3pC9Z4NlrXKLJ/Qr/ckb164DzemRnKLStYD
 wuqIAhdgalmsiFjmes65zwZWrlQOA92MW1XnylEi34sQ3ZHbt8OZd2E1FLnhTI/ICJ4x
 SzUA==
X-Gm-Message-State: AOAM532UxFIUrQdaNPMQFkBFBhCn9FRwrGcitCMlYRmR8dtxwoAHpwLT
 PdGob+gb9pqUIpe3MXEpcQ/VeH21WkGQ1A==
X-Google-Smtp-Source: ABdhPJw2S2BHrLQ5ORZGNRclRpRmLBwjTxubx18+Ly9zyfcTRlKE/bF2uyEk1tmXZuvNH9w9/2JIdw==
X-Received: by 2002:a05:6638:389a:: with SMTP id
 b26mr5141577jav.158.1643412519344; 
 Fri, 28 Jan 2022 15:28:39 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:38 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 33/40] bsd-user/signal.c: tswap_siginfo
Date: Fri, 28 Jan 2022 16:27:58 -0700
Message-Id: <20220128232805.86191-34-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d33
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d33;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd33.google.com
X-Spam_score_int: 8
X-Spam_score: 0.8
X-Spam_bar: /
X-Spam_report: (0.8 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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


