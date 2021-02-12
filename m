Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D9331A74B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Feb 2021 23:06:09 +0100 (CET)
Received: from localhost ([::1]:60112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAgZk-0003L9-Vh
	for lists+qemu-devel@lfdr.de; Fri, 12 Feb 2021 17:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cbrowy@avery-design.com>)
 id 1lAgUx-0001jq-70
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 17:01:11 -0500
Received: from server.avery-design.com ([198.57.169.184]:39502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cbrowy@avery-design.com>)
 id 1lAgUp-0005ec-Dn
 for qemu-devel@nongnu.org; Fri, 12 Feb 2021 17:01:10 -0500
Received: from ool-944ab965.dyn.optonline.net ([148.74.185.101]:56405
 helo=[192.168.1.180])
 by server.avery-design.com with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <cbrowy@avery-design.com>)
 id 1lAgL9-0001sU-JD; Fri, 12 Feb 2021 21:51:03 +0000
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.120.23.2.4\))
Subject: Re: [RFC PATCH v2 1/2] Basic PCIe DOE support
From: Chris Browy <cbrowy@avery-design.com>
In-Reply-To: <20210212162442.00007c1d@Huawei.com>
Date: Fri, 12 Feb 2021 16:58:21 -0500
Content-Transfer-Encoding: quoted-printable
Message-Id: <8A5C244A-DF9A-4EB5-8C24-568A606E75B0@avery-design.com>
References: <1612900760-7361-1-git-send-email-cbrowy@avery-design.com>
 <1612902949-9992-1-git-send-email-cbrowy@avery-design.com>
 <20210212162442.00007c1d@Huawei.com>
To: Jonathan Cameron <Jonathan.Cameron@Huawei.com>
X-Mailer: Apple Mail (2.3608.120.23.2.4)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - server.avery-design.com
X-AntiAbuse: Original Domain - nongnu.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - avery-design.com
X-Get-Message-Sender-Via: server.avery-design.com: authenticated_id:
 cbrowy@avery-design.com
X-Authenticated-Sender: server.avery-design.com: cbrowy@avery-design.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Received-SPF: pass client-ip=198.57.169.184;
 envelope-from=cbrowy@avery-design.com; helo=server.avery-design.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, SORTED_RECIPS=2.499,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Reply-To: "20210212162442.00007c1d@huawei.com"
 <20210212162442.00007c1d@Huawei.com>
Cc: Ben Widawsky <ben.widawsky@intel.com>, david@redhat.com,
 qemu-devel@nongnu.org, vishal.l.verma@intel.com, jgroves@micron.com,
 armbru@redhat.com, linux-cxl@vger.kernel.org, f4bug@amsat.org, mst@redhat.com,
 imammedo@redhat.com, dan.j.williams@intel.com, ira.weiny@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



> On Feb 12, 2021, at 11:24 AM, Jonathan Cameron =
<Jonathan.Cameron@Huawei.com> wrote:
>=20
> On Tue, 9 Feb 2021 15:35:49 -0500
> Chris Browy <cbrowy@avery-design.com> wrote:
>=20
> Run ./scripts/checkpatch.pl over the patches and fix all the warnings =
before
> posting.  It will save time by clearing out most of the minor =
formatting issues
> and similar that inevitably sneak in during development.
>=20
Excellent suggestion.  We=E2=80=99re still newbies!

> The biggest issue I'm seeing in here is that the abstraction of
> multiple DOE capabiltiies accessing same protocols doesn't make sense.
>=20
> Each DOE ecap region and hence mailbox can have it's own set of
> (possibly  overlapping) protocols.
>=20
> =46rom the ECN:
> "It is permitted for a protocol using data object exchanges to require
> that a Function implement a unique instance of DOE for that specific
> protocol, and/or to allow sharing of a DOE instance to only a specific
> set of protocols using data object exchange, and/or to allow a =
Function
> to implement multiple instances of DOE supporting the specific =
protocol."
>=20
> Tightly couple the ECAP and DOE.  If we are in the multiple instances
> of DOE supporting a specific protocol case, then register it =
separately
> for each one.  The individual device emulation then needs to deal with
> any possible clashes etc.

Not sure how configurable we want to make the device.  It is a simple =
type 3
device after all.=20

The DOE spec does leave it pretty arbitrary regarding N DOE instances =
(DOE=20
Extended Cap entry points) for M protocols, including where N>1 and M=3D1.=
 =20
Currently we implement N=3D2 DOE caps (instances), one for CDAT, one for=20=

Compliance Mode.

Maybe a more complex MLD device might have one or more DOE instances=20
for the CDAT protocol alone to define each HDM but currently we only =
have=20
one pmem (SLD) so we can=E2=80=99t really do much more than what=E2=80=99s=
 supported.

Open to further suggestion though.  Based on answer to above we=E2=80=99ll=
 follow=20
the suggestion lower in the code review regarding=20


