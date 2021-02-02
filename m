Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C780530C8E6
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 19:06:09 +0100 (CET)
Received: from localhost ([::1]:58690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7040-0006LH-NF
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 13:06:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45166)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l6zsk-0004v8-D3
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:54:30 -0500
Received: from zangief.bwidawsk.net ([107.170.211.233]:47784
 helo=mail.bwidawsk.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ben@bwidawsk.net>) id 1l6zsf-00022B-Bt
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 12:54:28 -0500
Received: by mail.bwidawsk.net (Postfix, from userid 5001)
 id 1172D1234A5; Tue,  2 Feb 2021 09:54:24 -0800 (PST)
Received: from mail.bwidawsk.net (c-73-37-61-164.hsd1.or.comcast.net
 [73.37.61.164])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (Client did not present a certificate)
 by mail.bwidawsk.net (Postfix) with ESMTPSA id B5D83122C69;
 Tue,  2 Feb 2021 09:54:12 -0800 (PST)
Date: Tue, 2 Feb 2021 09:54:11 -0800
From: Ben Widawsky <ben@bwidawsk.net>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Subject: Re: [RFC PATCH 2/4] hw/pci/pcie_doe: Introduce utility functions for
 PCIe DOE
Message-ID: <20210202175411.ru35ygg2avlygv7o@mail.bwidawsk.net>
References: <20210201151629.29656-1-Jonathan.Cameron@huawei.com>
 <20210201151629.29656-3-Jonathan.Cameron@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210201151629.29656-3-Jonathan.Cameron@huawei.com>
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

This was a bit more complicated than I was anticipating :-)

