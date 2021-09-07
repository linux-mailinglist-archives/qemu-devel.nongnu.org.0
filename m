Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B264030BB
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Sep 2021 00:10:39 +0200 (CEST)
Received: from localhost ([::1]:43710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNjIc-0003e0-Cw
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 18:10:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2Y-0005sn-4d
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:02 -0400
Received: from mail-io1-xd2d.google.com ([2607:f8b0:4864:20::d2d]:39436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mNj2W-0000y6-Gx
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 17:54:01 -0400
Received: by mail-io1-xd2d.google.com with SMTP id m11so459351ioo.6
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 14:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LfrE81ZrxSCq64hVLSr9n7zzdJ11Q73sKolgD5sAWUM=;
 b=dlq5UuBbYrs3+XFRYKna4/1h7OmlHwlUl5qdC2E+K5zzDA6jMesWJy9YbKQE589thR
 C4bmGnb7oIWOEdfZciG345bykhSqTMwRxax9vVo3Gbf0XbdLf4XiLG8iYqYqs3Co8zKP
 xCYTZnVL6ct3eEXL8wPd4bAw5jLZQkvdfBDoB8ojlLM8C4xmvOZGKTVD9VGKCFUrsUsP
 hDT7HLb/G0SmOunR9VUJO8zPX1+KZKgrGcjTU9m8cSpQUtJ2DBAUk8iZSfJ2PlGQ034Z
 b2IWtb+lMAiyQLKwCfqnNrOuw2xPg+gOSHtEovN9oMdFDnJVZA0poBSIWIjQUWxW/YLS
 cvAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LfrE81ZrxSCq64hVLSr9n7zzdJ11Q73sKolgD5sAWUM=;
 b=lEL42m82vE3QejGFfT8Z0Yi6bl0I3xyi9Yujhtvx9Ct8k7e3rPYEDMMvHLx2h8pWdO
 qgyAWzKy873xSquTXVINtGXMsnyaOpWW4TG3cbBO0ngm8BiddjRKX8V0r8FfEusgyCmQ
 pmgYM6OjrxZbprhoCguRQeMlou6ng9MVI4SXOUhmwxafzmZrdrZ0mAV4bOIaI13vaCrF
 /sDxTrU86pZSOlk4iWSbz1BrtKEEHKK3psH8RxNKn6w9G26tLx5QlFb8Jz/avy1Mo+Q+
 4IMfZbKvKuJCfk6AvyOMvsP2dteBsGs0UqwlVSJtpQDJnZBsLmOWdyKmeUd/ynUUejcd
 70GQ==
X-Gm-Message-State: AOAM5327/2eDDMq9EV1Xen4jQ1nsVmvfXJ/IIMXhjwLaU85gA2Sd5F9d
 9MIvXyl96I/Ust3Rt5pNMedhdkeGoktK8zvzbHE=
X-Google-Smtp-Source: ABdhPJzQ/m7EXz0aWwGX4tSl5p17oJJelVNcYyX/AS/LOwo8xTDaR36scNb8/mHDOnTsEkmb7pF+ug==
X-Received: by 2002:a02:c055:: with SMTP id u21mr438269jam.113.1631051639161; 
 Tue, 07 Sep 2021 14:53:59 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id t17sm192477iln.24.2021.09.07.14.53.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Sep 2021 14:53:58 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PULL 23/42] bsd-user: define max args in terms of pages
Date: Tue,  7 Sep 2021 15:53:13 -0600
Message-Id: <20210907215332.30737-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210907215332.30737-1-imp@bsdimp.com>
References: <20210907215332.30737-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2d;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: kevans@freebsd.org, Richard Henderson <richard.henderson@linaro.org>,
 Warner Losh <imp@FreeBSD.org>, Warner Losh <imp@bsdimp.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Warner Losh <imp@FreeBSD.org>

For 32-bit platforms, pass in up to 256k of args. For 64-bit, bump that
to 512k.

Signed-off-by: Kyle Evans <kevans@freebsd.org>
Signed-off-by: Warner Losh <imp@bsdimp.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 bsd-user/qemu.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/bsd-user/qemu.h b/bsd-user/qemu.h
index 55d71130bb..fea1a167e4 100644
--- a/bsd-user/qemu.h
+++ b/bsd-user/qemu.h
@@ -20,6 +20,7 @@
 
 #include "qemu/osdep.h"
 #include "cpu.h"
+#include "qemu/units.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
 
@@ -101,11 +102,17 @@ extern const char *qemu_uname_release;
 extern unsigned long mmap_min_addr;
 
 /*
- * MAX_ARG_PAGES defines the number of pages allocated for arguments
- * and envelope for the new program. 32 should suffice, this gives
- * a maximum env+arg of 128kB w/4KB pages!
+ * TARGET_ARG_MAX defines the number of bytes allocated for arguments
+ * and envelope for the new program. 256k should suffice for a reasonable
+ * maxiumum env+arg in 32-bit environments, bump it up to 512k for !ILP32
+ * platforms.
  */
-#define MAX_ARG_PAGES 32
+#if TARGET_ABI_BITS > 32
+#define TARGET_ARG_MAX (512 * KiB)
+#else
+#define TARGET_ARG_MAX (256 * KiB)
+#endif
+#define MAX_ARG_PAGES (TARGET_ARG_MAX / TARGET_PAGE_SIZE)
 
 /*
  * This structure is used to hold the arguments that are
-- 
2.32.0


