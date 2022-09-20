Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D41F15BE713
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Sep 2022 15:28:48 +0200 (CEST)
Received: from localhost ([::1]:40664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oadIt-00066y-JP
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 09:28:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZV-0001RF-Fj
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:47 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:46008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1oaaZR-000519-MN
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 06:33:43 -0400
Received: by mail-pl1-x62c.google.com with SMTP id w20so1892299ply.12
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 03:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hZ5BeVWIEmvZSQc//vOc1hMlcaYTXrE6w6t1vRdBzGs=;
 b=GHS4zEbZxBY1c5gFN2zEzR+RmGE8jPrJJS6t9mvCY2FS74VKBficA0DnA8rIMPt8wy
 hR4CMo1WXz3AE9hv8Ha6/vYPcjtzl4DgrAXrnseENZ23xvcCfDvboZlMREu1Nh1wndYm
 zv4lM2FD8clSxm+udggtJI6bIdVD0Dib5JFXWPwumPozJlympGvEo1Yc3SIJ8FNHOkCv
 VJpl9mJhKab+gIWQASus8lUOqnce7HoWXnZv5jykq6bRPvifAq2zfGf/5cqIu0XG0zpE
 GZNxNOehAQK+St7C3pc42wHqYBmI031PEm38wDE8MzrHPTpWfoJXpsE7enyqZ/vOAIkf
 4Vwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hZ5BeVWIEmvZSQc//vOc1hMlcaYTXrE6w6t1vRdBzGs=;
 b=sNQpZsOkL1FHwRTe/WBKozZYd6RMjH7biuO/742KnGWl1hpa2EIul63u/EBATYce5y
 Y/eU6OiLzwDYs93LOVS1l9MAi/MtNokU9PMMUGPIq6oPWY/72+LwbwqnKsWHCYq+Tq92
 Rn3Jv+XkZQNdOVEThW2MMkZzskfr2Xxj6k3lPNQgqd+HJckT0XPV+xsMEdPzGGvWyDVn
 2Hs8NQ1Wu0Ia/GO68aMKjBTXg+t15GMQDT2PO133I4XY/124eByGl98YTgVnjj6NJow0
 Ni3CB/1IUSlqFCGtTMVApZN6KnopaxbXNNiS20Q0PIxCa9Gl7sj9iDwb/Sou7RBiweD7
 c1UA==
X-Gm-Message-State: ACrzQf33GZni8MaraCxELw0P9jwFPPTablR8BktERWQCBM5WlJqZmQGU
 C0hkd2C42RhRmyR5ultP0RnxWaEFBPk=
X-Google-Smtp-Source: AMsMyM5qoZpCGAQpa84tMURG8knRZZNVb36ikUmTOZtCU4mwxzxcKcRJH8628yJWJNlhi3pjIYS/RQ==
X-Received: by 2002:a17:903:2104:b0:176:a9ef:418b with SMTP id
 o4-20020a170903210400b00176a9ef418bmr4136738ple.134.1663670017770; 
 Tue, 20 Sep 2022 03:33:37 -0700 (PDT)
Received: from ubuntu.. (144.168.56.201.16clouds.com. [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id
 n2-20020aa79842000000b00551fa0e2b2dsm699573pfq.206.2022.09.20.03.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 03:33:37 -0700 (PDT)
From: Bin Meng <bmeng.cn@gmail.com>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 31/39] tests/qtest: libqtest: Correct the timeout unit of
 blocking receive calls for win32
Date: Tue, 20 Sep 2022 18:31:51 +0800
Message-Id: <20220920103159.1865256-32-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220920103159.1865256-1-bmeng.cn@gmail.com>
References: <20220920103159.1865256-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pl1-x62c.google.com
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
index 08c4e76ffe..f6df0e35ac 100644
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


