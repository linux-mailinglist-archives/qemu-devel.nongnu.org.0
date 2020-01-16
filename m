Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C37D313EDB8
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jan 2020 19:05:01 +0100 (CET)
Received: from localhost ([::1]:46368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1is9Vs-0001HB-Qr
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 13:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33958)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <olaf@aepfle.de>) id 1is9Uc-0000jO-Te
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 13:03:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <olaf@aepfle.de>) id 1is9Ub-0005JS-SB
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 13:03:42 -0500
Received: from mo6-p01-ob.smtp.rzone.de ([2a01:238:20a:202:5301::10]:24953)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <olaf@aepfle.de>) id 1is9Ub-0005GX-7E
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 13:03:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1579197816;
 s=strato-dkim-0002; d=aepfle.de;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
 X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
 bh=J/NW60Cv4f1ZgEqIZPvWta41hVsdRAUs0eJjb8TKL4U=;
 b=jiuDkel4XGh95ZFiLXfRlOk+IclW284V7LAJ4G9bQtiBqXyU26RdrNFktpkaa8zp2g
 rZCfEwRn8hR6ewtX2MJddAC1UuFNTVIZYK86a9TqqzF1f+axjFUFm6SFaRzDhVVWUxKo
 I/mQ24NLiVBXrHkacfVncyILpT3zbvkv0tk0E1/fyIyapUQBhw6pvqsdLKD/3XpVyRTF
 j4kzZrNcXbzuIzBJnwmmQOZZwoDTzShkXX1DoMQTyyuaagRVKpNCo5JRaNtKOu2QpnUZ
 huYdlKQnMk87iykURbQTrtgXdoPg8veBXlLU8GPB3/trD9StFd1jnB0R+V/FvV3dOiea
 SZDA==
X-RZG-AUTH: ":P2EQZWCpfu+qG7CngxMFH1J+3q8wa/QXkBR9MXjAuzBW/OdlBZQ4AHSS1G8g"
X-RZG-CLASS-ID: mo00
Received: from sender by smtp.strato.de (RZmta 46.1.4 SBL|AUTH)
 with ESMTPSA id j08473w0GI3ZU9m
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 (Client did not present a certificate);
 Thu, 16 Jan 2020 19:03:35 +0100 (CET)
From: Olaf Hering <olaf@aepfle.de>
To: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>,
 Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org (open list:All patches CC here)
Subject: [PATCH v2] hw/i386: disable smbus migration for xenfv
Date: Thu, 16 Jan 2020 19:03:21 +0100
Message-Id: <20200116180321.24968-1-olaf@aepfle.de>
X-Mailer: git-send-email 2.16.4
In-Reply-To: <20200113174521.3336-1-olaf@aepfle.de>
References: <20200113174521.3336-1-olaf@aepfle.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a01:238:20a:202:5301::10
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
Cc: Olaf Hering <olaf@aepfle.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With commit 7fccf2a06890e3bc3b30e29827ad3fb93fe88fea a new member
smbus_no_migration_support was added, and enabled in two places.
With commit 4ab2f2a8aabfea95cc53c64e13b3f67960b27fdf the vmstate_acpi
got new elements, which are conditionally filled. As a result, an
incoming migration expected smbus related data unless smbus migration
was disabled for a given MachineClass.

Since commit 7fccf2a06890e3bc3b30e29827ad3fb93fe88fea forgot to handle
xenfv, live migration to receiving hosts using qemu-4.0 and later is broken.

Therefore this patch must be applied to stable-4.x as well.

Signed-off-by: Olaf Hering <olaf@aepfle.de>
---

diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index fa12203079..e19716d0d3 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -952,6 +952,7 @@ static void xenfv_machine_options(MachineClass *m)
     m->desc = "Xen Fully-virtualized PC";
     m->max_cpus = HVM_MAX_VCPUS;
     m->default_machine_opts = "accel=xen";
+    m->smbus_no_migration_support = true;
 }
 
 DEFINE_PC_MACHINE(xenfv, "xenfv", pc_xen_hvm_init,

