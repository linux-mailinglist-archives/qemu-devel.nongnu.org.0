Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 999774AAECB
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 11:17:43 +0100 (CET)
Received: from localhost ([::1]:56140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGec2-0002ZN-OG
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 05:17:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0K-00010X-Uz
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30459)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nGe0G-0003jG-Vk
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 04:38:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644140320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=J02YeX85DN5PdPxuS+0emk3q81FQ7EQCmvYPrZoDeSQ=;
 b=SB6R/TSDACMZu7M9l7ZjD2ZfvgJQ8yize5dIKmg8mChzKxa6cOqt/uaIjLZggggL7WDCsx
 cNYjoEGU1aKIZfp1QQXYzRF4B+QfQYfgRWXT1gxPOE+Xb09qnrPWGLU5Ww/YdcbIVb5wRj
 HrQarWILRjEWhCRawqAqkmwz6w8akNQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-mz7UtRCpNl-goXO-RaY5GQ-1; Sun, 06 Feb 2022 04:38:38 -0500
X-MC-Unique: mz7UtRCpNl-goXO-RaY5GQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 130-20020a1c0288000000b0037bc5cbd027so66255wmc.8
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 01:38:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=J02YeX85DN5PdPxuS+0emk3q81FQ7EQCmvYPrZoDeSQ=;
 b=nlhD13qTQKgjc+BK4aS/2rkAmwxGAmVZxI503MbkievzrUg74/w6j55zY8EcyNCl3w
 r632Kh+RASUi0oKHXVwS24L9COyE86dhm6jIGYxM46m7NMMozdD1aAwYeJ6aaEpv8qPf
 P7FE9HhIXCAMUMiz86mghtZLjJc4M3gmUXrWb0vTB9AvizBCBxlMiTxcS9do/T2GGidd
 TJppfc7PUIOQYpC8cUWZD0Vh3WP6TIUiF3M34IWA5wrJYTyQjjqN6jTc//njrs2tXOdY
 LRZnjcg04x2syUcVrYNU6g7hl1X+dlIUGohoCvKIqFaCnjBoS3DarxJnrsK7Ugg+4p/k
 1LvQ==
X-Gm-Message-State: AOAM533LCKRryvaGizkkafJ+oiN5i0CNPAnsPfPp/yAq9P4A1wToMYoV
 qGUpaUdcURUE2MLeIyM6H7vgqFin1/O8MSXq2tP0llujHVfEKN5g2EiA8Palp4eW4SaiVJpGssO
 mYE6JjDzV9PV1ogBoVK2edZBU8/qSY3/6pNrAr+/yY3XPREqL/NAzq7nIJZWs
X-Received: by 2002:a7b:c20d:: with SMTP id x13mr9383755wmi.47.1644140316926; 
 Sun, 06 Feb 2022 01:38:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwjzqj4kLCya7JmegZ8/uKVEljf9k+vWY97aEN8GegRPqcjbA2QdE98yKC2a0EE26mGgfi+gw==
X-Received: by 2002:a7b:c20d:: with SMTP id x13mr9383716wmi.47.1644140316294; 
 Sun, 06 Feb 2022 01:38:36 -0800 (PST)
Received: from redhat.com ([2.52.12.81])
 by smtp.gmail.com with ESMTPSA id n15sm6181650wmr.26.2022.02.06.01.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Feb 2022 01:38:35 -0800 (PST)
Date: Sun, 6 Feb 2022 04:38:33 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 18/24] ACPI ERST: support for ACPI ERST feature
Message-ID: <20220206093702.1282676-19-mst@redhat.com>
References: <20220206093702.1282676-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220206093702.1282676-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Eric DeVolder <eric.devolder@oracle.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eric DeVolder <eric.devolder@oracle.com>

This implements a PCI device for ACPI ERST. This implements the
non-NVRAM "mode" of operation for ERST as it is supported by
Linux and Windows.

Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
Reviewed-by: Ani Sinha <ani@anisinha.ca>
Message-Id: <1643402289-22216-6-git-send-email-eric.devolder@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/erst.c       | 840 +++++++++++++++++++++++++++++++++++++++++++
 hw/acpi/Kconfig      |   6 +
 hw/acpi/meson.build  |   1 +
 hw/acpi/trace-events |  15 +
 4 files changed, 862 insertions(+)
 create mode 100644 hw/acpi/erst.c

