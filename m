Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 488B55810AB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 12:02:57 +0200 (CEST)
Received: from localhost ([::1]:59192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGHOy-0004zC-5p
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 06:02:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oGH7U-0004Xl-I2
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 05:44:53 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:36531)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oGH7S-0001CR-GU
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 05:44:52 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue011
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MQdtO-1nsfjG2KGs-00NfEf; Tue, 26
 Jul 2022 11:44:44 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>, Helge Deller <deller@gmx.de>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 2/3] linux-user: Unconditionally use pipe2() syscall
Date: Tue, 26 Jul 2022 11:44:41 +0200
Message-Id: <20220726094442.4452-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220726094442.4452-1-laurent@vivier.eu>
References: <20220726094442.4452-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+Ovr0/76oUH/hG6+og+GRiO3VEqbLUKfsSkyxQDBuFg9eoNjQGg
 8QiXjbjYJcaHd7WTlSyEP9PYwJEJh34h+/yoO9jekAYKap1yo0wZ4VCDZUxN0yq7NUJiCSv
 qNSlP7mmkghMR7WsoYMFAbQtFhaiEDw4WONnx7pUkH/RcC7IJ2fyFROUm+YpsOVuka+Ilf7
 UZjpK2COJeIdlc5dZMBGw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:XQawUWV7wuk=:i5qp53y5nHaHIqFIYgtxoI
 tebL7qAbBm6xS8K5NMAdY/wsj4CwM5X/LFScDnFqUiuEjMRgJI0YH3QKXTk6EWadb6hH8MEE5
 +mDKVNgCCv4pcyn3KKHlDEzoQr6ljmaVkshsYAPal5amPHr1qytzFTyYChH2XHJG5kISdzWFz
 6RRsv4VxtTCJsKWgNkYSS3tib/o/OTXm0pBwrRn3TkdXb/pUN657hkJrmaV9xSV7qRVRd8vbs
 tHnxzn9/RUl0XqQf1G25R8q8CsQrYA40tc5YSi2jMsWUOVhA/OBV/ScwAX52QpajO17HeToEN
 57KumYnmInUXkd+zrZWTAaIY1e1JjoIB0mOrFT1khblksAJOzbBfNSOgOyrlS6x7+iCIsdJeg
 Uj4PeSiBhHQi2ei4tNUql8FjElDp0xjWfEqBPPkI0hYn7v+Jce2jMPsk2f5HmRpccn8ba5Cz3
 gNO43HAChzE7Y9BzdM/pjpzh4of/ZL38jSp6YzuSZopd6sgLqrGZ/wy07VtSTS+yEF+etgUv5
 dikJvAuBUWTnp+Qdk2p32TY3t+EDrC6oZ0QJEJ89ka2FGqvIsTN4J1TL0U9wLZqSZN5FmKdpG
 NgPyvELtFcMyU9IAzbiEUU7oJ7fWXzdj9+uwSFfZR3nB2k6QRI4pQCX5t8tzbbStIl/YZaGra
 p5rmBrSOp1CB0sEd0/k0vgt1e9I9s/2tj716+zvmvZUR2/5AQnHP829QAshz1uIOOyQUd51S2
 WJZtAIO8YqJWjWqDUt8bDZA+/4fdRFQ/fvCBBA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

From: Helge Deller <deller@gmx.de>

The pipe2() syscall is available on all Linux platforms since kernel
2.6.27, so use it unconditionally to emulate pipe() and pipe2().

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <YtbZ2ojisTnzxN9Y@p100>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 11 +----------
 meson.build          |  9 ---------
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 991b85e6b4dd..4f89184d0585 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1586,21 +1586,12 @@ static abi_long do_ppoll(abi_long arg1, abi_long arg2, abi_long arg3,
 }
 #endif
 
-static abi_long do_pipe2(int host_pipe[], int flags)
-{
-#ifdef CONFIG_PIPE2
-    return pipe2(host_pipe, flags);
-#else
-    return -ENOSYS;
-#endif
-}
-
 static abi_long do_pipe(CPUArchState *cpu_env, abi_ulong pipedes,
                         int flags, int is_pipe2)
 {
     int host_pipe[2];
     abi_long ret;
-    ret = flags ? do_pipe2(host_pipe, flags) : pipe(host_pipe);
+    ret = pipe2(host_pipe, flags);
 
     if (is_error(ret))
         return get_errno(ret);
diff --git a/meson.build b/meson.build
index 8a8c415fc1f8..75aaca8462e8 100644
--- a/meson.build
+++ b/meson.build
@@ -2026,15 +2026,6 @@ config_host_data.set('CONFIG_OPEN_BY_HANDLE', cc.links(gnu_source_prefix + '''
   #else
   int main(void) { struct file_handle fh; return open_by_handle_at(0, &fh, 0); }
   #endif'''))
-config_host_data.set('CONFIG_PIPE2', cc.links(gnu_source_prefix + '''
-  #include <unistd.h>
-  #include <fcntl.h>
-
-  int main(void)
-  {
-      int pipefd[2];
-      return pipe2(pipefd, O_CLOEXEC);
-  }'''))
 config_host_data.set('CONFIG_POSIX_MADVISE', cc.links(gnu_source_prefix + '''
   #include <sys/mman.h>
   #include <stddef.h>
-- 
2.37.1


