Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 360E329128
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 08:44:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:49785 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU3vx-00081J-A5
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 02:44:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40606)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hU3oh-0002l0-UC
	for qemu-devel@nongnu.org; Fri, 24 May 2019 02:36:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hU3oh-0002p0-0x
	for qemu-devel@nongnu.org; Fri, 24 May 2019 02:36:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47642)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hU3og-0002ok-S9
	for qemu-devel@nongnu.org; Fri, 24 May 2019 02:36:34 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B39B73092654;
	Fri, 24 May 2019 06:36:32 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-235.brq.redhat.com [10.40.204.235])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id D8C6C5B689;
	Fri, 24 May 2019 06:36:23 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Date: Fri, 24 May 2019 08:35:36 +0200
Message-Id: <20190524063553.5339-4-philmd@redhat.com>
In-Reply-To: <20190524063553.5339-1-philmd@redhat.com>
References: <20190524063553.5339-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.43]);
	Fri, 24 May 2019 06:36:32 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH 03/20] hw/i386/pc: Let e820_add_entry() return
 a ssize_t type
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Yang Zhong <yang.zhong@intel.com>, Eduardo Habkost <ehabkost@redhat.com>,
	Rob Bradford <robert.bradford@intel.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <rth@twiddle.net>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	Samuel Ortiz <sameo@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

e820_add_entry() returns an array size on success, or a negative
value on error.

Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
 hw/i386/pc.c         | 2 +-
 include/hw/i386/pc.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index df8600ac24..1245028dd6 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -868,7 +868,7 @@ static void handle_a20_line_change(void *opaque, int =
irq, int level)
     x86_cpu_set_a20(cpu, level);
 }
=20
-int e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
+ssize_t e820_add_entry(uint64_t address, uint64_t length, uint32_t type)
 {
     unsigned int index =3D le32_to_cpu(e820_reserve.count);
     struct e820_entry *entry;
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index 28b19173b0..2bc48c03c6 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -289,7 +289,7 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
 #define E820_NVS        4
 #define E820_UNUSABLE   5
=20
-int e820_add_entry(uint64_t, uint64_t, uint32_t);
+ssize_t e820_add_entry(uint64_t, uint64_t, uint32_t);
 size_t e820_get_num_entries(void);
 bool e820_get_entry(unsigned int, uint32_t, uint64_t *, uint64_t *);
=20
--=20
2.20.1