diff --git a/hw/acpi/erst.c b/hw/acpi/erst.c
new file mode 100644
index 0000000000..8a691cb5fe
--- /dev/null
+++ b/hw/acpi/erst.c
@@ -0,0 +1,840 @@
+/*
+ * ACPI Error Record Serialization Table, ERST, Implementation
+ *
+ * ACPI ERST introduced in ACPI 4.0, June 16, 2009.
+ * ACPI Platform Error Interfaces : Error Serialization
+ *
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "hw/qdev-core.h"
+#include "exec/memory.h"
+#include "qom/object.h"
+#include "hw/pci/pci.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/acpi/acpi.h"
+#include "hw/acpi/acpi-defs.h"
+#include "hw/acpi/aml-build.h"
+#include "hw/acpi/bios-linker-loader.h"
+#include "exec/address-spaces.h"
+#include "sysemu/hostmem.h"
+#include "hw/acpi/erst.h"
+#include "trace.h"
+
+/* ACPI 4.0: Table 17-16 Serialization Actions */
+#define ACTION_BEGIN_WRITE_OPERATION         0x0
+#define ACTION_BEGIN_READ_OPERATION          0x1
+#define ACTION_BEGIN_CLEAR_OPERATION         0x2
+#define ACTION_END_OPERATION                 0x3
+#define ACTION_SET_RECORD_OFFSET             0x4
+#define ACTION_EXECUTE_OPERATION             0x5
+#define ACTION_CHECK_BUSY_STATUS             0x6
+#define ACTION_GET_COMMAND_STATUS            0x7
+#define ACTION_GET_RECORD_IDENTIFIER         0x8
+#define ACTION_SET_RECORD_IDENTIFIER         0x9
+#define ACTION_GET_RECORD_COUNT              0xA
+#define ACTION_BEGIN_DUMMY_WRITE_OPERATION   0xB
+#define ACTION_RESERVED                      0xC
+#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE   0xD
+#define ACTION_GET_ERROR_LOG_ADDRESS_LENGTH  0xE
+#define ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES 0xF
+#define ACTION_GET_EXECUTE_OPERATION_TIMINGS 0x10 /* ACPI 6.3 */
+
+/* ACPI 4.0: Table 17-17 Command Status Definitions */
+#define STATUS_SUCCESS                0x00
+#define STATUS_NOT_ENOUGH_SPACE       0x01
+#define STATUS_HARDWARE_NOT_AVAILABLE 0x02
+#define STATUS_FAILED                 0x03
+#define STATUS_RECORD_STORE_EMPTY     0x04
+#define STATUS_RECORD_NOT_FOUND       0x05
+
+/* UEFI 2.1: Appendix N Common Platform Error Record */
+#define UEFI_CPER_RECORD_MIN_SIZE 128U
+#define UEFI_CPER_RECORD_LENGTH_OFFSET 20U
+#define UEFI_CPER_RECORD_ID_OFFSET 96U
+#define IS_UEFI_CPER_RECORD(ptr) \
+    (((ptr)[0] == 'C') && \
+     ((ptr)[1] == 'P') && \
+     ((ptr)[2] == 'E') && \
+     ((ptr)[3] == 'R'))
+
+/*
+ * NOTE that when accessing CPER fields within a record, memcpy()
+ * is utilized to avoid a possible misaligned access on the host.
+ */
+
+/*
+ * This implementation is an ACTION (cmd) and VALUE (data)
+ * interface consisting of just two 64-bit registers.
+ */
+#define ERST_REG_SIZE (16UL)
+#define ERST_ACTION_OFFSET (0UL) /* action (cmd) */
+#define ERST_VALUE_OFFSET  (8UL) /* argument/value (data) */
+
+/*
+ * ERST_RECORD_SIZE is the buffer size for exchanging ERST
+ * record contents. Thus, it defines the maximum record size.
+ * As this is mapped through a PCI BAR, it must be a power of
+ * two and larger than UEFI_CPER_RECORD_MIN_SIZE.
+ * The backing storage is divided into fixed size "slots",
+ * each ERST_RECORD_SIZE in length, and each "slot"
+ * storing a single record. No attempt at optimizing storage
+ * through compression, compaction, etc is attempted.
+ * NOTE that slot 0 is reserved for the backing storage header.
+ * Depending upon the size of the backing storage, additional
+ * slots will be part of the slot 0 header in order to account
+ * for a record_id for each available remaining slot.
+ */
+/* 8KiB records, not too small, not too big */
+#define ERST_RECORD_SIZE (8192UL)
+
+#define ACPI_ERST_MEMDEV_PROP "memdev"
+#define ACPI_ERST_RECORD_SIZE_PROP "record_size"
+
+/*
+ * From the ACPI ERST spec sections:
+ * A record id of all 0s is used to indicate 'unspecified' record id.
+ * A record id of all 1s is used to indicate empty or end.
+ */
+#define ERST_UNSPECIFIED_RECORD_ID (0UL)
+#define ERST_EMPTY_END_RECORD_ID (~0UL)
+
+#define ERST_IS_VALID_RECORD_ID(rid) \
+    ((rid != ERST_UNSPECIFIED_RECORD_ID) && \
+     (rid != ERST_EMPTY_END_RECORD_ID))
+
+/*
+ * Implementation-specific definitions and types.
+ * Values are arbitrary and chosen for this implementation.
+ * See erst.rst documentation for details.
+ */
+#define ERST_EXECUTE_OPERATION_MAGIC 0x9CUL
+#define ERST_STORE_MAGIC 0x524F545354535245UL /* ERSTSTOR */
+typedef struct {
+    uint64_t magic;
+    uint32_t record_size;
+    uint32_t storage_offset; /* offset to record storage beyond header */
+    uint16_t version;
+    uint16_t reserved;
+    uint32_t record_count;
+    uint64_t map[]; /* contains record_ids, and position indicates index */
+} __attribute__((packed)) ERSTStorageHeader;
+
+/*
+ * Object cast macro
+ */
+#define ACPIERST(obj) \
+    OBJECT_CHECK(ERSTDeviceState, (obj), TYPE_ACPI_ERST)
+
+/*
+ * Main ERST device state structure
+ */
+typedef struct {
+    PCIDevice parent_obj;
+
+    /* Backend storage */
+    HostMemoryBackend *hostmem;
+    MemoryRegion *hostmem_mr;
+    uint32_t storage_size;
+    uint32_t default_record_size;
+
+    /* Programming registers */
+    MemoryRegion iomem_mr;
+
+    /* Exchange buffer */
+    MemoryRegion exchange_mr;
+
+    /* Interface state */
+    uint8_t operation;
+    uint8_t busy_status;
+    uint8_t command_status;
+    uint32_t record_offset;
+    uint64_t reg_action;
+    uint64_t reg_value;
+    uint64_t record_identifier;
+    ERSTStorageHeader *header;
+    unsigned first_record_index;
+    unsigned last_record_index;
+    unsigned next_record_index;
+
+} ERSTDeviceState;
+
+/*******************************************************************/
+/*******************************************************************/
+static uint8_t *get_nvram_ptr_by_index(ERSTDeviceState *s, unsigned index)
+{
+    uint8_t *rc = NULL;
+    off_t offset = (index * le32_to_cpu(s->header->record_size));
+
+    g_assert(offset < s->storage_size);
+
+    rc = memory_region_get_ram_ptr(s->hostmem_mr);
+    rc += offset;
+
+    return rc;
+}
+
+static void make_erst_storage_header(ERSTDeviceState *s)
+{
+    ERSTStorageHeader *header = s->header;
+    unsigned mapsz, headersz;
+
+    header->magic = cpu_to_le64(ERST_STORE_MAGIC);
+    header->record_size = cpu_to_le32(s->default_record_size);
+    header->version = cpu_to_le16(0x0100);
+    header->reserved = cpu_to_le16(0x0000);
+
+    /* Compute mapsize */
+    mapsz = s->storage_size / s->default_record_size;
+    mapsz *= sizeof(uint64_t);
+    /* Compute header+map size */
+    headersz = sizeof(ERSTStorageHeader) + mapsz;
+    /* Round up to nearest integer multiple of ERST_RECORD_SIZE */
+    headersz = QEMU_ALIGN_UP(headersz, s->default_record_size);
+    header->storage_offset = cpu_to_le32(headersz);
+
+    /*
+     * The HostMemoryBackend initializes contents to zero,
+     * so all record_ids stashed in the map are zero'd.
+     * As well the record_count is zero. Properly initialized.
+     */
+}
+
+static void check_erst_backend_storage(ERSTDeviceState *s, Error **errp)
+{
+    ERSTStorageHeader *header;
+    uint32_t record_size;
+
+    header = memory_region_get_ram_ptr(s->hostmem_mr);
+    s->header = header;
+
+    /* Ensure pointer to header is 64-bit aligned */
+    g_assert(QEMU_PTR_IS_ALIGNED(header, sizeof(uint64_t)));
+
+    /*
+     * Check if header is uninitialized; HostMemoryBackend inits to 0
+     */
+    if (le64_to_cpu(header->magic) == 0UL) {
+        make_erst_storage_header(s);
+    }
+
+    /* Validity check record_size */
+    record_size = le32_to_cpu(header->record_size);
+    if (!(
+        (record_size) && /* non zero */
+        (record_size >= UEFI_CPER_RECORD_MIN_SIZE) &&
+        (((record_size - 1) & record_size) == 0) && /* is power of 2 */
+        (record_size >= 4096) /* PAGE_SIZE */
+        )) {
+        error_setg(errp, "ERST record_size %u is invalid", record_size);
+    }
+
+    /* Validity check header */
+    if (!(
+        (le64_to_cpu(header->magic) == ERST_STORE_MAGIC) &&
+        ((le32_to_cpu(header->storage_offset) % record_size) == 0) &&
+        (le16_to_cpu(header->version) == 0x0100) &&
+        (le16_to_cpu(header->reserved) == 0)
+        )) {
+        error_setg(errp, "ERST backend storage header is invalid");
+    }
+
+    /* Check storage_size against record_size */
+    if (((s->storage_size % record_size) != 0) ||
+         (record_size > s->storage_size)) {
+        error_setg(errp, "ACPI ERST requires storage size be multiple of "
+            "record size (%uKiB)", record_size);
+    }
+
+    /* Compute offset of first and last record storage slot */
+    s->first_record_index = le32_to_cpu(header->storage_offset)
+        / record_size;
+    s->last_record_index = (s->storage_size / record_size);
+}
+
+static void update_map_entry(ERSTDeviceState *s, unsigned index,
+    uint64_t record_id)
+{
+    if (index < s->last_record_index) {
+        s->header->map[index] = cpu_to_le64(record_id);
+    }
+}
+
+static unsigned find_next_empty_record_index(ERSTDeviceState *s)
+{
+    unsigned rc = 0; /* 0 not a valid index */
+    unsigned index = s->first_record_index;
+
+    for (; index < s->last_record_index; ++index) {
+        if (le64_to_cpu(s->header->map[index]) == ERST_UNSPECIFIED_RECORD_ID) {
+            rc = index;
+            break;
+        }
+    }
+
+    return rc;
+}
+
+static unsigned lookup_erst_record(ERSTDeviceState *s,
+    uint64_t record_identifier)
+{
+    unsigned rc = 0; /* 0 not a valid index */
+
+    /* Find the record_identifier in the map */
+    if (record_identifier != ERST_UNSPECIFIED_RECORD_ID) {
+        /*
+         * Count number of valid records encountered, and
+         * short-circuit the loop if identifier not found
+         */
+        uint32_t record_count = le32_to_cpu(s->header->record_count);
+        unsigned count = 0;
+        unsigned index;
+        for (index = s->first_record_index; index < s->last_record_index &&
+                count < record_count; ++index) {
+            if (le64_to_cpu(s->header->map[index]) == record_identifier) {
+                rc = index;
+                break;
+            }
+            if (le64_to_cpu(s->header->map[index]) !=
+                ERST_UNSPECIFIED_RECORD_ID) {
+                ++count;
+            }
+        }
+    }
+
+    return rc;
+}
+
+/*
+ * ACPI 4.0: 17.4.1.1 Serialization Actions, also see
+ * ACPI 4.0: 17.4.2.2 Operations - Reading 6.c and 2.c
+ */
+static unsigned get_next_record_identifier(ERSTDeviceState *s,
+    uint64_t *record_identifier, bool first)
+{
+    unsigned found = 0;
+    unsigned index;
+
+    /* For operations needing to return 'first' record identifier */
+    if (first) {
+        /* Reset initial index to beginning */
+        s->next_record_index = s->first_record_index;
+    }
+    index = s->next_record_index;
+
+    *record_identifier = ERST_EMPTY_END_RECORD_ID;
+
+    if (le32_to_cpu(s->header->record_count)) {
+        for (; index < s->last_record_index; ++index) {
+            if (le64_to_cpu(s->header->map[index]) !=
+                    ERST_UNSPECIFIED_RECORD_ID) {
+                    /* where to start next time */
+                    s->next_record_index = index + 1;
+                    *record_identifier = le64_to_cpu(s->header->map[index]);
+                    found = 1;
+                    break;
+            }
+        }
+    }
+    if (!found) {
+        /* at end (ie scan complete), reset */
+        s->next_record_index = s->first_record_index;
+    }
+
+    return STATUS_SUCCESS;
+}
+
+/* ACPI 4.0: 17.4.2.3 Operations - Clearing */
+static unsigned clear_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = STATUS_RECORD_NOT_FOUND;
+    unsigned index;
+
+    /* Check for valid record identifier */
+    if (!ERST_IS_VALID_RECORD_ID(s->record_identifier)) {
+        return STATUS_FAILED;
+    }
+
+    index = lookup_erst_record(s, s->record_identifier);
+    if (index) {
+        /* No need to wipe record, just invalidate its map entry */
+        uint32_t record_count;
+        update_map_entry(s, index, ERST_UNSPECIFIED_RECORD_ID);
+        record_count = le32_to_cpu(s->header->record_count);
+        record_count -= 1;
+        s->header->record_count = cpu_to_le32(record_count);
+        rc = STATUS_SUCCESS;
+    }
+
+    return rc;
+}
+
+/* ACPI 4.0: 17.4.2.2 Operations - Reading */
+static unsigned read_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = STATUS_RECORD_NOT_FOUND;
+    unsigned exchange_length;
+    unsigned index;
+
+    /* Check if backend storage is empty */
+    if (le32_to_cpu(s->header->record_count) == 0) {
+        return STATUS_RECORD_STORE_EMPTY;
+    }
+
+    exchange_length = memory_region_size(&s->exchange_mr);
+
+    /* Check for record identifier of all 0s */
+    if (s->record_identifier == ERST_UNSPECIFIED_RECORD_ID) {
+        /* Set to 'first' record in storage */
+        get_next_record_identifier(s, &s->record_identifier, true);
+        /* record_identifier is now a valid id, or all 1s */
+    }
+
+    /* Check for record identifier of all 1s */
+    if (s->record_identifier == ERST_EMPTY_END_RECORD_ID) {
+        return STATUS_FAILED;
+    }
+
+    /* Validate record_offset */
+    if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
+        return STATUS_FAILED;
+    }
+
+    index = lookup_erst_record(s, s->record_identifier);
+    if (index) {
+        uint8_t *nvram;
+        uint8_t *exchange;
+        uint32_t record_length;
+
+        /* Obtain pointer to the exchange buffer */
+        exchange = memory_region_get_ram_ptr(&s->exchange_mr);
+        exchange += s->record_offset;
+        /* Obtain pointer to slot in storage */
+        nvram = get_nvram_ptr_by_index(s, index);
+        /* Validate CPER record_length */
+        memcpy((uint8_t *)&record_length,
+            &nvram[UEFI_CPER_RECORD_LENGTH_OFFSET],
+            sizeof(uint32_t));
+        record_length = le32_to_cpu(record_length);
+        if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
+            rc = STATUS_FAILED;
+        }
+        if ((s->record_offset + record_length) > exchange_length) {
+            rc = STATUS_FAILED;
+        }
+        /* If all is ok, copy the record to the exchange buffer */
+        if (rc != STATUS_FAILED) {
+            memcpy(exchange, nvram, record_length);
+            rc = STATUS_SUCCESS;
+        }
+    } else {
+        /*
+         * See "Reading : 'The steps performed by the platform ...' 2.c"
+         * Set to 'first' record in storage
+         */
+        get_next_record_identifier(s, &s->record_identifier, true);
+    }
+
+    return rc;
+}
+
+/* ACPI 4.0: 17.4.2.1 Operations - Writing */
+static unsigned write_erst_record(ERSTDeviceState *s)
+{
+    unsigned rc = STATUS_FAILED;
+    unsigned exchange_length;
+    unsigned index;
+    uint64_t record_identifier;
+    uint32_t record_length;
+    uint8_t *exchange;
+    uint8_t *nvram = NULL;
+    bool record_found = false;
+
+    exchange_length = memory_region_size(&s->exchange_mr);
+
+    /* Validate record_offset */
+    if (s->record_offset > (exchange_length - UEFI_CPER_RECORD_MIN_SIZE)) {
+        return STATUS_FAILED;
+    }
+
+    /* Obtain pointer to record in the exchange buffer */
+    exchange = memory_region_get_ram_ptr(&s->exchange_mr);
+    exchange += s->record_offset;
+
+    /* Validate CPER record_length */
+    memcpy((uint8_t *)&record_length, &exchange[UEFI_CPER_RECORD_LENGTH_OFFSET],
+        sizeof(uint32_t));
+    record_length = le32_to_cpu(record_length);
+    if (record_length < UEFI_CPER_RECORD_MIN_SIZE) {
+        return STATUS_FAILED;
+    }
+    if ((s->record_offset + record_length) > exchange_length) {
+        return STATUS_FAILED;
+    }
+
+    /* Extract record identifier */
+    memcpy((uint8_t *)&record_identifier, &exchange[UEFI_CPER_RECORD_ID_OFFSET],
+        sizeof(uint64_t));
+    record_identifier = le64_to_cpu(record_identifier);
+
+    /* Check for valid record identifier */
+    if (!ERST_IS_VALID_RECORD_ID(record_identifier)) {
+        return STATUS_FAILED;
+    }
+
+    index = lookup_erst_record(s, record_identifier);
+    if (index) {
+        /* Record found, overwrite existing record */
+        nvram = get_nvram_ptr_by_index(s, index);
+        record_found = true;
+    } else {
+        /* Record not found, not an overwrite, allocate for write */
+        index = find_next_empty_record_index(s);
+        if (index) {
+            nvram = get_nvram_ptr_by_index(s, index);
+        } else {
+            /* All slots are occupied */
+            rc = STATUS_NOT_ENOUGH_SPACE;
+        }
+    }
+    if (nvram) {
+        /* Write the record into the slot */
+        memcpy(nvram, exchange, record_length);
+        memset(nvram + record_length, exchange_length - record_length, 0xFF);
+        /* If a new record, increment the record_count */
+        if (!record_found) {
+            uint32_t record_count;
+            record_count = le32_to_cpu(s->header->record_count);
+            record_count += 1; /* writing new record */
+            s->header->record_count = cpu_to_le32(record_count);
+        }
+        update_map_entry(s, index, record_identifier);
+        rc = STATUS_SUCCESS;
+    }
+
+    return rc;
+}
+
+/*******************************************************************/
+
+static uint64_t erst_rd_reg64(hwaddr addr,
+    uint64_t reg, unsigned size)
+{
+    uint64_t rdval;
+    uint64_t mask;
+    unsigned shift;
+
+    if (size == sizeof(uint64_t)) {
+        /* 64b access */
+        mask = 0xFFFFFFFFFFFFFFFFUL;
+        shift = 0;
+    } else {
+        /* 32b access */
+        mask = 0x00000000FFFFFFFFUL;
+        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
+    }
+
+    rdval = reg;
+    rdval >>= shift;
+    rdval &= mask;
+
+    return rdval;
+}
+
+static uint64_t erst_wr_reg64(hwaddr addr,
+    uint64_t reg, uint64_t val, unsigned size)
+{
+    uint64_t wrval;
+    uint64_t mask;
+    unsigned shift;
+
+    if (size == sizeof(uint64_t)) {
+        /* 64b access */
+        mask = 0xFFFFFFFFFFFFFFFFUL;
+        shift = 0;
+    } else {
+        /* 32b access */
+        mask = 0x00000000FFFFFFFFUL;
+        shift = ((addr & 0x4) == 0x4) ? 32 : 0;
+    }
+
+    val &= mask;
+    val <<= shift;
+    mask <<= shift;
+    wrval = reg;
+    wrval &= ~mask;
+    wrval |= val;
+
+    return wrval;
+}
+
+static void erst_reg_write(void *opaque, hwaddr addr,
+    uint64_t val, unsigned size)
+{
+    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
+
+    /*
+     * NOTE: All actions/operations/side effects happen on the WRITE,
+     * by this implementation's design. The READs simply return the
+     * reg_value contents.
+     */
+    trace_acpi_erst_reg_write(addr, val, size);
+
+    switch (addr) {
+    case ERST_VALUE_OFFSET + 0:
+    case ERST_VALUE_OFFSET + 4:
+        s->reg_value = erst_wr_reg64(addr, s->reg_value, val, size);
+        break;
+    case ERST_ACTION_OFFSET + 0:
+        /*
+         * NOTE: all valid values written to this register are of the
+         * ACTION_* variety. Thus there is no need to make this a 64-bit
+         * register, 32-bits is appropriate. As such ERST_ACTION_OFFSET+4
+         * is not needed.
+         */
+        switch (val) {
+        case ACTION_BEGIN_WRITE_OPERATION:
+        case ACTION_BEGIN_READ_OPERATION:
+        case ACTION_BEGIN_CLEAR_OPERATION:
+        case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+        case ACTION_END_OPERATION:
+            s->operation = val;
+            break;
+        case ACTION_SET_RECORD_OFFSET:
+            s->record_offset = s->reg_value;
+            break;
+        case ACTION_EXECUTE_OPERATION:
+            if ((uint8_t)s->reg_value == ERST_EXECUTE_OPERATION_MAGIC) {
+                s->busy_status = 1;
+                switch (s->operation) {
+                case ACTION_BEGIN_WRITE_OPERATION:
+                    s->command_status = write_erst_record(s);
+                    break;
+                case ACTION_BEGIN_READ_OPERATION:
+                    s->command_status = read_erst_record(s);
+                    break;
+                case ACTION_BEGIN_CLEAR_OPERATION:
+                    s->command_status = clear_erst_record(s);
+                    break;
+                case ACTION_BEGIN_DUMMY_WRITE_OPERATION:
+                    s->command_status = STATUS_SUCCESS;
+                    break;
+                case ACTION_END_OPERATION:
+                    s->command_status = STATUS_SUCCESS;
+                    break;
+                default:
+                    s->command_status = STATUS_FAILED;
+                    break;
+                }
+                s->busy_status = 0;
+            }
+            break;
+        case ACTION_CHECK_BUSY_STATUS:
+            s->reg_value = s->busy_status;
+            break;
+        case ACTION_GET_COMMAND_STATUS:
+            s->reg_value = s->command_status;
+            break;
+        case ACTION_GET_RECORD_IDENTIFIER:
+            s->command_status = get_next_record_identifier(s,
+                                    &s->reg_value, false);
+            break;
+        case ACTION_SET_RECORD_IDENTIFIER:
+            s->record_identifier = s->reg_value;
+            break;
+        case ACTION_GET_RECORD_COUNT:
+            s->reg_value = le32_to_cpu(s->header->record_count);
+            break;
+        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE:
+            s->reg_value = (hwaddr)pci_get_bar_addr(PCI_DEVICE(s), 1);
+            break;
+        case ACTION_GET_ERROR_LOG_ADDRESS_LENGTH:
+            s->reg_value = le32_to_cpu(s->header->record_size);
+            break;
+        case ACTION_GET_ERROR_LOG_ADDRESS_RANGE_ATTRIBUTES:
+            s->reg_value = 0x0; /* intentional, not NVRAM mode */
+            break;
+        case ACTION_GET_EXECUTE_OPERATION_TIMINGS:
+            s->reg_value =
+                (100ULL << 32) | /* 100us max time */
+                (10ULL  <<  0) ; /*  10us min time */
+            break;
+        default:
+            /* Unknown action/command, NOP */
+            break;
+        }
+        break;
+    default:
+        /* This should not happen, but if it does, NOP */
+        break;
+    }
+}
+
+static uint64_t erst_reg_read(void *opaque, hwaddr addr,
+                                unsigned size)
+{
+    ERSTDeviceState *s = (ERSTDeviceState *)opaque;
+    uint64_t val = 0;
+
+    switch (addr) {
+    case ERST_ACTION_OFFSET + 0:
+    case ERST_ACTION_OFFSET + 4:
+        val = erst_rd_reg64(addr, s->reg_action, size);
+        break;
+    case ERST_VALUE_OFFSET + 0:
+    case ERST_VALUE_OFFSET + 4:
+        val = erst_rd_reg64(addr, s->reg_value, size);
+        break;
+    default:
+        break;
+    }
+    trace_acpi_erst_reg_read(addr, val, size);
+    return val;
+}
+
+static const MemoryRegionOps erst_reg_ops = {
+    .read = erst_reg_read,
+    .write = erst_reg_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+/*******************************************************************/
+/*******************************************************************/
+static int erst_post_load(void *opaque, int version_id)
+{
+    ERSTDeviceState *s = opaque;
+
+    /* Recompute pointer to header */
+    s->header = (ERSTStorageHeader *)get_nvram_ptr_by_index(s, 0);
+    trace_acpi_erst_post_load(s->header, le32_to_cpu(s->header->record_size));
+
+    return 0;
+}
+
+static const VMStateDescription erst_vmstate  = {
+    .name = "acpi-erst",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .post_load = erst_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(operation, ERSTDeviceState),
+        VMSTATE_UINT8(busy_status, ERSTDeviceState),
+        VMSTATE_UINT8(command_status, ERSTDeviceState),
+        VMSTATE_UINT32(record_offset, ERSTDeviceState),
+        VMSTATE_UINT64(reg_action, ERSTDeviceState),
+        VMSTATE_UINT64(reg_value, ERSTDeviceState),
+        VMSTATE_UINT64(record_identifier, ERSTDeviceState),
+        VMSTATE_UINT32(next_record_index, ERSTDeviceState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void erst_realizefn(PCIDevice *pci_dev, Error **errp)
+{
+    ERSTDeviceState *s = ACPIERST(pci_dev);
+
+    trace_acpi_erst_realizefn_in();
+
+    if (!s->hostmem) {
+        error_setg(errp, "'" ACPI_ERST_MEMDEV_PROP "' property is not set");
+        return;
+    } else if (host_memory_backend_is_mapped(s->hostmem)) {
+        error_setg(errp, "can't use already busy memdev: %s",
+                   object_get_canonical_path_component(OBJECT(s->hostmem)));
+        return;
+    }
+
+    s->hostmem_mr = host_memory_backend_get_memory(s->hostmem);
+
+    /* HostMemoryBackend size will be multiple of PAGE_SIZE */
+    s->storage_size = object_property_get_int(OBJECT(s->hostmem), "size", errp);
+
+    /* Initialize backend storage and record_count */
+    check_erst_backend_storage(s, errp);
+
+    /* BAR 0: Programming registers */
+    memory_region_init_io(&s->iomem_mr, OBJECT(pci_dev), &erst_reg_ops, s,
+                          TYPE_ACPI_ERST, ERST_REG_SIZE);
+    pci_register_bar(pci_dev, 0, PCI_BASE_ADDRESS_SPACE_MEMORY, &s->iomem_mr);
+
+    /* BAR 1: Exchange buffer memory */
+    memory_region_init_ram(&s->exchange_mr, OBJECT(pci_dev),
+                            "erst.exchange",
+                            le32_to_cpu(s->header->record_size), errp);
+    pci_register_bar(pci_dev, 1, PCI_BASE_ADDRESS_SPACE_MEMORY,
+                        &s->exchange_mr);
+
+    /* Include the backend storage in the migration stream */
+    vmstate_register_ram_global(s->hostmem_mr);
+
+    trace_acpi_erst_realizefn_out(s->storage_size);
+}
+
+static void erst_reset(DeviceState *dev)
+{
+    ERSTDeviceState *s = ACPIERST(dev);
+
+    trace_acpi_erst_reset_in(le32_to_cpu(s->header->record_count));
+    s->operation = 0;
+    s->busy_status = 0;
+    s->command_status = STATUS_SUCCESS;
+    s->record_identifier = ERST_UNSPECIFIED_RECORD_ID;
+    s->record_offset = 0;
+    s->next_record_index = s->first_record_index;
+    /* NOTE: first/last_record_index are computed only once */
+    trace_acpi_erst_reset_out(le32_to_cpu(s->header->record_count));
+}
+
+static Property erst_properties[] = {
+    DEFINE_PROP_LINK(ACPI_ERST_MEMDEV_PROP, ERSTDeviceState, hostmem,
+                     TYPE_MEMORY_BACKEND, HostMemoryBackend *),
+    DEFINE_PROP_UINT32(ACPI_ERST_RECORD_SIZE_PROP, ERSTDeviceState,
+                     default_record_size, ERST_RECORD_SIZE),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void erst_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    PCIDeviceClass *k = PCI_DEVICE_CLASS(klass);
+
+    trace_acpi_erst_class_init_in();
+    k->realize = erst_realizefn;
+    k->vendor_id = PCI_VENDOR_ID_REDHAT;
+    k->device_id = PCI_DEVICE_ID_REDHAT_ACPI_ERST;
+    k->revision = 0x00;
+    k->class_id = PCI_CLASS_OTHERS;
+    dc->reset = erst_reset;
+    dc->vmsd = &erst_vmstate;
+    dc->user_creatable = true;
+    dc->hotpluggable = false;
+    device_class_set_props(dc, erst_properties);
+    dc->desc = "ACPI Error Record Serialization Table (ERST) device";
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    trace_acpi_erst_class_init_out();
+}
+
+static const TypeInfo erst_type_info = {
+    .name          = TYPE_ACPI_ERST,
+    .parent        = TYPE_PCI_DEVICE,
+    .class_init    = erst_class_init,
+    .instance_size = sizeof(ERSTDeviceState),
+    .interfaces = (InterfaceInfo[]) {
+        { INTERFACE_CONVENTIONAL_PCI_DEVICE },
+        { }
+    }
+};
+
+static void erst_register_types(void)
+{
+    type_register_static(&erst_type_info);
+}
+
+type_init(erst_register_types)
diff --git a/hw/acpi/Kconfig b/hw/acpi/Kconfig
index 622b0b50b7..19caebde6c 100644
--- a/hw/acpi/Kconfig
+++ b/hw/acpi/Kconfig
@@ -10,6 +10,7 @@ config ACPI_X86
     select ACPI_HMAT
     select ACPI_PIIX4
     select ACPI_PCIHP
+    select ACPI_ERST
 
 config ACPI_X86_ICH
     bool
@@ -60,3 +61,8 @@ config ACPI_HW_REDUCED
     select ACPI
     select ACPI_MEMORY_HOTPLUG
     select ACPI_NVDIMM
+
+config ACPI_ERST
+    bool
+    default y
+    depends on ACPI && PCI
diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
index adf6347bc4..f5b22983bb 100644
--- a/hw/acpi/meson.build
+++ b/hw/acpi/meson.build
@@ -22,6 +22,7 @@ acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_true: files('pcihp.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_PCIHP', if_false: files('acpi-pci-hotplug-stub.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_VIOT', if_true: files('viot.c'))
 acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
+acpi_ss.add(when: 'CONFIG_ACPI_ERST', if_true: files('erst.c'))
 acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
 acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
 acpi_ss.add(when: 'CONFIG_TPM', if_true: files('tpm.c'))
diff --git a/hw/acpi/trace-events b/hw/acpi/trace-events
index 974d770e8b..2250126a22 100644
--- a/hw/acpi/trace-events
+++ b/hw/acpi/trace-events
@@ -55,3 +55,18 @@ piix4_gpe_writeb(uint64_t addr, unsigned width, uint64_t val) "addr: 0x%" PRIx64
 # tco.c
 tco_timer_reload(int ticks, int msec) "ticks=%d (%d ms)"
 tco_timer_expired(int timeouts_no, bool strap, bool no_reboot) "timeouts_no=%d no_reboot=%d/%d"
+
+# erst.c
+acpi_erst_reg_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%04" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
+acpi_erst_reg_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%04" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
+acpi_erst_mem_write(uint64_t addr, uint64_t val, unsigned size) "addr: 0x%06" PRIx64 " <== 0x%016" PRIx64 " (size: %u)"
+acpi_erst_mem_read(uint64_t addr, uint64_t val, unsigned size) " addr: 0x%06" PRIx64 " ==> 0x%016" PRIx64 " (size: %u)"
+acpi_erst_pci_bar_0(uint64_t addr) "BAR0: 0x%016" PRIx64
+acpi_erst_pci_bar_1(uint64_t addr) "BAR1: 0x%016" PRIx64
+acpi_erst_realizefn_in(void)
+acpi_erst_realizefn_out(unsigned size) "total nvram size %u bytes"
+acpi_erst_reset_in(unsigned record_count) "record_count %u"
+acpi_erst_reset_out(unsigned record_count) "record_count %u"
+acpi_erst_post_load(void *header, unsigned slot_size) "header: 0x%p slot_size %u"
+acpi_erst_class_init_in(void)
+acpi_erst_class_init_out(void)
-- 
MST


