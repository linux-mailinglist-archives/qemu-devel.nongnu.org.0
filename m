Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4946A7F94
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 11:06:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXfpW-0002Kd-VN; Thu, 02 Mar 2023 05:06:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pXfpN-0002K4-8w
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:06:21 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jonathan.cameron@huawei.com>)
 id 1pXfpI-0006Qc-QK
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 05:06:20 -0500
Received: from lhrpeml500005.china.huawei.com (unknown [172.18.147.201])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4PS6BS4pbmz6JB8m;
 Thu,  2 Mar 2023 18:03:44 +0800 (CST)
Received: from localhost (10.122.247.231) by lhrpeml500005.china.huawei.com
 (7.191.163.240) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 2 Mar
 2023 10:06:09 +0000
Date: Thu, 2 Mar 2023 10:06:08 +0000
To: Jonathan Cameron via <qemu-devel@nongnu.org>
CC: Jonathan Cameron <Jonathan.Cameron@huawei.com>, Michael Tsirkin
 <mst@redhat.com>, Ben Widawsky <bwidawsk@kernel.org>,
 <linux-cxl@vger.kernel.org>, <linuxarm@huawei.com>, Ira Weiny
 <ira.weiny@intel.com>, Gregory Price <gourry.memverge@gmail.com>, Philippe
 =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>, Mike Maslenkin
 <mike.maslenkin@gmail.com>, Dave Jiang <dave.jiang@intel.com>, "Markus
 Armbruster" <armbru@redhat.com>, =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau
 <marcandre.lureau@redhat.com>, Thomas Huth <thuth@redhat.com>, "Michael Roth"
 <michael.roth@amd.com>
Subject: Re: [PATCH v6 8/8] hw/mem/cxl_type3: Add CXL RAS Error Injection
 Support.
Message-ID: <20230302100608.00005bcd@huawei.com>
In-Reply-To: <20230227112751.6101-9-Jonathan.Cameron@huawei.com>
References: <20230227112751.6101-1-Jonathan.Cameron@huawei.com>
 <20230227112751.6101-9-Jonathan.Cameron@huawei.com>
Organization: Huawei Technologies R&D (UK) Ltd.
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.29; x86_64-w64-mingw32)
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.122.247.231]
X-ClientProxiedBy: lhrpeml100002.china.huawei.com (7.191.160.241) To
 lhrpeml500005.china.huawei.com (7.191.163.240)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=jonathan.cameron@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Jonathan Cameron <Jonathan.Cameron@huawei.com>
From:  Jonathan Cameron via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

+CC Michael Roth.

Michael Tsirkin noted I'd missed CCing QAPI maintaintainers on the
poison injection series so I went back to check the others I had out for re=
view.
For this series I'd managed to pick up one of two as Markus gave comments on
earlier versions.

On Mon, 27 Feb 2023 11:27:51 +0000
Jonathan Cameron via <qemu-devel@nongnu.org> wrote:

