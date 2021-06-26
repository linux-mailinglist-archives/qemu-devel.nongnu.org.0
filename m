Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6C043B4B6C
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Jun 2021 02:02:30 +0200 (CEST)
Received: from localhost ([::1]:38452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwvmH-00055q-Og
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 20:02:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chris@server4.localdomain>)
 id 1lwvl7-00033f-40
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 20:01:17 -0400
Received: from static-71-162-116-19.bstnma.fios.verizon.net
 ([71.162.116.19]:37422 helo=server4.localdomain)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <chris@server4.localdomain>) id 1lwvl4-0005ZQ-TF
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 20:01:16 -0400
Received: by server4.localdomain (Postfix, from userid 503)
 id 6F00360311130; Fri, 25 Jun 2021 20:01:14 -0400 (EDT)
From: Chris Browy <cbrowy@avery-design.com>
To: mst@redhat.com
Subject: [PATCH v1 openspdm on QEMU CXL/PCIe Device 2/2] requester: Modified
 for QEMU emulation
Date: Fri, 25 Jun 2021 20:01:12 -0400
Message-Id: <1624665672-4964-1-git-send-email-cbrowy@avery-design.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624665280-3595-1-git-send-email-cbrowy@avery-design.com>
References: <1624665280-3595-1-git-send-email-cbrowy@avery-design.com>
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

The requester should be used as a PCIe app to access the SPDM object in
the PCEe device.

Signed-off-by: Chris Browy <cbrowy@avery-design.com>
---
 Include/IndustryStandard/PciDoeBinding.h    |  27 +++++++
 SpdmEmu/SpdmEmuCommon/SpdmEmu.c             |  85 ++++++++++++++++++++++
 SpdmEmu/SpdmEmuCommon/SpdmEmu.h             |   7 ++
 SpdmEmu/SpdmRequesterEmu/SpdmRequester.c    | 100 +++++++++++++++++++------
 SpdmEmu/SpdmRequesterEmu/SpdmRequesterEmu.c | 109 +++++++++++++++++++++++++---
 SpdmEmu/SpdmRequesterEmu/SpdmRequesterEmu.h |   5 ++
 6 files changed, 300 insertions(+), 33 deletions(-)

diff --git a/Include/IndustryStandard/PciDoeBinding.h b/Include/IndustryStandard/PciDoeBinding.h
index c7cd7d3..6d199f7 100644
--- a/Include/IndustryStandard/PciDoeBinding.h
+++ b/Include/IndustryStandard/PciDoeBinding.h
@@ -29,6 +29,33 @@ typedef struct {
 //UINT32   DataObjectDW[Length];
 } PCI_DOE_DATA_OBJECT_HEADER;
 
+/* Extended Capabilities (PCI-X 2.0 and Express) */
+#define PCI_EXT_CAP_ID(header)      (header & 0x0000ffff)
+#define PCI_EXT_CAP_VER(header)     ((header >> 16) & 0xf)
+#define PCI_EXT_CAP_NEXT(header)    ((header >> 20) & 0xffc)
+
+#define PCIE_EXT_CAP_OFFSET     0x100
+#define PCI_EXT_CAP_ID_DOE      0x2e    /*  Data Object Exchange */
+
+/* DOE Capabilities Register */
+#define PCIE_DOE_CAP            0x04
+#define  PCIE_DOE_CAP_INTR_SUPP 0x00000001
+/* DOE Control Register  */
+#define PCIE_DOE_CTRL           0x08
+#define  PCIE_DOE_CTRL_ABORT    0x00000001
+#define  PCIE_DOE_CTRL_INTR_EN  0x00000002
+#define  PCIE_DOE_CTRL_GO       0x80000000
+/* DOE Status Register  */
+#define PCIE_DOE_STATUS         0x0c
+#define  PCIE_DOE_STATUS_BUSY   0x00000001
+#define  PCIE_DOE_STATUS_INTR   0x00000002
+#define  PCIE_DOE_STATUS_ERR    0x00000004
+#define  PCIE_DOE_STATUS_DO_RDY 0x80000000
+/* DOE Write Data Mailbox Register  */
+#define PCIE_DOE_WR_DATA_MBOX   0x10
+/* DOE Read Data Mailbox Register  */
+#define PCIE_DOE_RD_DATA_MBOX   0x14
+
 #define PCI_DOE_VENDOR_ID_PCISIG                   0x0001
 
 #define PCI_DOE_DATA_OBJECT_TYPE_DOE_DISCOVERY     0x00
