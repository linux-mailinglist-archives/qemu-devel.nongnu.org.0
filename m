Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CB930CA7B
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:51:48 +0100 (CET)
Received: from localhost ([::1]:60728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l70mB-0004zk-Gz
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:51:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l70kC-0003ti-MY
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 13:49:45 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:48500
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l70k7-00040x-Im
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 13:49:41 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id A64951234A5; Tue,  2 Feb 2021 10:49:37 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id 56302122C69;
 Tue,  2 Feb 2021 10:49:25 -0800 (PST)
Date: Tue, 2 Feb 2021 10:49:23 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH 3/4] hw/cxl/cxl-cdat: Initial CDAT implementation for
 use by CXL devices
Message-ID: <20210202184923.oggv6hasjyjkmb5p@mail.bwidawsk.net>
References: <20210201151629.29656-1-Jonathan.Cameron@huawei.com>
 <20210201151629.29656-4-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201151629.29656-4-Jonathan.Cameron@huawei.com>
Received-SPF: none client-ip=107.170.211.233; envelope-from=ben@bwidawsk.net;
 helo=mail.bwidawsk.net
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, KHOP_HELO_FCRDNS=0.399,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, linuxarm@openeuler.org,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Vishal Verma <vishal.l.verma@intel.com>, f.fangjian@huawei.com,
 Chris Browy <cbrowy@avery-design.com>, qemu-devel@nongnu.org, f4bug@amsat.org,
 jcm@redhat.com, Prashant V Agarwal <agpr123@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Dan Williams <dan.j.williams@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21-02-01 23:16:28, Jonathan Cameron wrote:
> CDAT is an ACPI like format defined by the CXL consortium. It is
> available from
> 
> https://www.uefi.org/node/4093
> 
> Here support for managing all the entires is introduced, along with
> an implementation of a callback for a DOE mailbox which may be
> used to read these values from CXL hardware by either firmware or
> an OS.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>

I seem to be missing one critical thing, where is the CDAT header (Table 1 from
the spec) actually populated, length, revision, checksum, etc?

General, probably underthought-out, comment:

With the CXLType3Class I added since you probably wrote these patches, I wonder
if that'd be a better fit for populating some of these tables, having them
populate dynamically when the DOE/CDAT request actually comes in.

I have no strong opinion. The one advantage I see to using the class is
operations like managing handles, length calculations, etc can be managed by the
helper library rather than the device implementation having to do it. OTTOH if
you have devices that want to do weird things, they might lose some flexibility.

I think with just a few methods added to the CXLType3Class you could pretty
trivially build up a nice sane default CDAT for any CXL device.

