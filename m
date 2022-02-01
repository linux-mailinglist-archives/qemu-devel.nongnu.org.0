Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABC4E4A683F
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:54:28 +0100 (CET)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF22d-0006xR-G9
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:54:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nF08t-0001dJ-1f
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 15:52:47 -0500
Received: from [2607:f8b0:4864:20::d32] (port=45912
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nF08r-000638-1B
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 15:52:46 -0500
Received: by mail-io1-xd32.google.com with SMTP id s18so22787779ioa.12
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 12:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U8z+76zAPtnlcBkLoGa1tA0KeEJqxwSb7kKU2tHsaVE=;
 b=Oo11YJX9xbTG+YvuaXV42uFMKL+7CZcPl2DsJcWMR6Wfq9Qa1Jq8/Av73pc5XzD0Hg
 9xS6QmC85Yl2FPdF0l33NMZERUG/F/R59s3wgqO5h8bE6huNF6CfV91CNANjvB5mDeuC
 OSHZGF+dPKaSo9ozAxplqPtUR8+CbD/mYrvbgAbOK4UtmmMkm6J0VjZm3QI+zXJ+Gxds
 FxdqTHGbMQhXeJZCDcZOwjnGJFb7cmuDWxxXl6cPzXR+XrPJap7FVevhoovQ0GPBc3WQ
 I7uaSGq3Ls/CbjXSWkTk2iwJ1ELF6U32/s9JFZ1UDbS/v8snLpOCJaNhuzjmDKLZ6qiC
 eH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=U8z+76zAPtnlcBkLoGa1tA0KeEJqxwSb7kKU2tHsaVE=;
 b=6svPsO4dPHgUaN6xGP3AAmDLzy6Te8QLAkRlgf95p1cwFYAtu5X32WzqK1ocEo/k+Q
 yUuXa6+FkW2DRujMXBH207BCjFdrlA5uJioKxjh+9HmYq7c9ln49+FY1KyfV9ItctTVe
 c8oOSKSmMTVhUTwkteKd9zqTI1o1HB/xndgMTHzP2nuZFH6334BXlLaLgvelA+FhPF+r
 bEFx+DKBlG/Li5gtZLu0n1HWAMG++LfRSQsRsh+FvIg/WXchcEclfJ0oOCfF869JGgBG
 W9Eq5FDfOnDFk5nd2TOID3SomZKCaZRWeMk9pZxzYARJ2emWfxUbweUwHPyE+j/ju84A
 1OUw==
X-Gm-Message-State: AOAM531UefDbmItpMM0dQ88/MSM9K2PPz3jgzKA1/eH+gWLp3IluaUfY
 jkH37TSBebO4wm0NJtzUhpY7sNTTNYyunA==
X-Google-Smtp-Source: ABdhPJzM4CNx59Mogixi33iKHLJXbz7mLpAXyh7lophyfk7z3VgYEGtbCWA53UmpOqMN5KzOKIgTQw==
X-Received: by 2002:a02:1181:: with SMTP id 123mr13917642jaf.93.1643748762989; 
 Tue, 01 Feb 2022 12:52:42 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id n3sm9312187ioz.9.2022.02.01.12.52.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 12:52:42 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] bsd-user/signal.c: Only copy the _capsicum for
 FreeBSD_version > 1400026
Date: Tue,  1 Feb 2022 13:52:51 -0700
Message-Id: <20220201205251.57691-1-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d32
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d32;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd32.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>, richard.henderson@linaro.org,
 alex.bennee@linaro.org, Warner Losh <imp@bsdimp.com>,
 Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The capsicum signal stuff is new with FreeBSD 14, rev 1400026, so only
copy them on a new enough system.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/signal.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index ad22ba9d90d..b43266e6e06 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -242,8 +242,10 @@ static inline void host_to_target_siginfo_noswap(target_siginfo_t *tinfo,
          * one, then we know what to save.
          */
         if (sig == TARGET_SIGTRAP) {
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1400026
             tinfo->_reason._capsicum._syscall =
                 info->_reason._capsicum._syscall;
+#endif
             si_type = QEMU_SI_CAPSICUM;
         }
         break;
@@ -296,8 +298,10 @@ static void tswap_siginfo(target_siginfo_t *tinfo, const target_siginfo_t *info)
         __put_user(info->_reason._poll._band, &tinfo->_reason._poll._band);
         break;
     case QEMU_SI_CAPSICUM:
+#if defined(__FreeBSD_version) && __FreeBSD_version >= 1400026
         __put_user(info->_reason._capsicum._syscall,
                    &tinfo->_reason._capsicum._syscall);
+#endif
         break;
     default:
         g_assert_not_reached();
-- 
2.33.1