> CXL uses PCI AER Internal errors to signal to the host that an error has
> occurred. The host can then read more detailed status from the CXL RAS
> capability.
>=20
> For uncorrectable errors: support multiple injection in one operation
> as this is needed to reliably test multiple header logging support in an
> OS. The equivalent feature doesn't exist for correctable errors, so only
> one error need be injected at a time.
>=20
> Note:
>  - Header content needs to be manually specified in a fashion that
>    matches the specification for what can be in the header for each
>    error type.
>=20
> Injection via QMP:
> { "execute": "qmp_capabilities" }
> ...
> { "execute": "cxl-inject-uncorrectable-errors",
>   "arguments": {
>     "path": "/machine/peripheral/cxl-pmem0",
>     "errors": [
>         {
>             "type": "cache-address-parity",
>             "header": [ 3, 4]
>         },
>         {
>             "type": "cache-data-parity",
>             "header": [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,=
20,21,22,23,24,25,26,27,28,29,30,31]
>         },
>         {
>             "type": "internal",
>             "header": [ 1, 2, 4]
>         }
>         ]
>   }}
> ...
> { "execute": "cxl-inject-correctable-error",
>     "arguments": {
>         "path": "/machine/peripheral/cxl-pmem0",
>         "type": "physical"
>     } }
>=20
> Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> ---
> v6: (Thanks to Philippe Mathieu-Daud=E9)
> - Add Since entries in cxl.json
> - Add error prints in the stub functions so that if they are called witho=
ut
>   CONFIG_CXL_MEM_DEVICE then we get a useful print rather than just silen=
tly
>   eating them.
> ---
>  hw/cxl/cxl-component-utils.c   |   4 +-
>  hw/mem/cxl_type3.c             | 281 +++++++++++++++++++++++++++++++++
>  hw/mem/cxl_type3_stubs.c       |  17 ++
>  hw/mem/meson.build             |   2 +
>  include/hw/cxl/cxl_component.h |  26 +++
>  include/hw/cxl/cxl_device.h    |  11 ++
>  qapi/cxl.json                  | 128 +++++++++++++++
>  qapi/meson.build               |   1 +
>  qapi/qapi-schema.json          |   1 +
>  9 files changed, 470 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/cxl/cxl-component-utils.c b/hw/cxl/cxl-component-utils.c
> index 737b4764b9..b665d4f565 100644
> --- a/hw/cxl/cxl-component-utils.c
> +++ b/hw/cxl/cxl-component-utils.c
> @@ -142,16 +142,18 @@ static void ras_init_common(uint32_t *reg_state, ui=
nt32_t *write_msk)
>       * be handled as RO.
>       */
>      stl_le_p(reg_state + R_CXL_RAS_UNC_ERR_STATUS, 0);
> +    stl_le_p(write_msk + R_CXL_RAS_UNC_ERR_STATUS, 0x1cfff);
>      /* Bits 12-13 and 17-31 reserved in CXL 2.0 */
>      stl_le_p(reg_state + R_CXL_RAS_UNC_ERR_MASK, 0x1cfff);
>      stl_le_p(write_msk + R_CXL_RAS_UNC_ERR_MASK, 0x1cfff);
>      stl_le_p(reg_state + R_CXL_RAS_UNC_ERR_SEVERITY, 0x1cfff);
>      stl_le_p(write_msk + R_CXL_RAS_UNC_ERR_SEVERITY, 0x1cfff);
>      stl_le_p(reg_state + R_CXL_RAS_COR_ERR_STATUS, 0);
> +    stl_le_p(write_msk + R_CXL_RAS_COR_ERR_STATUS, 0x7f);
>      stl_le_p(reg_state + R_CXL_RAS_COR_ERR_MASK, 0x7f);
>      stl_le_p(write_msk + R_CXL_RAS_COR_ERR_MASK, 0x7f);
>      /* CXL switches and devices must set */
> -    stl_le_p(reg_state + R_CXL_RAS_ERR_CAP_CTRL, 0x00);
> +    stl_le_p(reg_state + R_CXL_RAS_ERR_CAP_CTRL, 0x200);
>  }
> =20
>  static void hdm_init_common(uint32_t *reg_state, uint32_t *write_msk,
> diff --git a/hw/mem/cxl_type3.c b/hw/mem/cxl_type3.c
> index 6cdd988d1d..abe60b362c 100644
> --- a/hw/mem/cxl_type3.c
> +++ b/hw/mem/cxl_type3.c
> @@ -1,6 +1,7 @@
>  #include "qemu/osdep.h"
>  #include "qemu/units.h"
>  #include "qemu/error-report.h"
> +#include "qapi/qapi-commands-cxl.h"
>  #include "hw/mem/memory-device.h"
>  #include "hw/mem/pc-dimm.h"
>  #include "hw/pci/pci.h"
> @@ -323,6 +324,66 @@ static void hdm_decoder_commit(CXLType3Dev *ct3d, in=
t which)
>      ARRAY_FIELD_DP32(cache_mem, CXL_HDM_DECODER0_CTRL, COMMITTED, 1);
>  }
> =20
> +static int ct3d_qmp_uncor_err_to_cxl(CxlUncorErrorType qmp_err)
> +{
> +    switch (qmp_err) {
> +    case CXL_UNCOR_ERROR_TYPE_CACHE_DATA_PARITY:
> +        return CXL_RAS_UNC_ERR_CACHE_DATA_PARITY;
> +    case CXL_UNCOR_ERROR_TYPE_CACHE_ADDRESS_PARITY:
> +        return CXL_RAS_UNC_ERR_CACHE_ADDRESS_PARITY;
> +    case CXL_UNCOR_ERROR_TYPE_CACHE_BE_PARITY:
> +        return CXL_RAS_UNC_ERR_CACHE_BE_PARITY;
> +    case CXL_UNCOR_ERROR_TYPE_CACHE_DATA_ECC:
> +        return CXL_RAS_UNC_ERR_CACHE_DATA_ECC;
> +    case CXL_UNCOR_ERROR_TYPE_MEM_DATA_PARITY:
> +        return CXL_RAS_UNC_ERR_MEM_DATA_PARITY;
> +    case CXL_UNCOR_ERROR_TYPE_MEM_ADDRESS_PARITY:
> +        return CXL_RAS_UNC_ERR_MEM_ADDRESS_PARITY;
> +    case CXL_UNCOR_ERROR_TYPE_MEM_BE_PARITY:
> +        return CXL_RAS_UNC_ERR_MEM_BE_PARITY;
> +    case CXL_UNCOR_ERROR_TYPE_MEM_DATA_ECC:
> +        return CXL_RAS_UNC_ERR_MEM_DATA_ECC;
> +    case CXL_UNCOR_ERROR_TYPE_REINIT_THRESHOLD:
> +        return CXL_RAS_UNC_ERR_REINIT_THRESHOLD;
> +    case CXL_UNCOR_ERROR_TYPE_RSVD_ENCODING:
> +        return CXL_RAS_UNC_ERR_RSVD_ENCODING;
> +    case CXL_UNCOR_ERROR_TYPE_POISON_RECEIVED:
> +        return CXL_RAS_UNC_ERR_POISON_RECEIVED;
> +    case CXL_UNCOR_ERROR_TYPE_RECEIVER_OVERFLOW:
> +        return CXL_RAS_UNC_ERR_RECEIVER_OVERFLOW;
> +    case CXL_UNCOR_ERROR_TYPE_INTERNAL:
> +        return CXL_RAS_UNC_ERR_INTERNAL;
> +    case CXL_UNCOR_ERROR_TYPE_CXL_IDE_TX:
> +        return CXL_RAS_UNC_ERR_CXL_IDE_TX;
> +    case CXL_UNCOR_ERROR_TYPE_CXL_IDE_RX:
> +        return CXL_RAS_UNC_ERR_CXL_IDE_RX;
> +    default:
> +        return -EINVAL;
> +    }
> +}
> +
> +static int ct3d_qmp_cor_err_to_cxl(CxlCorErrorType qmp_err)
> +{
> +    switch (qmp_err) {
> +    case CXL_COR_ERROR_TYPE_CACHE_DATA_ECC:
> +        return CXL_RAS_COR_ERR_CACHE_DATA_ECC;
> +    case CXL_COR_ERROR_TYPE_MEM_DATA_ECC:
> +        return CXL_RAS_COR_ERR_MEM_DATA_ECC;
> +    case CXL_COR_ERROR_TYPE_CRC_THRESHOLD:
> +        return CXL_RAS_COR_ERR_CRC_THRESHOLD;
> +    case CXL_COR_ERROR_TYPE_RETRY_THRESHOLD:
> +        return CXL_RAS_COR_ERR_RETRY_THRESHOLD;
> +    case CXL_COR_ERROR_TYPE_CACHE_POISON_RECEIVED:
> +        return CXL_RAS_COR_ERR_CACHE_POISON_RECEIVED;
> +    case CXL_COR_ERROR_TYPE_MEM_POISON_RECEIVED:
> +        return CXL_RAS_COR_ERR_MEM_POISON_RECEIVED;
> +    case CXL_COR_ERROR_TYPE_PHYSICAL:
> +        return CXL_RAS_COR_ERR_PHYSICAL;
> +    default:
> +        return -EINVAL;
> +    }
> +}
> +
>  static void ct3d_reg_write(void *opaque, hwaddr offset, uint64_t value,
>                             unsigned size)
>  {
> @@ -341,6 +402,83 @@ static void ct3d_reg_write(void *opaque, hwaddr offs=
et, uint64_t value,
>          should_commit =3D FIELD_EX32(value, CXL_HDM_DECODER0_CTRL, COMMI=
T);
>          which_hdm =3D 0;
>          break;
> +    case A_CXL_RAS_UNC_ERR_STATUS:
> +    {
> +        uint32_t capctrl =3D ldl_le_p(cache_mem + R_CXL_RAS_ERR_CAP_CTRL=
);
> +        uint32_t fe =3D FIELD_EX32(capctrl, CXL_RAS_ERR_CAP_CTRL, FIRST_=
ERROR_POINTER);
> +        CXLError *cxl_err;
> +        uint32_t unc_err;
> +
> +        /*
> +         * If single bit written that corresponds to the first error
> +         * pointer being cleared, update the status and header log.
> +         */
> +        if (!QTAILQ_EMPTY(&ct3d->error_list)) {
> +            if ((1 << fe) ^ value) {
> +                CXLError *cxl_next;
> +                /*
> +                 * Software is using wrong flow for multiple header reco=
rding
> +                 * Following behavior in PCIe r6.0 and assuming multiple
> +                 * header support. Implementation defined choice to clea=
r all
> +                 * matching records if more than one bit set - which cor=
responds
> +                 * closest to behavior of hardware not capable of multip=
le
> +                 * header recording.
> +                 */
> +                QTAILQ_FOREACH_SAFE(cxl_err, &ct3d->error_list, node, cx=
l_next) {
> +                    if ((1 << cxl_err->type) & value) {
> +                        QTAILQ_REMOVE(&ct3d->error_list, cxl_err, node);
> +                        g_free(cxl_err);
> +                    }
> +                }
> +            } else {
> +                /* Done with previous FE, so drop from list */
> +                cxl_err =3D QTAILQ_FIRST(&ct3d->error_list);
> +                QTAILQ_REMOVE(&ct3d->error_list, cxl_err, node);
> +                g_free(cxl_err);
> +            }
> +
> +            /*
> +             * If there is another FE, then put that in place and update
> +             * the header log
> +             */
> +            if (!QTAILQ_EMPTY(&ct3d->error_list)) {
> +                uint32_t *header_log =3D &cache_mem[R_CXL_RAS_ERR_HEADER=
0];
> +                int i;
> +
> +                cxl_err =3D QTAILQ_FIRST(&ct3d->error_list);
> +                for (i =3D 0; i < CXL_RAS_ERR_HEADER_NUM; i++) {
> +                    stl_le_p(header_log + i, cxl_err->header[i]);
> +                }
> +                capctrl =3D FIELD_DP32(capctrl, CXL_RAS_ERR_CAP_CTRL,
> +                                     FIRST_ERROR_POINTER, cxl_err->type);
> +            } else {
> +                /*
> +                 * If no more errors, then follow recomendation of PCI s=
pec
> +                 * r6.0 6.2.4.2 to set the first error pointer to a stat=
us
> +                 * bit that will never be used.
> +                 */
> +                capctrl =3D FIELD_DP32(capctrl, CXL_RAS_ERR_CAP_CTRL,
> +                                     FIRST_ERROR_POINTER,
> +                                     CXL_RAS_UNC_ERR_CXL_UNUSED);
> +            }
> +            stl_le_p((uint8_t *)cache_mem + A_CXL_RAS_ERR_CAP_CTRL, capc=
trl);
> +        }
> +        unc_err =3D 0;
> +        QTAILQ_FOREACH(cxl_err, &ct3d->error_list, node) {
> +            unc_err |=3D 1 << cxl_err->type;
> +        }
> +        stl_le_p((uint8_t *)cache_mem + offset, unc_err);
> +
> +        return;
> +    }
> +    case A_CXL_RAS_COR_ERR_STATUS:
> +    {
> +        uint32_t rw1c =3D value;
> +        uint32_t temp =3D ldl_le_p((uint8_t *)cache_mem + offset);
> +        temp &=3D ~rw1c;
> +        stl_le_p((uint8_t *)cache_mem + offset, temp);
> +        return;
> +    }
>      default:
>          break;
>      }
> @@ -404,6 +542,8 @@ static void ct3_realize(PCIDevice *pci_dev, Error **e=
rrp)
>      unsigned short msix_num =3D 1;
>      int i, rc;
> =20
> +    QTAILQ_INIT(&ct3d->error_list);
> +
>      if (!cxl_setup_memory(ct3d, errp)) {
>          return;
>      }
> @@ -631,6 +771,147 @@ static void set_lsa(CXLType3Dev *ct3d, const void *=
buf, uint64_t size,
>       */
>  }
> =20
> +/* For uncorrectable errors include support for multiple header recordin=
g */
> +void qmp_cxl_inject_uncorrectable_errors(const char *path,
> +                                         CXLUncorErrorRecordList *errors,
> +                                         Error **errp)
> +{
> +    Object *obj =3D object_resolve_path(path, NULL);
> +    static PCIEAERErr err =3D {};
> +    CXLType3Dev *ct3d;
> +    CXLError *cxl_err;
> +    uint32_t *reg_state;
> +    uint32_t unc_err;
> +    bool first;
> +
> +    if (!obj) {
> +        error_setg(errp, "Unable to resolve path");
> +        return;
> +    }
> +
> +    if (!object_dynamic_cast(obj, TYPE_CXL_TYPE3)) {
> +        error_setg(errp, "Path does not point to a CXL type 3 device");
> +        return;
> +    }
> +
> +    err.status =3D PCI_ERR_UNC_INTN;
> +    err.source_id =3D pci_requester_id(PCI_DEVICE(obj));
> +    err.flags =3D 0;
> +
> +    ct3d =3D CXL_TYPE3(obj);
> +
> +    first =3D QTAILQ_EMPTY(&ct3d->error_list);
> +    reg_state =3D ct3d->cxl_cstate.crb.cache_mem_registers;
> +    while (errors) {
> +        uint32List *header =3D errors->value->header;
> +        uint8_t header_count =3D 0;
> +        int cxl_err_code;
> +
> +        cxl_err_code =3D ct3d_qmp_uncor_err_to_cxl(errors->value->type);
> +        if (cxl_err_code < 0) {
> +            error_setg(errp, "Unknown error code");
> +            return;
> +        }
> +
> +        /* If the error is masked, nothing to do here */
> +        if (!((1 << cxl_err_code) &
> +              ~ldl_le_p(reg_state + R_CXL_RAS_UNC_ERR_MASK))) {
> +            errors =3D errors->next;
> +            continue;
> +        }
> +
> +        cxl_err =3D g_malloc0(sizeof(*cxl_err));
> +        if (!cxl_err) {
> +            return;
> +        }
> +
> +        cxl_err->type =3D cxl_err_code;
> +        while (header && header_count < 32) {
> +            cxl_err->header[header_count++] =3D header->value;
> +            header =3D header->next;
> +        }
> +        if (header_count > 32) {
> +            error_setg(errp, "Header must be 32 DWORD or less");
> +            return;
> +        }
> +        QTAILQ_INSERT_TAIL(&ct3d->error_list, cxl_err, node);
> +
> +        errors =3D errors->next;
> +    }
> +
> +    if (first && !QTAILQ_EMPTY(&ct3d->error_list)) {
> +        uint32_t *cache_mem =3D ct3d->cxl_cstate.crb.cache_mem_registers;
> +        uint32_t capctrl =3D ldl_le_p(cache_mem + R_CXL_RAS_ERR_CAP_CTRL=
);
> +        uint32_t *header_log =3D &cache_mem[R_CXL_RAS_ERR_HEADER0];
> +        int i;
> +
> +        cxl_err =3D QTAILQ_FIRST(&ct3d->error_list);
> +        for (i =3D 0; i < CXL_RAS_ERR_HEADER_NUM; i++) {
> +            stl_le_p(header_log + i, cxl_err->header[i]);
> +        }
> +
> +        capctrl =3D FIELD_DP32(capctrl, CXL_RAS_ERR_CAP_CTRL,
> +                             FIRST_ERROR_POINTER, cxl_err->type);
> +        stl_le_p(cache_mem + R_CXL_RAS_ERR_CAP_CTRL, capctrl);
> +    }
> +
> +    unc_err =3D 0;
> +    QTAILQ_FOREACH(cxl_err, &ct3d->error_list, node) {
> +        unc_err |=3D (1 << cxl_err->type);
> +    }
> +    if (!unc_err) {
> +        return;
> +    }
> +
> +    stl_le_p(reg_state + R_CXL_RAS_UNC_ERR_STATUS, unc_err);
> +    pcie_aer_inject_error(PCI_DEVICE(obj), &err);
> +
> +    return;
> +}
> +
> +void qmp_cxl_inject_correctable_error(const char *path, CxlCorErrorType =
type,
> +                                      Error **errp)
> +{
> +    static PCIEAERErr err =3D {};
> +    Object *obj =3D object_resolve_path(path, NULL);
> +    CXLType3Dev *ct3d;
> +    uint32_t *reg_state;
> +    uint32_t cor_err;
> +    int cxl_err_type;
> +
> +    if (!obj) {
> +        error_setg(errp, "Unable to resolve path");
> +        return;
> +    }
> +    if (!object_dynamic_cast(obj, TYPE_CXL_TYPE3)) {
> +        error_setg(errp, "Path does not point to a CXL type 3 device");
> +        return;
> +    }
> +
> +    err.status =3D PCI_ERR_COR_INTERNAL;
> +    err.source_id =3D pci_requester_id(PCI_DEVICE(obj));
> +    err.flags =3D PCIE_AER_ERR_IS_CORRECTABLE;
> +
> +    ct3d =3D CXL_TYPE3(obj);
> +    reg_state =3D ct3d->cxl_cstate.crb.cache_mem_registers;
> +    cor_err =3D ldl_le_p(reg_state + R_CXL_RAS_COR_ERR_STATUS);
> +
> +    cxl_err_type =3D ct3d_qmp_cor_err_to_cxl(type);
> +    if (cxl_err_type < 0) {
> +        error_setg(errp, "Invalid COR error");
> +        return;
> +    }
> +    /* If the error is masked, nothting to do here */
> +    if (!((1 << cxl_err_type) & ~ldl_le_p(reg_state + R_CXL_RAS_COR_ERR_=
MASK))) {
> +        return;
> +    }
> +
> +    cor_err |=3D (1 << cxl_err_type);
> +    stl_le_p(reg_state + R_CXL_RAS_COR_ERR_STATUS, cor_err);
> +
> +    pcie_aer_inject_error(PCI_DEVICE(obj), &err);
> +}
> +
>  static void ct3_class_init(ObjectClass *oc, void *data)
>  {
>      DeviceClass *dc =3D DEVICE_CLASS(oc);
> diff --git a/hw/mem/cxl_type3_stubs.c b/hw/mem/cxl_type3_stubs.c
> new file mode 100644
> index 0000000000..d574c58f9a
> --- /dev/null
> +++ b/hw/mem/cxl_type3_stubs.c
> @@ -0,0 +1,17 @@
> +
> +#include "qemu/osdep.h"
> +#include "qapi/error.h"
> +#include "qapi/qapi-commands-cxl.h"
> +
> +void qmp_cxl_inject_uncorrectable_errors(const char *path,
> +                                         CXLUncorErrorRecordList *errors,
> +                                         Error **errp)
> +{
> +    error_setg(errp, "CXL Type 3 support is not compiled in");
> +}
> +
> +void qmp_cxl_inject_correctable_error(const char *path, CxlCorErrorType =
type,
> +                                      Error **errp)
> +{
> +    error_setg(errp, "CXL Type 3 support is not compiled in");
> +}
> diff --git a/hw/mem/meson.build b/hw/mem/meson.build
> index 609b2b36fc..56c2618b84 100644
> --- a/hw/mem/meson.build
> +++ b/hw/mem/meson.build
> @@ -4,6 +4,8 @@ mem_ss.add(when: 'CONFIG_DIMM', if_true: files('pc-dimm.c=
'))
>  mem_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_mc.c'))
>  mem_ss.add(when: 'CONFIG_NVDIMM', if_true: files('nvdimm.c'))
>  mem_ss.add(when: 'CONFIG_CXL_MEM_DEVICE', if_true: files('cxl_type3.c'))
> +softmmu_ss.add(when: 'CONFIG_CXL_MEM_DEVICE', if_false: files('cxl_type3=
_stubs.c'))
> +softmmu_ss.add(when: 'CONFIG_ALL', if_true: files('cxl_type3_stubs.c'))
> =20
>  softmmu_ss.add_all(when: 'CONFIG_MEM_DEVICE', if_true: mem_ss)
> =20
> diff --git a/include/hw/cxl/cxl_component.h b/include/hw/cxl/cxl_componen=
t.h
> index 692d7a5507..ec4203b83f 100644
> --- a/include/hw/cxl/cxl_component.h
> +++ b/include/hw/cxl/cxl_component.h
> @@ -65,11 +65,37 @@ CXLx_CAPABILITY_HEADER(SNOOP, 0x14)
>  #define CXL_RAS_REGISTERS_OFFSET 0x80
>  #define CXL_RAS_REGISTERS_SIZE   0x58
>  REG32(CXL_RAS_UNC_ERR_STATUS, CXL_RAS_REGISTERS_OFFSET)
> +#define CXL_RAS_UNC_ERR_CACHE_DATA_PARITY 0
> +#define CXL_RAS_UNC_ERR_CACHE_ADDRESS_PARITY 1
> +#define CXL_RAS_UNC_ERR_CACHE_BE_PARITY 2
> +#define CXL_RAS_UNC_ERR_CACHE_DATA_ECC 3
> +#define CXL_RAS_UNC_ERR_MEM_DATA_PARITY 4
> +#define CXL_RAS_UNC_ERR_MEM_ADDRESS_PARITY 5
> +#define CXL_RAS_UNC_ERR_MEM_BE_PARITY 6
> +#define CXL_RAS_UNC_ERR_MEM_DATA_ECC 7
> +#define CXL_RAS_UNC_ERR_REINIT_THRESHOLD 8
> +#define CXL_RAS_UNC_ERR_RSVD_ENCODING 9
> +#define CXL_RAS_UNC_ERR_POISON_RECEIVED 10
> +#define CXL_RAS_UNC_ERR_RECEIVER_OVERFLOW 11
> +#define CXL_RAS_UNC_ERR_INTERNAL 14
> +#define CXL_RAS_UNC_ERR_CXL_IDE_TX 15
> +#define CXL_RAS_UNC_ERR_CXL_IDE_RX 16
> +#define CXL_RAS_UNC_ERR_CXL_UNUSED 63 /* Magic value */
>  REG32(CXL_RAS_UNC_ERR_MASK, CXL_RAS_REGISTERS_OFFSET + 0x4)
>  REG32(CXL_RAS_UNC_ERR_SEVERITY, CXL_RAS_REGISTERS_OFFSET + 0x8)
>  REG32(CXL_RAS_COR_ERR_STATUS, CXL_RAS_REGISTERS_OFFSET + 0xc)
> +#define CXL_RAS_COR_ERR_CACHE_DATA_ECC 0
> +#define CXL_RAS_COR_ERR_MEM_DATA_ECC 1
> +#define CXL_RAS_COR_ERR_CRC_THRESHOLD 2
> +#define CXL_RAS_COR_ERR_RETRY_THRESHOLD 3
> +#define CXL_RAS_COR_ERR_CACHE_POISON_RECEIVED 4
> +#define CXL_RAS_COR_ERR_MEM_POISON_RECEIVED 5
> +#define CXL_RAS_COR_ERR_PHYSICAL 6
>  REG32(CXL_RAS_COR_ERR_MASK, CXL_RAS_REGISTERS_OFFSET + 0x10)
>  REG32(CXL_RAS_ERR_CAP_CTRL, CXL_RAS_REGISTERS_OFFSET + 0x14)
> +    FIELD(CXL_RAS_ERR_CAP_CTRL, FIRST_ERROR_POINTER, 0, 6)
> +REG32(CXL_RAS_ERR_HEADER0, CXL_RAS_REGISTERS_OFFSET + 0x18)
> +#define CXL_RAS_ERR_HEADER_NUM 32
>  /* Offset 0x18 - 0x58 reserved for RAS logs */
> =20
>  /* 8.2.5.10 - CXL Security Capability Structure */
> diff --git a/include/hw/cxl/cxl_device.h b/include/hw/cxl/cxl_device.h
> index 7e5ad65c1d..d589f78202 100644
> --- a/include/hw/cxl/cxl_device.h
> +++ b/include/hw/cxl/cxl_device.h
> @@ -232,6 +232,14 @@ REG64(CXL_MEM_DEV_STS, 0)
>      FIELD(CXL_MEM_DEV_STS, MBOX_READY, 4, 1)
>      FIELD(CXL_MEM_DEV_STS, RESET_NEEDED, 5, 3)
> =20
> +typedef struct CXLError {
> +    QTAILQ_ENTRY(CXLError) node;
> +    int type; /* Error code as per FE definition */
> +    uint32_t header[32];
> +} CXLError;
> +
> +typedef QTAILQ_HEAD(, CXLError) CXLErrorList;
> +
>  struct CXLType3Dev {
>      /* Private */
>      PCIDevice parent_obj;
> @@ -248,6 +256,9 @@ struct CXLType3Dev {
> =20
>      /* DOE */
>      DOECap doe_cdat;
> +
> +    /* Error injection */
> +    CXLErrorList error_list;
>  };
> =20
>  #define TYPE_CXL_TYPE3 "cxl-type3"
> diff --git a/qapi/cxl.json b/qapi/cxl.json
> new file mode 100644
> index 0000000000..4be7d46041
> --- /dev/null
> +++ b/qapi/cxl.json
> @@ -0,0 +1,128 @@
> +# -*- Mode: Python -*-
> +# vim: filetype=3Dpython
> +
> +##
> +# =3D CXL devices
> +##
> +
> +##
> +# @CxlUncorErrorType:
> +#
> +# Type of uncorrectable CXL error to inject. These errors are reported v=
ia
> +# an AER uncorrectable internal error with additional information logged=
 at
> +# the CXL device.
> +#
> +# @cache-data-parity: Data error such as data parity or data ECC error C=
XL.cache
> +# @cache-address-parity: Address parity or other errors associated with =
the
> +#                        address field on CXL.cache
> +# @cache-be-parity: Byte enable parity or other byte enable errors on CX=
L.cache
> +# @cache-data-ecc: ECC error on CXL.cache
> +# @mem-data-parity: Data error such as data parity or data ECC error on =
CXL.mem
> +# @mem-address-parity: Address parity or other errors associated with the
> +#                      address field on CXL.mem
> +# @mem-be-parity: Byte enable parity or other byte enable errors on CXL.=
mem.
> +# @mem-data-ecc: Data ECC error on CXL.mem.
> +# @reinit-threshold: REINIT threshold hit.
> +# @rsvd-encoding: Received unrecognized encoding.
> +# @poison-received: Received poison from the peer.
> +# @receiver-overflow: Buffer overflows (first 3 bits of header log indic=
ate which)
> +# @internal: Component specific error
> +# @cxl-ide-tx: Integrity and data encryption tx error.
> +# @cxl-ide-rx: Integrity and data encryption rx error.
> +#
> +# Since: 8.0
> +##
> +
> +{ 'enum': 'CxlUncorErrorType',
> +  'data': ['cache-data-parity',
> +           'cache-address-parity',
> +           'cache-be-parity',
> +           'cache-data-ecc',
> +           'mem-data-parity',
> +           'mem-address-parity',
> +           'mem-be-parity',
> +           'mem-data-ecc',
> +           'reinit-threshold',
> +           'rsvd-encoding',
> +           'poison-received',
> +           'receiver-overflow',
> +           'internal',
> +           'cxl-ide-tx',
> +           'cxl-ide-rx'
> +           ]
> + }
> +
> +##
> +# @CXLUncorErrorRecord:
> +#
> +# Record of a single error including header log.
> +#
> +# @type: Type of error
> +# @header: 16 DWORD of header.
> +#
> +# Since: 8.0
> +##
> +{ 'struct': 'CXLUncorErrorRecord',
> +  'data': {
> +      'type': 'CxlUncorErrorType',
> +      'header': [ 'uint32' ]
> +  }
> +}
> +
> +##
> +# @cxl-inject-uncorrectable-errors:
> +#
> +# Command to allow injection of multiple errors in one go. This allows t=
esting
> +# of multiple header log handling in the OS.
> +#
> +# @path: CXL Type 3 device canonical QOM path
> +# @errors: Errors to inject
> +#
> +# Since: 8.0
> +##
> +{ 'command': 'cxl-inject-uncorrectable-errors',
> +  'data': { 'path': 'str',
> +             'errors': [ 'CXLUncorErrorRecord' ] }}
> +
> +##
> +# @CxlCorErrorType:
> +#
> +# Type of CXL correctable error to inject
> +#
> +# @cache-data-ecc: Data ECC error on CXL.cache
> +# @mem-data-ecc: Data ECC error on CXL.mem
> +# @crc-threshold: Component specific and applicable to 68 byte Flit mode=
 only.
> +# @cache-poison-received: Received poison from a peer on CXL.cache.
> +# @mem-poison-received: Received poison from a peer on CXL.mem
> +# @physical: Received error indication from the physical layer.
> +#
> +# Since: 8.0
> +##
> +{ 'enum': 'CxlCorErrorType',
> +  'data': ['cache-data-ecc',
> +           'mem-data-ecc',
> +           'crc-threshold',
> +           'retry-threshold',
> +           'cache-poison-received',
> +           'mem-poison-received',
> +           'physical']
> +}
> +
> +##
> +# @cxl-inject-correctable-error:
> +#
> +# Command to inject a single correctable error.  Multiple error injection
> +# of this error type is not interesting as there is no associated header=
 log.
> +# These errors are reported via AER as a correctable internal error, with
> +# additional detail available from the CXL device.
> +#
> +# @path: CXL Type 3 device canonical QOM path
> +# @type: Type of error.
> +#
> +# Since: 8.0
> +##
> +{ 'command': 'cxl-inject-correctable-error',
> +  'data': { 'path': 'str',
> +            'type': 'CxlCorErrorType'
> +  }
> +}
> diff --git a/qapi/meson.build b/qapi/meson.build
> index fbdb442fdf..73c3c8c31a 100644
> --- a/qapi/meson.build
> +++ b/qapi/meson.build
> @@ -31,6 +31,7 @@ qapi_all_modules =3D [
>    'compat',
>    'control',
>    'crypto',
> +  'cxl',
>    'dump',
>    'error',
>    'introspect',
> diff --git a/qapi/qapi-schema.json b/qapi/qapi-schema.json
> index f000b90744..079f2a402a 100644
> --- a/qapi/qapi-schema.json
> +++ b/qapi/qapi-schema.json
> @@ -95,3 +95,4 @@
>  { 'include': 'pci.json' }
>  { 'include': 'stats.json' }
>  { 'include': 'virtio.json' }
> +{ 'include': 'cxl.json' }


