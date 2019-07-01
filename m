Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0233F43A26
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jun 2019 17:19:30 +0200 (CEST)
Received: from localhost ([::1]:40812 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbRVh-0001kp-5C
	for lists+qemu-devel@lfdr.de; Thu, 13 Jun 2019 11:19:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42430)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hbQpf-0001UI-6c
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:36:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hbQpc-0001VK-W6
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:36:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37526)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hbQpZ-0001Kl-2Z
 for qemu-devel@nongnu.org; Thu, 13 Jun 2019 10:35:59 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 6765030860BF;
 Thu, 13 Jun 2019 14:35:44 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.141])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 277E71001B0F;
 Thu, 13 Jun 2019 14:35:37 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 13 Jun 2019 16:34:31 +0200
Message-Id: <20190613143446.23937-6-philmd@redhat.com>
In-Reply-To: <20190613143446.23937-1-philmd@redhat.com>
References: <20190613143446.23937-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.44]); Thu, 13 Jun 2019 14:35:49 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2 05/20] hw/i386/pc: Add documentation to the
 e820_*() functions
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
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Rob Bradford <robert.bradford@intel.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Ortiz <sameo@linux.intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 include/hw/i386/pc.h | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 7c07185dd5..fc66b61ff8 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -293,9 +293,42 @@ typedef enum {
     E820_UNUSABLE   =3D 5
 } E820Type;
=20
-ssize_t e820_add_entry(uint64_t, uint64_t, uint32_t);
+/**
+ * e820_add_entry: Add an #e820_entry to the @e820_table.
+ *
+ * Returns the number of entries of the e820_table on success,
+ *         or a negative errno otherwise.
+ *
+ * @address: The base address of the structure which the BIOS is to fill=
 in.
+ * @length: The length in bytes of the structure passed to the BIOS.
+ * @type: The #E820Type of the address range.
+ */
+ssize_t e820_add_entry(uint64_t address, uint64_t length, E820Type type)=
;
+
+/**
+ * e820_get_num_entries: The number of entries of the @e820_table.
+ *
+ * Returns the number of entries of the e820_table.
+ */
 size_t e820_get_num_entries(void);
-bool e820_get_entry(unsigned int, uint32_t, uint64_t *, uint64_t *);
+
+/**
+ * e820_get_entry: Get the address/length of an #e820_entry.
+ *
+ * If the #e820_entry stored at @index is of #E820Type @type, fills @add=
ress
+ * and @length with the #e820_entry values and return @true.
+ * Return @false otherwise.
+ *
+ * @index: The index of the #e820_entry to get values.
+ * @type: The @E820Type of the address range expected.
+ * @address: Pointer to the base address of the #e820_entry structure to
+ *           be filled.
+ * @length: Pointer to the length (in bytes) of the #e820_entry structur=
e
+ *          to be filled.
+ * @return: true if the entry was found, false otherwise.
+ */
+bool e820_get_entry(unsigned int index, E820Type type,
+                    uint64_t *address, uint64_t *length);
=20
 extern GlobalProperty pc_compat_4_0_1[];
 extern const size_t pc_compat_4_0_1_len;
--=20
2.20.1


