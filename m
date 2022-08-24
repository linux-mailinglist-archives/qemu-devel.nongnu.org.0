Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B12359F8DA
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 13:52:31 +0200 (CEST)
Received: from localhost ([::1]:41478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQovc-0003b1-S6
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 07:52:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmvC-0004XN-BA
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:38 -0400
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:40920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oQmv9-0001tw-R7
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 05:43:37 -0400
Received: by mail-pg1-x532.google.com with SMTP id w13so9474448pgq.7
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 02:43:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=KNoYD8dCMjVvXD7l6AFXvjIplF+y/seVMIxP0e3Hrho=;
 b=mZEqbFZG4On1tN55lgipnchPnF4qUcohXmRl/A3IlBWrwJl4P9OdnRklu6e4YKq54I
 Ak61Ml8CWejHGATGZ5fvmkXPT844sLmBtLwWDev0EUne5DVXTvAJd0hK5FtwBr9wC1Z0
 +eqejq6sVj/9qM4gpylIwnVMpoYrVSyjul9qBcelOYc5YISWXn9t3RUjoxl6jxJKc2Yn
 qVZZr4HobZX/+ntj8LIQYBGCw8VmCEWhGzpiYHDqw4QvCPeou/uOoVfdDkO8ScwcYr3a
 hwwbqbxfeEaH+D2LJ3XefKiYXWq8L4AfsZd23X14zCbPeIrM1jh/s21/LxZWZwGMpZJv
 g1zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=KNoYD8dCMjVvXD7l6AFXvjIplF+y/seVMIxP0e3Hrho=;
 b=rpl+rjYfcveDU+b0/SQ0O0P+H5K7Xd/n2cVCEnKzJhDv/EiHNKIvLEvQQ15naBayNE
 YG+FmV2uSvNiVmQ/Uloybh5bQ0HgM5r94H1s8SSqIxJfywlHVfiEBTWId22cUdZiN99l
 /kSqBb5Ltt1hPgebcNSlqNNyuE+vOSeQdlPX+WgYA/rJVOEOkDPSdbOd4yPnTd+xK4BF
 zlIrxn23cWOGuKyrGdRafOIhz9goTwA7XU5Ya5NG9/ZZzDmMcOa15NL2STgAUxOuXnvj
 ajo1MjIrciONghibZrrwKWcFqAcP5Mk1w9JK0LEl7h5yY7QDavdj0iJ3lPtUadzEJ7ZZ
 7YLA==
X-Gm-Message-State: ACgBeo0nsiTjqFxP0guk6pOCSQ4PW9ZJbyrKYDzhYQSLhBrkUa4yKsdi
 uO2vQfyAzELlaK4S1iCtqGOz6b/j2S4=
X-Google-Smtp-Source: AA6agR6lbBCU3hcBIWie281FWXZo8Rcp7V5wbWG8phwnaFQeHj7pNJsmqmbLG0tQEWMdjrVZgeFUow==
X-Received: by 2002:a05:6a00:2283:b0:537:2c29:fc8 with SMTP id
 f3-20020a056a00228300b005372c290fc8mr3214660pfe.42.1661334214376; 
 Wed, 24 Aug 2022 02:43:34 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 b14-20020a170903228e00b001728eb339e2sm12165972plh.286.2022.08.24.02.43.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Aug 2022 02:43:34 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 47/51] tests/qtest: libqtest: Correct the timeout unit of
 blocking receive calls for win32
Date: Wed, 24 Aug 2022 17:40:25 +0800
Message-Id: <20220824094029.1634519-48-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220824094029.1634519-1-bmeng.cn@gmail.com>
References: <20220824094029.1634519-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Bin Meng <bin.meng@windriver.com>

Some qtest cases don't get response from the the QEMU executable
under test in time on Windows. It turns out that the socket receive
call got timeout before it receive the complete response.

The timeout value is supposed to be set to 50 seconds via the
setsockopt() call, but there is a difference among platforms.
The timeout unit of blocking receive calls is measured in
seconds on non-Windows platforms but milliseconds on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
---

 tests/qtest/libqtest.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 918f4657ed..7b41971347 100644
--- a/tests/qtest/libqtest.c
+++ b/tests/qtest/libqtest.c
@@ -36,13 +36,14 @@
 #include "qapi/qmp/qstring.h"
 
 #define MAX_IRQ 256
-#define SOCKET_TIMEOUT 50
 
 #ifndef _WIN32
+# define SOCKET_TIMEOUT 50
 # define CMD_EXEC   "exec "
 # define DEV_STDERR "/dev/fd/2"
 # define DEV_NULL   "/dev/null"
 #else
+# define SOCKET_TIMEOUT 50000
 # define CMD_EXEC   ""
 # define DEV_STDERR "2"
 # define DEV_NULL   "nul"
@@ -108,8 +109,16 @@ static int socket_accept(int sock)
     struct sockaddr_un addr;
     socklen_t addrlen;
     int ret;
+    /*
+     * timeout unit of blocking receive calls is different among platfoms.
+     * It's in seconds on non-Windows platforms but milliseconds on Windows.
+     */
+#ifndef _WIN32
     struct timeval timeout = { .tv_sec = SOCKET_TIMEOUT,
                                .tv_usec = 0 };
+#else
+    DWORD timeout = SOCKET_TIMEOUT;
+#endif
 
     if (setsockopt(sock, SOL_SOCKET, SO_RCVTIMEO,
                    (void *)&timeout, sizeof(timeout))) {
-- 
2.34.1


