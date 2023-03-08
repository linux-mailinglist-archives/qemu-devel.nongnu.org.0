Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2675A6B094F
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 14:35:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZtth-0004OL-Ie; Wed, 08 Mar 2023 08:32:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr6-0001lC-Mm
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:22 -0500
Received: from mout.kundenserver.de ([212.227.17.10])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pZtr2-00066j-RH
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 08:29:20 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MQdI8-1pxdH21iVi-00NlTO; Wed, 08
 Mar 2023 14:29:06 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Mathis Marion <mathis.marion@silabs.com>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 10/28] linux-user: fix sockaddr_in6 endianness
Date: Wed,  8 Mar 2023 14:28:39 +0100
Message-Id: <20230308132857.161793-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230308132857.161793-1-laurent@vivier.eu>
References: <20230308132857.161793-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Hy53xkBdeSLRXJ6pYxuYEEHOz9j/oWvZquYZC5qO8IouMOlyyiW
 TwCn8cilroAEizwUIbgaiErzZTCY7MzOSxXuG9u/DK5fxjCnWYKYqyYGx2rbVvs+ElOrDDK
 bNd6TvirFYymjbpdSlK9unSs6VXpKToyLzllQI/+9eIOjnYRmUphKYDsSfCGdsezjuQsuC7
 /ipSY6S/IUzJuTey7psYw==
UI-OutboundReport: notjunk:1;M01:P0:0yyqnfcbaH8=;E4Qkf3VIQeOuYl/Z0jMgAvq+E6Y
 ANBEXO2XPAwmnt1RGkfnP3ZygPq2etPqld+1SF8LmBB8192UiMxaK6OHnL3ztsWdkGKLhKjA6
 tt1adLvYyE1x3to5MQb/HTUAMnzaSQEvTwJmtBu7xNQFIKkMhv3hTXszvmYd9bbg0qdwwWBqU
 9rnkb54Cw7LB+GJ8aEG9Sz7PitjN3aVq6DTBgId8ws1voPmWAG6suVHTN/UT7/nXuTqYm7bvt
 sI1R7j5qP0MaJkAk9gYe7tJo80j6NyHFKFkD6+bruceb8BxoMdfWPGz0GI09aQDzZNd/7u8dL
 gsghJS9f8onDzqI3KpzaY7Us6JrIMbPt1eUo7RHDs22J0C5mEe7ysoUGkANWVIryzFOmcFAkR
 WC1YB8lFGO6d9OXVXVL2kVX8QrUpxpUcgTFfGToO3ML2E2Wq+QXAlAt0XDqOajsa4RSU4SPrk
 idlXkO3FPzNHXF7ALmWCunPKZO2gJ3WPrFG9j3je6GrC7saScX5dvOp1wONWRCybAmMfnkGej
 KeBWZcuDZC+1LeIv46q45N7W64vGfp5tP1EIcp+qFd/bgAOlhVGCGMLjeXhI/+N9/3HlQLn3q
 pjobkPjYPXAwl4h2i2SZYCNz0vNi0yxRiyCYG9J16CpCOU3+a3p6juqBNISINUmNpd1S4Oqkw
 rvy3+JT7ugGLloeChhFFSMcVzUycEchVdWy6z++q8A==
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

From: Mathis Marion <mathis.marion@silabs.com>

The sin6_scope_id field uses the host byte order, so there is a
conversion to be made when host and target endianness differ.

Signed-off-by: Mathis Marion <mathis.marion@silabs.com>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230307154256.101528-2-Mathis.Marion@silabs.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index bcf409e134b4..1f903dd67cba 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -1714,6 +1714,11 @@ static inline abi_long target_to_host_sockaddr(int fd, struct sockaddr *addr,
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
2.39.2


