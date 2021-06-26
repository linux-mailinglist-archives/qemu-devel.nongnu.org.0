Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B660C3B4B6F
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 02:06:54 +0200 (CEST)
Received: from localhost ([::1]:44146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwvqX-0000dC-92
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 20:06:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lwvpR-0008JP-HJ
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 20:05:45 -0400
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:37462 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lwvpO-0007u3-RU
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 20:05:45 -0400
Received: by server4.localdomain (Postfix, from userid 503)
 id 4D9EE6031112B; Fri, 25 Jun 2021 20:05:42 -0400 (EDT)
From: Chris Browy <cbrowy@avery-design.com>
To: mst@redhat.com
Subject: [PATCH v1 QEMU CXL modifications for openspdm 1/1] pcie/spdm: PCIe
 CMA implementation
Date: Fri, 25 Jun 2021 20:05:39 -0400
Message-Id: <1624665939-5740-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624665723-5169-1-git-send-email-cbrowy@avery-design.com>
References: <1624665723-5169-1-git-send-email-cbrowy@avery-design.com>
Received-SPF: none client-ip=71.162.116.19;
 envelope-from=chris@server4.localdomain; helo=server4.localdomain
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, KHOP_HELO_FCRDNS=0.399,
 NO_DNS_FOR_FROM=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: ben.widawsky@intel.com, david@redhat.com, qemu-devel@nongnu.org,
 vishal.l.verma@intel.com, jgroves@micron.com,
 Chris Browy <cbrowy@avery-design.com>, armbru@redhat.com,
 linux-cxl@vger.kernel.org, f4bug@amsat.org, hchkuo@avery-design.com.tw,
 tyshao@avery-design.com.tw, jonathan.cameron@huawei.com, imammedo@redhat.com,
 dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: hchkuo <hchkuo@avery-design.com.tw>

The Data Object Exchange implementation of Component Measurement
and Authentication (CMA). This patch is basically based on Openspdm:
https://github.com/jyao1/openspdm.git.

Openspdm is an emulator composed of an SPDM requester and an SPDM
responder. The requester and responder communicate with each other via
a TCP socket. The Openspdm requester is merged to this patch as a DOE
capability in hw/mem/cxl_type3.c. The "-spdm=<bool>" is provided to turn
on/off the CMA capability. Once the option is turned on (-spdm=true) the 
CXL device can communicate with Openspdm's responder to get the data 
object of SPDM/secured SPDM.

Signed-off-by: hchkuo <hchkuo@avery-design.com.tw>
Signed-off-by: Chris Browy <cbrowy@avery-design.com>
---
 hw/mem/cxl_type3.c              |  31 +++-
 hw/pci/Kconfig                  |   4 +
 hw/pci/SpdmEmuCommand.c         | 319 ++++++++++++++++++++++++++++++++++++++++
 hw/pci/meson.build              |   1 +
 include/hw/cxl/cxl_device.h     |   2 +
 include/hw/pci/SpdmEmuCommand.h |  21 +++
 include/hw/pci/pcie_doe.h       |   2 +
 7 files changed, 377 insertions(+), 3 deletions(-)
 create mode 100644 hw/pci/SpdmEmuCommand.c
 create mode 100644 include/hw/pci/SpdmEmuCommand.h

diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
index 4b4097f..da38f3f 100644
--- a/hw/mem/cxl_type3.c
+++ b/hw/mem/cxl_type3.c
@@ -16,6 +16,8 @@
 #include "hw/pci/msi.h"
 #include "hw/pci/msix.h"
 
+#include "hw/pci/SpdmEmuCommand.h"
+
 #define DWORD_BYTE 4
 
 /* This function will be used when cdat file is not specified */
@@ -266,6 +268,9 @@ static uint32_t ct3d_config_read(PCIDevice *pci_dev, uint32_t addr, int size)
 
     if (pcie_doe_read_config(&ct3d->doe_comp, addr, size, &val)) {
         return val;
+    } else if (ct3d->use_spdm &&
+               pcie_doe_read_config(&ct3d->doe_spdm, addr, size, &val)) {
+        return val;
     } else if (pcie_doe_read_config(&ct3d->doe_cdat, addr, size, &val)) {
         return val;
     }
@@ -278,6 +283,9 @@ static void ct3d_config_write(PCIDevice *pci_dev, uint32_t addr, uint32_t val,
 {
     CXLType3Dev *ct3d = CT3(pci_dev);
 
+    if (ct3d->use_spdm) {
+        pcie_doe_write_config(&ct3d->doe_spdm, addr, val, size);
+    }
     pcie_doe_write_config(&ct3d->doe_comp, addr, val, size);
     pcie_doe_write_config(&ct3d->doe_cdat, addr, val, size);
     pci_default_write_config(pci_dev, addr, val, size);
@@ -472,6 +480,12 @@ static MemoryRegion *cxl_md_get_memory_region(MemoryDeviceState *md,
     return ct3d->cxl_dstate.pmem;
 }
 
+static DOEProtocol doe_spdm_prot[] = {
+    {PCI_VENDOR_ID_PCI_SIG, PCI_SIG_DOE_CMA, pcie_doe_spdm_rsp},
+    {PCI_VENDOR_ID_PCI_SIG, PCI_SIG_DOE_SECURED_CMA, pcie_doe_spdm_rsp},
+    {},
+};
+
 static DOEProtocol doe_comp_prot[] = {
     {CXL_VENDOR_ID, CXL_DOE_COMPLIANCE, cxl_doe_compliance_rsp},
     {},
@@ -489,7 +503,7 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     ComponentRegisters *regs = &cxl_cstate->crb;
     MemoryRegion *mr = &regs->component_registers;
     uint8_t *pci_conf = pci_dev->config;
-    unsigned short msix_num = 2;
+    unsigned short msix_num = 3;
     int i;
 
     if (!ct3d->cxl_dstate.pmem) {
@@ -528,13 +542,22 @@ static void ct3_realize(PCIDevice *pci_dev, Error **errp)
     }
 
     /* DOE Initailization */
-    pcie_doe_init(pci_dev, &ct3d->doe_comp, 0x160, doe_comp_prot, true, 0);
-    pcie_doe_init(pci_dev, &ct3d->doe_cdat, 0x190, doe_cdat_prot, true, 1);
+    if (ct3d->use_spdm) {
+        spdm_sock_init(errp);
+        pcie_doe_init(pci_dev, &ct3d->doe_spdm, 0x160, doe_spdm_prot, true, 2);
+    }
+    pcie_doe_init(pci_dev, &ct3d->doe_comp, 0x190, doe_comp_prot, true, 1);
+    pcie_doe_init(pci_dev, &ct3d->doe_cdat, 0x1b0, doe_cdat_prot, true, 0);
 
     cxl_cstate->cdat.build_cdat_table = build_default_cdat_table;
     cxl_doe_cdat_init(cxl_cstate, errp);
 }
 
+static void ct3_exit(PCIDevice *pci_dev)
+{
+    spdm_sock_fini();
+}
+
 static uint64_t cxl_md_get_addr(const MemoryDeviceState *md)
 {
     CXLType3Dev *ct3d = CT3(md);
@@ -570,6 +593,7 @@ static Property ct3_props[] = {
     DEFINE_PROP_LINK("lsa", CXLType3Dev, lsa, TYPE_MEMORY_BACKEND,
                      HostMemoryBackend *),
     DEFINE_PROP_STRING("cdat", CXLType3Dev, cxl_cstate.cdat.filename),
+    DEFINE_PROP_BOOL("spdm", CXLType3Dev, use_spdm, false),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -658,6 +682,7 @@ static void ct3_class_init(ObjectClass *oc, void *data)
     CXLType3Class *cvc = CXL_TYPE3_DEV_CLASS(oc);
 
     pc->realize = ct3_realize;
+    pc->exit = ct3_exit;
     pc->class_id = PCI_CLASS_STORAGE_EXPRESS;
     pc->vendor_id = PCI_VENDOR_ID_INTEL;
     pc->device_id = 0xd93; /* LVF for now */
diff --git a/hw/pci/Kconfig b/hw/pci/Kconfig
index 77f8b00..181495e 100644
--- a/hw/pci/Kconfig
+++ b/hw/pci/Kconfig
@@ -13,3 +13,7 @@ config MSI_NONBROKEN
     # or support it and have a good implementation. See commit
     # 47d2b0f33c664533b8dbd5cb17faa8e6a01afe1f.
     bool
+
+config PCIE_SPDM
+    bool
+    default y
diff --git a/hw/pci/SpdmEmuCommand.c b/hw/pci/SpdmEmuCommand.c
new file mode 100644
index 0000000..b1944fa
--- /dev/null
+++ b/hw/pci/SpdmEmuCommand.c
@@ -0,0 +1,319 @@
+/**
+@file
+UEFI OS based application.
+
+Copyright (c) 2020, Intel Corporation. All rights reserved.<BR>
+SPDX-License-Identifier: BSD-2-Clause-Patent
+
+**/
+
+#include "hw/pci/SpdmEmuCommand.h"
+#include "qapi/error.h"
+#include <sys/socket.h>
+#include <arpa/inet.h>
+
+#define DWORD_BYTE 4
+
+struct in_addr mIpAddress = {0x0100007F};
+int ClientSocket;
+uint32_t mUseTransportLayer = SOCKET_TRANSPORT_TYPE_PCI_DOE;
+
+/**
+  This function dump raw data.
+
+  @param  Data  raw data
+  @param  Size  raw data size
+**/
+static void DumpData(uint8_t *Data, uint64_t Size)
+{
+    uint64_t Index;
+
+    for (Index = 0; Index < Size; Index++) {
+        if (Index != 0) {
+            printf (" ");
+        }
+        printf ("%02x", Data[Index]);
+    }
+    printf("\n");
+}
+
+/**
+  Read number of bytes data in blocking mode.
+
+  If there is no enough data in socket, this function will wait.
+  This function will return if enough data is read, or socket error.
+**/
+static bool ReadBytes(int Socket, uint8_t *Buffer, uint32_t NumberOfBytes)
+{
+    int Result;
+    uint32_t NumberReceived;
+
+    NumberReceived = 0;
+    while (NumberReceived < NumberOfBytes) {
+        Result = recv(Socket, (char *)(Buffer + NumberReceived),
+                      NumberOfBytes - NumberReceived, 0);
+        if (Result == -1) {
+            printf("Receive error - 0x%x\n", errno);
+            return false;
+        }
+        if (Result == 0) {
+            return false;
+        }
+        NumberReceived += Result;
+    }
+    return true;
+}
+
+static bool ReadData32(int Socket, uint32_t *Data)
+{
+    bool Result;
+
+    Result = ReadBytes(Socket, (uint8_t *)Data, sizeof(uint32_t));
+    if (!Result) {
+        return Result;
+    }
+    *Data = ntohl(*Data);
+    return true;
+}
+
+/**
+  Read multiple bytes in blocking mode.
+
+  The length is presented as first 4 bytes in big endian.
+  The data follows the length.
+
+  If there is no enough data in socket, this function will wait.
+  This function will return if enough data is read, or socket error.
+**/
+static bool ReadMultipleBytes(int Socket, uint8_t *Buffer,
+                              uint32_t *BytesReceived, uint32_t MaxBufferLength)
+{
+    uint32_t Length;
+    bool Result;
+
+    Result = ReadData32(Socket, &Length);
+    if (!Result) {
+        return Result;
+    }
+    printf("Platform Port Receive Size: ");
+    Length = ntohl(Length);
+    DumpData((uint8_t *)&Length, sizeof(uint32_t));
+    Length = ntohl(Length);
+
+    *BytesReceived = Length;
+    if (*BytesReceived > MaxBufferLength) {
+        printf("Buffer too small (0x%x). Expected - 0x%x\n",
+               MaxBufferLength, *BytesReceived);
+        return false;
+    }
+    if (Length == 0) {
+        return true;
+    }
+    Result = ReadBytes (Socket, Buffer, Length);
+    if (!Result) {
+        return Result;
+    }
+    printf("Platform Port Receive Buffer:\n    ");
+    DumpData(Buffer, Length);
+    return true;
+}
+
+static bool ReceivePlatformData(int Socket, uint32_t *Command,
+                                uint8_t *ReceiveBuffer,
+                                uint32_t *BytesToReceive)
+{
+    bool Result;
+    uint32_t Response;
+    uint32_t TransportType;
+    uint32_t BytesReceived;
+
+    Result = ReadData32(Socket, &Response);
+    if (!Result) {
+        return Result;
+    }
+    *Command = Response;
+    printf("Platform Port Receive Command: ");
+    Response = ntohl(Response);
+    DumpData((uint8_t *)&Response, sizeof(uint32_t));
+
+    Result = ReadData32(Socket, &TransportType);
+    if (!Result) {
+        return Result;
+    }
+    printf("Platform Port Receive TransportType: ");
+    TransportType = ntohl(TransportType);
+    DumpData((uint8_t *)&TransportType, sizeof(uint32_t));
+    TransportType = ntohl(TransportType);
+    if (TransportType != mUseTransportLayer) {
+        printf("TransportType mismatch\n");
+        return false;
+    }
+
+    BytesReceived = 0;
+    Result = ReadMultipleBytes(Socket, ReceiveBuffer, &BytesReceived,
+                               (uint32_t)*BytesToReceive);
+    if (!Result) {
+        return Result;
+    }
+    *BytesToReceive = BytesReceived;
+
+    return Result;
+}
+
+/**
+  Write number of bytes data in blocking mode.
+
+  This function will return if data is written, or socket error.
+**/
+static bool WriteBytes(int Socket, uint8_t *Buffer, uint32_t NumberOfBytes)
+{
+    int Result;
+    uint32_t NumberSent;
+
+    NumberSent = 0;
+    while (NumberSent < NumberOfBytes) {
+        Result = send(Socket, (char *)(Buffer + NumberSent),
+                      NumberOfBytes - NumberSent, 0);
+        if (Result == -1) {
+            printf ("Send error - 0x%x\n", errno);
+            return false;
+        }
+        NumberSent += Result;
+    }
+    return true;
+}
+
+static bool WriteData32(int Socket, uint32_t Data)
+{
+    Data = htonl(Data);
+    return WriteBytes(Socket, (uint8_t *)&Data, sizeof(uint32_t));
+}
+
+/**
+  Write multiple bytes.
+
+  The length is presented as first 4 bytes in big endian.
+  The data follows the length.
+**/
+static bool WriteMultipleBytes(int Socket, uint8_t *Buffer,
+                               uint32_t BytesToSend)
+{
+    bool Result;
+
+    Result = WriteData32 (Socket, BytesToSend);
+    if (!Result) {
+        return Result;
+    }
+    printf("Platform Port Transmit Size: ");
+    BytesToSend = htonl(BytesToSend);
+    DumpData((uint8_t *)&BytesToSend, sizeof(uint32_t));
+    BytesToSend = htonl(BytesToSend);
+
+    Result = WriteBytes(Socket, Buffer, BytesToSend);
+    if (!Result) {
+        return Result;
+    }
+    printf("Platform Port Transmit Buffer:\n    ");
+    DumpData(Buffer, BytesToSend);
+
+    return true;
+}
+
+static bool SendPlatformData(int Socket, uint32_t Command, uint8_t *SendBuffer,
+                             uint32_t BytesToSend)
+{
+    bool Result;
+    uint32_t Request;
+    uint32_t TransportType;
+
+    Request = Command;
+    Result = WriteData32(Socket, Request);
+    if (!Result) {
+        return Result;
+    }
+    printf ("Platform Port Transmit Command: ");
+    Request = htonl(Request);
+    DumpData((uint8_t *)&Request, sizeof(uint32_t));
+
+    Result = WriteData32(Socket, mUseTransportLayer);
+    if (!Result) {
+        return Result;
+    }
+    printf("Platform Port Transmit TransportType: ");
+    TransportType = ntohl(mUseTransportLayer);
+    DumpData((uint8_t *)&TransportType, sizeof(uint32_t));
+
+    Result = WriteMultipleBytes(Socket, SendBuffer, BytesToSend);
+    if (!Result) {
+        return Result;
+    }
+
+    return true;
+}
+
+void spdm_sock_init(Error **errp)
+{
+    int result;
+    struct sockaddr_in ServerAddr;
+    uint16_t Port = 2323;
+
+    ClientSocket = socket(AF_INET, SOCK_STREAM, IPPROTO_TCP);
+    if (ClientSocket == INVALID_SOCKET) {
+        error_setg(errp, "Openspdm: %s\n", strerror(errno));
+        return;
+    }
+
+    ServerAddr.sin_family = AF_INET;
+    memcpy(&ServerAddr.sin_addr.s_addr, &mIpAddress, sizeof(struct in_addr));
+    ServerAddr.sin_port = htons(Port);
+    memset(ServerAddr.sin_zero, 0, sizeof(ServerAddr.sin_zero));
+
+    result = connect(ClientSocket, (struct sockaddr *)&ServerAddr,
+                     sizeof(ServerAddr));
+    if (result == SOCKET_ERROR) {
+        error_setg(errp, "Openspdm: %s\n", strerror(errno));
+        closesocket(ClientSocket);
+        return;
+    }
+    printf("Openspdm: Connect success!\n");
+}
+
+bool pcie_doe_spdm_rsp(DOECap *doe_cap)
+{
+    void *req = pcie_doe_get_write_mbox_ptr(doe_cap);
+    uint32_t len = pcie_doe_get_obj_len(req);
+    uint32_t rsp_len = MAX_SPDM_MESSAGE_BUFFER_SIZE, Command;
+    bool result;
+
+    result = SendPlatformData(ClientSocket, SOCKET_SPDM_COMMAND_NORMAL,
+                              req, len * DWORD_BYTE);
+    if (!result) {
+        printf("SendPlatformData error\n");
+        return result;
+    }
+
+    result = ReceivePlatformData(ClientSocket, &Command,
+                                 (uint8_t *)doe_cap->read_mbox, &rsp_len);
+    if (!result) {
+        printf("ReceivePlatformData error\n");
+        return result;
+    }
+
+    assert(Command != 0);
+    doe_cap->read_mbox_len += DIV_ROUND_UP(rsp_len, DWORD_BYTE);
+
+    return true;
+}
+
+void spdm_sock_fini(void)
+{
+    bool result;
+
+    result = SendPlatformData(ClientSocket, SOCKET_SPDM_COMMAND_SHUTDOWN,
+                              NULL, 0);
+    if (!result) {
+        printf("SendPlatformData error\n");
+        return;
+    }
+    printf("Openspdm: Shutdown!\n");
+}
diff --git a/hw/pci/meson.build b/hw/pci/meson.build
index 115e502..e3be112 100644
--- a/hw/pci/meson.build
+++ b/hw/pci/meson.build
@@ -13,6 +13,7 @@ pci_ss.add(files(
 # CONFIG_PCI_EXPRESS=n.
 pci_ss.add(files('pcie.c', 'pcie_aer.c'))
 pci_ss.add(files('pcie_doe.c'))
+pci_ss.add(when: 'CONFIG_PCIE_SPDM', if_true: files('SpdmEmuCommand.c'))
 softmmu_ss.add(when: 'CONFIG_PCI_EXPRESS', if_true: files('pcie_port.c', 'pcie_host.c'))
 softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
 
diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
index de006ff..a112620 100644
--- a/include/hw/cxl/cxl_device.h
+++ b/include/hw/cxl/cxl_device.h
@@ -240,6 +240,8 @@ typedef struct cxl_type3_dev {
     /* DOE */
     DOECap doe_comp;
     DOECap doe_cdat;
+    bool use_spdm;
+    DOECap doe_spdm;
 } CXLType3Dev;
 
 #ifndef TYPE_CXL_TYPE3_DEV
diff --git a/include/hw/pci/SpdmEmuCommand.h b/include/hw/pci/SpdmEmuCommand.h
new file mode 100644
index 0000000..39e7e9a
--- /dev/null
+++ b/include/hw/pci/SpdmEmuCommand.h
@@ -0,0 +1,21 @@
+#include "qemu/osdep.h"
+#include "hw/pci/pcie_doe.h"
+
+#define SOCKET_TRANSPORT_TYPE_MCTP     0x01
+#define SOCKET_TRANSPORT_TYPE_PCI_DOE  0x02
+
+#define SOCKET_SPDM_COMMAND_NORMAL                0x0001
+#define SOCKET_SPDM_COMMAND_OOB_ENCAP_KEY_UPDATE  0x8001
+#define SOCKET_SPDM_COMMAND_CONTINUE              0xFFFD
+#define SOCKET_SPDM_COMMAND_SHUTDOWN              0xFFFE
+#define SOCKET_SPDM_COMMAND_UNKOWN                0xFFFF
+#define SOCKET_SPDM_COMMAND_TEST                  0xDEAD
+
+#define INVALID_SOCKET (-1)
+#define SOCKET_ERROR (-1)
+
+#define MAX_SPDM_MESSAGE_BUFFER_SIZE      0x1200
+
+void spdm_sock_init(Error **errp);
+bool pcie_doe_spdm_rsp(DOECap *doe_cap);
+void spdm_sock_fini(void);
diff --git a/include/hw/pci/pcie_doe.h b/include/hw/pci/pcie_doe.h
index e551f49..af4be56 100644
--- a/include/hw/pci/pcie_doe.h
+++ b/include/hw/pci/pcie_doe.h
@@ -47,6 +47,8 @@ REG32(PCI_DOE_CAP_STATUS, 0)
 
 /* PCI-SIG defined Data Object Types - Table 7-x2 */
 #define PCI_SIG_DOE_DISCOVERY       0x00
+#define PCI_SIG_DOE_CMA             0x01
+#define PCI_SIG_DOE_SECURED_CMA     0x02
 
 #define PCI_DOE_DW_SIZE_MAX         (1 << 18)
 #define PCI_DOE_PROTOCOL_NUM_MAX    256
-- 
1.8.3.1


