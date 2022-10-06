Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE4B55F6ADA
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 17:40:58 +0200 (CEST)
Received: from localhost ([::1]:45430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogSza-0007Ub-09
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 11:40:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58136)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXx-0003fl-3P
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:26 -0400
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036]:45894)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSXv-0004cq-GQ
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:12:24 -0400
Received: by mail-pj1-x1036.google.com with SMTP id
 o9-20020a17090a0a0900b0020ad4e758b3so2011503pjo.4
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KikajeV1rfLr6F/ZMb4ysQ02AJPYh5p4ZSc7N5x5QVQ=;
 b=RAC8wIjtAM3cMEQui3qfpU8HWGF9gyfeCq4zEp4gn0021S8/CgcWO5Fu0YZtAJUED2
 zqt+q41WPHkBDtyr11hV6mLIOMAvhKNWrcuPjYWsOXlLJliAyK2tmUFJn1TsTazA7EYW
 230XCV5DKs6osnokNwOvI6MO91uKgFUdC6MeAnzsCkIISXHRX2t/Tl7kqGQ9Ehb0agej
 IRfl6xuSWvJ3FEf8b1wZMeGXhe7UpgbdgjDwIsW93YKuhS01hwEACTagroN4dAD0xLRJ
 OxGPhSLmwH1Vj8O89Dh1yBKR74N2j9NmTKVeAV+UQEDPZGA4RWb2TP0o6f5bvO8rgH2a
 L6zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KikajeV1rfLr6F/ZMb4ysQ02AJPYh5p4ZSc7N5x5QVQ=;
 b=24hSfh0VYSQE2c18VRRPbQLjjqowWRhrIEJfjVh5g/lNimt6mIrxwNonSg9PEHkjdD
 gJ/phUyWSasGWL4P3WioYXLizs2ldiB+/+77efL0RbUPv+et0JHTb1Xt9s+9m4y1GqUo
 d9rKtWgViBxLsaW6LUkTWj+avRm2a8f09Oc1gXa0iuden5ZyfCyn1KY516/ivcfROm/l
 a/Iu5UOvQFR2lJIMZKXD/V5eM5o+yEbsiu5uOMzWEkm0nb3oEWCDi8gd9c4mkwShCGR9
 rBTpSVoeER2TzJkw3fijqek8LgeqtttEi44ESQysOgyV2LPq3Krna+jvlWH8rEyQ63HG
 hZ+Q==
X-Gm-Message-State: ACrzQf02stH5U7Eitj0ZYh6O6TfTYHhOfBU+Q0DL6EGLHKxDaUZ8485L
 dG7NzOQzoW+vTt8MUiwq5spr3eAd9Bs=
X-Google-Smtp-Source: AMsMyM4T2HM5SyE6oQT2g0AZOgdCKKdsgmNLlodob/Vnit5zx7gp0BoGrFIXhGeXc/4ZBLp1F6NYMw==
X-Received: by 2002:a17:903:41c2:b0:178:5ddd:c75b with SMTP id
 u2-20020a17090341c200b001785dddc75bmr411936ple.22.1665069141809; 
 Thu, 06 Oct 2022 08:12:21 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 135-20020a62148d000000b00540c8ed61ddsm8589067pfu.150.2022.10.06.08.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:12:21 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH 13/18] tests/qtest: libqtest: Correct the timeout unit of
 blocking receive calls for win32
Date: Thu,  6 Oct 2022 23:11:30 +0800
Message-Id: <20221006151135.2078908-14-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151135.2078908-1-bmeng.cn@gmail.com>
References: <20221006151135.2078908-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1036;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1036.google.com
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
index ecd22cdb11..d52883c361 100644
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
@@ -103,8 +104,16 @@ static int socket_accept(int sock)
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


