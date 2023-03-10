Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5256B5403
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 23:13:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pakvr-0008I0-0a; Fri, 10 Mar 2023 17:09:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvp-0008Gm-1D
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:45 -0500
Received: from mout.kundenserver.de ([212.227.17.24])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1pakvm-00034B-QY
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 17:09:44 -0500
Received: from quad ([82.64.211.94]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MPGiR-1pvSjY3UjN-00Pa2I; Fri, 10
 Mar 2023 23:09:34 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <laurent@vivier.eu>,
 Mathis Marion <mathis.marion@silabs.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PULL 10/28] linux-user: fix sockaddr_in6 endianness
Date: Fri, 10 Mar 2023 23:09:09 +0100
Message-Id: <20230310220927.326606-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310220927.326606-1-laurent@vivier.eu>
References: <20230310220927.326606-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:RSC8l9Pchs9wsuCzh8EcgVNvxm1rOk+ZyjLPuTMz9Ek+83Q++Hu
 gL6gDRJOGfVT9Gf4+MgvIE42Bk2CkOpkz8cZd1Sf2lEheRuoVAjOJSWpPMA3DGU8UX2Y2cX
 v42tgCtgpSmVO5Hp97HeGE644kJcKf0tLhLH+OTu4q0QId4E1agoQsRQWLnRSzeyF1rIHvZ
 YHa4Qc5HoM0o8X9MWUIug==
UI-OutboundReport: notjunk:1;M01:P0:hw8pl3uBGzE=;I/hsQAZC0H6xdCSIyJo0OEEwnZZ
 1ZOTLbA2YGmSpYqEF4ZElN2SATb11bO9Q13XZgu81HC/WRSDB+5/mXKNrTlpdmv48OPtosrkn
 eUXXPgdnyuyOLbNf7kTev0XTpCNt7/8CvCeMu80KQQs5sXoaKLmQC6xQZyKMBnHfzOV2FFucm
 cBQscujBCZOV7w8FJp0zmd6vfwqYJfGlwT/f05ccms96+8HSBjJZ2HP/1IjIoEjYIl3qfyi41
 9urzJomxgEziXGq0/8UxVvDUzkU4EtKlvznzNJC5iBj+otCm2EXGy8hWx68M7AeeMUhWcBZVc
 Ar6WIQRf6A8jNIFaL38godVOrXMGwJFstOWYLmfTgInqSqMXGzUi5WdLBeoZXL2zKuzm3yKsk
 W2SgqAwMtq35ccMOROGHSa1AZlIl9igm0qkYEgx1mSBQoq/uwTQBr8mtRdCtWSd1NbEsNO3UF
 kjDIv/RU1dfdXf9m/QDGqDdtG4xAZEhrO94L9x1tXSgHDONI9b6ndWlG6sMjBF6yZd3Vc/iio
 YjF+e1E98pcSXv+T3UPs6W4M6PP5hZTrNxmQboDrQ4+nHh7AiwAqLmWf62BfWQ3K65ISglkUU
 cIPttDI83Swfx0F6pvXpWMsFkar3uUr2ogwYJbnaz3v827f7fYy0IZx1VvLSKPpRm1YrPG4ms
 UINF8oTEnOsLGfgKcnUIE9tKURi/7iJ4RsWRWepe/Q==
Received-SPF: none client-ip=212.227.17.24; envelope-from=laurent@vivier.eu;
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
index 931f9db47552..05c81079e745 100644
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


