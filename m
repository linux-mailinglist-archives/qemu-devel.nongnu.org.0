Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E8164A2A7B
	for <lists+qemu-devel@lfdr.de>; Sat, 29 Jan 2022 01:16:23 +0100 (CET)
Received: from localhost ([::1]:55664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDbPi-00023J-6i
	for lists+qemu-devel@lfdr.de; Fri, 28 Jan 2022 19:16:22 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafr-0000kf-Jn
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:29:01 -0500
Received: from [2607:f8b0:4864:20::d30] (port=44832
 helo=mail-io1-xd30.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nDafh-0001aj-1A
 for qemu-devel@nongnu.org; Fri, 28 Jan 2022 18:28:58 -0500
Received: by mail-io1-xd30.google.com with SMTP id p63so8829724iod.11
 for <qemu-devel@nongnu.org>; Fri, 28 Jan 2022 15:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uu/c8NbwOYwvWKC+skM1aHWNApehobWbRU2Oop3qnVw=;
 b=IYyvzCKyoEZ/T94A97bRvcEKj0QusehXenCc/Bue1w1dg0Wzbvk/XMjx8Gdnt5malM
 kizuj+B972FyXMHez472P1nWHtn1Vv9R61uy+La2E/1tJyKdHXgTqTGcI+XYb4ep9rTk
 q9eqNoXoO/ilfupeg4THUSELZEJTkRwW9ystyJjcuNB1iEV0aM/sdn5H3RaVfJHLupsl
 QuYh43oXQM/f4joa361rHw6/6b/VQHdZpoDRqCOPN2ZcbpC7WtgBnpzErm0mxAmapr9f
 FAZXT7TYrjBDEEAxHMs2UrjY91nmuPx9FQo5YpbsY+AYF/CTsmucGYCc8YWScJLSlCPx
 XXNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uu/c8NbwOYwvWKC+skM1aHWNApehobWbRU2Oop3qnVw=;
 b=l+2OH87Ni5cC4WeQiCIRgzuqL9069KmNAJemhF+WILdm6KBaM1K/88zYIONcATnMWu
 tbWhmR/voRL+fKt7T3ekaIOcSOsrDtVL7kQe31KBRXRTs+XQFbTjw++Ai/hm30kmqkUL
 pkQFfEItKYMk/nPVPZcqycLHvxnmZU4w7QMx2Yg2vje6fVAhldmYQQPP9MZEswLdMAnW
 TJxCFAlbfG8H4ps9pRdhCAjv68AGZ+A2l8jO5g75AN7O1eYXb+NVOxkRZYM3axs2WYeb
 KEFAzOcdCyhv1uoFeBZFMv51yRocvGkmlznl2Lnx2uUHbZzfM7NYAJNGZ064zLqZSpRM
 R60g==
X-Gm-Message-State: AOAM531lrS3+cFlssV/AEv30OHkbiBb9NY3uF4XQwci4wcpU7YBdTvo7
 3/reu5NMnv0p25pKGtQZxPwuOYMW3gVxhA==
X-Google-Smtp-Source: ABdhPJwtGbSUBVdNJiUxHxR9ieVaUJP15kz605ggfDlPWGAcpWKpIzzY758pwjlL2ryLdqyvCGZqIw==
X-Received: by 2002:a02:ccb9:: with SMTP id t25mr5949816jap.290.1643412506236; 
 Fri, 28 Jan 2022 15:28:26 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id o11sm14323111ilm.20.2022.01.28.15.28.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 15:28:25 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 22/40] bsd-user: Add host signals to the build
Date: Fri, 28 Jan 2022 16:27:47 -0700
Message-Id: <20220128232805.86191-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220128232805.86191-1-imp@bsdimp.com>
References: <20220128232805.86191-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::d30
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::d30;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd30.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>, def@FreeBSD.org,
 jrtc27@FreeBSD.org, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Start to add the host signal functionality to the build.

Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/signal.c | 1 +
 meson.build       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/bsd-user/signal.c b/bsd-user/signal.c
index ad8437a8bfb..f3e020e004a 100644
--- a/bsd-user/signal.c
+++ b/bsd-user/signal.c
@@ -22,6 +22,7 @@
 #include "qemu.h"
 #include "signal-common.h"
 #include "hw/core/tcg-cpu-ops.h"
+#include "host-signal.h"
 
 /*
  * Stubbed out routines until we merge signal support from bsd-user
diff --git a/meson.build b/meson.build
index 5dbc9a7a365..155403d44f4 100644
--- a/meson.build
+++ b/meson.build
@@ -2947,6 +2947,7 @@ foreach target : target_dirs
     if 'CONFIG_BSD_USER' in config_target
       base_dir = 'bsd-user'
       target_inc += include_directories('bsd-user/' / targetos)
+      target_inc += include_directories('bsd-user/host/' / host_arch)
       dir = base_dir / abi
       arch_srcs += files(dir / 'signal.c', dir / 'target_arch_cpu.c')
     endif
-- 
2.33.1


