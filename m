Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B1BE3232A
	for <lists+qemu-devel@lfdr.de>; Sun,  2 Jun 2019 13:45:18 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47967 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hXOvM-0006AD-Qy
	for lists+qemu-devel@lfdr.de; Sun, 02 Jun 2019 07:45:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1hXOt6-0004pJ-Ox
	for qemu-devel@nongnu.org; Sun, 02 Jun 2019 07:42:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jan.kiszka@siemens.com>) id 1hXOsW-00067M-9y
	for qemu-devel@nongnu.org; Sun, 02 Jun 2019 07:42:21 -0400
Received: from thoth.sbs.de ([192.35.17.2]:33127)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jan.kiszka@siemens.com>)
	id 1hXOsW-00063m-0X
	for qemu-devel@nongnu.org; Sun, 02 Jun 2019 07:42:20 -0400
Received: from mail2.sbs.de (mail2.sbs.de [192.129.41.66])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id x52BgFlF027537
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK); 
	Sun, 2 Jun 2019 13:42:16 +0200
Received: from [139.22.33.164] ([139.22.33.164])
	by mail2.sbs.de (8.15.2/8.15.2) with ESMTP id x52BgD2t017469;
	Sun, 2 Jun 2019 13:42:13 +0200
X-Mozilla-News-Host: news://news.gmane.org:119
To: qemu-devel <qemu-devel@nongnu.org>
From: Jan Kiszka <jan.kiszka@siemens.com>
Message-ID: <a84b7e03-f9a8-b577-be27-4d93d1caa1c9@siemens.com>
Date: Sun, 2 Jun 2019 13:42:13 +0200
User-Agent: Mozilla/5.0 (X11; U; Linux i686 (x86_64); de; rv:1.8.1.12)
	Gecko/20080226 SUSE/2.0.0.12-1.1 Thunderbird/2.0.0.12 Mnenhy/0.7.5.666
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x
X-Received-From: 192.35.17.2
Subject: [Qemu-devel] [PATCH] ioapic: kvm: Skip route updates for masked pins
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Jan Kiszka <jan.kiszka@siemens.com>

Masked entries will not generate interrupt messages, thus do no need to
be routed by KVM. This is a cosmetic cleanup, just avoiding warnings of
the kind

qemu-system-x86_64: vtd_irte_get: detected non-present IRTE (index=0, high=0xff00, low=0x100)

if the masked entry happens to reference a non-present IRTE.

Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
---
 hw/intc/ioapic.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/hw/intc/ioapic.c b/hw/intc/ioapic.c
index 7074489fdf..2fb288a22d 100644
--- a/hw/intc/ioapic.c
+++ b/hw/intc/ioapic.c
@@ -197,9 +197,11 @@ static void ioapic_update_kvm_routes(IOAPICCommonState *s)
             MSIMessage msg;
             struct ioapic_entry_info info;
             ioapic_entry_parse(s->ioredtbl[i], &info);
-            msg.address = info.addr;
-            msg.data = info.data;
-            kvm_irqchip_update_msi_route(kvm_state, i, msg, NULL);
+            if (!info.masked) {
+                msg.address = info.addr;
+                msg.data = info.data;
+                kvm_irqchip_update_msi_route(kvm_state, i, msg, NULL);
+            }
         }
         kvm_irqchip_commit_routes(kvm_state);
     }
-- 
2.16.4

