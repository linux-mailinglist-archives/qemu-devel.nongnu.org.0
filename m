Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D193E6DCAB7
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Apr 2023 20:24:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1plw8y-0002kr-4n; Mon, 10 Apr 2023 14:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8d-0002e0-P3
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:13 -0400
Received: from mail-il1-x12a.google.com ([2607:f8b0:4864:20::12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1plw8a-0000eq-DX
 for qemu-devel@nongnu.org; Mon, 10 Apr 2023 14:21:11 -0400
Received: by mail-il1-x12a.google.com with SMTP id s4so2662993ilv.11
 for <qemu-devel@nongnu.org>; Mon, 10 Apr 2023 11:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681150867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vxR1gdsQAsuHf2IN6tJm6YdCj/AcvFHJBZVDZiQZkYs=;
 b=1gBf4Cgb59rbB3qOtNU01kiosgLcIyXYrzbWd5Be8vZIBM+4Vp0QjaNgBQW3ovsb/D
 FdZuu7nPTcK6Sd2zRM2UYHqNiKc1imXuHc0zDU7jI7RzH6LVJdR7QBIeAY3LGm/xZZoU
 CFyBUNUjNPXqTThDGRiaOSD3F7x+q0z30livbZ9SJ/wX36/yHI4SITw7IKCGKOZDt/vT
 BXUKOLdBopzfSqN3MhgFVbhS029+0EPYEacedUE3KU5Kv0mhVINgbT2vxi72vY1nhpt1
 Asg9fZ1HxxGiSzU/zKvE7gAGGo3fogzDJ0K2gDZjevJmK0t9z3Yxt04omeRbbzghWtV/
 SL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681150867;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vxR1gdsQAsuHf2IN6tJm6YdCj/AcvFHJBZVDZiQZkYs=;
 b=fC2KqeL/F9XlzQGHlazDPH5G3iG9JM/TDZJeIrBwMLyZxLBtFyupgR96j6xgtzE//Z
 SOOIWqyndgadwMdWJfjQ+g3tl2zabOtBqTPJgy/11wzia6WFu1YXt7PGG7YhaqSFwogJ
 2oLL87fsQndgSTMjhd+Ld+5OzT9fvxNVC6STXc9uvZ0H+pdV1+FNWl12KvnxBusQTJIi
 laTAWRlCvDcgH9hLcldrgqwwVMqNF49kXCxKqc2qoMJe6ppwaCRlMk4Jzk3Gq3ykhIQ2
 sqNVkg8wUjNpValutfxsvyBoZj4UoOehCiPaXL+/wFfNlHDxh75tzgbgkwi4ORkZRosC
 nCjw==
X-Gm-Message-State: AAQBX9ecW+vSbCSsYDjo1+4HGxsc6s2Bys50iN2PTytbne/FzSxWacM+
 9utRQMrwT9oe6g1yuzWnwR/B1B+FH2C/tC8eGfs=
X-Google-Smtp-Source: AKy350ZlJsreSzRIETfN2KhEk0PN/2OIKCPxt/bValKfcd/z83lG8b6XrV3phcXAaANIgAfl45hv3A==
X-Received: by 2002:a92:c811:0:b0:328:8245:38a2 with SMTP id
 v17-20020a92c811000000b00328824538a2mr4454585iln.8.1681150866964; 
 Mon, 10 Apr 2023 11:21:06 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 a15-20020a056e02120f00b00313b281ecd2sm3104314ilq.70.2023.04.10.11.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 11:21:06 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: jrtc27@jrtc27.com, riastradh@netbsd.org, Kyle Evans <kevans@freebsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Warner Losh <imp@bsdimp.com>, reinoud@netbsd.org
Subject: [PATCH v2 02/19] bsd-user: Ifdef a few MAP_ constants for NetBSD /
 OpenBSD.
Date: Mon, 10 Apr 2023 12:20:39 -0600
Message-Id: <20230410182056.320-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410182056.320-1-imp@bsdimp.com>
References: <20230410182056.320-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12a;
 envelope-from=imp@bsdimp.com; helo=mail-il1-x12a.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

MAP_GUARD, MAP_EXCL, and MAP_NOCORE are FreeBSD only. Define them to be
0 if they aren't defined, and rely on the compiler to optimize away
sections not relevant. Added only to the top of mmap.c since that's the
only place we need this.

Signed-off-by: Warner Losh <imp@bsdimp.com>
---
 bsd-user/mmap.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/bsd-user/mmap.c b/bsd-user/mmap.c
index d6c5a344c9b..2d91e8e8826 100644
--- a/bsd-user/mmap.c
+++ b/bsd-user/mmap.c
@@ -20,6 +20,20 @@
 
 #include "qemu.h"
 
+/*
+ * Not all the BSDs have all the MAP flags, so define some of them to 0 here and
+ * rely on the compiler optimizing always false conditions away.
+ */
+#ifndef MAP_GUARD
+#define MAP_GUARD 0
+#endif
+#ifndef MAP_EXCL
+#define MAP_EXCL 0
+#endif
+#ifndef MAP_NOCORE
+#define MAP_NOCORE 0
+#endif
+
 static pthread_mutex_t mmap_mutex = PTHREAD_MUTEX_INITIALIZER;
 static __thread int mmap_lock_count;
 
-- 
2.40.0


