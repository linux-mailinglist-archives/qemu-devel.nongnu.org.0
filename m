Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E3353F9039
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 23:40:24 +0200 (CEST)
Received: from localhost ([::1]:38776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJN6l-0005y4-7Q
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 17:40:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39062)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg4-0006NW-9Q
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:48 -0400
Received: from mail-io1-xd2e.google.com ([2607:f8b0:4864:20::d2e]:37869)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1mJMg0-0006wa-Sb
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 17:12:47 -0400
Received: by mail-io1-xd2e.google.com with SMTP id b7so5606370iob.4
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 14:12:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LfrE81ZrxSCq64hVLSr9n7zzdJ11Q73sKolgD5sAWUM=;
 b=dsXDnil5RnNf9yg2JWDyb25I766cQQ2G6fkCP7tnbzwoplUUgSCP6BoECGA5wvTM9g
 5Sr1wMVsmuxlCeLmfbTfQQWfFFHeVcDCYpTwuAI6HpIs25++zTgsKML4FHkYX3vPMHWF
 1LfBI//P+XFmdhrO/Ovbgj68aFsAKAtbVOCUs7uddMd2yxeb6TKYD7hniBDGGxUFP1j1
 zbC9gf6yCDzYRBlHQzdPPdwn/UWmbEKMODOE+FfiBce2CTjZZb2zt9K3YfhqliZslcSh
 V3UJaB5j8RRX66dTcTk8SLLGIphZNxFUWb/hJycFUIDecjsERRNA9W4yeYT5qDcKoYj3
 ffIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LfrE81ZrxSCq64hVLSr9n7zzdJ11Q73sKolgD5sAWUM=;
 b=S67SCyfHmEza8FkcnoCmtrxyI+IiWsYDi3uOcV9Bo5anekJHmnryYh8XpkCzESYEte
 6ChyH5mt3Tx9AnzFkP2CfL2vBQmT5GaGwVe/5I1UJJ/ldhKkWay9d+MDL6f/sa2yVYfo
 dBKIv4rA28g22R1S87oP0nfh99N64b2A/dX3vbcRUm4Z4s+xu3XuqQpkL7C3TyJ+G3/o
 WbOMssSScpx+PB55VkT6zi1qz5QWjAxjAfQdXmzSBLzBVFRmysM8lOrDalmRy6RnnDt0
 UnrR9CcK837WtlySlBdJVV17vBwSuD+i4hxPN/OwydhYVM/nv5N/cwTkaBDevLD5LYBK
 PFzQ==
X-Gm-Message-State: AOAM530POwGbcyiorl5VZsiq9kHAvQcj5/tDhiVxRYszpJknUPCYVhdn
 95GgBm5BSUGr0CJr+XHxYt9OD2IfsbTJE+sB
X-Google-Smtp-Source: ABdhPJwG52LfIlFVT/VgQpb3RcjBotg9n6coJLoiOL7koDaDMQ2cCnbWdVGM43q8a2oPfO5sz6HtMQ==
X-Received: by 2002:a02:c8cc:: with SMTP id q12mr5131032jao.93.1630012363630; 
 Thu, 26 Aug 2021 14:12:43 -0700 (PDT)
Received: from dune.bsdimp.com (50-253-99-174-static.hfc.comcastbusiness.net.
 [50.253.99.174])
 by smtp.gmail.com with ESMTPSA id a17sm2348633ilp.75.2021.08.26.14.12.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 14:12:43 -0700 (PDT)
From: imp@bsdimp.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/43] bsd-user: define max args in terms of pages
Date: Thu, 26 Aug 2021 15:11:41 -0600
Message-Id: <20210826211201.98877-24-imp@bsdimp.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210826211201.98877-1-imp@bsdimp.com>
References: <20210826211201.98877-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d2e;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd2e.google.com
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
Cc: Kyle Evans <kevans@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
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


