Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EC944A5045
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 21:39:01 +0100 (CET)
Received: from localhost ([::1]:54278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEdS0-0001oc-0h
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 15:39:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnk-00053s-2k
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:25 -0500
Received: from [2607:f8b0:4864:20::d32] (port=38808
 helo=mail-io1-xd32.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1nEcnb-0002eh-Pe
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 14:57:23 -0500
Received: by mail-io1-xd32.google.com with SMTP id w7so18426610ioj.5
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 11:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Uu/c8NbwOYwvWKC+skM1aHWNApehobWbRU2Oop3qnVw=;
 b=jd+0DNe6KR1avL3TpquKJrYByvlHm+3wI+ypNU76me4irSfVff8YeVaSam9TTcMvFi
 0TkRUQLW2Kno9Ap6D2DTK52kWX+XDQMaYP/PlRZgVNbY+Y6x2DUokX+vXv3eOAHbWJhf
 uRyTJTJL7CnZWnB1K9LHu8NY44ZhJc9P5AjelbI3caj2yAHbAEYdRtUbZC14KctaPOB0
 xOZZfMH1CP08vI6vYPpnIB7yjkzoR1jY0Pqfh+sStEjPuFTkwJwyiv03ayDH2tzM2xkl
 +pb+gsKt4kqPmXwVjYFYY1PsPIvlYngGc7qO2hgvODNIAW7Fm2psWG9PYYAUb0oRzU2N
 6SfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Uu/c8NbwOYwvWKC+skM1aHWNApehobWbRU2Oop3qnVw=;
 b=1Zam4fuqb6F2yuenQUtpmJ3kWgIlfSVRAQVghWR0XHj4aJHaXquUm57QG0L8n4uA0y
 rGMrQiaq1geyQGcObCB49/adEyK9C6ntc/QU8lPNqMfprrxhVVOEXcJQZ5LONNmaNk3k
 P2fCUrgdcCNvPPI3IL80+lpJcLJYgDgQhwbnfKisbh/xA8LsDATIraZACqsrni+lWXff
 1Z4sRHm0GGUAuuEDVCSlTPN8ufa+tVQME04zTkx1tC+0TL/bwtEW6SGFC657ytIUCGo8
 gsJ2+5S8XgVvjrW00xhoKQvlNEp7lUUEBxlYYNQheJobgoxTOsdCLBdbbFl1ILWRTUE6
 RQdA==
X-Gm-Message-State: AOAM533J0ibL7VJBxnTw4r2fvoZ4ErH7Gw5dtfJmOcZ/CBO9pJhTKXZb
 eAWJygE16VA8A63uQi4uzlb/EV1LAnqkow==
X-Google-Smtp-Source: ABdhPJyEcn2X4GnwagvKLvpoZodovhLT280+TRCPeeHH75vbgMD/1JWRjyhfknwU8Rbi61bJpWexCQ==
X-Received: by 2002:a5e:9316:: with SMTP id k22mr11654944iom.18.1643659012182; 
 Mon, 31 Jan 2022 11:56:52 -0800 (PST)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id j2sm1972989ilu.82.2022.01.31.11.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 11:56:51 -0800 (PST)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/40] bsd-user: Add host signals to the build
Date: Mon, 31 Jan 2022 12:56:18 -0700
Message-Id: <20220131195636.31991-23-imp@bsdimp.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20220131195636.31991-1-imp@bsdimp.com>
References: <20220131195636.31991-1-imp@bsdimp.com>
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


