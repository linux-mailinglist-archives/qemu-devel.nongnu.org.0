Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D931345AB9
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 10:24:21 +0100 (CET)
Received: from localhost ([::1]:40014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOdGu-0002zX-Gm
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 05:24:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lOdFB-0001LC-DK
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:22:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50158)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lOdEx-0007dl-W0
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 05:22:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616491339;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NhpvuifEd2fAyfPe43PbMxrroDytNIY9+CNVKRxYGB8=;
 b=JXnyXFybGB7dH9h9A6e7bFUTzX8FIJUWMy7ocvkl6+8foASycO5U9fi19Qj+uof4oVfxO+
 +lKtvbMJ9vEtzVApA1tiDuP2FKu8BE3fSq+3d/JvQ5N98QgkFQvrbvXm9k8VMqbI8EE3Db
 fu3N/lI6xahjc1GU2ZzT1Bhjo966XZk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-JQpCQGwQPICH0c_ZN191Fg-1; Tue, 23 Mar 2021 05:22:17 -0400
X-MC-Unique: JQpCQGwQPICH0c_ZN191Fg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FE05180FCAA
 for <qemu-devel@nongnu.org>; Tue, 23 Mar 2021 09:22:16 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-239.ams2.redhat.com
 [10.36.113.239])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 401369CA0;
 Tue, 23 Mar 2021 09:22:15 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 2/2] optionrom/pvh: use memcmp() to find the RSDP signature
