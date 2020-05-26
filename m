Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F6701A8FFD
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Apr 2020 03:02:27 +0200 (CEST)
Received: from localhost ([::1]:40882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOWRe-0002pz-7Z
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 21:02:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58350)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alazar@bitdefender.com>) id 1jOWOy-0000vl-DP
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 20:59:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alazar@bitdefender.com>) id 1jOWOx-00051g-CG
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 20:59:40 -0400
Received: from mx01.bbu.dsd.mx.bitdefender.com ([91.199.104.161]:49076)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <alazar@bitdefender.com>)
 id 1jOWOx-00050i-3h
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 20:59:39 -0400
Received: from smtp.bitdefender.com (smtp02.buh.bitdefender.net [10.17.80.76])
 by mx01.bbu.dsd.mx.bitdefender.com (Postfix) with ESMTPS id
 991FB30747C4; Wed, 15 Apr 2020 03:59:34 +0300 (EEST)
Received: from localhost.localdomain (unknown [91.199.104.27])
 by smtp.bitdefender.com (Postfix) with ESMTPSA id 76035305B7A1;
 Wed, 15 Apr 2020 03:59:34 +0300 (EEST)
From: =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v1 06/26] E820: extend the table access interface
Date: Wed, 15 Apr 2020 03:59:18 +0300
Message-Id: <20200415005938.23895-7-alazar@bitdefender.com>
In-Reply-To: <20200415005938.23895-1-alazar@bitdefender.com>
References: <20200415005938.23895-1-alazar@bitdefender.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 91.199.104.161
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Adalbert=20Laz=C4=83r?= <alazar@bitdefender.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This new function is necessary for the VM introspection object.
By sending all e820 entries, not just the RAM ones,
the introspection tool can differentiate between
an invalid address and a reserved one.

CC: Paolo Bonzini <pbonzini@redhat.com>
CC: Richard Henderson <rth@twiddle.net>
CC: Eduardo Habkost <ehabkost@redhat.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>
CC: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Signed-off-by: Adalbert Laz=C4=83r <alazar@bitdefender.com>
---
 hw/i386/e820_memory_layout.c | 12 ++++++++++++
 hw/i386/e820_memory_layout.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/hw/i386/e820_memory_layout.c b/hw/i386/e820_memory_layout.c
index bcf9eaf837..a875e9e326 100644
--- a/hw/i386/e820_memory_layout.c
+++ b/hw/i386/e820_memory_layout.c
@@ -57,3 +57,15 @@ bool e820_get_entry(int idx, uint32_t type, uint64_t *=
address, uint64_t *length)
     }
     return false;
 }
+
+bool e820_get_entry2(int idx, uint32_t *type, uint64_t *address,
+                     uint64_t *length)
+{
+    if (idx < e820_entries) {
+        *type =3D le32_to_cpu(e820_table[idx].type);
+        *address =3D le64_to_cpu(e820_table[idx].address);
+        *length =3D le64_to_cpu(e820_table[idx].length);
+        return true;
+    }
+    return false;
+}
diff --git a/hw/i386/e820_memory_layout.h b/hw/i386/e820_memory_layout.h
index 2a0ceb8b9c..a4555c21fb 100644
--- a/hw/i386/e820_memory_layout.h
+++ b/hw/i386/e820_memory_layout.h
@@ -36,6 +36,8 @@ int e820_add_entry(uint64_t address, uint64_t length, u=
int32_t type);
 int e820_get_num_entries(void);
 bool e820_get_entry(int index, uint32_t type,
                     uint64_t *address, uint64_t *length);
+bool e820_get_entry2(int index, uint32_t *type,
+                     uint64_t *address, uint64_t *length);
=20
=20
=20

