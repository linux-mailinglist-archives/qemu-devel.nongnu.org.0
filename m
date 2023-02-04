Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F418C68AB23
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Feb 2023 17:11:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOL5u-0005Fs-Rk; Sat, 04 Feb 2023 11:08:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5p-0005CY-HS
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:48 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pOL5n-0006wm-UD
 for qemu-devel@nongnu.org; Sat, 04 Feb 2023 11:08:45 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MTRhS-1pCM9l2EcG-00TirZ; Sat, 04
 Feb 2023 17:08:41 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 15/22] linux-user: Fix SO_ERROR return code of getsockopt()
Date: Sat,  4 Feb 2023 17:08:23 +0100
Message-Id: <20230204160830.193093-16-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230204160830.193093-1-laurent@vivier.eu>
References: <20230204160830.193093-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:ctvkeRRaSGp+LXDc9zYwdH5ofs1nRVuBV2Q51cNatjilB/ph77y
 zJgj/+iy98/AHljUE5MjCTcwXU4pEq1Ozz5Gbz4L/PENYFETM74I4Oq8sSfj1oswequOZ42
 +wtFuBQNGK7gt5Q4sbN92hPdkB3eezZDEL+d4ELT0YkOYBTAPLmi4HzLQb0qr8CjZfcaVOG
 RmtqxT309SMq4Q+g09xag==
UI-OutboundReport: notjunk:1;M01:P0:XaT9SpYvLG4=;B7vR44XIuM9Iemjr6GCram7TmrM
 UF67rcoHFf2dZbr/PyQ/YpzyWje4AJd8hv7/yF+Fx5cLMUbegow6Qa0C6sqYwjbpMGRPTM6Cj
 8DPCiWipuzmj0N4aqKYtoDqN5VRqNrL5Q6RiWwOwPtFTEmBYv+RZQPyFCjPTzgmXcvtfoGbPk
 HvdfNge9uqZ7E1ACcglkzK653OyJ4BgErDEUnkhQD/CXGxrqYzIvxzZTQd7EpX/7KlW51Gjka
 oFjcLdd+nPEDfVk89tJa/AZUUKgANrJEysnaSuifdATXNzu2OxzUFTzPfJmO3ZRD223ucDjMH
 qB/qCsnicebv3UqGT292swq19pb3F+a6wHZBtQU6LZ05tWPmPXx374v4Ka/sZIxUE8A5e0zY6
 xxvBbEOyryXq7GkycikHgNWa3FNFNlS3aN/u/1YkZxccemasmfMjdfgA1Wbwdvg9iaiS7Fw7A
 5skARRFcLJBfaTlDcR1ucxx82kzA8BF3lwk/j7AUhVPxP8Ujrs4OxeEIDeeuHj1t8y7eOO7+U
 C6M0lPGiOuzwtpfUh4bP7u44D8ucokGy3g/AWJTMa4qGq9EuIkTdzhlQiMfr+Z8+Kbedl7ay+
 7YhOD6C6XPOChIXUhi8Ws4/oJzoRewprnbXmDvZyBQKe4t/JxiPa+OR0r2YsrxN2+O5B4jB9D
 g5+s/IBQuacHC+Yrs3AkHb4LAkEq5vuWyLF5okVFGg==
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Helge Deller <deller@gmx.de>

Add translation for the host error return code of:
    getsockopt(19, SOL_SOCKET, SO_ERROR, [ECONNREFUSED], [4]) = 0

This fixes the testsuite of the cockpit debian package with a
hppa-linux guest on a x86-64 host.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <Y9QzNzXg0hrzHQeo@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 210db5f0be94..1c42df651801 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -2758,8 +2758,13 @@ get_timeout:
         ret = get_errno(getsockopt(sockfd, level, optname, &val, &lv));
         if (ret < 0)
             return ret;
-        if (optname == SO_TYPE) {
+        switch (optname) {
+        case SO_TYPE:
             val = host_to_target_sock_type(val);
+            break;
+        case SO_ERROR:
+            val = host_to_target_errno(val);
+            break;
         }
         if (len > lv)
             len = lv;
-- 
2.39.1


