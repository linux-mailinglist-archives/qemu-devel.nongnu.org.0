Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAFB4A6A66
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 04:01:20 +0100 (CET)
Received: from localhost ([::1]:56934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF5tV-0004VO-7u
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 22:01:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nF0hF-0005Bc-J7
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:28:17 -0500
Received: from [2607:f8b0:4864:20::132] (port=34358
 helo=mail-il1-x132.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nF0hC-00035s-Sm
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 16:28:17 -0500
Received: by mail-il1-x132.google.com with SMTP id y17so15435949ilm.1
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 13:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S1snauN/YAF6P12soGKQAS/NSQHz8i2wVYxQgX/gD6s=;
 b=thYaXQxKmv7vCzapEJ9oozo2WwCsged03ZcRI1KeRAbB0bV+oy39m7TgIgyxej6hLk
 LjxmX0O3MQ4v3h1pj+x4q1Q1GxamOmyPtIwZz6mt9egvOheximkuvsvrTCd8m34RwXOM
 uAz7C+kYXUNkeWEZWacX9bVqOpfrucmbvqHu6uEATLXrwjwpxuXqQAXhlVQ1FRWOcFW2
 IPIsOFQk+cL+dSMjgQgwdA7pQAjBf+R9oO0bNJG2ZzKeIIXnBP77VBiuPJcRRmXRQm0H
 iaPwlrqbbPyhboizJgz2HtguI5ZlwJbVqs/JgzqR5oqevUBOrCT16L7C1vS45uUvNU1W
 32kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=S1snauN/YAF6P12soGKQAS/NSQHz8i2wVYxQgX/gD6s=;
 b=2B4M+wYwqOVTOS9hoAcwxgn5+aRyNzwSLxKBZUoPhIC5bysjYpVQ7KNifvKbID2MBH
 UvwIW9bBq/pXa8VJtfeMXGTO8w5uB6U/DaMChqM+k2QgLxtFqodi3jLdn/Wtzc1ieLFv
 jwfFck6ieL1LSJEYbYzAUbkSXONnhsR9Jogkhqjndz41B+REdBkNkGDKVURkp7+o4gw3
 kHr8skHnYeS3lKlbREwi7vlS/uTEat2R7owDEQt5LxJfpRWFVf2dFJs/PuiIJRutmjlJ
 rd8VrtSfyldKbSa8Jsh5CrQX/+KV+Qa3gsz92l32CUN1d1a+d2xnU5WkbBLMB7di/2SU
 xRKA==
X-Gm-Message-State: AOAM531jDZiSUTzE9jxtmRLdQ2CZIxOi8nQw0tFRYQjE982W4nOevTNi
 Ex4UcAW/kl2bu+1K5ip5LeGK5WoT/ydOgg==
X-Google-Smtp-Source: ABdhPJw19ekFSkzg+L3X6xlLexKsZ+qbm5loCOVUv2GeGHxUhK1A6Z98o2yRvIGpTrEZF2AipnMn1g==
X-Received: by 2002:a05:6e02:2145:: with SMTP id
 d5mr15949402ilv.57.1643750880510; 
 Tue, 01 Feb 2022 13:28:00 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id h3sm20384590ild.11.2022.02.01.13.27.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 13:28:00 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] bsd-user/signal.c: Only copy the _capsicum for
 FreeBSD_version > 1400026
Date: Tue,  1 Feb 2022 14:28:09 -0700
Message-Id: <20220201212809.59518-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::132
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::132;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x132.google.com
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
Cc: alex.bennee@linaro.org, Kyle Evans <kevans@freebsd.org>,
 richard.henderson@linaro.org, Warner Losh <imp@bsdimp.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The capsicum signal stuff is new with FreeBSD 14, rev 1400026, so only
define QEMU_SI_CAPSICUM there. Only copy _capsicum when QEMU_SI_CAPSICUM
is defined. Default to no info being passed for signals we make no guess
about.

Signed-off-by: Warner Losh <imp@bsdimp.com>
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


