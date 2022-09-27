Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53C9A5EC331
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 14:47:18 +0200 (CEST)
Received: from localhost ([::1]:56002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1od9zY-0000ER-Cn
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 08:47:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SF-0003kZ-VC
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:47 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:33289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1od8SE-0005KH-A6
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 07:08:47 -0400
Received: by mail-pg1-x531.google.com with SMTP id f193so9141072pgc.0
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 04:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=0TjyjmagWil3MltuTF+3LjPFTwhOERwy0g28RMKJdOI=;
 b=boO3ubYK+Uv/TPRG5p6DPUQp9Gqy66MuTKzZtuQ7Cl7uKYa3ouj3sCsU8dQohDbLRL
 gCb8nVhIvtApB0jm1XWf01GMFCtpZKFlo1JQBge+qGqKRx1hVa6eDu3PEKjOmcKACHxy
 svD4kKx8/aFRfVy2pc8pKvdHqbzbh6lVHCsLG7JjF/ikQNPu9fOp78tzeVP+W1EznOsR
 +FDsFBehVSLyVRRzo4X6a+QaJiuZ6WRx8D86lA/AgLsXRqsHMmbLY4pulnxgQ+f39zEx
 JMG/qahp/9be2uuLPquGK8kqb9X64J8a39ZcUHCYAeB42e5xtkTeuv/03b1CmwPWbBZl
 Tvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=0TjyjmagWil3MltuTF+3LjPFTwhOERwy0g28RMKJdOI=;
 b=2dgpsQXH2oNxFhREP3UwfPsl21udQXylLVXsOdKC8AKWFKxxgo2zlz3pZjcUts100s
 h1u9qEuFU2I1/RashWD5R7+MXsLNT+HIgpKQSp1TEkBcHailOPuI8gvvb1I+Gb+2oZxJ
 yAQaVK902tcsEDXDixMd41q7JH/WHX/+TvzN2AKyxYWhat4PlH7+2wYEkn5+Xwc6Up/p
 ZrFOydgSIgHb+BmfLI9HDvVwfB3stYNhpoYA5Xnn0tOMMzHKcZbDrAnWvs+EnyUFNjVk
 VCfFIua2QT5/0OkXh98fmDSJH82uJMyrdKFEf2j9dBkLAOTkTrKRBvWaAtPG0JUkI163
 0aDg==
X-Gm-Message-State: ACrzQf2W3u+0HlkHGEfREjjplxcPFvPf7jPEsDhicBv03yDRkLp79wSx
 kBQ3PXPZhZrJxBL9Ni5Nd5eN3jCiiT4=
X-Google-Smtp-Source: AMsMyM49pVvkjgXFyLFsqPGIkZgpe7L4yPDZqimxcB9M+T5rHLwZ1/IzSiLi04GKIlfu6lQ9ACYh1Q==
X-Received: by 2002:a05:6a00:cd6:b0:546:d03:3dd7 with SMTP id
 b22-20020a056a000cd600b005460d033dd7mr28658305pfv.19.1664276924858; 
 Tue, 27 Sep 2022 04:08:44 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 i7-20020a626d07000000b00540f2323f67sm1453601pfc.95.2022.09.27.04.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Sep 2022 04:08:44 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org,
	Thomas Huth <thuth@redhat.com>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v4 46/54] tests/qtest: libqtest: Correct the timeout unit of
 blocking receive calls for win32
Date: Tue, 27 Sep 2022 19:06:24 +0800
Message-Id: <20220927110632.1973965-47-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220927110632.1973965-1-bmeng.cn@gmail.com>
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Some qtest cases don't get response from the QEMU executable under
test in time on Windows. It turns out that the socket receive call
got timeout before it receive the complete response.

The timeout value is supposed to be set to 50 seconds via the
setsockopt() call, but there is a difference among platforms.
The timeout unit of blocking receive calls is measured in
seconds on non-Windows platforms but milliseconds on Windows.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---

(no changes since v1)

 tests/qtest/libqtest.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/tests/qtest/libqtest.c b/tests/qtest/libqtest.c
index 1ae58624d9..e3360338de 100644
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
@@ -106,8 +107,16 @@ static int socket_accept(int sock)
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


