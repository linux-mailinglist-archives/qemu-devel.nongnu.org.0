Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF766DE1FC
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Apr 2023 19:12:01 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pmHVt-0003pt-D2; Tue, 11 Apr 2023 13:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVm-0003pE-No
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:30 -0400
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <imp@bsdimp.com>) id 1pmHVi-00066u-5C
 for qemu-devel@nongnu.org; Tue, 11 Apr 2023 13:10:29 -0400
Received: by mail-io1-xd31.google.com with SMTP id k13so14469590iov.10
 for <qemu-devel@nongnu.org>; Tue, 11 Apr 2023 10:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112; t=1681233024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WQaAp59x+Mdyu1iJVILNhFfK7zDGSlhnzQzZybq8o+A=;
 b=Ry5PmTX2P2HQx8DqAxKB4PnQ1wdtbgDPY+UokNN+QRtJHt4VAWn5qP9KD+aMJFa78B
 nUvOYLnN9hfV+lLS72dOhR8vYtWChNovgX7SB8vPVGcQTvQTXLpaKT6rCrpec0d+K7Ry
 /OY1ljhDr4ry04344PojoNe+jHlyNZF6WXEQ2MuPPYU92gcRW5qrU/kNkbsOz1i/sKOP
 pdVQbHJFw6RyMSk05JGZ0QNbWLnfLAXmETX9RUbR3fJP3f0Inz5V/51JVDKTJY33Ra3n
 8WdRCJtoc8PzekCikjHTDIkyp0YhtsJEp6sTKeQynalqzD+z/rQ+y0ZuywfchIYnucGj
 4zGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681233024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WQaAp59x+Mdyu1iJVILNhFfK7zDGSlhnzQzZybq8o+A=;
 b=ZN+cbWhxV0BFEJiiGwQXX/QS/H2deNraJm4SQf6KkXXX98WGEkaGAwaCLMdLjDs2k/
 UYn4fWQ2UIb62kLXiM4/fFizXKToAJUn+lA1bQLKk38HKVDSXLBgWHNYWrh0kqIob30F
 W76rHxuT1seV2gCmTy9lcxtMxrtxpLzegqNbnWEYQl9KH4x56Rz+gO1koXGv5hbGqdVP
 xwtaWUruUB9qgEyeuqOXeMQ2b0JRSoqdqBNah4XGDLYbIaYKaDZjzrSSjl09iGCwr6zw
 tU3F5sTRsWGafXGoz99T7+7suwVS90vNNvH11BiQ4RIFkazXM0DRm94TSNQyDwcI8wcI
 NOUQ==
X-Gm-Message-State: AAQBX9eif8NqsH7tTHAN8GHeXu2+2UbAQKfDGdqgw8m3QfDfUyA6l/HG
 T+xeXh6vGTbw2p+Q/uPB7YZc/SSpACrGXXRAybk=
X-Google-Smtp-Source: AKy350bnJnvwB+blHXQcJTYPI2zyiZWBWqpn570D3VX77foOunJgsd0Gg3CyY3KqvsoOuJvbMIA60Q==
X-Received: by 2002:a5e:990a:0:b0:74c:822c:a6ac with SMTP id
 t10-20020a5e990a000000b0074c822ca6acmr10169096ioj.15.1681233024228; 
 Tue, 11 Apr 2023 10:10:24 -0700 (PDT)
Received: from dune.bsdimp.com (c-71-237-47-177.hsd1.co.comcast.net.
 [71.237.47.177]) by smtp.gmail.com with ESMTPSA id
 d36-20020a0285a7000000b0040b11b7ef54sm4140942jai.39.2023.04.11.10.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Apr 2023 10:10:23 -0700 (PDT)
From: Warner Losh <imp@bsdimp.com>
To: qemu-devel@nongnu.org
Cc: ryoon@netbsd.org, kevans@freebsd.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, riastradh@netbsd.org, brad@comstyle.com,
 reinoud@netbsd.org, jrtc27@jrtc27.com,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Warner Losh <imp@bsdimp.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v3 02/20] bsd-user: Ifdef a few MAP_ constants for NetBSD /
 OpenBSD.
Date: Tue, 11 Apr 2023 11:09:37 -0600
Message-Id: <20230411170955.17358-3-imp@bsdimp.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230411170955.17358-1-imp@bsdimp.com>
References: <20230411170955.17358-1-imp@bsdimp.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::d31;
 envelope-from=imp@bsdimp.com; helo=mail-io1-xd31.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
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


