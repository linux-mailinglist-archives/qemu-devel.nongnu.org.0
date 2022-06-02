Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 090F553B8ED
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Jun 2022 14:23:01 +0200 (CEST)
Received: from localhost ([::1]:58910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwjqu-00056D-3q
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 08:23:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTe-00012y-Jb
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:58 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:39111)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nwjTd-0001HA-2E
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 07:58:58 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MDykM-1o6apP0V6q-009vQS; Thu, 02
 Jun 2022 13:58:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 17/19] linux-user/strace: Use is_error in print_syscall_err
Date: Thu,  2 Jun 2022 13:58:35 +0200
Message-Id: <20220602115837.2013918-18-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220602115837.2013918-1-laurent@vivier.eu>
References: <20220602115837.2013918-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:XWErTcrZ6W5JxPdOk3q0B2fTn1s115yHePcBVlGBw46nDI3KZJw
 JQIQy/SIJwh3UqaapA8CPrCDw9Yrp9XcUsWIoePE6cjqwZ6T6uzA6FCjpCu8aJYp7AykLbJ
 VlXfd4NgmXg6OCRpaFfPklD77p8u2DEIbaIk9qrCpo1j5/n8AWufHGVJvjYarDunAk+nsyE
 TGIAE8hhatX8npu+GgCIw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:EM9Dr8HJ7BY=:/TYFpVVxoDDSBa3VMK7+HH
 gTASeUxFvDLe+YvyXJKWdqjFzUjJBOyiAEf1nS4RQ+/ahem/PYYZuX+APOnjf3fQC9O4U3Qmq
 9j9SHmRwFzICUmuLbdmevg7UMF6RTkdASUzvGCfKS98LQO/inOPl4zQSLJ/1VmyblLIspvdNI
 nxahldfng0CNVgYkX81C0w7bpul71PNhgMwBLzGSvl1UZ0M2AIzthX92l9GIDhA2/0NKL/oXe
 P3VDfYfQpvV7qQsmc71Z3fy486yo2NxSccVN5zVgBeaRM1S1Z+wOsVXTNuzBekb+nMnXDNJT7
 IV6tPBq2Z61xJH8AX6zIkGs+ZRo8tI3LdeCmc2HAZNgUvVrdvRHrdtyszSKPW4+WBQKAsEvjk
 2ESVoYZcR2VviA72HiIngGHOUnyo/meOZM+ezySvuwhfWbNG39NaT6VtZ1nuvMIbVuOZvDBxb
 dwRjBaaju0/Kmz+YW5OZwXdcUZUGr4qdRtAOk4HY+dgJXsQlPgtUfbCnfi4OZ8xr1g6gX/ieC
 s5VnkljkFrVeealawdUcN0aQKXk8dYR6VyCvD/V+xMln7MezKsfrQzegnKE67k/Osx4qFbF/5
 RSPkI8sTlf4kd3TkuGd2NiC5lUaWoG0Iy/EPgeARF9fFi6Q79ErYgcKP5xHxlWOFxbBaDlb0g
 Ph4ovwF4XZnOE3miC6iOvqj3VYvqYFfV75S0FYZ4D2/pfLfkJdI+Asy/BZV2Yfn8HEUuaIh0H
 MHPcczzkHgEvVWMOsGrC08XRhMWpzOhqeTdaiw==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Richard Henderson <richard.henderson@linaro.org>

Errors are not all negative numbers: use is_error.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220602013401.303699-16-richard.henderson@linaro.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/strace.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/strace.c b/linux-user/strace.c
index 9fa681dea9bb..7d882526da03 100644
--- a/linux-user/strace.c
+++ b/linux-user/strace.c
@@ -689,7 +689,7 @@ print_syscall_err(abi_long ret)
     const char *errstr;
 
     qemu_log(" = ");
-    if (ret < 0) {
+    if (is_error(ret)) {
         errstr = target_strerror(-ret);
         if (errstr) {
             qemu_log("-1 errno=%d (%s)", (int)-ret, errstr);
-- 
2.36.1