Date: Tue, 23 Mar 2021 10:22:11 +0100
Message-Id: <20210323092211.44597-3-sgarzare@redhat.com>
In-Reply-To: <20210323092211.44597-1-sgarzare@redhat.com>
References: <20210323092211.44597-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New versions of gcc report a potential error and there may be alignment
issues using uint64_t pointer to check the RSDP signature:

    gcc 10.2.1 "cc (Alpine 10.2.1_pre2) 10.2.1 20210313" reports:

    pc-bios/optionrom/pvh_main.c: In function 'search_rsdp':
    pc-bios/optionrom/pvh_main.c:61:21: warning: comparison is always false
    due to limited range of data type [-Wtype-limits]
       61 |         if (*rsdp_p == RSDP_SIGNATURE) {
          |                     ^~

Let's use memcmp() to get more readable code and avoid these issues.

Reported-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---

Notes:
    v2:
    - made 'rsdp_signature' static const [Phil]
    - uses memcmp() instead of __builtin_memcmp()
    - added pvh.bin binary with the changes applied

 pc-bios/optionrom/pvh_main.c |  12 +++++++-----
 pc-bios/pvh.bin              | Bin 1536 -> 1536 bytes
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/pc-bios/optionrom/pvh_main.c b/pc-bios/optionrom/pvh_main.c
index 28e79d7fc4..f654703bad 100644
--- a/pc-bios/optionrom/pvh_main.c
+++ b/pc-bios/optionrom/pvh_main.c
@@ -27,7 +27,8 @@ asm (".code32"); /* this code will be executed in protected mode */
 #include "optrom_fw_cfg.h"
 #include "../../include/hw/xen/start_info.h"
 
-#define RSDP_SIGNATURE          0x2052545020445352LL /* "RSD PTR " */
+#define RSDP_SIGNATURE          "RSD PTR "
+#define RSDP_SIGNATURE_SIZE     8
 #define RSDP_AREA_ADDR          0x000E0000
 #define RSDP_AREA_SIZE          0x00020000
 #define EBDA_BASE_ADDR          0x0000040E
@@ -53,12 +54,13 @@ static uint8_t cmdline_buffer[CMDLINE_BUFSIZE];
 /* Search RSDP signature. */
 static uintptr_t search_rsdp(uint32_t start_addr, uint32_t end_addr)
 {
-    uint64_t *rsdp_p;
+    static const char rsdp_signature[RSDP_SIGNATURE_SIZE] = RSDP_SIGNATURE;
+    char *rsdp_p;
 
     /* RSDP signature is always on a 16 byte boundary */
-    for (rsdp_p = (uint64_t *)start_addr; rsdp_p < (uint64_t *)end_addr;
-         rsdp_p += 2) {
-        if (*rsdp_p == RSDP_SIGNATURE) {
+    for (rsdp_p = (char *)start_addr; rsdp_p < (char *)end_addr;
+         rsdp_p += 16) {
+        if (memcmp(rsdp_p, rsdp_signature, RSDP_SIGNATURE_SIZE) == 0) {
             return (uintptr_t)rsdp_p;
         }
     }
diff --git a/pc-bios/pvh.bin b/pc-bios/pvh.bin
index 8033080ada2db4c4613fdc3bb5a69d79c7b0c0ca..778ca261447bed794ecb98bb29138a09568aca67 100644
GIT binary patch
delta 656
zcmZqRY2cYKnJIyF;?!q6oi`3X5NJNZ#ebrcWpX>CZ@rI-$Z^&MiVO@DNArx2vn~O$
z7#SEC7ACMVFf6_R<n71+u}%P4$63z+Nf6k<z`)1wny>kQfGq=q00V!^C7@uVMNqJd
zLg}l<3YLJ7AcfM0iw}S`9f4}v*C5Ei&}pJ_+(m^2WJvQvCjM5&&dJ-D>^OD+)pUyP
zQJnmTNsf)bbrDc{vJA6qJ;-6*J}MmlA2uJ6iH?hpJ=|LcbO*>_5ID{XGu-e%+Cn~{
zv7LtwK4NM9;lSUf^8f$;Zl>M|3_wxK3q_(YRT&u=dP~$8CIFpnd4a!K6v&6V`7O-N
zPYf@CUEL`PGWaFygMa`3r%ldhHmq*|@{hB&07($&c2N;o+yNHqfeP&asaU)LEVczI
zcARw$ki`hp@bVSVq~0xRAkAP$>;#3uE)fvdMMdC6?q8s5eN+T?i2_ABKfH(q@mW;5
zLsVE6g94`>6gmtH5MA65T_P_mK&nDiL|QME8bG83AW|GJWPwsICm}4IV0hr=R|Ge0
z0z^F*L_N=ow|~G65ZNUJ6ajjV=f!Q12#~QD<S_?I{GJ4iip?Kc_!uX#Dl@(T0NEhW
AtpET3

delta 702
zcmZqRY2cYKndyM&#Hr7C4n7v>yw!Y)i~m%o$mDiL-})F8k>jilq6`cbNArx2v$g<P
zj0_A63l9Jpi#Gs?9VbAn6+q%R>lz>l0y`KO_!!bAbPF_o3JP{n==NY~{1^}tq`-NR
zzeOFWz4?HEEdvK1L+Rb)tP7xej<YU-vJ4NTE#zZiU^w`I#kQUS$S8B~X6W4jVp$$5
z7kin;#K6$I4P+0{9Lr<;ZJ|H`EOwPXFub%FWPGP6$mrfOhJ6XFK%R-paTgV!VL<(l
znfP1HfezX$0F>Av0u<_emG*wOAdt5cq@s6n0h1EP46qq<L?_Q;l4B|jnY@ol)(jLR
z-99QD{~tCVk%^9rk3HO5qQ)=*Y#+iaFKzz+|KGbs4P+TeesVmsVSNHn>v7f;APEB9
zE-E66Gr&SQP@x?l6^kc;#il^Tj<favS)ibQX@P3y1h7kYfgIoKq9X7j_V54yK$i*Z
z0_p7h@WL0wXHn@6QDIpO@=1NC=o}yg(ZvnXCGtW8q$)&3r1ersCPa!0BE|E97h<5u
zE+L=@(78M>e*Xa~1~L|t;}tic=V5+<*dze4iQ~l*pt&#0{~>}55^@s^51_>4%RN9B
MZNA7N&B#~{07`n#VE_OC

-- 
2.30.2


