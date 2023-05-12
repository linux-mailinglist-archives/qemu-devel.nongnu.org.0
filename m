Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1197006AC
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 13:24:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxQrI-0005zI-PF; Fri, 12 May 2023 07:22:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrG-0005yQ-N0
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:46 -0400
Received: from mout.kundenserver.de ([212.227.126.187])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pxQrF-0002O4-56
 for qemu-devel@nongnu.org; Fri, 12 May 2023 07:22:46 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MBBCI-1q2MY8498w-00CgDf; Fri, 12
 May 2023 13:22:43 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@t-8ch.de>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 7/9] linux-user: Don't require PROT_READ for mincore
Date: Fri, 12 May 2023 13:22:36 +0200
Message-Id: <20230512112238.85272-8-laurent@vivier.eu>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230512112238.85272-1-laurent@vivier.eu>
References: <20230512112238.85272-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:kF8Qqf3UVZfsQUstMkyw6i+ijgyOZHjAHvjbJkqWpttWGDScJs+
 rZV0jhRFUszyUtsHFyIDGX9LiviS/xv6N2RiZqZw0czu+aTuUZs/ondsblbOIymjyy9YYYM
 OZCBZX5+XdaDi6dat4GwqZKtqCw6uD0P8tG5RERXLEsXpM+IKkxZBVNONbiMetj/vNFdP8d
 OTCHmd6poKxLj/O7eHlBw==
UI-OutboundReport: notjunk:1;M01:P0:CXB9Qp3eomA=;wPbnJXydmxfOSSKz1brmZKVD/b1
 2WN9PjRDp6P5GDxGY/V9uJ5i+qelbCuH3bMKOgzuL8Iga8c7HfouuZy6AnWE4291/sthjXOIJ
 JwAPJLJz2kHyvnOCw/wJM1LU9CNjj/2vgLAPXfMXvXIUNYJQZFRppTSw5aFm3xB1mbJ+HkI7F
 uSKr7DVgxJ+JISG+hQzfkKiJqhhRBWijpkrWyUJKm9GHJ2i1vfKzf8wAySDvTX/yoVoFKn8Au
 9ymvxwnJb5QGeiNI8D3jzOkKKqe0dFlCSxrFKAUITbgSuUXfPpDprAMqpkXIHHxU07o50oCyN
 HNcuoVNU5QlXwTgz0LwnCO0rn5YgaBr6pppC9mHW128GEsMyr6RvTk2hbNw9rM9x3v5JIXTfb
 X3mQ8pS8pWsGR1he70RtEC049xxb24q7FR7YmyeZrVOXxNfwkPMketOe+hz7nwIVgviTGIQe6
 xqtF8EEVDtZkQRt43sE+JJ34FDAo9ABucNjwvY9OmrasrcEf9pfdszxgq/4iP5fK3Mu39vAch
 sOEArUn+4UYPJes/uMiP/5wUmgwaOUuDNu592pTani5WNo0xGbDGJZyTRwymrvGu8Cx1+XrIY
 56oIHw+hTJkfLa+RlnpNNY473mvWXHmUk+A2WHmUpmOT9yfT9gXOuj6GKdzP7E2Lfl0az50/r
 W0BvnZL27nnLIY9kBxnuOcPQosAb5d+lvcKCA7ssiA==
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Weißschuh <thomas@t-8ch.de>

The kernel does not require PROT_READ for addresses passed to mincore.
For example the fincore(1) tool from util-linux uses PROT_NONE and
currently does not work under qemu-user.

Example (with fincore(1) from util-linux 2.38):

$ fincore /proc/self/exe
RES PAGES  SIZE FILE
24K     6 22.1K /proc/self/exe

$ qemu-x86_64 /usr/bin/fincore /proc/self/exe
fincore: failed to do mincore: /proc/self/exe: Cannot allocate memory

With this patch:

$ ./build/qemu-x86_64 /usr/bin/fincore /proc/self/exe
RES PAGES  SIZE FILE
24K     6 22.1K /proc/self/exe

Signed-off-by: Thomas Weißschuh <thomas@t-8ch.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20230422100314.1650-3-thomas@t-8ch.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 95da74ab1234..7170332041ca 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -11981,7 +11981,7 @@ static abi_long do_syscall1(CPUArchState *cpu_env, int num, abi_long arg1,
 #ifdef TARGET_NR_mincore
     case TARGET_NR_mincore:
         {
-            void *a = lock_user(VERIFY_READ, arg1, arg2, 0);
+            void *a = lock_user(VERIFY_NONE, arg1, arg2, 0);
             if (!a) {
                 return -TARGET_ENOMEM;
             }
-- 
2.40.1