On 21-02-01 23:16:27, Jonathan Cameron wrote:
> This implements the ECN to the PCI 5.0 specification available at
> https://members.pcisig.com/wg/PCI-SIG/document/14143
> 
> Does not currently support interrupts.
> 
> Note that currently no attempt is made to clean up allocated memory.
> 
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
>  hw/pci/meson.build       |   2 +-
>  hw/pci/pcie_doe.c        | 257 +++++++++++++++++++++++++++++++++++++++
>  include/hw/pci/doe.h     |  40 ++++++
>  include/hw/pci/pci_ids.h |   2 +
>  4 files changed, 300 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/pci/meson.build b/hw/pci/meson.build
> index 5c4bbac817..7336620ee3 100644
> --- a/hw/pci/meson.build
> +++ b/hw/pci/meson.build
> @@ -11,7 +11,7 @@ pci_ss.add(files(
>  # The functions in these modules can be used by devices too.  Since we
>  # allow plugging PCIe devices into PCI buses, include them even if
>  # CONFIG_PCI_EXPRESS=n.
> -pci_ss.add(files('pcie.c', 'pcie_aer.c'))
> +pci_ss.add(files('pcie.c', 'pcie_aer.c',  'pcie_doe.c'))
>  softmmu_ss.add(when: 'CONFIG_PCI_EXPRESS', if_true: files('pcie_port.c', 'pcie_host.c'))
>  softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
>  
> diff --git a/hw/pci/pcie_doe.c b/hw/pci/pcie_doe.c
> new file mode 100644
> index 0000000000..8739c41280
> --- /dev/null
> +++ b/hw/pci/pcie_doe.c
> @@ -0,0 +1,257 @@
> +/*
> + * pcie_doe.c
> + * utility functions for pci express data object exchange introduced
> + * in PCI 5.0 Data Object Exchange (DOE) ECN
> + *
> + * Copyright (c) 2021 Jonathan Cameron <Jonathan.Cameron@huawei.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "qemu/error-report.h"
> +#include "hw/pci/pci.h"
> +#include "hw/pci/doe.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qemu/range.h"
> +#include "qemu/rcu.h"
> +#include "sysemu/hostmem.h"
> +

I know it's RFC and quickly thrown together, but:

/* VID and Type */
#define DOE_DATA_OBJECT_HDR1 0
/* Length */
#define DOE_DATA_OBJECT_HDR2 1
/* Index */
#define DOE_DATA_OBJECT_REQUEST_DATA 2
#define DOE_DATA_OBJECT_RESPONSE_DATA 3

Then use that throughout below, please?

> +struct doe_handler {
> +    uint16_t vendor_id;
> +    uint8_t object_type;
> +    doe_msg_handler_t handler;
> +    void *priv;
> +};
> +
> +static void doe_set_ctl(PCIEDOE *doe, uint32_t val)
> +{
> +    /* Abort */
> +    if (val & PCI_DOE_CTRL_DOE_ABORT) {
> +        doe->req_index = 0;
> +        doe->rsp_index = 0;
> +        doe->req_length = 0;
> +        doe->error = false;
> +        doe->data_object_ready = false;
> +    }
> +
> +    if (val & PCI_DOE_CTRL_DOE_GO) {
> +        GList *l;
> +        uint16_t vendor_id = doe->store[0] & PCI_DATA_OBJ_DW0_VID;
> +        uint8_t object_type = (doe->store[0] & PCI_DATA_OBJ_DW0_TYPE) >>
> +            ctz32(PCI_DATA_OBJ_DW0_TYPE);

I think it'd be much nicer to read this as REG32/FIELD_EX32.

> +        if ((doe->req_index != 3) || (doe->req_length != 3)) {
> +            /*
> +             * Not entirely clear what should happen if req_length is correct
> +             * buf insufficient data has been received.

s/buf/but

Also, maybe for more resiliency and readability, with a comment about why '3':
if ((doe->req_index < 3) ...

I think it'd be much more readable if you pulled the index directly out of the
register store here instead of when you set.

len = doe->store[DOE_DATA_OBJECT_HDR2] & PCI_DATA_OBJ_DW1_LEN;
if (!len)
	len = 1<<18;

> +             */
> +            doe->error = true;
> +            return;

I don't think this should be an error:
"If the Length is shorter than expected for a specific data object, then the data
object must be silently discarded.

If the Length is greater than expected for a specific data object, then the
portion of the data object up to the expected length must be processednormally
and the remainder of the data object must be silently discarded."

> +        }
> +        /* Discovery protocol - DOE ECN */
> +        if (vendor_id == PCI_VENDOR_ID_PCI_SIG &&
> +            object_type == PCI_DOE_DIS_OBJ_TYPE) {
> +            uint8_t index = doe->store[2] & PCI_DOE_DIS_REQ_D0_DW0_INDEX;
> +            doe->store[1] = 3;
> +            if (index == 0) {
> +                /* First entry is this one, the discovery protocol itself */
> +                uint8_t next;
> +
> +                if (doe->cb_list) {
> +                    next = index + 1;
> +                } else {
> +                    next = 0;
> +                }

I think a comment here that you're terminating the list if no callbacks are
registered would be good.

> +                doe->store[2] =
> +                    (next << ctz32(PCI_DOE_DIS_RSP_D0_DW0_NEXT_INDEX)) |
> +                    (0 << ctz32(PCI_DOE_DIS_RSP_D0_DW0_PROT)) |
> +                    0x0001;

Same comment about FIELD_DP|EX32. I'd try it and see how it looks.

Would probably be nice to #define some vendor ID, or use fields so it's obvious
why you have a 0x1.

> +            } else {
> +                /* Other entries based on register callbacks */
> +                uint8_t next;
> +                struct doe_handler *h;
> +
> +                h = g_list_nth_data(doe->cb_list, index - 1);

It wasn't immediately obvious to me why index - 1. Maybe it'd be a little nicer
if you had a helper:

static inline struct doe_handler *doe_get_handler(PCIEDOE *doe, int doe_index)
{
	struct doe_handler *ret = NULL;

	// assert(doe->cb_list);
	if (doe->cb_list)
		ret = g_list_nth_data(doe->cb_list, doe_index - 1);

	return ret;
}

> +                /*
> +                 * Off end of list, Table 7-x4 in DOE ECN -
> +                 * Vendor ID 0xFFFF if no more indices
> +                 */
> +                if (h == NULL) {
> +                    doe->store[2] = 0xFFFF;
> +                } else {
> +                    if (g_list_nth(doe->cb_list, index)) {
> +                        next = index + 1;
> +                    } else {
> +                        next = 0;
> +                    }

A bit confusing here as well IMO, but I don't know a better way to write it
other than adding comments about index effectively being off by 1.

> +                    doe->store[2] =
> +                        (next << ctz32(PCI_DOE_DIS_RSP_D0_DW0_NEXT_INDEX)) |
> +                        (h->object_type << ctz32(PCI_DOE_DIS_RSP_D0_DW0_PROT)) |
> +                        h->vendor_id;
> +                }
> +            }
> +            doe->data_object_ready = true;
> +            doe->rsp_index = 0;
> +        } else {
> +            for (l = doe->cb_list; l != NULL; l = l->next) {
> +                struct doe_handler *h = l->data;
> +                if (h->vendor_id == vendor_id &&
> +                    h->object_type == object_type) {
> +                    int ret = h->handler(doe, h->vendor_id, h->object_type,
> +                                         h->priv);
> +                    if (ret) {
> +                        /*
> +                         * No response so as per 6.xx.1 in DOE ECN
> +                         * "... within 1 second after the DOE Go bit was Set
> +                         *  in the DOE Control register, otherwise the DOE
> +                         *  instance must Set the DOE Error bit in the DOE
> +                         *  Status register.."
> +                         */
> +                         doe->error = true;

extra whitespace

> +                        break;
> +                    }
> +                    doe->data_object_ready = true;
> +                    doe->rsp_index = 0;
> +                    break;
> +                }
> +            }
> +            /* Comamnd not handled */
> +            if (l == NULL) {
> +                doe->error = true;
> +            }
> +        }
> +        /* Reset input index to allow for a new message */
> +        doe->req_index = 0;
> +    }
> +}
> +
> +static void doe_set_write_mailbox(PCIEDOE *doe, uint32_t val)
> +{
> +    if (doe->req_index == 1) {
> +        if (val & 0x3FFFF) {

val & PCI_DATA_OBJ_DW1_LEN

> +            doe->req_length = val & PCI_DATA_OBJ_DW1_LEN;
> +        } else {
> +            doe->req_length = 1 << 18;
> +        }
> +    }
> +    if (doe->req_length && doe->req_index == doe->req_length) {
> +        /*
> +         * 6.xx.1 Data Objects
> +         * If the DW transferred does not match the indicated Length
> +         * for a data object, then the data object must be
> +         * silently discarded
> +         */
> +        return;
> +    }
> +    doe->store[doe->req_index] = val;
> +    doe->req_index++;
> +}
> +
> +static uint32_t doe_get_read_mailbox(PCIEDOE *doe)
> +{
> +    uint32_t val;
> +
> +    if (doe->rsp_index == 0) {
> +        doe->rsp_length = doe->store[1] & PCI_DATA_OBJ_DW1_LEN;
> +    }
> +    if (!doe->data_object_ready) {
> +        /* Underflow of the Read Data Mailbox Mechanism */
> +        doe->error = true;
> +        return 0;
> +    }

I don't think this should be an error condition. Could you please explain?

> +
> +    val = doe->store[doe->rsp_index];
> +    doe->rsp_index++;
> +    if (doe->rsp_index == doe->rsp_length) {
> +        doe->rsp_index = -1;
> +        doe->data_object_ready = false;
> +    }
> +
> +    return val;
> +}
> +
> +static uint32_t doe_get_status(PCIEDOE *doe)
> +{
> +    uint32_t val = 0;
> +
> +    if (doe->busy) {
> +        val |= PCI_DOE_STATUS_DOE_BUSY;
> +    }

Do you actually intend to model busy?

> +    /* bit 1: interrupt not yet supported */
> +    if (doe->error) {
> +        val |= PCI_DOE_STATUS_DOE_ERROR;
> +    }
> +    if (doe->data_object_ready) {
> +        val |= PCI_DOE_STATUS_DATA_OBJECT_READY;
> +    }
> +
> +    return val;
> +}
> +
> +void doe_add_message_handler(PCIEDOE *doe, uint16_t vendor_id,
> +                             uint8_t object_type,
> +                             const doe_msg_handler_t handler, void *priv)
> +{
> +    struct doe_handler *h = g_malloc0(sizeof(*handler));
> +
> +    h->vendor_id = vendor_id;
> +    h->object_type = object_type;
> +    h->handler = handler;
> +    h->priv = priv;
> +    doe->cb_list = g_list_append(doe->cb_list, h);
> +}
> +
> +uint32_t pcie_doe_ecap(PCIEDOE *doe, PCIDevice *d, uint16_t offset)
> +{
> +    doe->doe_base = offset;
> +    /* Length field is 18 bits and is in dwords */
> +    doe->store = g_malloc0((1 << 18) * sizeof(uint32_t));

I think it's fine if you're instantiating DOE to just have this be statically
allocated.

> +
> +    pcie_add_capability(d, PCI_EXT_CAP_ID_DOE, 1, offset, 0x18);
> +    offset += 0x18;
> +
> +    return offset;
> +}
> +
> +void pcie_doe_write(PCIEDOE *doe, uint32_t addr, uint32_t val, int len)
> +{
> +    if (len != 4) {
> +        return;
> +    } 

Do you want to check alignment also?

> +
> +    switch (addr - doe->doe_base) {
> +    case PCI_DOE_CTRL:
> +        doe_set_ctl(doe, val);
> +        break;
> +    case PCI_DOE_WRITE_MAILBOX:
> +        doe_set_write_mailbox(doe, val);
> +        break;
> +    }
> +}
> +
> +uint32_t pcie_doe_read(PCIEDOE *doe, uint32_t addr, int len, int *found)
> +{
> +    if (len != 4) {
> +        *found = 0;
> +        return 0;
> +    }

Same comment as _write

> +
> +    *found = 1;
> +    switch (addr - doe->doe_base) {
> +    case PCI_DOE_CAP:
> +        return 0; /* No interrupt support */
> +    case PCI_DOE_STATUS:
> +        return doe_get_status(doe);
> +    case PCI_DOE_READ_MAILBOX:
> +        return doe_get_read_mailbox(doe);
> +    default:
> +        *found = 0;
> +        return 0;
> +    }
> +}

I'm guessing you don't love 'found'. Perhaps you can have this return an int64_t
and negative values are errors?

I'm not yet convinced you even need that level of error handling though. I
suppose next patch will tell me.

> +
> diff --git a/include/hw/pci/doe.h b/include/hw/pci/doe.h
> new file mode 100644
> index 0000000000..364c866c53
> --- /dev/null
> +++ b/include/hw/pci/doe.h
> @@ -0,0 +1,40 @@
> +/*
> + * PCIE DOE emulation.
> + *
> + * Copyright (c) 2021 Jonathan Cameron <Jonathan.Cameron@huawei.com>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + */
> +
> +#ifndef QEMU_PCIE_DOE_H_
> +#define QEMU_PCIE_DOE_H_
> +#include "qemu/osdep.h"
> +#include "qemu/units.h"
> +#include "hw/qdev-properties.h"
> +#include "qapi/error.h"
> +#include "qemu/module.h"
> +
> +typedef struct pcie_doe {
> +    uint32_t doe_base;
> +    GList *cb_list;
> +    int req_index;
> +    int req_length;
> +    int rsp_index;
> +    int rsp_length;
> +    bool data_object_ready;
> +    bool error;
> +    bool busy;
> +    uint32_t *store;
> +} PCIEDOE;
> +
> +typedef int (*doe_msg_handler_t)(PCIEDOE *doe, uint16_t vendor_id,
> +                                 uint8_t object_type, void *priv);
> +
> +uint32_t pcie_doe_ecap(PCIEDOE *doe, PCIDevice *d, uint16_t offset);
> +void doe_add_message_handler(PCIEDOE *doe, uint16_t vendor_id,
> +                             uint8_t object_type,
> +                             const doe_msg_handler_t handler, void *priv);
> +uint32_t pcie_doe_read(PCIEDOE *doe, uint32_t addr, int len, int *found);
> +void pcie_doe_write(PCIEDOE *doe, uint32_t addr, uint32_t val, int len);
> +#endif
> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
> index 76bf3ed590..636b2e8017 100644
> --- a/include/hw/pci/pci_ids.h
> +++ b/include/hw/pci/pci_ids.h
> @@ -157,6 +157,8 @@
>  
>  /* Vendors and devices.  Sort key: vendor first, device next. */
>  
> +#define PCI_VENDOR_ID_PCI_SIG            0x0001
> +
>  #define PCI_VENDOR_ID_LSI_LOGIC          0x1000
>  #define PCI_DEVICE_ID_LSI_53C810         0x0001
>  #define PCI_DEVICE_ID_LSI_53C895A        0x0012
> -- 
> 2.19.1
> 
> 