>=20
> Various comments inline, but mostly small stuff.
>=20
> Jonathan
>=20
>=20
>> ---
>> MAINTAINERS                               |   7 +
>> hw/pci/meson.build                        |   1 +
>> hw/pci/pcie.c                             |   2 +-
>> hw/pci/pcie_doe.c                         | 414 =
++++++++++++++++++++++++++++++
>> include/hw/pci/pci_ids.h                  |   2 +
>> include/hw/pci/pcie.h                     |   1 +
>> include/hw/pci/pcie_doe.h                 | 166 ++++++++++++
>> include/hw/pci/pcie_regs.h                |   4 +
>> include/standard-headers/linux/pci_regs.h |   3 +-
>> 9 files changed, 598 insertions(+), 2 deletions(-)
>> create mode 100644 hw/pci/pcie_doe.c
>> create mode 100644 include/hw/pci/pcie_doe.h
>>=20
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 981dc92..4fb865e 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -1655,6 +1655,13 @@ F: docs/pci*
>> F: docs/specs/*pci*
>> F: default-configs/pci.mak
>>=20
>> +PCIE DOE
>> +M: Huai-Cheng Kuo <hchkuo@avery-design.com.tw>
>> +M: Chris Browy <cbrowy@avery-design.com>
>> +S: Supported
>> +F: include/hw/pci/pcie_doe.h
>> +F: hw/pci/pcie_doe.c
>> +
>> ACPI/SMBIOS
>> M: Michael S. Tsirkin <mst@redhat.com>
>> M: Igor Mammedov <imammedo@redhat.com>
>> diff --git a/hw/pci/meson.build b/hw/pci/meson.build
>> index 5c4bbac..115e502 100644
>> --- a/hw/pci/meson.build
>> +++ b/hw/pci/meson.build
>> @@ -12,6 +12,7 @@ pci_ss.add(files(
>> # allow plugging PCIe devices into PCI buses, include them even if
>> # CONFIG_PCI_EXPRESS=3Dn.
>> pci_ss.add(files('pcie.c', 'pcie_aer.c'))
>> +pci_ss.add(files('pcie_doe.c'))
>> softmmu_ss.add(when: 'CONFIG_PCI_EXPRESS', if_true: =
files('pcie_port.c', 'pcie_host.c'))
>> softmmu_ss.add_all(when: 'CONFIG_PCI', if_true: pci_ss)
>>=20
>=20
> ...
>=20
>> diff --git a/hw/pci/pcie_doe.c b/hw/pci/pcie_doe.c
>> new file mode 100644
>> index 0000000..df8e92e
>> --- /dev/null
>> +++ b/hw/pci/pcie_doe.c
>> @@ -0,0 +1,414 @@
>=20
> Add a copyright header / license etc before v3.
>=20
>> +#include "qemu/osdep.h"
>> +#include "qemu/log.h"
>> +#include "qemu/error-report.h"
>> +#include "qapi/error.h"
>> +#include "qemu/range.h"
>> +#include "hw/pci/pci.h"
>> +#include "hw/pci/pcie.h"
>> +#include "hw/pci/pcie_doe.h"
>> +#include "hw/pci/msi.h"
>> +#include "hw/pci/msix.h"
>> +
>> +/*
>> + * DOE Default Protocols (Discovery, CMA)
>> + */
>> +/* Discovery Request Object */
>> +struct doe_discovery {
>> +    DOEHeader header;
>> +    uint8_t index;
>> +    uint8_t reserved[3];
>> +} QEMU_PACKED;
>> +
>> +/* Discovery Response Object */
>> +struct doe_discovery_rsp {
>> +    DOEHeader header;
>> +    uint16_t vendor_id;
>> +    uint8_t doe_type;
>> +    uint8_t next_index;
>> +} QEMU_PACKED;
>> +
>> +/* Callback for Discovery */
>> +static bool pcie_doe_discovery_rsp(DOECap *doe_cap)
>> +{
>> +    PCIEDOE *doe =3D doe_cap->doe;
>> +    struct doe_discovery *req =3D pcie_doe_get_req(doe_cap);
>> +    uint8_t index =3D req->index;
>> +    DOEProtocol *prot =3D NULL;
>> +
>> +    /* Request length mismatch, discard */
>> +    if (req->header.length < dwsizeof(struct doe_discovery)) {
>> +        return DOE_DISCARD;
>=20
> 	return false;  Or better yet a meaningful error code to make =
debugging
> easier.

OK

>=20
>> +    }
>> +
>> +    /* Point to the requested protocol */
>> +    if (index < doe->protocol_num) {
>> +        prot =3D &doe->protocols[index];
>> +    }
>> +
>> +    struct doe_discovery_rsp rsp =3D {
>> +        .header =3D {
>> +            .vendor_id =3D PCI_VENDOR_ID_PCI_SIG,
>> +            .doe_type =3D PCI_SIG_DOE_DISCOVERY,
>> +            .reserved =3D 0x0,
>=20
> Nice thing about c99 based structure assignment is that unspecified
> elements are set to 0 automatically.  So you can drop this particular
> element safely and end up with slightly cleaner code.

OK

>=20
>> +            .length =3D dwsizeof(struct doe_discovery_rsp),
>> +        },
>> +        .vendor_id =3D (prot) ? prot->vendor_id : 0xFFFF,
>> +        .doe_type =3D (prot) ? prot->doe_type : 0xFF,
>> +        .next_index =3D (index + 1) < doe->protocol_num ?
>> +                      (index + 1) : 0,
>> +    };
>> +
>> +    pcie_doe_set_rsp(doe_cap, &rsp);
>> +
>> +    return DOE_SUCCESS;
>> +}
>> +
>> +/* Callback for CMA */
>> +static bool pcie_doe_cma_rsp(DOECap *doe_cap)
>=20
> I've not checked CMA, but I'd expect this to be a separate
> patch as not part of core DOE support (or same ECN for that
> matter).

