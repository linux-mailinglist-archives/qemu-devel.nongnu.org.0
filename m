Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E219F5F6BCF
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 18:32:50 +0200 (CEST)
Received: from localhost ([::1]:54800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogTnl-0007iX-Ev
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 12:32:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfW-0004Wk-OJ
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:16 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030]:50969)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1ogSfU-0006DL-L1
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 11:20:14 -0400
Received: by mail-pj1-x1030.google.com with SMTP id lx7so2082054pjb.0
 for <qemu-devel@nongnu.org>; Thu, 06 Oct 2022 08:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KikajeV1rfLr6F/ZMb4ysQ02AJPYh5p4ZSc7N5x5QVQ=;
 b=g0TCRu1tX5TmQnyzftmAPARwwEc/wWukLQ2Q5TYzlwsvTuxMEtq9BJA/IGk9CelYkX
 1mFMnpGGliSoM4lThT4mcoCDwt0FpfjGoXPWgKoMjDxzrJkJtxV1Nwciere5CSGl6HMp
 tEo7Gk7dzNn8AfxpGWohXNTOP/dlrq458rqGOusj28h0vjeSgQF98yms88vIYzetjmUk
 hXJdx5HSYe10UdU1f3qn3LWQ45Palq0pyIBw/2+qW8MHPoSeiOmXUFlLeAbtX7+dZVOb
 K6ajqACPA8FFihvrFTwGIg6So2mTwY4IlBKie9ZTJ4OLMd5BZTt9UMgCTqlgaFifxydf
 o8kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KikajeV1rfLr6F/ZMb4ysQ02AJPYh5p4ZSc7N5x5QVQ=;
 b=0vIWAJsZKJHHbu+QTLsguzNZsXi70woSmGmCxvjqLu9CBg95J3Ac97TsZcpi05we27
 T8G18C4GkF9DTInohgqBm5RFS3kawThXMwIEYJ/QtO3me8wu8RurDg0KAzBX4KbKaBGy
 NvtU/H4MeaRYyMZEalKny6r26BwtB5pkTmjGVUOjpI9f8+OoJamWT5VU4H9/uaNedkZc
 BROhZoWEbHeRY4cJxYBKy/J8qstlj2x8OvZRyscplnWubAnKxd0Za3FZ3NpOb9GC9oby
 ciexxWgg5nBHkJl6kL/LiKPZSVE64WHJm8NG9u5DiBX6L3mYgbgouNsatCZ0Vk5Xm6qc
 yg7g==
X-Gm-Message-State: ACrzQf1heqrwXl+SczUjPMUbJV8zH0QwRfsL0oq8po4P0wXmWrfu5taK
 qkE2s+YEvo0PK275smyDEvk2a16YSbo=
X-Google-Smtp-Source: AMsMyM4pdmHWbgmlRKSB6UfcJMTJpETnSCHG3zsboCDd3qSX/jjsbmQDN1D/LNyE5RwV3N6d1E3aiQ==
X-Received: by 2002:a17:903:244d:b0:178:a0eb:d4bc with SMTP id
 l13-20020a170903244d00b00178a0ebd4bcmr397617pls.33.1665069611116; 
 Thu, 06 Oct 2022 08:20:11 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 p13-20020a170902780d00b0017c37a5a2fdsm11426759pll.216.2022.10.06.08.20.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Oct 2022 08:20:10 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Bin Meng <bin.meng@windriver.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Subject: [PATCH v5 13/18] tests/qtest: libqtest: Correct the timeout unit of
 blocking receive calls for win32
Date: Thu,  6 Oct 2022 23:19:22 +0800
Message-Id: <20221006151927.2079583-14-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221006151927.2079583-1-bmeng.cn@gmail.com>
References: <20221006151927.2079583-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pj1-x1030.google.com
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