> ---
>  hw/cxl/cxl-cdat.c         | 252 ++++++++++++++++++++++++++++++++++++++
>  hw/cxl/meson.build        |   1 +
>  include/hw/cxl/cxl_cdat.h | 101 +++++++++++++++
>  3 files changed, 354 insertions(+)
> 
> diff --git a/hw/cxl/cxl-cdat.c b/hw/cxl/cxl-cdat.c
> new file mode 100644
> index 0000000000..6ed4c15cc0
> --- /dev/null
> +++ b/hw/cxl/cxl-cdat.c
> @@ -0,0 +1,252 @@
> +/*
> + * Support for CDAT entires as defined in
> + * Coherent Device Attribute Table (CDAT) Specification rev 1.02
> + * Available from uefi.org.
> + *
> + * Copyright (c) 2021 Jonathan Cameron <Jonathan.Cameron@huawei.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qemu/error-report.h"
> +#include "hw/mem/memory-device.h"
> +#include "hw/mem/pc-dimm.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/doe.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/range.h"
> +#include "qemu/rcu.h"
> +#include "sysemu/hostmem.h"
> +#include "sysemu/numa.h"
> +#include "hw/cxl/cxl.h"
> +
> +void cdat_add_dsmas(CXLCDAT *cdat, uint8_t dsmad_handle, uint8_t flags,
> +                    uint64_t dpa_base, uint64_t dpa_length)
> +{
> +    struct cxl_cdat_dsmas *dsmas = g_malloc0(sizeof(*dsmas));
> +    dsmas->dsmad_handle = dsmad_handle;
> +    dsmas->flags = flags;
> +    dsmas->dpa_base = dpa_base;
> +    dsmas->dpa_length = dpa_length;
> +    cdat->dsmas_list = g_list_append(cdat->dsmas_list, dsmas);
> +}
> +
> +void cdat_add_dslbis(CXLCDAT *cdat, uint8_t handle, uint8_t flags,
> +                     uint8_t data_type, uint64_t base_unit,
> +                     uint16_t entry0, uint16_t entry1, uint16_t entry2)
> +{
> +    struct cxl_cdat_dslbis *dslbis = g_malloc0(sizeof(*dslbis));
> +    dslbis->handle = handle;
> +    dslbis->flags = flags;
> +    dslbis->data_type = data_type;
> +    dslbis->entry_base_unit = base_unit;
> +    dslbis->entries[0] = entry0;
> +    dslbis->entries[1] = entry1;
> +    dslbis->entries[2] = entry2;
> +    cdat->dslbis_list = g_list_append(cdat->dslbis_list, dslbis);
> +}
> +
> +void cdat_add_dsmscis(CXLCDAT *cdat, uint8_t dsmas_handle,
> +                      uint64_t memory_sc_size, uint64_t cache_attrs)
> +{
> +    struct cxl_cdat_dsmscis *dsmscis = g_malloc(sizeof(*dsmscis));
> +    dsmscis->dsmas_handle = dsmas_handle;
> +    dsmscis->memory_side_cache_size = memory_sc_size;
> +    dsmscis->cache_attributes = cache_attrs;
> +    cdat->dsmscis_list = g_list_append(cdat->dsmscis_list, dsmscis);
> +}
> +
> +void cdat_add_dsis(CXLCDAT *cdat, uint8_t flags, uint8_t handle)
> +{
> +    struct cxl_cdat_dsis *dsis = g_malloc(sizeof(*dsis));
> +    dsis->flags = flags;
> +    dsis->handle = handle;
> +    cdat->dsis_list = g_list_append(cdat->dsis_list, dsis);
> +}
> +
> +void cdat_add_dsemts(CXLCDAT *cdat, uint8_t dsmas_handle,
> +                     uint8_t efi_mem_type_attr, uint64_t dpa_offset,
> +                     uint64_t dpa_length)
> +{
> +    struct cxl_cdat_dsemts *dsemts = g_malloc(sizeof(*dsemts));
> +    dsemts->dsmas_handle = dsmas_handle;
> +    dsemts->efi_mem_type_attr = efi_mem_type_attr;
> +    dsemts->dpa_offset = dpa_offset;
> +    dsemts->dpa_length = dpa_length;
> +    cdat->dsemts_list = g_list_append(cdat->dsemts_list, dsemts);
> +}
> +
> +struct cxl_cdat_sslbis *cdat_add_sslbis(CXLCDAT *cdat, uint8_t num_entries,
> +                                        uint8_t data_type, uint64_t base_unit)
> +{
> +    struct cxl_cdat_sslbis *sslbis =
> +        g_malloc(sizeof(*sslbis) + num_entries * sizeof(sslbis->entries[0]));
> +    sslbis->num_entries = num_entries;
> +    sslbis->data_type = data_type;
> +    sslbis->base_unit = base_unit;
> +    cdat->sslbis_list = g_list_append(cdat->sslbis_list, sslbis);
> +    return sslbis;
> +}
> +
> +int cdata_sslbis_set_entry(struct cxl_cdat_sslbis *sslbis, uint8_t index,
> +                           uint16_t portx, uint16_t porty, uint16_t val)
> +{
> +    struct cxl_cdat_sslbis_entry *entry;
> +    if (index >= sslbis->num_entries) {
> +        return -1;
> +    }
> +    entry = &sslbis->entries[index];
> +    entry->port_x_id = portx;
> +    entry->port_y_id = porty;
> +    entry->val = val;
> +    return 0;
> +}
> +
> +int cxl_table_access(PCIEDOE *doe, uint16_t vendor_id, uint8_t object_type,
> +                     void *priv)
> +{
> +    uint8_t table_type;
> +    int total_entries;
> +    uint16_t entry_handle;
> +    CXLCDAT *cdat = priv;
> +    uint16_t next_entry;
> +
> +    if (doe->req_length != 3) {
> +        /* optional error for unexpected command length */
> +        return -1;
> +    }
> +
> +    if ((doe->store[2] & CXL_DOE_TABLE_ACCESS_DW2_RCODE) != 0) {
> +        /*
> +         * Only table access code currently supported.
> +         * Error indication is lack of Data Object Ready
> +         */
> +        return -1;
> +    }
> +
> +    table_type = (doe->store[2] & CXL_DOE_TABLE_ACCESS_DW2_TYPE) >>
> +        ctz32(CXL_DOE_TABLE_ACCESS_DW2_TYPE);
> +    if (table_type != 0) {
> +        /* Unsuported table ID so just don't set Data Object Ready */
> +        return -1;
> +    }
> +    entry_handle = (doe->store[2] & CXL_DOE_TABLE_ACCESS_DW2_ENTRYHANDLE) >>
> +        ctz32(CXL_DOE_TABLE_ACCESS_DW2_ENTRYHANDLE);
> +
> +    /* Assume entry handle == CDAT structure index */
> +    total_entries = g_list_length(cdat->dsmas_list) +
> +        g_list_length(cdat->dslbis_list) +
> +        g_list_length(cdat->dsmscis_list) +
> +        g_list_length(cdat->dsis_list) +
> +        g_list_length(cdat->dsemts_list) +
> +        g_list_length(cdat->sslbis_list);
> +    if (entry_handle + 1 == total_entries) {
> +        next_entry = 0xFFFF;
> +    } else {
> +        next_entry = entry_handle + 1;
> +    }
> +
> +    if (entry_handle < g_list_length(cdat->dsmas_list)) {
> +        const int dsmas_len = 24;
> +        struct cxl_cdat_dsmas *dsmas =
> +            g_list_nth_data(cdat->dsmas_list, entry_handle);
> +
> +        doe->store[1] = 3 + dsmas_len / sizeof(uint32_t);
> +        doe->store[2] = next_entry << 16;
> +        doe->store[3] = (dsmas_len << 16) | CXL_CDAT_DSMAS_TYPE;
> +
> +        /* cxl version of proximity domain */
> +        doe->store[4] = dsmas->dsmad_handle;
> +        /* flags in 2nd byte of [4] (bit 2 is non volatile) */
> +        doe->store[4] |= (dsmas->flags << 8);
> +        doe->store[5] = dsmas->dpa_base & 0xFFFFFFFF;
> +        doe->store[6] = (dsmas->dpa_base >> 32) & 0xFFFFFFFF;
> +        doe->store[7] = dsmas->dpa_length & 0xFFFFFFFF;
> +        doe->store[8] = (dsmas->dpa_length >> 32) & 0xFFFFFFFF;
> +        return 0;
> +    }
> +    entry_handle -= g_list_length(cdat->dsmas_list);
> +    if (entry_handle < g_list_length(cdat->dslbis_list)) {
> +        const int dslbis_len = 24;
> +        struct cxl_cdat_dslbis *dslbis =
> +            g_list_nth_data(cdat->dslbis_list, entry_handle);
> +
> +        doe->store[1] = 3 + dslbis_len / sizeof(uint32_t);
> +        doe->store[2] = next_entry << 16;
> +        doe->store[3] = (dslbis_len << 16) | CXL_CDAT_DSLBIS_TYPE;
> +
> +        doe->store[4] = (dslbis->data_type << 24) | (dslbis->flags << 8) |
> +            dslbis->handle;
> +        doe->store[5] = dslbis->entry_base_unit & 0xFFFFFFFF;
> +        doe->store[6] = (dslbis->entry_base_unit >> 32) & 0xFFFFFFFF;
> +        doe->store[7] = (dslbis->entries[1] << 16) | dslbis->entries[0];
> +        doe->store[8] = dslbis->entries[2];
> +        return 0;
> +    }
> +    entry_handle -= g_list_length(cdat->dslbis_list);
> +    if (entry_handle < g_list_length(cdat->dsmscis_list)) {
> +        const int dsmscis_len = 20;
> +        struct cxl_cdat_dsmscis *dsmscis =
> +            g_list_nth_data(cdat->dsmscis_list, entry_handle);
> +
> +        doe->store[1] = 3 + dsmscis_len / sizeof(uint32_t);
> +        doe->store[2] = next_entry << 16;
> +        doe->store[3] = (dsmscis_len << 16) | CXL_CDAT_DSMSCIS_TYPE;
> +        doe->store[4] = dsmscis->dsmas_handle;
> +        doe->store[5] = dsmscis->memory_side_cache_size & 0xffffffff;
> +        doe->store[6] = (dsmscis->memory_side_cache_size >> 32) & 0xffffffff;
> +        doe->store[7] = dsmscis->cache_attributes;
> +    }
> +    entry_handle -= g_list_length(cdat->dsmscis_list);
> +    if (entry_handle < g_list_length(cdat->dsis_list)) {
> +        const int dsis_len = 8;
> +        struct cxl_cdat_dsis *dsis =
> +            g_list_nth_data(cdat->dsis_list, entry_handle);
> +
> +        doe->store[1] = 3 + dsis_len / sizeof(uint32_t);
> +        doe->store[2] = next_entry << 16;
> +        doe->store[3] = (dsis_len << 16) | CXL_CDAT_DSMSCIS_TYPE;
> +        doe->store[4] = (dsis->handle << 8) | dsis->flags;
> +    }
> +    entry_handle -= g_list_length(cdat->dsis_list);
> +    if (entry_handle < g_list_length(cdat->dsemts_list)) {
> +        const int dsemts_len = 24;
> +        struct cxl_cdat_dsemts *dsemts =
> +            g_list_nth_data(cdat->dsemts_list, entry_handle);
> +
> +        doe->store[1] = 3 + dsemts_len / sizeof(uint32_t);
> +        doe->store[2] = next_entry << 16;
> +        doe->store[3] = (dsemts_len << 16) | CXL_CDAT_DSEMTS_TYPE;
> +        doe->store[4] = (dsemts->efi_mem_type_attr << 8) | dsemts->dsmas_handle;
> +        doe->store[5] = dsemts->dpa_offset & 0xffffffff;
> +        doe->store[6] = (dsemts->dpa_offset >> 32) & 0xffffffff;
> +        doe->store[7] = dsemts->dpa_length & 0xffffffff;
> +        doe->store[8] = (dsemts->dpa_length >> 32) & 0xffffffff;
> +    }
> +    entry_handle -= g_list_length(cdat->dsemts_list);
> +    if (entry_handle < g_list_length(cdat->sslbis_list)) {
> +        struct cxl_cdat_sslbis *sslbis =
> +            g_list_nth_data(cdat->sslbis_list, entry_handle);
> +        int sslbis_len = 16 + 8 * sslbis->num_entries;
> +        int i;
> +
> +        doe->store[1] = 3 + sslbis_len / sizeof(uint32_t);
> +        doe->store[2] = next_entry << 16;
> +        doe->store[3] = (sslbis_len << 16) | CXL_CDAT_SSLBIS_TYPE;
> +        doe->store[4] = sslbis->data_type;
> +        doe->store[5] = sslbis->base_unit & 0xffffffff;
> +        doe->store[6] = (sslbis->base_unit >> 32) & 0xffffffff;
> +        for (i = 0; i < sslbis->num_entries; i++) {
> +            doe->store[7 + i * 2] = (sslbis->entries[i].port_y_id << 8) |
> +                sslbis->entries[i].port_x_id;
> +            doe->store[7 + i * 2 + 1] = sslbis->entries[i].val;
> +        }
> +    }
> +
> +    return -1;
> +}
> diff --git a/hw/cxl/meson.build b/hw/cxl/meson.build
> index 0eca715d10..9e2e5f4094 100644
> --- a/hw/cxl/meson.build
> +++ b/hw/cxl/meson.build
> @@ -2,4 +2,5 @@ softmmu_ss.add(when: 'CONFIG_CXL', if_true: files(
>    'cxl-component-utils.c',
>    'cxl-device-utils.c',
>    'cxl-mailbox-utils.c',
> +  'cxl-cdat.c',
>  ))
> diff --git a/include/hw/cxl/cxl_cdat.h b/include/hw/cxl/cxl_cdat.h
> new file mode 100644
> index 0000000000..d0226c463c
> --- /dev/null
> +++ b/include/hw/cxl/cxl_cdat.h
> @@ -0,0 +1,101 @@
> +/*
> + * Support for CDAT entires as defined in
> + * Coherent Device Attribute Table (CDAT) Specification rev 1.02
> + * Available from uefi.org.
> + *
> + * Copyright (c) 2021 Jonathan Cameron <Jonathan.Cameron@huawei.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +#ifndef QEMU_CXL_CDAT_H
> +#define QEMU_CXL_CDAT_H
> +#include "hw/pci/doe.h"
> +/* DW2 is common to the request and response */
> +#define CXL_DOE_TABLE_ACCESS_DW2_RCODE          0x000000ff
> +#define CXL_DOE_TABLE_ACCESS_DW2_TYPE           0x0000ff00
> +#define CXL_DOE_TABLE_ACCESS_DW2_ENTRYHANDLE    0xffff0000
> +
> +#define CXL_CDAT_DSMAS_TYPE     0
> +#define CXL_CDAT_DSLBIS_TYPE    1
> +#define CXL_CDAT_DSMSCIS_TYPE   2
> +#define CXL_CDAT_DSIS_TYPE      3
> +#define CXL_CDAT_DSEMTS_TYPE    4
> +#define CXL_CDAT_SSLBIS_TYPE    5
> +
> +struct cxl_cdat_dsmas {
> +    uint8_t dsmad_handle;
> +    uint8_t flags;
> +#define CDAT_DSMAS_FLAG_NV (1 << 2)
> +    uint64_t dpa_base;
> +    uint64_t dpa_length;
> +};
> +
> +struct cxl_cdat_dslbis {
> +    uint8_t handle;
> +    uint8_t flags;
> +    uint8_t data_type;
> +    uint64_t entry_base_unit;
> +    uint16_t entries[3]; /* 6 bytes */
> +};
> +
> +struct cxl_cdat_dsmscis {
> +    uint8_t dsmas_handle;
> +    uint64_t memory_side_cache_size;
> +    uint32_t cache_attributes;
> +};
> +
> +struct cxl_cdat_dsis {
> +    uint8_t flags;
> +#define CDAT_DSIS_MEMORY_ATTACHED 0x01
> +    uint8_t handle;
> +};
> +
> +struct cxl_cdat_dsemts {
> +    uint8_t dsmas_handle;
> +    uint8_t efi_mem_type_attr;
> +    uint64_t dpa_offset;
> +    uint64_t dpa_length;
> +};
> +
> +struct cxl_cdat_sslbis_entry {
> +    uint16_t port_x_id;
> +    uint16_t port_y_id;
> +    uint16_t val;
> +};
> +
> +struct cxl_cdat_sslbis {
> +    uint8_t num_entries; /* needed to compute length */
> +    uint8_t data_type;
> +    uint64_t base_unit;
> +    struct cxl_cdat_sslbis_entry entries[];
> +};
> +
> +typedef struct cxl_cdat {
> +    GList *dsmas_list;
> +    GList *dslbis_list;
> +    GList *dsmscis_list;
> +    GList *dsis_list;
> +    GList *dsemts_list;
> +    GList *sslbis_list;
> +} CXLCDAT;
> +
> +void cdat_add_dsmas(CXLCDAT *cdat, uint8_t dsmad_handle, uint8_t flags,
> +                    uint64_t dpa_base, uint64_t dpa_length);
> +void cdat_add_dslbis(CXLCDAT *cdat, uint8_t handle, uint8_t flags,
> +                     uint8_t data_type, uint64_t base_unit,
> +                     uint16_t entry0, uint16_t entry1, uint16_t entry2);
> +void cdat_add_dsmscis(CXLCDAT *cdat, uint8_t dsmas_handle,
> +                      uint64_t memory_sc_size, uint64_t cache_attrs);
> +void cdat_add_dsis(CXLCDAT *cdat, uint8_t flags, uint8_t handle);
> +void cdat_add_dsemts(CXLCDAT *cdat, uint8_t dsmas_handle,
> +                     uint8_t efi_mem_type_attr, uint64_t dpa_offset,
> +                     uint64_t dpa_length);
> +struct cxl_cdat_sslbis *cdat_add_sslbis(CXLCDAT *cdat, uint8_t num_entries,
> +                                        uint8_t data_type, uint64_t base_unit);
> +int cdata_sslbis_set_entry(struct cxl_cdat_sslbis *sslbis, uint8_t index,
> +                           uint16_t portx, uint16_t pory, uint16_t val);
> +
> +int cxl_table_access(PCIEDOE *doe, uint16_t vendor_id, uint8_t object_type,
> +                     void *priv);
> +#endif
> -- 
> 2.19.1
> 
> 