We=E2=80=99ll back out CMA.  Currently it=E2=80=99s an incomplete =
solution.  We support it in=20
discovery process but the response is that of being disabled.  So not =
the best
way to handle it.

>=20
>> +{
>> +    doe_cap->status.error =3D 1;
>> +
>> +    memset(doe_cap->read_mbox, 0,
>> +           PCI_DOE_MAX_DW_SIZE * sizeof(uint32_t));
>> +
>> +    doe_cap->write_mbox_len =3D 0;
>> +
>> +    return DOE_DISCARD;
>> +}
>> +
>> +/*
>> + * DOE Utilities
>> + */
>> +static void pcie_doe_reset_mbox(DOECap *st)
>> +{
>> +    st->read_mbox_idx =3D 0;
>> +
>> +    st->read_mbox_len =3D 0;
>> +    st->write_mbox_len =3D 0;
>> +
>> +    memset(st->read_mbox, 0, PCI_DOE_MAX_DW_SIZE * =
sizeof(uint32_t));
>> +    memset(st->write_mbox, 0, PCI_DOE_MAX_DW_SIZE * =
sizeof(uint32_t));
>> +}
>> +
>> +/*
>> + * Initialize the list and protocol for a device.
>> + * This function won't add the DOE capabitity to your PCIe device.
>> + */
>> +void pcie_doe_init(PCIDevice *dev, PCIEDOE *doe)
>> +{
>> +    doe->pdev =3D dev;
>> +    doe->head =3D NULL;
>> +    doe->protocol_num =3D 0;
>=20
> No need to set things to zero as I assume you allocate it zero filled.
> At least no point for things where zero is the obvious default.
>=20
>> +
>> +    /* Register two default protocol */
>> +    //TODO : LINK LIST
>=20
> Agreed :)
>=20
>> +    pcie_doe_register_protocol(doe, PCI_VENDOR_ID_PCI_SIG,
>> +            PCI_SIG_DOE_DISCOVERY, pcie_doe_discovery_rsp);
>> +    pcie_doe_register_protocol(doe, PCI_VENDOR_ID_PCI_SIG,
>> +            PCI_SIG_DOE_CMA, pcie_doe_cma_rsp);
>> +}
>> +
>> +int pcie_cap_doe_add(PCIEDOE *doe, uint16_t offset, bool intr, =
uint16_t vec) {
>=20
> Bracket on this line.
>=20
>> +    DOECap *new_cap, **ptr;
>> +    PCIDevice *dev =3D doe->pdev;
>> +
>> +    pcie_add_capability(dev, PCI_EXT_CAP_ID_DOE, PCI_DOE_VER, =
offset,
>> +                        PCI_DOE_SIZEOF);
>> +
>> +    ptr =3D &doe->head;
>> +    /* Insert the new DOE at the end of linked list */
>=20
> As below, not sure this abstraction makes sense.
>=20
>> +    while (*ptr) {
>> +        if (range_covers_byte((*ptr)->offset, PCI_DOE_SIZEOF, =
offset) ||
>> +            (*ptr)->cap.vec =3D=3D vec) {
>> +            return -EINVAL;
>> +        }
>> +
>> +        ptr =3D &(*ptr)->next;
>> +    }
>> +    new_cap =3D g_malloc0(sizeof(DOECap));
>> +    *ptr =3D new_cap;
>> +
>> +    new_cap->doe =3D doe;
>> +    new_cap->offset =3D offset;
>> +    new_cap->next =3D NULL;
>> +
>> +    /* Configure MSI/MSI-X */
>> +    if (intr && (msi_present(dev) || msix_present(dev))) {
>> +        new_cap->cap.intr =3D intr;
>> +        new_cap->cap.vec =3D vec;
>> +    }
>> +
>> +    /* Set up W/R Mailbox buffer */
>> +    new_cap->write_mbox =3D g_malloc0(PCI_DOE_MAX_DW_SIZE * =
sizeof(uint32_t));
>> +    new_cap->read_mbox =3D g_malloc0(PCI_DOE_MAX_DW_SIZE * =
sizeof(uint32_t));
>> +
>> +    pcie_doe_reset_mbox(new_cap);
>> +
>> +    return 0;
>> +}
>> +
>> +void pcie_doe_uninit(PCIEDOE *doe) {
>> +    PCIDevice *dev =3D doe->pdev;
>> +    DOECap *cap;
>> +
>> +    pci_del_capability(dev, PCI_EXT_CAP_ID_DOE, PCI_DOE_SIZEOF);
>> +
>> +    cap =3D doe->head;
>> +    while (cap) {
>> +        doe->head =3D doe->head->next;
>> +
>> +        g_free(cap->read_mbox);
>> +        g_free(cap->write_mbox);
>> +        cap->read_mbox =3D NULL;
>> +        cap->write_mbox =3D NULL;
>=20
> I'd avoid setting things to NULL that you are throwing away.  It
> implies that they will be reused or that it matters in somewhat which
> isn't the case here.

OK

>=20
>> +        g_free(cap);
>> +        cap =3D doe->head;
>> +    }
>> +}
>> +
>> +void pcie_doe_register_protocol(PCIEDOE *doe, uint16_t vendor_id,
>> +        uint8_t doe_type, bool (*set_rsp)(DOECap *))
>> +{
>> +    /* Protocol num should not exceed 256 */
>> +    assert(doe->protocol_num < PCI_DOE_PROTOCOL_MAX);
>> +
>> +    doe->protocols[doe->protocol_num].vendor_id =3D vendor_id;
>> +    doe->protocols[doe->protocol_num].doe_type =3D doe_type;
>> +    doe->protocols[doe->protocol_num].set_rsp =3D set_rsp;
>> +
>> +    doe->protocol_num++;
>> +}
>> +
>> +uint32_t pcie_doe_build_protocol(DOEProtocol *p)
>> +{
>> +    return DATA_OBJ_BUILD_HEADER1(p->vendor_id, p->doe_type);
>> +}
>> +
>> +/* Return the pointer of DOE request in write mailbox buffer */
>> +void *pcie_doe_get_req(DOECap *doe_cap)
>> +{
>> +    return doe_cap->write_mbox;
>> +}
>> +
>> +/* Copy the response to read mailbox buffer */
>> +void pcie_doe_set_rsp(DOECap *doe_cap, void *rsp)
>> +{
>> +    uint32_t len =3D pcie_doe_object_len(rsp);
>> +
>> +    memcpy(doe_cap->read_mbox + doe_cap->read_mbox_len,
>> +           rsp, len * sizeof(uint32_t));
>> +    doe_cap->read_mbox_len +=3D len;
>> +}
>> +
>> +/* Get Data Object length */
>> +uint32_t pcie_doe_object_len(void *obj)
>> +{
>> +    return (obj)? ((DOEHeader *)obj)->length : 0;
>> +}
>> +
>> +static void pcie_doe_write_mbox(DOECap *doe_cap, uint32_t val)
>> +{
>> +    memcpy(doe_cap->write_mbox + doe_cap->write_mbox_len, &val, =
sizeof(uint32_t));
>> +
>> +    if (doe_cap->write_mbox_len =3D=3D 1) {
>> +        DOE_DBG("  Capture DOE request DO length =3D %d\n", val & =
0x0003ffff);
>> +    }
>> +
>> +    doe_cap->write_mbox_len++;
>=20
> We probably need to check that the mailbox write was full dword as the =
spec
> requires.  No idea what we do if it isn't as spec doesn't seem to =
say...
> I've queried one of our PCI experts.

Let us know their response.  If not being able to rely on full DW config =
access will
require a bunch of changes to accommodate.

>=20
>=20
>> +}
>> +
>> +static void pcie_doe_irq_assert(DOECap *doe_cap)
>> +{
>> +    PCIDevice *dev =3D doe_cap->doe->pdev;
>> +
>> +    if (doe_cap->cap.intr && doe_cap->ctrl.intr) {
>> +        /* Interrupt notify */
>> +        if (msix_enabled(dev)) {
>> +            msix_notify(dev, doe_cap->cap.vec);
>> +        } else if (msi_enabled(dev)) {
>> +            msi_notify(dev, doe_cap->cap.vec);
>> +        }
>> +        /* Not support legacy IRQ */
>> +    }
>> +}
>> +
>> +static void pcie_doe_set_ready(DOECap *doe_cap, bool rdy)
>> +{
>> +    doe_cap->status.ready =3D rdy;
>> +
>> +    if (rdy) {
>> +        pcie_doe_irq_assert(doe_cap);
>> +    }
>> +}
>> +
>> +static void pcie_doe_set_error(DOECap *doe_cap, bool err)
>> +{
>> +    doe_cap->status.error =3D err;
>> +
>> +    if (err) {
>> +        pcie_doe_irq_assert(doe_cap);
>> +    }
>> +}
>> +
>> +DOECap *pcie_doe_covers_addr(PCIEDOE *doe, uint32_t addr)
>> +{
>> +    DOECap *ptr =3D doe->head;
>> +
>> +    /* If overlaps DOE range. PCIe Capability Header won't be =
included. */
>> +    while (ptr &&=20
>> +           !range_covers_byte(ptr->offset + PCI_EXP_DOE_CAP, =
PCI_DOE_SIZEOF - 4, addr)) {
>> +        ptr =3D ptr->next;
>> +    }
>> +   =20
>> +    return ptr;
>> +}
>> +
>> +uint32_t pcie_doe_read_config(DOECap *doe_cap,
>> +                              uint32_t addr, int size)
>> +{
>> +    uint32_t ret =3D 0, shift, mask =3D 0xFFFFFFFF;
>> +    uint16_t doe_offset =3D doe_cap->offset;
>> +
>> +    /* If overlaps DOE range. PCIe Capability Header won't be =
included. */
>> +    if (range_covers_byte(doe_offset + PCI_EXP_DOE_CAP, =
PCI_DOE_SIZEOF - 4, addr)) {
>=20
> I'd flip this around to reduce indentation + no need to be careful =
with alignment etc
> if we aren't returning anything.
>=20
>       if (!range_cover_byte(doe_offset + PCI_EXP_DOE_CAP, =
PCI_DOE_SIZEOF - 4, addr)
> 		return 0;
>=20
>=20
>> +        addr -=3D doe_offset;
>> +
>> +        if (range_covers_byte(PCI_EXP_DOE_CAP, sizeof(uint32_t), =
addr)) {
>> +            ret =3D FIELD_DP32(ret, PCI_DOE_CAP_REG, INTR_SUPP,
>> +                             doe_cap->cap.intr);
>> +            ret =3D FIELD_DP32(ret, PCI_DOE_CAP_REG, =
DOE_INTR_MSG_NUM,
>> +                             doe_cap->cap.vec);
>> +        } else if (range_covers_byte(PCI_EXP_DOE_CTRL, =
sizeof(uint32_t), addr)) {
>> +            /* Must return ABORT=3D0 and GO=3D0 */
>> +            ret =3D FIELD_DP32(ret, PCI_DOE_CAP_CONTROL, =
DOE_INTR_EN,
>> +                             doe_cap->ctrl.intr);
>> +            DOE_DBG("  CONTROL REG=3D%x\n", ret);
>> +        } else if (range_covers_byte(PCI_EXP_DOE_STATUS, =
sizeof(uint32_t), addr)) {
>> +            ret =3D FIELD_DP32(ret, PCI_DOE_CAP_STATUS, DOE_BUSY,
>> +                             doe_cap->status.busy);
>> +            ret =3D FIELD_DP32(ret, PCI_DOE_CAP_STATUS, =
DOE_INTR_STATUS,
>> +                             doe_cap->status.intr);
>> +            ret =3D FIELD_DP32(ret, PCI_DOE_CAP_STATUS, DOE_ERROR,
>> +                             doe_cap->status.error);
>> +            ret =3D FIELD_DP32(ret, PCI_DOE_CAP_STATUS, =
DATA_OBJ_RDY,
>> +                             doe_cap->status.ready);
>> +        } else if (range_covers_byte(PCI_EXP_DOE_RD_DATA_MBOX, =
sizeof(uint32_t), addr)) {
>> +            /* Check that READY is set */
>=20
> I'd clean out any comment that is obvious from the code.
> Comments get out of sync over time so there is a maintenance burden in =
having them such
> that we only bother if they add information.
>=20
>> +            if (!doe_cap->status.ready) {
>> +                /* Return 0 if not ready */
>> +                DOE_DBG("  RD MBOX RETURN=3D%x\n", ret);
>> +            } else {
>> +                /* Deposit next DO DW into read mbox */
>=20
> This comment is missleading.  It might not be the 'next' one. If you =
read
> the register twice for instance.  Much better not to have the comment
> at all on basis code is fairly obvious anyway!
>=20
> As mentioned below, a read of this when nothing there is an underflow =
and spec
> suggests that is an error condition.
>=20
>> +                DOE_DBG("  RD MBOX, DATA OBJECT READY,"
>> +                        " CURRENT DO DW OFFSET=3D%x\n",
>> +                        doe_cap->read_mbox_idx);
>> +
>> +                ret =3D doe_cap->read_mbox[doe_cap->read_mbox_idx];
>> +
>> +                DOE_DBG("  RD MBOX DW=3D%x\n", ret);
>> +                DOE_DBG("  RD MBOX DW OFFSET=3D%d, RD MBOX =
LENGTH=3D%d\n",
>> +                        doe_cap->read_mbox_idx, =
doe_cap->read_mbox_len);
>> +            }
>> +        } else if (range_covers_byte(PCI_EXP_DOE_WR_DATA_MBOX, =
sizeof(uint32_t), addr)) {
>> +            DOE_DBG("  WR MBOX, local_val =3D%x\n", ret);
>> +        }
>> +    }
>> +
>> +    /* Alignment */
>> +    shift =3D addr % sizeof(uint32_t);
>> +    if (shift) {
>> +        ret >>=3D shift * 8;
>> +    }
>> +    mask >>=3D (sizeof(uint32_t) - size) * 8;
>> +
>> +    return ret & mask;
>> +}
>> +
>> +void pcie_doe_write_config(DOECap *doe_cap,
>> +                           uint32_t addr, uint32_t val, int size)
>> +{
>> +    PCIEDOE *doe =3D doe_cap->doe;
>> +    uint16_t doe_offset =3D doe_cap->offset;
>> +    int p;
>> +    bool discard;
>> +    uint32_t shift;
>> +
>> +    DOE_DBG("  addr=3D%x, val=3D%x, size=3D%x\n", addr, val, size);
>> +
>> +    /* If overlaps DOE range. PCIe Capability Header won't be =
included. */
>> +    if (range_covers_byte(doe_offset + PCI_EXP_DOE_CAP, =
PCI_DOE_SIZEOF - 4, addr)) {
>=20
> As below, invert this condition and return early as it will simplify =
below and reduce
> indentation.
>=20
>     if (!range_covers_byte(doe_offset + PCI_EXP_DOE_CAP, =
PCI_DOE_SIZEOF - 4, addr)) {
>          return;
>    }
>=20
>> +        /* Alignment */
>> +        shift =3D addr % sizeof(uint32_t);
>> +        addr -=3D (doe_offset - shift);
>> +        val <<=3D shift * 8;
>> +
>> +        switch (addr) {
>> +        case PCI_EXP_DOE_CTRL:
>> +            DOE_DBG("  CONTROL=3D%x\n", val);
>> +            if (FIELD_EX32(val, PCI_DOE_CAP_CONTROL, DOE_ABORT)) {
>> +                /* If ABORT, clear status reg DOE Error and DOE =
Ready */
>> +                DOE_DBG("  Setting ABORT\n");
>> +                pcie_doe_set_ready(doe_cap, 0);
>> +                pcie_doe_set_error(doe_cap, 0);
>> +                pcie_doe_reset_mbox(doe_cap);
>> +            } else if (FIELD_EX32(val, PCI_DOE_CAP_CONTROL, DOE_GO)) =
{
>> +                DOE_DBG("  CONTROL GO=3D%x\n", val);
>=20
> This case is complex enough I'd factor it out as it's own function.

OK

>=20
>> +                /*
>> +                 * Check protocol the incoming request in write_mbox =
and
>> +                 * memcpy the corresponding response to read_mbox.
>> +                 *
>> +                 * "discard" should be set up if the response =
callback
>> +                 * function could not deal with request (e.g. length
>> +                 * mismatch) or the protocol of request was not =
found.
>> +                 */
>> +                discard =3D DOE_DISCARD;
>> +                for (p =3D 0; p < doe->protocol_num; p++) {
>> +                    if (doe_cap->write_mbox[0] =3D=3D
>> +                        pcie_doe_build_protocol(&doe->protocols[p])) =
{
>> +                        /* Found */
>> +                        DOE_DBG("  DOE PROTOCOL=3D%x\n", =
doe_cap->write_mbox[0]);
>> +                        /*
>> +                         * Spec:
>> +                         * If the number of DW transferred does not =
match the
>> +                         * indicated Length for a data object, then =
the
>> +                         * data object must be silently discarded.
>> +                         */
>> +                        if (doe_cap->write_mbox_len =3D=3D
>> +                            =
pcie_doe_object_len(pcie_doe_get_req(doe_cap)))
>> +                            discard =3D =
doe->protocols[p].set_rsp(doe_cap);
>> +                        break;
>> +                    }
>> +                }
>> +
>> +                /* Set DOE Ready */
>> +                if (!discard) {
>> +                    pcie_doe_set_ready(doe_cap, 1);
>> +                } else {
>> +                    pcie_doe_reset_mbox(doe_cap);
>> +                }
>> +            } else if (FIELD_EX32(val, PCI_DOE_CAP_CONTROL, =
DOE_INTR_EN)) {
>=20
> Spec reference needed to say why you can't write this at same time as =
GO.
> It may be odd thing to do, but I can't see anything saying you =
couldn't do this,
> for example on your very first command.
>=20
>> +                doe_cap->ctrl.intr =3D 1;
>> +            }
>> +            break;
>> +        case PCI_EXP_DOE_RD_DATA_MBOX:
>> +            /* Read MBOX */
>> +            DOE_DBG("  INCR RD MBOX DO DW OFFSET=3D%d\n", =
doe_cap->read_mbox_idx);
>> +            doe_cap->read_mbox_idx +=3D 1;
>> +            /* Last DW */
>> +            if (doe_cap->read_mbox_idx >=3D doe_cap->read_mbox_len) =
{
>> +                pcie_doe_reset_mbox(doe_cap);
>> +                pcie_doe_set_ready(doe_cap, 0);
>> +            }
>=20
> A write of this when there is nothing there is an underflow. As is a =
read of this
> after the last write.  I would guess both should be error conditions.

We=E2=80=99ll double check and fix accordingly

>=20
>> +            break;
>> +        case PCI_EXP_DOE_WR_DATA_MBOX:
>> +            /* Write MBOX */
>> +            DOE_DBG("  WR MBOX=3D%x, DW OFFSET =3D %d\n", val, =
doe_cap->write_mbox_len);
>> +            pcie_doe_write_mbox(doe_cap, val);
>> +            break;
>> +        case PCI_EXP_DOE_STATUS:
>> +        case PCI_EXP_DOE_CAP:
>> +        default:
>> +            break;
>> +        }
>> +    }
>> +}
>> diff --git a/include/hw/pci/pci_ids.h b/include/hw/pci/pci_ids.h
>> index 76bf3ed..636b2e8 100644
>> --- a/include/hw/pci/pci_ids.h
>> +++ b/include/hw/pci/pci_ids.h
>> @@ -157,6 +157,8 @@
>>=20
>> /* Vendors and devices.  Sort key: vendor first, device next. */
>>=20
>> +#define PCI_VENDOR_ID_PCI_SIG            0x0001
>> +
>> #define PCI_VENDOR_ID_LSI_LOGIC          0x1000
>> #define PCI_DEVICE_ID_LSI_53C810         0x0001
>> #define PCI_DEVICE_ID_LSI_53C895A        0x0012
>> diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
>> index 14c58eb..47d6f66 100644
>> --- a/include/hw/pci/pcie.h
>> +++ b/include/hw/pci/pcie.h
>> @@ -25,6 +25,7 @@
>> #include "hw/pci/pcie_regs.h"
>> #include "hw/pci/pcie_aer.h"
>> #include "hw/hotplug.h"
>> +#include "hw/pci/pcie_doe.h"
>>=20
>> typedef enum {
>>     /* for attention and power indicator */
>> diff --git a/include/hw/pci/pcie_doe.h b/include/hw/pci/pcie_doe.h
>> new file mode 100644
>> index 0000000..f497075
>> --- /dev/null
>> +++ b/include/hw/pci/pcie_doe.h
>> @@ -0,0 +1,166 @@
>> +#ifndef PCIE_DOE_H
>> +#define PCIE_DOE_H
>> +
>> +#include "qemu/range.h"
>> +#include "qemu/typedefs.h"
>> +#include "hw/register.h"
>> +
>> +/*=20
>> + * PCI DOE register defines 7.9.xx=20
>> + */
>> +/* DOE Capabilities Register */
>> +#define PCI_EXP_DOE_CAP             0x04
>> +REG32(PCI_DOE_CAP_REG, 0)
>> +    FIELD(PCI_DOE_CAP_REG, INTR_SUPP, 0, 1)
>> +    FIELD(PCI_DOE_CAP_REG, DOE_INTR_MSG_NUM, 1, 11)
>> +
>> +/* DOE Control Register */
>> +#define PCI_EXP_DOE_CTRL            0x08
>> +REG32(PCI_DOE_CAP_CONTROL, 0)
>> +    FIELD(PCI_DOE_CAP_CONTROL, DOE_ABORT, 0, 1)
>> +    FIELD(PCI_DOE_CAP_CONTROL, DOE_INTR_EN, 1, 1)
>> +    FIELD(PCI_DOE_CAP_CONTROL, DOE_GO, 31, 1)
>> +
>> +/* DOE Status Register  */
>> +#define PCI_EXP_DOE_STATUS          0x0c
>> +REG32(PCI_DOE_CAP_STATUS, 0)
>> +    FIELD(PCI_DOE_CAP_STATUS, DOE_BUSY, 0, 1)
>> +    FIELD(PCI_DOE_CAP_STATUS, DOE_INTR_STATUS, 1, 1)
>> +    FIELD(PCI_DOE_CAP_STATUS, DOE_ERROR, 2, 1)
>> +    FIELD(PCI_DOE_CAP_STATUS, DATA_OBJ_RDY, 31, 1)
>> +
>> +/* DOE Write Data Mailbox Register  */
>> +#define PCI_EXP_DOE_WR_DATA_MBOX    0x10
>> +
>> +/* DOE Read Data Mailbox Register  */
>> +#define PCI_EXP_DOE_RD_DATA_MBOX    0x14
>> +
>> +/*=20
>> + * PCI DOE register defines 7.9.xx=20
>> + */
>> +/* Table 7-x2 */
>> +#define PCI_SIG_DOE_DISCOVERY       0x00
>> +#define PCI_SIG_DOE_CMA             0x01
>> +
>> +#define DATA_OBJ_BUILD_HEADER1(v, p)  ((p << 16) | v)
>> +
>> +/* Figure 6-x1 */
>> +#define DATA_OBJECT_HEADER1_OFFSET  0
>> +#define DATA_OBJECT_HEADER2_OFFSET  1
>> +#define DATA_OBJECT_CONTENT_OFFSET  2
>> +
>> +#define PCI_DOE_MAX_DW_SIZE (1 << 18)
>> +#define PCI_DOE_PROTOCOL_MAX 256
>> +
>> +/*
>> + * Self-defined Marco
>> + */
>> +/* Request/Response State */
>> +#define DOE_SUCCESS 0
>> +#define DOE_DISCARD 1
> Drop these. As mentioned in previous review.  These are just
> obvious bools.
>=20
>> +
>> +/* An invalid vector number for MSI/MSI-x */
>> +#define DOE_NO_INTR (~0)
>> +
>> +/*
>> + * DOE Protocol - Data Object
>> + */
>> +typedef struct DOEHeader DOEHeader;
>> +typedef struct DOEProtocol DOEProtocol;
>> +typedef struct PCIEDOE PCIEDOE;
>> +typedef struct DOECap DOECap;
>> +
>> +struct DOEHeader {
>> +    uint16_t vendor_id;
>> +    uint8_t doe_type;
>> +    uint8_t reserved;
>> +    struct {
>> +        uint32_t length:18;
>> +        uint32_t reserved2:14;
>=20
> As before, bitfields are not a good idea in this sort of code in =
general due to lack
> of standard handling in the C spec.
>=20
>> +    };
>> +} QEMU_PACKED;
>> +
>> +/* Protocol infos and rsp function callback */
>> +struct DOEProtocol {
>> +    uint16_t vendor_id;
>> +    uint8_t doe_type;
>> +
>> +    bool (*set_rsp)(DOECap *);
>> +};
>> +
>> +struct PCIEDOE {
>> +    PCIDevice *pdev;
>=20
> Having the PCIDevice in here only allows you to drop a parameter in =
read and write
> calls. I'd not bother given the nest of pointers you have as a result.
> Just pass both the PCIDOE and the PCIDevice into those two functions.
>=20
>> +    DOECap *head;
>=20
> I can sort of get what you are doing with this list of DOEs but to =
mind it's the wrong
> abstraction as it doesn't fit how I think these will be used.
>=20
> It's not a case that there will be N DOE mailboxes each of which =
supports
> all the same protocols.  I suspect quite the opposite.
>=20
> Each DOE may support multiple protocols but the most obvious reason =
you'd
> do multiple DOEs is because they support different protocols.

Agree

>=20
> If we want to support the same protocol on mulitple DOE instances then =
we'd
> register it for each of them.
>=20
> Thus I'd drop the list handling and instead  have for example
>=20
> struct cxl_type3_dev {
>=20
> ...
>=20
>    PCIDOE doe_ima;
>    PCIDOE doe_cdat;
> };
>=20
> In the read and write calls then just call pcie_doe_xxxx_config() =
twice.
> You do have to handle the miss vs hit stuff though (similar problem =
that
> lead to ugly code in my version).

OK we=E2=80=99ll handle it better in next patch.

>=20
>=20
>> +
>> +    /* Protocols and its callback response */
>> +    DOEProtocol protocols[PCI_DOE_PROTOCOL_MAX];
>> +    uint32_t protocol_num;
>> +};
>> +
>> +struct DOECap {
>> +    PCIEDOE *doe;
>=20
> Following suggestion to get rid of the list, you should also then =
combine
> PCIEDOE and the DOECap as they match 1 to 1.
>=20
>> +
>> +    /* Capability offset */
>> +    uint16_t offset;
>> +
>> +    /* Next DOE capability */
>> +    DOECap *next;
>> +
>> +    /* Capability */
>> +    struct {
>> +        bool intr;
>> +        uint16_t vec;
>> +    } cap;
>> +
>> +    /* Control */
>> +    struct {
>> +        bool abort;
>> +        bool intr;
>> +        bool go;
>> +    } ctrl;
>> +
>> +    /* Status */
>> +    struct {
>> +        bool busy;
>> +        bool intr;
>> +        bool error;
>> +        bool ready;
>> +    } status;
>> +
>> +    /* Mailbox buffer for device */
>> +    uint32_t *write_mbox;
>> +    uint32_t *read_mbox;
>> +
>> +    /* Mailbox position indicator */
>> +    uint32_t read_mbox_idx;
>> +    uint32_t read_mbox_len;
>> +    uint32_t write_mbox_len;
>> +};
>> +
>> +void pcie_doe_init(PCIDevice *dev, PCIEDOE *doe);
>> +int pcie_cap_doe_add(PCIEDOE *doe, uint16_t offset, bool intr, =
uint16_t vec);
>> +void pcie_doe_uninit(PCIEDOE *doe);
>> +void pcie_doe_register_protocol(PCIEDOE *doe, uint16_t vendor_id,
>> +                                uint8_t doe_type,
>> +                                bool (*set_rsp)(DOECap *));
>> +uint32_t pcie_doe_build_protocol(DOEProtocol *p);
>> +DOECap *pcie_doe_covers_addr(PCIEDOE *doe, uint32_t addr);
>> +uint32_t pcie_doe_read_config(DOECap *doe_cap, uint32_t addr, int =
size);
>> +void pcie_doe_write_config(DOECap *doe_cap, uint32_t addr,
>> +                           uint32_t val, int size);
>> +
>> +/* Utility functions for set_rsp in DOEProtocol */
>> +void *pcie_doe_get_req(DOECap *doe_cap);
>> +void pcie_doe_set_rsp(DOECap *doe_cap, void *rsp);
>> +uint32_t pcie_doe_object_len(void *obj);
>> +
>> +#define DOE_DEBUG
>> +#ifdef DOE_DEBUG
>> +#define DOE_DBG(...) printf(__VA_ARGS__)
>> +#else
>> +#define DOE_DBG(...) {}
>> +#endif
>=20
> Tidy this stuff up (i.e. get rid of it) for next version.  It's fine =
when
> you are doing early debug, but we don't want it in the version for =
review.

Got it!

>=20
>> +
>> +#define dwsizeof(s) ((sizeof(s) + 4 - 1) / 4)
>=20
> Not used in this patch.  Move it down towards code that uses it or at =
very=20
> least only introduce it when used.
>=20
>> +
>> +#endif /* PCIE_DOE_H */
>> diff --git a/include/hw/pci/pcie_regs.h b/include/hw/pci/pcie_regs.h
>> index 1db86b0..963dc2e 100644
>> --- a/include/hw/pci/pcie_regs.h
>> +++ b/include/hw/pci/pcie_regs.h
>> @@ -179,4 +179,8 @@ typedef enum PCIExpLinkWidth {
>> #define PCI_ACS_VER                     0x1
>> #define PCI_ACS_SIZEOF                  8
>>=20
>> +/* DOE Capability Register Fields */
>> +#define PCI_DOE_VER                     0x1
>> +#define PCI_DOE_SIZEOF                  24
>> +
>> #endif /* QEMU_PCIE_REGS_H */
>> diff --git a/include/standard-headers/linux/pci_regs.h =
b/include/standard-headers/linux/pci_regs.h
>> index e709ae8..4a7b7a4 100644
>> --- a/include/standard-headers/linux/pci_regs.h
>> +++ b/include/standard-headers/linux/pci_regs.h
>=20
> Pull this change out as a separate patch.  This header gets fetched =
via a script
> so we will only find this here if we update the source file in the =
kernel.

Got it!

>=20
> That should happen soon anyway as we add the support to read this.
>=20
>=20
>> @@ -730,7 +730,8 @@
>> #define PCI_EXT_CAP_ID_DVSEC	0x23	/* Designated Vendor-Specific */
>> #define PCI_EXT_CAP_ID_DLF	0x25	/* Data Link Feature */
>> #define PCI_EXT_CAP_ID_PL_16GT	0x26	/* Physical Layer 16.0 =
GT/s */
>> -#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_PL_16GT
>> +#define PCI_EXT_CAP_ID_DOE      0x2E    /* Data Object Exchange */
>> +#define PCI_EXT_CAP_ID_MAX	PCI_EXT_CAP_ID_DOE
>>=20
>> #define PCI_EXT_CAP_DSN_SIZEOF	12
>> #define PCI_EXT_CAP_MCAST_ENDPOINT_SIZEOF 40
>=20


