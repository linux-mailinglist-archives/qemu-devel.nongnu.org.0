Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D1411E858
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Dec 2019 17:30:37 +0100 (CET)
Received: from localhost ([::1]:51080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ifnps-00057k-Eo
	for lists+qemu-devel@lfdr.de; Fri, 13 Dec 2019 11:30:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38774)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1ifnfB-0000RX-70
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 11:19:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1ifnf9-0001aZ-UW
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 11:19:33 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:60083
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1ifnf9-0001Y8-LL
 for qemu-devel@nongnu.org; Fri, 13 Dec 2019 11:19:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1576253971;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Sl200vKoDtXZiCTG+5unevgyZVrBojkXBzppV1yXaVA=;
 b=VADxBDWhUulrFABfTvUKvgHwWoOQBakEX8Ev40q2HL0rvVLLR/vW4MyaPhdWPZkIJmI7Vo
 BZFsgkGwwnxUdYR8xRSchMrKJYr/TGUIvoLiwPl6cP+skXPF11BxFKNOafKNN3n+Yq21wa
 q9cW46NhBxeM7UTl22fH+a8bdgAivIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-uffglKv3NCyR9VsUy6ZNxQ-1; Fri, 13 Dec 2019 11:19:27 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 29D4DDBA8;
 Fri, 13 Dec 2019 16:19:26 +0000 (UTC)
Received: from localhost (ovpn-116-226.ams2.redhat.com [10.36.116.226])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6FEDC601B6;
 Fri, 13 Dec 2019 16:19:23 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 07/16] s390x: Beautify diag308 handling
Date: Fri, 13 Dec 2019 17:18:42 +0100
Message-Id: <20191213161851.24687-8-cohuck@redhat.com>
In-Reply-To: <20191213161851.24687-1-cohuck@redhat.com>
References: <20191213161851.24687-1-cohuck@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: uffglKv3NCyR9VsUy6ZNxQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
Cc: Thomas Huth <thuth@redhat.com>, Janosch Frank <frankja@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Janosch Frank <frankja@linux.ibm.com>

Let's improve readability by:
* Using constants for the subcodes
* Moving parameter checking into a function
* Removing subcode > 6 check as the default case catches that

Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Message-Id: <20191127175046.4911-6-frankja@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
---
 target/s390x/diag.c | 54 +++++++++++++++++++++++++++------------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/target/s390x/diag.c b/target/s390x/diag.c
index 53c2f81f2a1a..b5aec06d6bef 100644
--- a/target/s390x/diag.c
+++ b/target/s390x/diag.c
@@ -53,6 +53,29 @@ int handle_diag_288(CPUS390XState *env, uint64_t r1, uin=
t64_t r3)
 #define DIAG_308_RC_NO_CONF         0x0102
 #define DIAG_308_RC_INVALID         0x0402
=20
+#define DIAG308_RESET_MOD_CLR       0
+#define DIAG308_RESET_LOAD_NORM     1
+#define DIAG308_LOAD_CLEAR          3
+#define DIAG308_LOAD_NORMAL_DUMP    4
+#define DIAG308_SET                 5
+#define DIAG308_STORE               6
+
+static int diag308_parm_check(CPUS390XState *env, uint64_t r1, uint64_t ad=
dr,
+                              uintptr_t ra, bool write)
+{
+    if ((r1 & 1) || (addr & ~TARGET_PAGE_MASK)) {
+        s390_program_interrupt(env, PGM_SPECIFICATION, ra);
+        return -1;
+    }
+    if (!address_space_access_valid(&address_space_memory, addr,
+                                    sizeof(IplParameterBlock), write,
+                                    MEMTXATTRS_UNSPECIFIED)) {
+        s390_program_interrupt(env, PGM_ADDRESSING, ra);
+        return -1;
+    }
+    return 0;
+}
+
 void handle_diag_308(CPUS390XState *env, uint64_t r1, uint64_t r3, uintptr=
_t ra)
 {
     CPUState *cs =3D env_cpu(env);
@@ -65,30 +88,24 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, u=
int64_t r3, uintptr_t ra)
         return;
     }
=20
-    if ((subcode & ~0x0ffffULL) || (subcode > 6)) {
+    if (subcode & ~0x0ffffULL) {
         s390_program_interrupt(env, PGM_SPECIFICATION, ra);
         return;
     }
=20
     switch (subcode) {
-    case 0:
+    case DIAG308_RESET_MOD_CLR:
         s390_ipl_reset_request(cs, S390_RESET_MODIFIED_CLEAR);
         break;
-    case 1:
+    case DIAG308_RESET_LOAD_NORM:
         s390_ipl_reset_request(cs, S390_RESET_LOAD_NORMAL);
         break;
-    case 3:
+    case DIAG308_LOAD_CLEAR:
+        /* Well we still lack the clearing bit... */
         s390_ipl_reset_request(cs, S390_RESET_REIPL);
         break;
-    case 5:
-        if ((r1 & 1) || (addr & 0x0fffULL)) {
-            s390_program_interrupt(env, PGM_SPECIFICATION, ra);
-            return;
-        }
-        if (!address_space_access_valid(&address_space_memory, addr,
-                                        sizeof(IplParameterBlock), false,
-                                        MEMTXATTRS_UNSPECIFIED)) {
-            s390_program_interrupt(env, PGM_ADDRESSING, ra);
+    case DIAG308_SET:
+        if (diag308_parm_check(env, r1, addr, ra, false)) {
             return;
         }
         iplb =3D g_new0(IplParameterBlock, 1);
@@ -110,15 +127,8 @@ void handle_diag_308(CPUS390XState *env, uint64_t r1, =
uint64_t r3, uintptr_t ra)
 out:
         g_free(iplb);
         return;
-    case 6:
-        if ((r1 & 1) || (addr & 0x0fffULL)) {
-            s390_program_interrupt(env, PGM_SPECIFICATION, ra);
-            return;
-        }
-        if (!address_space_access_valid(&address_space_memory, addr,
-                                        sizeof(IplParameterBlock), true,
-                                        MEMTXATTRS_UNSPECIFIED)) {
-            s390_program_interrupt(env, PGM_ADDRESSING, ra);
+    case DIAG308_STORE:
+        if (diag308_parm_check(env, r1, addr, ra, true)) {
             return;
         }
         iplb =3D s390_ipl_get_iplb();
--=20
2.21.0


