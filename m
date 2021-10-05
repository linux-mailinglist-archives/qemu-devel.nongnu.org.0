Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B514422F2E
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:26:27 +0200 (CEST)
Received: from localhost ([::1]:35546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoCw-0003ZM-CZ
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:26:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnYA-0007p2-QU
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:18 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:38490)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mXnY8-0003ut-Kp
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:44:18 -0400
Received: by mail-ed1-x534.google.com with SMTP id dj4so1217049edb.5
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=o/9VsRJ4FP/YaqS/ATZW3afXJPLasRAhTWZ76zdiiLo=;
 b=fofZzQ1IYyTbRMqrhQ3eYGismbAqgyCJNcSlwZ2Cwzdx59QuzDglMLg4ZVXEq10k7P
 T0VWdYmtb0fqIlyjgSnZgZvom8tZKh79WZ+V/nIGQj0NXEF7DeYE6T+9Imbg2fw9Yq+T
 rAsiocnQmipQ29WEm+euonq3HGRpJbwjnx0z/caGA82CPa8eZ9TAP7tmEyDoQqk4P61b
 VbSrNspsP/PGkND/+gajdsTqfhr9e/5vMxncSonKWcdKKArc76STx+zO2zo0mBZSvZDa
 zuomXWRi/n8brWnFay35TwJszQc+ju4WS1s3VLeoKiGXR6HnxOEDYHk3FN/O9Zk8UCI8
 RJDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=o/9VsRJ4FP/YaqS/ATZW3afXJPLasRAhTWZ76zdiiLo=;
 b=FvxGv23LU41lQ8NSQ1WFOFmxYtyqAPTcA8vTKvYsNncNzV5GCgprYY9ieM3TR+lU/n
 STTl1hv0ZpbVeNuNllkUGI8BNnSuBMpw1kpVkIL3SmQ+5X7XHl/sXTuwghLqPvOBZbXD
 glcGLrfvjhOWxW5uPDxSu8/Qya9qeKCiII4L3Ypod6iBfjr183pX/jDZNyzGVqYX+ay5
 idSipTJmKRzQ/ErV6n8ffBVXg7JGpypH1abtpWu+qZC5I6xEf2dLZv1kvImzJtWqtyO3
 Say5l7aCjYX7MpPrrLlm2M3Emz27tDL3jJaAU7nG4ErAkI9NOu0DdPP/HBctC5BcAF51
 UaMw==
X-Gm-Message-State: AOAM532xLrN7sNnAAlmtuAEMEjwiBUH0HVEs1taoBVtUmnQwcHiV8N55
 QBjXo3YBq0Co0k9LIqjFpGAMshLJXV0=
X-Google-Smtp-Source: ABdhPJzVBYM8HEy/cYEW5Nn3CW/JGe5g0tGZvSx06y389bu3Odnt9NbU05IEGjRUbP2IBrR0WzNxYg==
X-Received: by 2002:a50:d903:: with SMTP id t3mr27231550edj.70.1633452255323; 
 Tue, 05 Oct 2021 09:44:15 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x14sm6101392edd.25.2021.10.05.09.44.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:44:14 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/12] hw/misc: applesmc: use host osk as default on macs
Date: Tue,  5 Oct 2021 18:44:00 +0200
Message-Id: <20211005164408.288128-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211005164408.288128-1-pbonzini@redhat.com>
References: <20211005164408.288128-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Pedro=20To=CC=82rres?= <t0rr3sp3dr0@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Pedro Tôrres <t0rr3sp3dr0@gmail.com>

When running on a Mac, QEMU is able to get the host OSK and use it as
the default value for the AppleSMC device. The OSK query operation
doesn't require administrator privileges and can be executed by any user
on the system. This patch is based on open-source code from Apple, just
like the implementation from VirtualBox.

Apple:
https://opensource.apple.com/source/IOKitUser/IOKitUser-647.6.13/pwr_mgt.subproj/IOPMLibPrivate.c
https://opensource.apple.com/source/PowerManagement/PowerManagement-637.60.1/pmconfigd/PrivateLib.c

