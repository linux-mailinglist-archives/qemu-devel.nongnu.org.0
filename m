Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A15E5EE6E9
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 22:59:10 +0200 (CEST)
Received: from localhost ([::1]:55242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ode97-0007GS-5T
	for lists+qemu-devel@lfdr.de; Wed, 28 Sep 2022 16:59:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1oddet-0008MW-T2
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:55 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:48195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1odder-0006T6-Bq
 for qemu-devel@nongnu.org; Wed, 28 Sep 2022 16:27:54 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MEV7U-1oTA562rhC-00FyCI; Wed, 28
 Sep 2022 22:27:50 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>,
	Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 18/37] linux-user: Fix TARGET_PROT_SEM for XTENSA
Date: Wed, 28 Sep 2022 22:27:18 +0200
Message-Id: <20220928202737.793171-19-laurent@vivier.eu>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220928202737.793171-1-laurent@vivier.eu>
References: <20220928202737.793171-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:A1/nH2+PkP1GnT42Sg7sSlRZaoyRH4CLQaeOzJNv00dS+QmhJxZ
 eQ6GqEQ0ZI12408qhDAv/9KBxQjqc60FCqIn+sX/URsvDNgeUa9uLogQTZgJ6iT4ztHXxji
 IZyOEkbYeFONJBScNzzN/oHmuYbGRQQcti2qy0DHmZXiHckQ6P/oroyx7kPoKd5Z2CUtIeL
 S08RNX2MoqgGP9OaKHRMg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ClgR7nEbAks=:kEZJT5bFAoCoR5Pmd5oJXK
 wU6gHh08lfZJdu8eWJuW+Cck2le0CB07uy8iu5b/NFurjuRUGoNWRk3BfMeTC8m0DSsHNVONm
 GXxsifGf9obNnLCqCKr9mO5IyyFoczzbL+t2b5gpbv1VhRNtpFU+Gp7emJLyepnZOPGENVj1S
 Vamu1MsPRKNN4lHIM9KTpI8Te8mqHzxRcEI2aCLq2rVy1J1+8vEWol0/xjQGflqsPGbHecJUz
 MmggEUuQlRc50M6wLu2djtszT+cY9ucfDi0BMuv+sPgxAOzigQwlghWNCztEh5TIEKzOMGpJ1
 1bj/pCTFCSx8BNCVKvsT8nU9ribilvpbT9Y9rcHj0ojxcciUIOa1eXyU0Wvd6h0kTdrNd11Fr
 63CBBK6njxynDHMrhTo0vP+tcfIK7d0cSnZbWnPSMVN+hNZsP8g7AxAj6BIIwibAlTcTAw++5
 aIgWCSnrRDezmqxlUzK3R4J6uoseM7Ac7tg4CNs+hMHgJim/w7oYwBq1ytS4K1heoaxSLh5Gp
 YmjnOEilT6jQTHX3Iw7Y/njQZXq1Xv1pVC/mrl3CKn2TAwc94SI+x58ulqfIt9EDDzxovqiHh
 IJ/VzOcz9wOnq+c1U+9isZT9v4cSe7QmweUrWFKGiIqP1/kV0SeZi2gHmeeInhSVuTNvOLY4y
 OxQGGMv4FAh+dQAtXReGh0PBYtBmVKqSdPeZo1EtvBA++ZK3JIxwYuREb2LZfq3EhPhRl1s06
 vRgyhrm+8XU7jcUVSoi3vXXGfXgopOhc1CvvToZSse2YGTygrYIvzwRLXUlAlUp5M11lhlPcX
 kSBZPWT
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Helge Deller <deller@gmx.de>

The xtensa platform has a value of 0x10 for PROT_SEM.

Signed-off-by: Helge Deller <deller@gmx.de>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Message-Id: <20220924114501.21767-2-deller@gmx.de>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 linux-user/syscall_defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/syscall_defs.h b/linux-user/syscall_defs.h
index 85b0f33e91d7..1e3577bfa56f 100644
--- a/linux-user/syscall_defs.h
+++ b/linux-user/syscall_defs.h
@@ -1246,7 +1246,7 @@ struct target_winsize {
 
 #include "termbits.h"
 
-#if defined(TARGET_MIPS)
+#if defined(TARGET_MIPS) || defined(TARGET_XTENSA)
 #define TARGET_PROT_SEM         0x10
 #else
 #define TARGET_PROT_SEM         0x08
-- 
2.37.3


