Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0BA94A6894
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 00:36:58 +0100 (CET)
Received: from localhost ([::1]:56392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF2hl-0004Vf-MW
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 18:36:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nF1BN-0007CJ-RM
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:59:26 -0500
Received: from [2607:f8b0:4864:20::d36] (port=35514
 helo=mail-io1-xd36.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nF1BI-000804-PG
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:59:25 -0500
Received: by mail-io1-xd36.google.com with SMTP id 9so23119086iou.2
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:59:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nrFyJIsCSOFMSAloZZydQhEgevJuu/hdGTZ3nxAMEAE=;
 b=yn/H7790oDeJxwN7MN7cIGa3zGNTa0/EJytgxqfF1ptoHDLEJ4/3kq1UTufWRBZPki
 qcPUbD2VjbCqHMfaZYf6vW8KvjmGQ95KoMz+EGm2tzBuIZqOgdAVzEWLucHp+Z0zcNU5
 sN1S1GXfF/CxxiFy6qxhBL7LvoXCrMVoFIMMwXGb6h40zIh9HUHoA7R46QGPHX/fzLXj
 fT5UoLKpxTOTMvp5iyRPSzT93pYB7n4kN4oE4FPZoKdNbeq/irmkkD2CUJd1GuPey5Xu
 0Cqm9AAj+alJV0jruEE9oRPGySGmglRBBLqoDD89RL9AOJ98cvDFOZdI6z7nOH4qqdG/
 pViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nrFyJIsCSOFMSAloZZydQhEgevJuu/hdGTZ3nxAMEAE=;
 b=60pL0H6LkVG7t4vEFg5hT1J+IauVVTttVBKTw8d//PfvNrdNz12a6l1NVU8NxGfcaa
 0k53Vdp3Eksq9upn6bhzubHbZw08GDyRGysW7sySQuz33H/TMZYaHsEMX7zlBH3bbv/V
 BkSabU70ocrC10BwmtTT6FCbuB+dZpMLNNDPcIpycDZLyHPn3xEfBNQpz7BiVWctegEK
 QMR7YPXoYKFf0QE5Gvt7ncD4ijGLBTgN/TGGhN1kmKmksxVbkuvcgIaR1WbXhtPkaWB5
 U45n0o5LQJ59jghAkEPPXB5sC2avR3TVgh9NTf9+5UJds2TMEBKH2fk1iWPXwPyOxg3d
 PBLQ==
X-Gm-Message-State: AOAM532eMDAEw7QsqJ6daHf3MIjT41rR2e/idf29WpZEaaOJxovFKeuW
 oEAYNAPDDFJgTBUlpfWK1QRKn9U7OVCe/A==
X-Google-Smtp-Source: ABdhPJyl8ExneUWadkbu3tVXxKtf8dg5Ktao7hPyhDth81gNj9vtaDqTdKjPeDqqInNp7mWMgRxcxg==
X-Received: by 2002:a05:6602:727:: with SMTP id
 g7mr15260997iox.90.1643752757285; 
 Tue, 01 Feb 2022 13:59:17 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id 193sm14960836iob.17.2022.02.01.13.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 13:59:16 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 1/1] bsd-user/signal.c: Only copy the _capsicum for
 FreeBSD_version > 1400026
Date: Tue,  1 Feb 2022 14:58:57 -0700
Message-Id: <20220201215857.61820-2-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220201215857.61820-1-imp@bsdimp.com>
References: <20220201215857.61820-1-imp@bsdimp.com>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, richard.henderson@linaro.org,
 alex.bennee@linaro.org, Warner Losh <imp@bsdimp.com>,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The capsicum signal stuff is new with FreeBSD 14, rev 1400026, so only
define QEMU_SI_CAPSICUM there. Only copy _capsicum when QEMU_SI_CAPSICUM
is defined. Default to no info being passed for signals we make no guess
about.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal-common.h | 5 +++++
 bsd-user/signal.c        | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/bsd-user/signal-common.h b/bsd-user/signal-common.h
index 7ff8e8f2e40..6f90345bb2a 100644
--- a/bsd-user/signal-common.h
+++ b/bsd-user/signal-common.h
@@ -59,12 +59,17 @@ void target_to_host_sigset(sigset_t *d, const target_sigset_t *s);
  * For FreeBSD, we have si_pid, si_uid, si_status, and si_addr always. Linux and
  * {Open,Net}BSD have a different approach (where their reason field is larger,
  * but whose siginfo has fewer fields always).
+ *
+ * QEMU_SI_CAPSICUM is currently only FreeBSD 14 current only, so only define
+ * it where _capsicum is available.
  */
 #define QEMU_SI_NOINFO   0      /* nothing other than si_signo valid */
 #define QEMU_SI_FAULT    1      /* _fault is valid in _reason */
 #define QEMU_SI_TIMER    2      /* _timer is valid in _reason */
 #define QEMU_SI_MESGQ    3      /* _mesgq is valid in _reason */
 #define QEMU_SI_POLL     4      /* _poll is valid in _reason */
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1400026
 #define QEMU_SI_CAPSICUM 5      /* _capsicum is valid in _reason */
+#endif
 
 #endif
diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index ad22ba9d90d..0bc6d2edbd9 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -222,6 +222,7 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
          * We have to go based on the signal number now to figure out
          * what's valid.
          */
+        si_type = QEMU_SI_NOINFO;
         if (has_trapno(sig)) {
             tinfo->_reason._fault._trapno = info->_reason._fault._trapno;
             si_type = QEMU_SI_FAULT;
@@ -241,11 +242,13 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
          * capsicum is somewhere between weak and non-existant, but if we get
          * one, then we know what to save.
          */
+#ifdef QEMU_SI_CAPSICUM
         if (sig == TARGET_SIGTRAP) {
             tinfo->_reason._capsicum._syscall =
                 info->_reason._capsicum._syscall;
             si_type = QEMU_SI_CAPSICUM;
         }
+#endif
         break;
     }
     tinfo->si_code = deposit32(si_code, 24, 8, si_type);
@@ -295,10 +298,12 @@ static void tswap_siginfo(target_siginfo_t *tinfo, const target_siginfo_t *info)
         /* Note: Not generated on FreeBSD */
         __put_user(info->_reason._poll._band, &tinfo->_reason._poll._band);
         break;
+#ifdef QEMU_SI_CAPSICUM
     case QEMU_SI_CAPSICUM:
         __put_user(info->_reason._capsicum._syscall,
                    &tinfo->_reason._capsicum._syscall);
         break;
+#endif
     default:
         g_assert_not_reached();
     }
-- 
2.33.1


