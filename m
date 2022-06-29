Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A84555FBB8
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jun 2022 11:21:28 +0200 (CEST)
Received: from localhost ([::1]:38808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6Tsx-0007SG-D5
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 05:21:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6ThC-0000jz-5M; Wed, 29 Jun 2022 05:09:20 -0400
Received: from mout.kundenserver.de ([217.72.192.73]:49093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1o6Th9-0003Ys-8M; Wed, 29 Jun 2022 05:09:13 -0400
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MwxRN-1njIhx2ZxL-00ySuK; Wed, 29
 Jun 2022 11:09:02 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Bernhard Beschow <shentey@gmail.com>,
 Paul Durrant <paul@xen.org>, Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 10/11] hw/i386/xen/xen-hvm: Allow for stubbing
 xen_set_pci_link_route()
Date: Wed, 29 Jun 2022 11:08:48 +0200
Message-Id: <20220629090849.1350227-11-laurent@vivier.eu>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220629090849.1350227-1-laurent@vivier.eu>
References: <20220629090849.1350227-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+AOZAPEh4DyN88bVRueXwQ7rqqtNZOchrE07gwGOLFbVt39MaQJ
 a8vX47Zitk84jrmvCJ5uinLngOkn9mxB5Yai7EYFVgWNlS2jiz13sm4gWl0cUYljkkYAjE6
 c9TffXAZjz7D2hRVMlt7A5s8OGU0ea+Q7O7p2KBaeQ00BZ6Eh8AQdYSc71vRZkuGtTGTj5U
 +WuPpduw3JzhEHgg1wbAw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:0qST8EF+KrM=:jdFmgsszbivrXI8YpWDG7J
 5Go8rZ7T+m0FrggqHW3JGULCqiaRds8X9wo5yFapzOklscnpi/J7JqXtSq3MIUd1ChjUT/7pX
 qXT5w5fNVox+P4hBaTZ4jddnHT9ZTmv5plr4i3pnhGlpiHRBf9KVwCEoNd4eUAm4Dv/hlSuJu
 93HV5O6JjnVYDJNs29v1sLqgo7B215yL90mW1Zb2npJgydBxOWsJoEFJsTXjCU7MwXFT7VZ9j
 1DvT4I0xyEB3/tEVr3+iFUH74zWRhiUOiWMVHoqPu8ZNH8IcPh3r5g+MpBGYzPWtKL6Qbiqzm
 P8tolnwoqjJ9ExkGxNodSnNLhcOB2/KaC2SOovVkqVU4IFtbq7QVah9JFoaZWTvHuYD7/H3/L
 NoryISd7DuMX4Tzy3rpkke9fB52pw8Y5f/e6F4FPxMidTIlI1IHlttNxriAa39pjALNcYWZ7s
 fiyHIxChOD0l73H7RvJEo9nFs2Q54w3z5eDJEA/5s3Q7tHh72vczsZcRvgZupzEJ6NEr5KfEI
 4DeWE15IaqSEwazT93NvZ/0rFOPv2CDeTVCgsAiD0KWE/PRt0wux1DYUWaEBBCkjmRQnJnqXl
 V9R668V2xKxTb+g4jKizTzVTMubf4bZ+Lzx3tjjWHBQXihkmFbyvQ3cwVqpduLKC15tXvTFeK
 buI3JH4OUF6xki0dXnQqDdHajWmfE2nZQtqRJ3Ryh8ltn11AoCJ6KhX57xeSrCuy0IvpV6rbK
 LJ9ge5myeDGFYIlKQGTZMiwfIyvv2iW2rLk01A==
Received-SPF: none client-ip=217.72.192.73; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Bernhard Beschow <shentey@gmail.com>

The only user of xen_set_pci_link_route() is
xen_piix_pci_write_config_client() which implements PIIX-specific logic in
the xen namespace. This makes xen-hvm depend on PIIX which could be
avoided if xen_piix_pci_write_config_client() was implemented in PIIX. In
order to do this, xen_set_pci_link_route() needs to be stubbable which
this patch addresses.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Paul Durrant <paul@xen.org>
Message-Id: <20220626094656.15673-2-shentey@gmail.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/i386/xen/xen-hvm.c       | 7 ++++++-
 include/hw/xen/xen.h        | 1 +
 include/hw/xen/xen_common.h | 6 ------
 stubs/xen-hw-stub.c         | 5 +++++
 4 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/hw/i386/xen/xen-hvm.c b/hw/i386/xen/xen-hvm.c
index 0731f7041069..204fda7949d9 100644
--- a/hw/i386/xen/xen-hvm.c
+++ b/hw/i386/xen/xen-hvm.c
@@ -161,11 +161,16 @@ void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
         }
         v &= 0xf;
         if (((address + i) >= PIIX_PIRQCA) && ((address + i) <= PIIX_PIRQCD)) {
-            xen_set_pci_link_route(xen_domid, address + i - PIIX_PIRQCA, v);
+            xen_set_pci_link_route(address + i - PIIX_PIRQCA, v);
         }
     }
 }
 
+int xen_set_pci_link_route(uint8_t link, uint8_t irq)
+{
+    return xendevicemodel_set_pci_link_route(xen_dmod, xen_domid, link, irq);
+}
+
 int xen_is_pirq_msi(uint32_t msi_data)
 {
     /* If vector is 0, the msi is remapped into a pirq, passed as
diff --git a/include/hw/xen/xen.h b/include/hw/xen/xen.h
index 0f9962b1c190..13bffaef531f 100644
--- a/include/hw/xen/xen.h
+++ b/include/hw/xen/xen.h
@@ -21,6 +21,7 @@ extern enum xen_mode xen_mode;
 extern bool xen_domid_restrict;
 
 int xen_pci_slot_get_pirq(PCIDevice *pci_dev, int irq_num);
+int xen_set_pci_link_route(uint8_t link, uint8_t irq);
 void xen_piix3_set_irq(void *opaque, int irq_num, int level);
 void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len);
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data);
diff --git a/include/hw/xen/xen_common.h b/include/hw/xen/xen_common.h
index 179741ff791c..77ce17d8a4f7 100644
--- a/include/hw/xen/xen_common.h
+++ b/include/hw/xen/xen_common.h
@@ -316,12 +316,6 @@ static inline int xen_set_pci_intx_level(domid_t domid, uint16_t segment,
                                              device, intx, level);
 }
 
-static inline int xen_set_pci_link_route(domid_t domid, uint8_t link,
-                                         uint8_t irq)
-{
-    return xendevicemodel_set_pci_link_route(xen_dmod, domid, link, irq);
-}
-
 static inline int xen_inject_msi(domid_t domid, uint64_t msi_addr,
                                  uint32_t msi_data)
 {
diff --git a/stubs/xen-hw-stub.c b/stubs/xen-hw-stub.c
index 15f3921a76b0..743967623f00 100644
--- a/stubs/xen-hw-stub.c
+++ b/stubs/xen-hw-stub.c
@@ -23,6 +23,11 @@ void xen_piix_pci_write_config_client(uint32_t address, uint32_t val, int len)
 {
 }
 
+int xen_set_pci_link_route(uint8_t link, uint8_t irq)
+{
+    return -1;
+}
+
 void xen_hvm_inject_msi(uint64_t addr, uint32_t data)
 {
 }
-- 
2.36.1