VirtualBox:
https://www.virtualbox.org/browser/vbox/trunk/src/VBox/Devices/EFI/DevSmc.cpp#L516

Signed-off-by: Pedro Tôrres <t0rr3sp3dr0@gmail.com>
---
 hw/misc/applesmc.c | 192 ++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 191 insertions(+), 1 deletion(-)

diff --git a/hw/misc/applesmc.c b/hw/misc/applesmc.c
index 1b9acaf1d3..cec247b5ee 100644
--- a/hw/misc/applesmc.c
+++ b/hw/misc/applesmc.c
@@ -38,6 +38,171 @@
 #include "qemu/timer.h"
 #include "qom/object.h"
 
+#if defined(__APPLE__) && defined(__MACH__)
+#include <IOKit/IOKitLib.h>
+
+enum {
+    kSMCSuccess     = 0x00,
+    kSMCKeyNotFound = 0x84
+};
+
+enum {
+    kSMCUserClientOpen  = 0x00,
+    kSMCUserClientClose = 0x01,
+    kSMCHandleYPCEvent  = 0x02,
+    kSMCReadKey         = 0x05,
+    kSMCGetKeyInfo      = 0x09
+};
+
+typedef struct SMCVersion {
+    uint8_t  major;
+    uint8_t  minor;
+    uint8_t  build;
+    uint8_t  reserved;
+    uint16_t release;
+} SMCVersion;
+
+typedef struct SMCPLimitData {
+    uint16_t version;
+    uint16_t length;
+    uint32_t cpuPLimit;
+    uint32_t gpuPLimit;
+    uint32_t memPLimit;
+} SMCPLimitData;
+
+typedef struct SMCKeyInfoData {
+    IOByteCount dataSize;
+    uint32_t    dataType;
+    uint8_t     dataAttributes;
+} SMCKeyInfoData;
+
+typedef struct {
+    uint32_t       key;
+    SMCVersion     vers;
+    SMCPLimitData  pLimitData;
+    SMCKeyInfoData keyInfo;
+    uint8_t        result;
+    uint8_t        status;
+    uint8_t        data8;
+    uint32_t       data32;
+    uint8_t        bytes[32];
+} SMCParamStruct;
+
+static IOReturn smc_call_struct_method(uint32_t selector,
+                                       SMCParamStruct *inputStruct,
+                                       SMCParamStruct *outputStruct)
+{
+    IOReturn ret;
+
+    size_t inputStructCnt = sizeof(SMCParamStruct);
+    size_t outputStructCnt = sizeof(SMCParamStruct);
+
+    io_service_t smcService = IO_OBJECT_NULL;
+    io_connect_t smcConnect = IO_OBJECT_NULL;
+
+    smcService = IOServiceGetMatchingService(kIOMasterPortDefault,
+                                             IOServiceMatching("AppleSMC"));
+    if (smcService == IO_OBJECT_NULL) {
+        ret = kIOReturnNotFound;
+        goto exit;
+    }
+
+    ret = IOServiceOpen(smcService, mach_task_self(), 1, &smcConnect);
+    if (ret != kIOReturnSuccess) {
+        smcConnect = IO_OBJECT_NULL;
+        goto exit;
+    }
+    if (smcConnect == IO_OBJECT_NULL) {
+        ret = kIOReturnError;
+        goto exit;
+    }
+
+    ret = IOConnectCallMethod(smcConnect, kSMCUserClientOpen,
+                              NULL, 0, NULL, 0,
+                              NULL, NULL, NULL, NULL);
+    if (ret != kIOReturnSuccess) {
+        goto exit;
+    }
+
+    ret = IOConnectCallStructMethod(smcConnect, selector,
+                                    inputStruct, inputStructCnt,
+                                    outputStruct, &outputStructCnt);
+
+exit:
+    if (smcConnect != IO_OBJECT_NULL) {
+        IOConnectCallMethod(smcConnect, kSMCUserClientClose,
+                            NULL, 0, NULL, 0, NULL,
+                            NULL, NULL, NULL);
+        IOServiceClose(smcConnect);
+    }
+
+    return ret;
+}
+
+static IOReturn smc_read_key(uint32_t key,
+                             uint8_t *bytes,
+                             IOByteCount *dataSize)
+{
+    IOReturn ret;
+
+    SMCParamStruct inputStruct;
+    SMCParamStruct outputStruct;
+
+    if (key == 0 || bytes == NULL) {
+        ret = kIOReturnCannotWire;
+        goto exit;
+    }
+
+    /* determine key's data size */
+    memset(&inputStruct, 0, sizeof(SMCParamStruct));
+    inputStruct.data8 = kSMCGetKeyInfo;
+    inputStruct.key = key;
+
+    memset(&outputStruct, 0, sizeof(SMCParamStruct));
+    ret = smc_call_struct_method(kSMCHandleYPCEvent, &inputStruct, &outputStruct);
+    if (ret != kIOReturnSuccess) {
+        goto exit;
+    }
+    if (outputStruct.result == kSMCKeyNotFound) {
+        ret = kIOReturnNotFound;
+        goto exit;
+    }
+    if (outputStruct.result != kSMCSuccess) {
+        ret = kIOReturnInternalError;
+        goto exit;
+    }
+
+    /* get key value */
+    memset(&inputStruct, 0, sizeof(SMCParamStruct));
+    inputStruct.data8 = kSMCReadKey;
+    inputStruct.key = key;
+    inputStruct.keyInfo.dataSize = outputStruct.keyInfo.dataSize;
+
+    memset(&outputStruct, 0, sizeof(SMCParamStruct));
+    ret = smc_call_struct_method(kSMCHandleYPCEvent, &inputStruct, &outputStruct);
+    if (ret != kIOReturnSuccess) {
+        goto exit;
+    }
+    if (outputStruct.result == kSMCKeyNotFound) {
+        ret = kIOReturnNotFound;
+        goto exit;
+    }
+    if (outputStruct.result != kSMCSuccess) {
+        ret = kIOReturnInternalError;
+        goto exit;
+    }
+
+    memset(bytes, 0, *dataSize);
+    if (*dataSize > inputStruct.keyInfo.dataSize) {
+        *dataSize = inputStruct.keyInfo.dataSize;
+    }
+    memcpy(bytes, outputStruct.bytes, *dataSize);
+
+exit:
+    return ret;
+}
+#endif
+
 /* #define DEBUG_SMC */
 
 #define APPLESMC_DEFAULT_IOBASE        0x300