diff --git a/SpdmEmu/SpdmEmuCommon/SpdmEmu.c b/SpdmEmu/SpdmEmuCommon/SpdmEmu.c
index b9a4311..768a8b0 100644
--- a/SpdmEmu/SpdmEmuCommon/SpdmEmu.c
+++ b/SpdmEmu/SpdmEmuCommon/SpdmEmu.c
@@ -32,6 +32,11 @@ UINT32  mExeSession = (0 |
                        EXE_SESSION_MEAS |
                        0);
 
+extern struct pcie_dev dev;
+extern char filename[41];
+struct pcie_dev dev = {0};
+char filename[41];
+
 VOID
 PrintUsage (
   IN CHAR8* Name
@@ -364,6 +369,64 @@ Done:
   return Ret;
 }
 
+/* Ref: pciutils/lib/filter.c */
+/* Slot filter syntax: [[[domain]:][bus]:][slot][.[func]] */
+static char *pci_filter_parse_slot(struct pcie_dev *f, char *str)
+{
+    char *colon = strrchr(str, ':');
+    char *dot = strchr((colon ? colon + 1 : str), '.');
+    char *mid = str;
+    char *e, *bus, *colon2;
+
+    if (colon) {
+        *colon++ = 0;
+        mid = colon;
+        colon2 = strchr(str, ':');
+
+        if (colon2) {
+            *colon2++ = 0;
+            bus = colon2;
+            if (str[0] && strcmp(str, "*")) {
+                long int x = strtol(str, &e, 16);
+                if ((e && *e) || (x < 0 || x > 0x7fffffff)) {
+                    return "Invalid domain number";
+                }
+                f->domain = x;
+            }
+        } else
+            bus = str;
+
+        if (bus[0] && strcmp(bus, "*")) {
+            long int x = strtol(bus, &e, 16);
+            if ((e && *e) || (x < 0 || x > 0xff)) {
+                return "Invalid bus number";
+            }
+            f->bus = x;
+        }
+    }
+
+    if (dot) {
+        *dot++ = 0;
+    }
+
+    if (mid[0] && strcmp(mid, "*")) {
+        long int x = strtol(mid, &e, 16);
+        if ((e && *e) || (x < 0 || x > 0x1f)) {
+            return "Invalid slot number";
+        }
+        f->slot = x;
+    }
+
+    if (dot && dot[0] && strcmp(dot, "*")) {
+        long int x = strtol(dot, &e, 16);
+        if ((e && *e) || (x < 0 || x > 7)) {
+            return "Invalid function number";
+        }
+        f->func = x;
+    }
+    return NULL;
+}
+
 void
 ProcessArgs (
   char  *ProgramName,
@@ -373,6 +436,7 @@ ProcessArgs (
 {
   UINT32  Data32;
   CHAR8   *PcapFileName;
+  char *err;
 
   PcapFileName = NULL;
 
@@ -854,6 +918,27 @@ ProcessArgs (
       }
     }
 
+    if (strcmp (argv[0], "-s") == 0) {
+      if (argc >= 2) {
+        err = pci_filter_parse_slot(&dev, argv[1]);
+        if (err) {
+          printf("%s\n", err);
+          PrintUsage (ProgramName);
+          exit (0);
+        }
+        sprintf(filename, "/sys/bus/pci/devices/%04x:%02x:%02x.%01x/config",
+                dev.domain, dev.bus, dev.slot, dev.func);
+
+        argc -= 2;
+        argv += 2;
+        continue;
+      } else {
+        printf ("invalid -s\n");
+        PrintUsage (ProgramName);
+        exit (0);
+      }
+    }
+
     printf ("invalid %s\n", argv[0]);
     PrintUsage (ProgramName);
     exit (0);
diff --git a/SpdmEmu/SpdmEmuCommon/SpdmEmu.h b/SpdmEmu/SpdmEmuCommon/SpdmEmu.h
index 640cf00..5335fc9 100644
--- a/SpdmEmu/SpdmEmuCommon/SpdmEmu.h
+++ b/SpdmEmu/SpdmEmuCommon/SpdmEmu.h
@@ -156,4 +156,11 @@ ProcessArgs (
   char  *argv[ ]
   );
 
+struct pcie_dev {
+    int pdev;
+    int domain;
+    int bus;
+    int slot;
+    int func;
+};
 #endif
diff --git a/SpdmEmu/SpdmRequesterEmu/SpdmRequester.c b/SpdmEmu/SpdmRequesterEmu/SpdmRequester.c
index 7635e7e..cfa1723 100644
--- a/SpdmEmu/SpdmRequesterEmu/SpdmRequester.c
+++ b/SpdmEmu/SpdmRequesterEmu/SpdmRequester.c
@@ -11,6 +11,7 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
 
 VOID                          *mSpdmContext;
 SOCKET                        mSocket;
+extern struct pcie_dev dev;
 
 BOOLEAN
 CommunicatePlatformData (
@@ -53,6 +54,30 @@ CommunicatePlatformData (
 
 RETURN_STATUS
 EFIAPI
+AvyPCIConfigWriteDW (
+  IN     UINT64                                 Address,
+  IN OUT UINT32                                 Data
+  )
+{
+  pwrite(dev.pdev, &Data, sizeof(uint32_t), Address);
+
+  return RETURN_SUCCESS;
+}
+
+RETURN_STATUS
+EFIAPI
+AvyPCIConfigReadDW (
+  IN     UINT64                                 Address,
+  IN OUT UINT32                                 *Data
+  )
+{
+  pread(dev.pdev, Data, sizeof(uint32_t), Address);
+
+  return RETURN_SUCCESS;
+}
+
+RETURN_STATUS
+EFIAPI
 SpdmDeviceSendMessage (
   IN     VOID                                   *SpdmContext,
   IN     UINTN                                  RequestSize,
@@ -60,19 +85,30 @@ SpdmDeviceSendMessage (
   IN     UINT64                                 Timeout
   )
 {
+  RETURN_STATUS PCIResult;
   BOOLEAN Result;
+  INT32 Index;
+  UINT32 DoeStatus = 0;
 
-  Result = SendPlatformData (mSocket, SOCKET_SPDM_COMMAND_NORMAL, Request, (UINT32)RequestSize);
-  if (!Result) {
-    printf ("SendPlatformData Error - %x\n",
-#ifdef _MSC_VER
-      WSAGetLastError()
-#else
-      errno
-#endif
-      );
-    return RETURN_DEVICE_ERROR;
+  while (DoeStatus & PCIE_DOE_STATUS_BUSY) {
+    Result = AvyPCIConfigReadDW(mDOEBaseAddress + PCIE_DOE_STATUS, &DoeStatus);
+    if (Result) {
+      return Result;
+    }
+  }
+
+  for (Index = 0; Index < (INT32)(RequestSize / 4) ; Index++) {
+    PCIResult = AvyPCIConfigWriteDW (mDOEBaseAddress + PCIE_DOE_WR_DATA_MBOX, ((UINT32 *)Request)[Index]);
+    if (PCIResult) {
+      return PCIResult;
     }
+  }
+
+  PCIResult = AvyPCIConfigWriteDW (mDOEBaseAddress + PCIE_DOE_CTRL, PCIE_DOE_CTRL_GO);
+  if (PCIResult) {
+    return PCIResult;
+  }
+
   return RETURN_SUCCESS;
 }
 
@@ -85,20 +121,40 @@ SpdmDeviceReceiveMessage (
   IN     UINT64                                 Timeout
   )
 {
-  BOOLEAN Result;
-  UINT32  Command;
+  RETURN_STATUS Result;
+  UINT32 RecieveBuffer[MAX_SPDM_MESSAGE_BUFFER_SIZE];
+  UINT32 RecieveBufferCount = 0, DoeStatus = 0;
 
-  Result = ReceivePlatformData (mSocket, &Command, Response, ResponseSize);
-  if (!Result) {
-    printf ("ReceivePlatformData Error - %x\n",
-#ifdef _MSC_VER
-      WSAGetLastError()
-#else
-      errno
-#endif
-      );
-    return RETURN_DEVICE_ERROR;
+  while ((!(DoeStatus & PCIE_DOE_STATUS_DO_RDY)) || (DoeStatus & PCIE_DOE_STATUS_BUSY)) {
+    Result = AvyPCIConfigReadDW(mDOEBaseAddress + PCIE_DOE_STATUS, &DoeStatus);
+    if (Result) {
+      return Result;
     }
+  }
+
+  while (DoeStatus & PCIE_DOE_STATUS_DO_RDY) {
+    Result = AvyPCIConfigReadDW (mDOEBaseAddress + PCIE_DOE_RD_DATA_MBOX, RecieveBuffer + RecieveBufferCount);
+    if (Result) {
+      return Result;
+    }
+    RecieveBufferCount++;
+
+    Result = AvyPCIConfigWriteDW (mDOEBaseAddress + PCIE_DOE_RD_DATA_MBOX, 0x1);
+    if (Result) {
+      return Result;
+    }
+
+    Result = AvyPCIConfigReadDW (mDOEBaseAddress + PCIE_DOE_STATUS, &DoeStatus);
+    if (Result) {
+      return Result;
+    }
+  }
+  *ResponseSize = RecieveBufferCount * 4;
+  CopyMem (Response, RecieveBuffer, *ResponseSize);
+
+  DumpData ((UINT8 *)Response, *ResponseSize);
+  printf ("\n");
+
   return RETURN_SUCCESS;
 }
 
diff --git a/SpdmEmu/SpdmRequesterEmu/SpdmRequesterEmu.c b/SpdmEmu/SpdmRequesterEmu/SpdmRequesterEmu.c
index 61d38d8..64b7381 100644
--- a/SpdmEmu/SpdmRequesterEmu/SpdmRequesterEmu.c
+++ b/SpdmEmu/SpdmRequesterEmu/SpdmRequesterEmu.c
@@ -22,6 +22,10 @@ extern SOCKET                       mSocket;
 
 extern VOID          *mSpdmContext;
 
+extern struct pcie_dev dev;
+UINT32 mDOEBaseAddress = 0;
+extern char filename[41];
+
 VOID *
 SpdmClientInit (
   VOID
@@ -53,6 +57,31 @@ DoSessionViaSpdm (
   IN     BOOLEAN              UsePsk
   );
 
+RETURN_STATUS
+EFIAPI
+AvyPCIConfigReadDW (
+  IN     UINT64                                 Address,
+  IN OUT UINT32                                 *Data
+  );
+
+RETURN_STATUS
+EFIAPI
+SpdmDeviceSendMessage (
+  IN     VOID                                   *SpdmContext,
+  IN     UINTN                                  RequestSize,
+  IN     VOID                                   *Request,
+  IN     UINT64                                 Timeout
+  );
+
+RETURN_STATUS
+EFIAPI
+SpdmDeviceReceiveMessage (
+  IN     VOID                                   *SpdmContext,
+  IN OUT UINTN                                  *ResponseSize,
+  IN OUT VOID                                   *Response,
+  IN     UINT64                                 Timeout
+  );
+
 BOOLEAN
 InitClient (
   OUT SOCKET  *Socket,
@@ -116,12 +145,18 @@ PlatformClientRoutine (
   IN UINT16 PortNumber
   )
 {
+#if 0
   SOCKET         PlatformSocket;
   BOOLEAN        Result;
   UINT32         Response;
+#endif
   UINTN          ResponseSize;
+  INT32          Result;
   RETURN_STATUS  Status;
+  UINT32         CapabilityOffset = 0, PCIRegister;
+  BOOLEAN        ProtocolFound = FALSE;
 
+#if 0
 #ifdef _MSC_VER
   WSADATA Ws;
   if (WSAStartup(MAKEWORD(2,2), &Ws) != 0) {
@@ -176,6 +211,49 @@ PlatformClientRoutine (
       mDoeRequest.DoeDiscoveryRequest.Index = DoeResponse.DoeDiscoveryResponse.NextIndex;
     } while (DoeResponse.DoeDiscoveryResponse.NextIndex != 0);
   }
+#endif
+  if (mUseTransportLayer == SOCKET_TRANSPORT_TYPE_PCI_DOE) {
+    DOE_DISCOVERY_RESPONSE_MINE  DoeResponse;
+
+    for (CapabilityOffset = PCIE_EXT_CAP_OFFSET; CapabilityOffset;
+         CapabilityOffset = PCI_EXT_CAP_NEXT(PCIRegister)) {
+      Result = AvyPCIConfigReadDW (CapabilityOffset, &PCIRegister);
+      if (Result) {
+        printf ("Config Read error\n");
+        goto Done;
+      }
+
+      if (PCI_EXT_CAP_ID(PCIRegister) == PCI_EXT_CAP_ID_DOE) {
+        mDOEBaseAddress = CapabilityOffset;
+
+        // DOE Discovery
+        do {
+          SpdmDeviceSendMessage (NULL, sizeof(mDoeRequest), &mDoeRequest, 0);
+          SpdmDeviceReceiveMessage (NULL, &ResponseSize, &DoeResponse, 0);
+
+          if (DoeResponse.DoeHeader.VendorId == PCI_DOE_VENDOR_ID_PCISIG &&
+              DoeResponse.DoeDiscoveryResponse.DataObjectType == PCI_DOE_DATA_OBJECT_TYPE_SPDM) {
+            ProtocolFound = TRUE;
+            break;
+          }
+
+          mDoeRequest.DoeDiscoveryRequest.Index = DoeResponse.DoeDiscoveryResponse.NextIndex;
+        } while (DoeResponse.DoeDiscoveryResponse.NextIndex != 0);
+
+        if (ProtocolFound) {
+          break;
+        }
+      }
+    }
+
+    if (!mDOEBaseAddress) {
+      printf ("DOE Capability not found\n");
+      goto Done;
+    } else if (!ProtocolFound) {
+      printf ("SPDM protocol not found\n");
+      goto Done;
+    }
+  }
 
   mSpdmContext = SpdmClientInit ();
   if (mSpdmContext == NULL) {
@@ -217,24 +295,26 @@ PlatformClientRoutine (
   }
 
   // Do test - end
+  printf ("\033[1mTest End\033[m\n");
+  return TRUE;
 
 Done:
-  ResponseSize = 0;
-  Result = CommunicatePlatformData (
-            PlatformSocket,
-            SOCKET_SPDM_COMMAND_SHUTDOWN - mExeMode,
-            NULL,
-            0,
-            &Response,
-            &ResponseSize,
-            NULL
-            );
+  //ResponseSize = 0;
+  //Result = CommunicatePlatformData (
+  //          PlatformSocket,
+  //          SOCKET_SPDM_COMMAND_SHUTDOWN - mExeMode,
+  //          NULL,
+  //          0,
+  //          &Response,
+  //          &ResponseSize,
+  //          NULL
+  //          );
 
   if (mSpdmContext != NULL) {
     free (mSpdmContext);
   }
 
-  closesocket (PlatformSocket);
+  //closesocket (PlatformSocket);
 
 #ifdef _MSC_VER
   WSACleanup();
@@ -253,9 +333,16 @@ int main (
 
   ProcessArgs ("SpdmRequesterEmu", argc, argv);
 
+  dev.pdev = open(filename, O_RDWR);
+  if (dev.pdev < 0) {
+      printf("Fail to open %s\n", filename);
+      return -1;
+  }
+
   PlatformClientRoutine (DEFAULT_SPDM_PLATFORM_PORT);
   printf ("Client stopped\n");
 
   ClosePcapPacketFile ();
+  close(dev.pdev);
   return 0;
 }
diff --git a/SpdmEmu/SpdmRequesterEmu/SpdmRequesterEmu.h b/SpdmEmu/SpdmRequesterEmu/SpdmRequesterEmu.h
index 5671536..c1d03ef 100644
--- a/SpdmEmu/SpdmRequesterEmu/SpdmRequesterEmu.h
+++ b/SpdmEmu/SpdmRequesterEmu/SpdmRequesterEmu.h
@@ -20,4 +20,9 @@ SPDX-License-Identifier: BSD-2-Clause-Patent
 #include "stdio.h"
 #include "SpdmEmu.h"
 
+#include <sys/types.h>
+#include <sys/stat.h>
+#include <fcntl.h>
+
+extern UINT32 mDOEBaseAddress;
 #endif
-- 
1.8.3.1


