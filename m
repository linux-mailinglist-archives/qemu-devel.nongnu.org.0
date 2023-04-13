Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F38396E15EA
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Apr 2023 22:35:04 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn3cW-0003we-Cu; Thu, 13 Apr 2023 16:32:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3cQ-0003qp-2N; Thu, 13 Apr 2023 16:32:34 -0400
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1pn3cG-0003l9-Nx; Thu, 13 Apr 2023 16:32:33 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 728564013E;
 Thu, 13 Apr 2023 23:31:57 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id E10AA21E;
 Thu, 13 Apr 2023 23:31:55 +0300 (MSK)
Received: (nullmailer pid 2344361 invoked by uid 1000);
 Thu, 13 Apr 2023 20:31:54 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Mathis Marion <mathis.marion@silabs.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Michael Tokarev <mjt@tls.msk.ru>
Subject: [PATCH 15/21] linux-user: fix sockaddr_in6 endianness
Date: Thu, 13 Apr 2023 23:31:27 +0300
Message-Id: <20230413203143.2344250-15-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230413203051.2344192-1-mjt@tls.msk.ru>
References: <20230413203051.2344192-1-mjt@tls.msk.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Mathis Marion <mathis.marion@silabs.com>

The sin6_scope_id field uses the host byte order, so there is a
conversion to be made when host and target endianness differ.

Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230307154256.101528-2-Mathis.Marion@silabs.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
(cherry picked from commit 44cf6731d6b9a48bcd57392e8cd6f0f712aaa677)
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
---
 linux-user/syscall.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 24b25759be..106d5ed05b 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1755,6 +1755,11 @@ static inline abi_long target_to_host_sockaddr(int fd, struct sockaddr *addr,
 	lladdr = (struct target_sockaddr_ll *)addr;
 	lladdr->sll_ifindex = tswap32(lladdr->sll_ifindex);
 	lladdr->sll_hatype = tswap16(lladdr->sll_hatype);
+    } else if (sa_family == AF_INET6) {
+        struct sockaddr_in6 *in6addr;
+
+        in6addr = (struct sockaddr_in6 *)addr;
+        in6addr->sin6_scope_id = tswap32(in6addr->sin6_scope_id);
     }
     unlock_user(target_saddr, target_addr, 0);
 
-- 
2.30.2