@@ -315,6 +480,7 @@ static const MemoryRegionOps applesmc_err_io_ops = {
 static void applesmc_isa_realize(DeviceState *dev, Error **errp)
 {
     AppleSMCState *s = APPLE_SMC(dev);
+    bool valid_key = false;
 
     memory_region_init_io(&s->io_data, OBJECT(s), &applesmc_data_io_ops, s,
                           "applesmc-data", 1);
@@ -331,7 +497,31 @@ static void applesmc_isa_realize(DeviceState *dev, Error **errp)
     isa_register_ioport(&s->parent_obj, &s->io_err,
                         s->iobase + APPLESMC_ERR_PORT);
 
-    if (!s->osk || (strlen(s->osk) != 64)) {
+    if (s->osk) {
+        valid_key = strlen(s->osk) == 64;
+    } else {
+#if defined(__APPLE__) && defined(__MACH__)
+        IOReturn ret;
+        IOByteCount size = 32;
+
+        ret = smc_read_key('OSK0', (uint8_t *) default_osk, &size);
+        if (ret != kIOReturnSuccess) {
+            goto failure;
+        }
+
+        ret = smc_read_key('OSK1', (uint8_t *) default_osk + size, &size);
+        if (ret != kIOReturnSuccess) {
+            goto failure;
+        }
+
+        warn_report("Using AppleSMC with host key");
+        valid_key = true;
+        s->osk = default_osk;
+failure:;
+#endif
+    }
+
+    if (!valid_key) {
         warn_report("Using AppleSMC with invalid key");
         s->osk = default_osk;
     }
-- 
2.31.1



