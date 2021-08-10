Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0C03E5837
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Aug 2021 12:22:37 +0200 (CEST)
Received: from localhost ([::1]:58044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mDOu3-0003b1-QZ
	for lists+qemu-devel@lfdr.de; Tue, 10 Aug 2021 06:22:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDOqa-00024u-GS; Tue, 10 Aug 2021 06:19:00 -0400
Received: from ozlabs.org ([203.11.71.1]:56577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1mDOqU-0006nn-2d; Tue, 10 Aug 2021 06:18:59 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GkTSS0G9cz9sX1; Tue, 10 Aug 2021 20:18:47 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1628590728;
 bh=MrvsurQ4NJo+ykRJUT7zg8HOJwTKpXiip5msT1fgXLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fq5I4CXTJdZX1YHcZaIx9+5WKZCtti5v+3BqVdc7MICiCfKQmnIG0gSPYdDXIZicb
 KC/xw+3cVztgXiFU0/ZxzFDcQ2GFUu3gLQicAngf3pDnpTsP5zaPhoDnZw5TeG4PZm
 1pk4ABz6fUP5tXhse30NFoLRpVGvdVK9VglUKfmo=
Date: Tue, 10 Aug 2021 16:06:37 +1000
From: David Gibson <david@gibson.dropbear.id.au>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Subject: Re: [PATCH 09/26] ppc/xive2: Introduce a XIVE2 core framework
Message-ID: <YRIXbdUAq6rDcHo/@yekko>
References: <20210809134547.689560-1-clg@kaod.org>
 <20210809134547.689560-10-clg@kaod.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="VD7A2DyUtwPGj1By"
Content-Disposition: inline
In-Reply-To: <20210809134547.689560-10-clg@kaod.org>
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, Greg Kurz <groug@kaod.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--VD7A2DyUtwPGj1By
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 09, 2021 at 03:45:30PM +0200, C=E9dric Le Goater wrote:
> The XIVE2 interrupt controller of the POWER10 processor as the same
> logic as on POWER9 but its SW interface has been largely reworked. The
> interrupt controller has a new register interface, different BARs,
> extra VSDs. These will be described when we add the device model for
> the baremetal machine.
>=20
> The XIVE internal structures for the EAS, END, NVT have different
> layouts which is a problem for the current core XIVE framework. To
> avoid adding too much complexity in the XIVE models, a new XIVE2 core
> framework is introduced. It duplicates the models which are closely
> linked to the XIVE internal structures : Xive2Router and
> Xive2ENDSource and reuses the XiveSource, XivePresenter, XiveTCTX
> models, as they are more generic.
>=20
> Signed-off-by: C=E9dric Le Goater <clg@kaod.org>
> ---
>  include/hw/ppc/xive2.h      |  84 +++++
>  include/hw/ppc/xive2_regs.h | 198 +++++++++++
>  hw/intc/xive2.c             | 672 ++++++++++++++++++++++++++++++++++++
>  hw/intc/meson.build         |   4 +-
>  4 files changed, 956 insertions(+), 2 deletions(-)
>  create mode 100644 include/hw/ppc/xive2.h
>  create mode 100644 include/hw/ppc/xive2_regs.h
>  create mode 100644 hw/intc/xive2.c
>=20
> diff --git a/include/hw/ppc/xive2.h b/include/hw/ppc/xive2.h
> new file mode 100644
> index 000000000000..a14f430a09f7
> --- /dev/null
> +++ b/include/hw/ppc/xive2.h
> @@ -0,0 +1,84 @@
> +/*
> + * QEMU PowerPC XIVE2 interrupt controller model  (POWER10)
> + *
> + * Copyright (c) 2019-2021, IBM Corporation.
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + *
> + */
> +
> +#ifndef PPC_XIVE2_H
> +#define PPC_XIVE2_H
> +
> +#include "hw/ppc/xive2_regs.h"
> +
> +/*
> + * XIVE2 Router (POWER10)
> + */
> +typedef struct Xive2Router {
> +    SysBusDevice    parent;
> +
> +    XiveFabric *xfb;
> +} Xive2Router;
> +
> +#define TYPE_XIVE2_ROUTER TYPE_XIVE_ROUTER "2"
> +#define XIVE2_ROUTER(obj)                                \
> +    OBJECT_CHECK(Xive2Router, (obj), TYPE_XIVE2_ROUTER)
> +#define XIVE2_ROUTER_CLASS(klass)                                       =
 \
> +    OBJECT_CLASS_CHECK(Xive2RouterClass, (klass), TYPE_XIVE2_ROUTER)
> +#define XIVE2_ROUTER_GET_CLASS(obj)                              \
> +    OBJECT_GET_CLASS(Xive2RouterClass, (obj), TYPE_XIVE2_ROUTER)
> +
> +typedef struct Xive2RouterClass {
> +    SysBusDeviceClass parent;
> +
> +    /* XIVE table accessors */
> +    int (*get_eas)(Xive2Router *xrtr, uint8_t eas_blk, uint32_t eas_idx,
> +                   Xive2Eas *eas);
> +    int (*get_end)(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_idx,
> +                   Xive2End *end);
> +    int (*write_end)(Xive2Router *xrtr, uint8_t end_blk, uint32_t end_id=
x,
> +                     Xive2End *end, uint8_t word_number);
> +    int (*get_nvp)(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_idx,
> +                   Xive2Nvp *nvp);
> +    int (*write_nvp)(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nvp_id=
x,
> +                     Xive2Nvp *nvp, uint8_t word_number);
> +    uint8_t (*get_block_id)(Xive2Router *xrtr);
> +} Xive2RouterClass;
> +
> +int xive2_router_get_eas(Xive2Router *xrtr, uint8_t eas_blk, uint32_t ea=
s_idx,
> +                        Xive2Eas *eas);
> +int xive2_router_get_end(Xive2Router *xrtr, uint8_t end_blk, uint32_t en=
d_idx,
> +                        Xive2End *end);
> +int xive2_router_write_end(Xive2Router *xrtr, uint8_t end_blk, uint32_t =
end_idx,
> +                          Xive2End *end, uint8_t word_number);
> +int xive2_router_get_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nv=
p_idx,
> +                        Xive2Nvp *nvp);
> +int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t =
nvp_idx,
> +                          Xive2Nvp *nvp, uint8_t word_number);
> +
> +void xive2_router_notify(XiveNotifier *xn, uint32_t lisn);
> +
> +/*
> + * XIVE2 END ESBs  (POWER10)
> + */
> +
> +#define TYPE_XIVE2_END_SOURCE TYPE_XIVE_END_SOURCE "2"
> +#define XIVE2_END_SOURCE(obj) \
> +    OBJECT_CHECK(Xive2EndSource, (obj), TYPE_XIVE2_END_SOURCE)
> +
> +typedef struct Xive2EndSource {
> +    DeviceState parent;
> +
> +    uint32_t        nr_ends;
> +
> +    /* ESB memory region */
> +    uint32_t        esb_shift;
> +    MemoryRegion    esb_mmio;
> +
> +    Xive2Router     *xrtr;
> +} Xive2EndSource;
> +
> +
> +#endif /* PPC_XIVE2_H */
> diff --git a/include/hw/ppc/xive2_regs.h b/include/hw/ppc/xive2_regs.h
> new file mode 100644
> index 000000000000..f4827f4c6d54
> --- /dev/null
> +++ b/include/hw/ppc/xive2_regs.h
> @@ -0,0 +1,198 @@
> +/*
> + * QEMU PowerPC XIVE2 internal structure definitions (POWER10)
> + *
> + * Copyright (c) 2019-2021, IBM Corporation.
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + */
> +
> +#ifndef PPC_XIVE2_REGS_H
> +#define PPC_XIVE2_REGS_H
> +
> +/*
> + * Thread Interrupt Management Area (TIMA)
> + *
> + * In Gen1 mode (P9 compat mode) word 2 is the same. However in Gen2
> + * mode (P10), the CAM line is slightly different as the VP space was
> + * increased.
> + */
> +#define   TM2_QW0W2_VU           PPC_BIT32(0)
> +#define   TM2_QW0W2_LOGIC_SERV   PPC_BITMASK32(4, 31)
> +#define   TM2_QW1W2_VO           PPC_BIT32(0)
> +#define   TM2_QW1W2_OS_CAM       PPC_BITMASK32(4, 31)
> +#define   TM2_QW2W2_VP           PPC_BIT32(0)
> +#define   TM2_QW2W2_POOL_CAM     PPC_BITMASK32(4, 31)
> +#define   TM2_QW3W2_VT           PPC_BIT32(0)
> +#define   TM2_QW3W2_LP           PPC_BIT32(6)
> +#define   TM2_QW3W2_LE           PPC_BIT32(7)
> +
> +/*
> + * Event Assignment Structure (EAS)
> + */
> +
> +typedef struct Xive2Eas {
> +        uint64_t       w;
> +#define EAS2_VALID                 PPC_BIT(0)
> +#define EAS2_END_BLOCK             PPC_BITMASK(4, 7) /* Destination EQ b=
lock# */
> +#define EAS2_END_INDEX             PPC_BITMASK(8, 31) /* Destination EQ =
index */
> +#define EAS2_MASKED                PPC_BIT(32) /* Masked                =
 */
> +#define EAS2_END_DATA              PPC_BITMASK(33, 63) /* written to the=
 EQ */
> +} Xive2Eas;
> +
> +#define xive2_eas_is_valid(eas)   (be64_to_cpu((eas)->w) & EAS2_VALID)
> +#define xive2_eas_is_masked(eas)  (be64_to_cpu((eas)->w) & EAS2_MASKED)
> +
> +void xive2_eas_pic_print_info(Xive2Eas *eas, uint32_t lisn, Monitor *mon=
);
> +
> +/*
> + * Event Notifification Descriptor (END)
> + */
> +
> +typedef struct Xive2End {
> +        uint32_t       w0;
> +#define END2_W0_VALID              PPC_BIT32(0) /* "v" bit */
> +#define END2_W0_ENQUEUE            PPC_BIT32(5) /* "q" bit */
> +#define END2_W0_UCOND_NOTIFY       PPC_BIT32(6) /* "n" bit */
> +#define END2_W0_SILENT_ESCALATE    PPC_BIT32(7) /* "s" bit */
> +#define END2_W0_BACKLOG            PPC_BIT32(8) /* "b" bit */
> +#define END2_W0_PRECL_ESC_CTL      PPC_BIT32(9) /* "p" bit */
> +#define END2_W0_UNCOND_ESCALATE    PPC_BIT32(10) /* "u" bit */
> +#define END2_W0_ESCALATE_CTL       PPC_BIT32(11) /* "e" bit */
> +#define END2_W0_ADAPTIVE_ESC       PPC_BIT32(12) /* "a" bit */
> +#define END2_W0_ESCALATE_END       PPC_BIT32(13) /* "N" bit */
> +#define END2_W0_FIRMWARE1          PPC_BIT32(16) /* Owned by FW */
> +#define END2_W0_FIRMWARE2          PPC_BIT32(17) /* Owned by FW */
> +#define END2_W0_AEC_SIZE           PPC_BITMASK32(18, 19)
> +#define END2_W0_AEG_SIZE           PPC_BITMASK32(20, 23)
> +#define END2_W0_EQ_VG_PREDICT      PPC_BITMASK32(24, 31) /* Owned by HW =
*/
> +        uint32_t       w1;
> +#define END2_W1_ESn                PPC_BITMASK32(0, 1)
> +#define END2_W1_ESn_P              PPC_BIT32(0)
> +#define END2_W1_ESn_Q              PPC_BIT32(1)
> +#define END2_W1_ESe                PPC_BITMASK32(2, 3)
> +#define END2_W1_ESe_P              PPC_BIT32(2)
> +#define END2_W1_ESe_Q              PPC_BIT32(3)
> +#define END2_W1_GEN_FLIPPED        PPC_BIT32(8)
> +#define END2_W1_GENERATION         PPC_BIT32(9)
> +#define END2_W1_PAGE_OFF           PPC_BITMASK32(10, 31)
> +        uint32_t       w2;
> +#define END2_W2_RESERVED           PPC_BITMASK32(4, 7)
> +#define END2_W2_EQ_ADDR_HI         PPC_BITMASK32(8, 31)
> +        uint32_t       w3;
> +#define END2_W3_EQ_ADDR_LO         PPC_BITMASK32(0, 24)
> +#define END2_W3_QSIZE              PPC_BITMASK32(28, 31)
> +        uint32_t       w4;
> +#define END2_W4_END_BLOCK          PPC_BITMASK32(4, 7)
> +#define END2_W4_ESC_END_INDEX      PPC_BITMASK32(8, 31)
> +#define END2_W4_ESB_BLOCK          PPC_BITMASK32(0, 3)
> +#define END2_W4_ESC_ESB_INDEX      PPC_BITMASK32(4, 31)
> +        uint32_t       w5;
> +#define END2_W5_ESC_END_DATA       PPC_BITMASK32(1, 31)
> +        uint32_t       w6;
> +#define END2_W6_FORMAT_BIT         PPC_BIT32(0)
> +#define END2_W6_IGNORE             PPC_BIT32(1)
> +#define END2_W6_VP_BLOCK           PPC_BITMASK32(4, 7)
> +#define END2_W6_VP_OFFSET          PPC_BITMASK32(8, 31)
> +#define END2_W6_VP_OFFSET_GEN1     PPC_BITMASK32(13, 31)
> +        uint32_t       w7;
> +#define END2_W7_TOPO               PPC_BITMASK32(0, 3) /* Owned by HW */
> +#define END2_W7_F0_PRIORITY        PPC_BITMASK32(8, 15)
> +#define END2_W7_F1_LOG_SERVER_ID   PPC_BITMASK32(4, 31)
> +} Xive2End;
> +
> +#define xive2_end_is_valid(end)    (be32_to_cpu((end)->w0) & END2_W0_VAL=
ID)
> +#define xive2_end_is_enqueue(end)  (be32_to_cpu((end)->w0) & END2_W0_ENQ=
UEUE)
> +#define xive2_end_is_notify(end)                \
> +    (be32_to_cpu((end)->w0) & END2_W0_UCOND_NOTIFY)
> +#define xive2_end_is_backlog(end)  (be32_to_cpu((end)->w0) & END2_W0_BAC=
KLOG)
> +#define xive2_end_is_escalate(end)                      \
> +    (be32_to_cpu((end)->w0) & END2_W0_ESCALATE_CTL)
> +#define xive2_end_is_uncond_escalation(end)              \
> +    (be32_to_cpu((end)->w0) & END2_W0_UNCOND_ESCALATE)
> +#define xive2_end_is_silent_escalation(end)              \
> +    (be32_to_cpu((end)->w0) & END2_W0_SILENT_ESCALATE)
> +#define xive2_end_is_escalate_end(end)              \
> +    (be32_to_cpu((end)->w0) & END2_W0_ESCALATE_END)
> +#define xive2_end_is_firmware1(end)              \
> +    (be32_to_cpu((end)->w0) & END2_W0_FIRMWARE1)
> +#define xive2_end_is_firmware2(end)              \
> +    (be32_to_cpu((end)->w0) & END2_W0_FIRMWARE2)
> +
> +static inline uint64_t xive2_end_qaddr(Xive2End *end)
> +{
> +    return ((uint64_t) be32_to_cpu(end->w2) & END2_W2_EQ_ADDR_HI) << 32 |
> +        (be32_to_cpu(end->w3) & END2_W3_EQ_ADDR_LO);
> +}
> +
> +void xive2_end_pic_print_info(Xive2End *end, uint32_t end_idx, Monitor *=
mon);
> +void xive2_end_queue_pic_print_info(Xive2End *end, uint32_t width,
> +                                    Monitor *mon);
> +void xive2_end_eas_pic_print_info(Xive2End *end, uint32_t end_idx,
> +                                   Monitor *mon);
> +
> +/*
> + * Notification Virtual Processor (NVP)
> + */
> +typedef struct Xive2Nvp {
> +        uint32_t       w0;
> +#define NVP2_W0_VALID              PPC_BIT32(0)
> +#define NVP2_W0_ESC_END            PPC_BIT32(25) /* 'N' bit 0:ESB  1:END=
 */
> +        uint32_t       w1;
> +        uint32_t       w2;
> +#define NVP2_W2_IPB                PPC_BITMASK32(8, 15)
> +        uint32_t       w3;
> +        uint32_t       w4;
> +#define NVP2_W4_ESC_ESB_BLOCK      PPC_BITMASK32(0, 3)  /* N:0 */
> +#define NVP2_W4_ESC_ESB_INDEX      PPC_BITMASK32(4, 31) /* N:0 */
> +#define NVP2_W4_ESC_END_BLOCK      PPC_BITMASK32(4, 7)  /* N:1 */
> +#define NVP2_W4_ESC_END_INDEX      PPC_BITMASK32(8, 31) /* N:1 */
> +        uint32_t       w5;
> +#define NVP2_W5_PSIZE              PPC_BITMASK32(0, 1)
> +#define NVP2_W5_VP_END_BLOCK       PPC_BITMASK32(4, 7)
> +#define NVP2_W5_VP_END_INDEX       PPC_BITMASK32(8, 31)
> +        uint32_t       w6;
> +        uint32_t       w7;
> +} Xive2Nvp;
> +
> +#define xive2_nvp_is_valid(nvp)    (be32_to_cpu((nvp)->w0) & NVP2_W0_VAL=
ID)
> +
> +/*
> + * The VP number space in a block is defined by the END2_W6_VP_OFFSET
> + * field of the XIVE END. When running in Gen1 mode (P9 compat mode),
> + * the VP space is reduced to (1 << 19) VPs per block
> + */
> +#define XIVE2_NVP_SHIFT              24
> +#define XIVE2_NVP_COUNT              (1 << XIVE2_NVP_SHIFT)
> +
> +static inline uint32_t xive2_nvp_cam_line(uint8_t nvp_blk, uint32_t nvp_=
idx)
> +{
> +    return (nvp_blk << XIVE2_NVP_SHIFT) | nvp_idx;
> +}
> +
> +static inline uint32_t xive2_nvp_idx(uint32_t cam_line)
> +{
> +    return cam_line & ((1 << XIVE2_NVP_SHIFT) - 1);
> +}
> +
> +static inline uint32_t xive2_nvp_blk(uint32_t cam_line)
> +{
> +    return (cam_line >> XIVE2_NVP_SHIFT) & 0xf;
> +}
> +
> +/*
> + * Notification Virtual Group or Crowd (NVG/NVC)
> + */
> +typedef struct Xive2Nvgc {
> +        uint32_t        w0;
> +#define NVGC2_W0_VALID             PPC_BIT32(0)
> +        uint32_t        w1;
> +        uint32_t        w2;
> +        uint32_t        w3;
> +        uint32_t        w4;
> +        uint32_t        w5;
> +        uint32_t        w6;
> +        uint32_t        w7;
> +} Xive2Nvgc;
> +
> +#endif /* PPC_XIVE2_REGS_H */
> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
> new file mode 100644
> index 000000000000..b1c216b10006
> --- /dev/null
> +++ b/hw/intc/xive2.c
> @@ -0,0 +1,672 @@
> +/*
> + * QEMU PowerPC XIVE2 interrupt controller model (POWER10)
> + *
> + * Copyright (c) 2019-2021, IBM Corporation..
> + *
> + * This code is licensed under the GPL version 2 or later. See the
> + * COPYING file in the top-level directory.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu/log.h"
> +#include "qemu/module.h"
> +#include "qapi/error.h"
> +#include "target/ppc/cpu.h"
> +#include "sysemu/cpus.h"
> +#include "sysemu/dma.h"
> +#include "hw/qdev-properties.h"
> +#include "monitor/monitor.h"
> +#include "hw/ppc/xive.h"
> +#include "hw/ppc/xive2.h"
> +#include "hw/ppc/xive2_regs.h"
> +
> +static uint8_t priority_to_ipb(uint8_t priority)
> +{
> +    return priority > XIVE_PRIORITY_MAX ?
> +        0 : 1 << (XIVE_PRIORITY_MAX - priority);
> +}

This is identical to the XIVE1 version, couldn't you share it by
putting it in a header?

> +void xive2_eas_pic_print_info(Xive2Eas *eas, uint32_t lisn, Monitor *mon)
> +{
> +    if (!xive2_eas_is_valid(eas)) {
> +        return;
> +    }
> +
> +    monitor_printf(mon, "  %08x %s end:%02x/%04x data:%08x\n",
> +                   lisn, xive2_eas_is_masked(eas) ? "M" : " ",
> +                   (uint8_t)  xive_get_field64(EAS2_END_BLOCK, eas->w),
> +                   (uint32_t) xive_get_field64(EAS2_END_INDEX, eas->w),
> +                   (uint32_t) xive_get_field64(EAS2_END_DATA, eas->w));
> +}
> +
> +void xive2_end_queue_pic_print_info(Xive2End *end, uint32_t width,
> +                                    Monitor *mon)
> +{
> +    uint64_t qaddr_base =3D xive2_end_qaddr(end);
> +    uint32_t qsize =3D xive_get_field32(END2_W3_QSIZE, end->w3);
> +    uint32_t qindex =3D xive_get_field32(END2_W1_PAGE_OFF, end->w1);
> +    uint32_t qentries =3D 1 << (qsize + 10);
> +    int i;
> +
> +    /*
> +     * print out the [ (qindex - (width - 1)) .. (qindex + 1)] window
> +     */
> +    monitor_printf(mon, " [ ");
> +    qindex =3D (qindex - (width - 1)) & (qentries - 1);
> +    for (i =3D 0; i < width; i++) {
> +        uint64_t qaddr =3D qaddr_base + (qindex << 2);
> +        uint32_t qdata =3D -1;
> +
> +        if (dma_memory_read(&address_space_memory, qaddr, &qdata,
> +                            sizeof(qdata))) {
> +            qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to read EQ @0x%"
> +                          HWADDR_PRIx "\n", qaddr);
> +            return;
> +        }
> +        monitor_printf(mon, "%s%08x ", i =3D=3D width - 1 ? "^" : "",
> +                       be32_to_cpu(qdata));
> +        qindex =3D (qindex + 1) & (qentries - 1);
> +    }
> +    monitor_printf(mon, "]");
> +}
> +
> +void xive2_end_pic_print_info(Xive2End *end, uint32_t end_idx, Monitor *=
mon)
> +{
> +    uint64_t qaddr_base =3D xive2_end_qaddr(end);
> +    uint32_t qindex =3D xive_get_field32(END2_W1_PAGE_OFF, end->w1);
> +    uint32_t qgen =3D xive_get_field32(END2_W1_GENERATION, end->w1);
> +    uint32_t qsize =3D xive_get_field32(END2_W3_QSIZE, end->w3);
> +    uint32_t qentries =3D 1 << (qsize + 10);
> +
> +    uint32_t nvp_blk =3D xive_get_field32(END2_W6_VP_BLOCK, end->w6);
> +    uint32_t nvp_idx =3D xive_get_field32(END2_W6_VP_OFFSET, end->w6);
> +    uint8_t priority =3D xive_get_field32(END2_W7_F0_PRIORITY, end->w7);
> +    uint8_t pq;
> +
> +    if (!xive2_end_is_valid(end)) {
> +        return;
> +    }
> +
> +    pq =3D xive_get_field32(END2_W1_ESn, end->w1);
> +
> +    monitor_printf(mon,
> +                   "  %08x %c%c %c%c%c%c%c%c%c%c%c%c prio:%d nvp:%02x/%0=
4x",
> +                   end_idx,
> +                   pq & XIVE_ESB_VAL_P ? 'P' : '-',
> +                   pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
> +                   xive2_end_is_valid(end)    ? 'v' : '-',
> +                   xive2_end_is_enqueue(end)  ? 'q' : '-',
> +                   xive2_end_is_notify(end)   ? 'n' : '-',
> +                   xive2_end_is_backlog(end)  ? 'b' : '-',
> +                   xive2_end_is_escalate(end) ? 'e' : '-',
> +                   xive2_end_is_escalate_end(end) ? 'N' : '-',
> +                   xive2_end_is_uncond_escalation(end)   ? 'u' : '-',
> +                   xive2_end_is_silent_escalation(end)   ? 's' : '-',
> +                   xive2_end_is_firmware1(end)   ? 'f' : '-',
> +                   xive2_end_is_firmware2(end)   ? 'F' : '-',
> +                   priority, nvp_blk, nvp_idx);
> +
> +    if (qaddr_base) {
> +        monitor_printf(mon, " eq:@%08"PRIx64"% 6d/%5d ^%d",
> +                       qaddr_base, qindex, qentries, qgen);
> +        xive2_end_queue_pic_print_info(end, 6, mon);
> +    }
> +    monitor_printf(mon, "\n");
> +}
> +
> +void xive2_end_eas_pic_print_info(Xive2End *end, uint32_t end_idx,
> +                                  Monitor *mon)
> +{
> +    Xive2Eas *eas =3D (Xive2Eas *) &end->w4;
> +    uint8_t pq;
> +
> +    if (!xive2_end_is_escalate(end)) {
> +        return;
> +    }
> +
> +    pq =3D xive_get_field32(END2_W1_ESe, end->w1);
> +
> +    monitor_printf(mon, "  %08x %c%c %c%c end:%02x/%04x data:%08x\n",
> +                   end_idx,
> +                   pq & XIVE_ESB_VAL_P ? 'P' : '-',
> +                   pq & XIVE_ESB_VAL_Q ? 'Q' : '-',
> +                   xive2_eas_is_valid(eas) ? 'v' : ' ',
> +                   xive2_eas_is_masked(eas) ? 'M' : ' ',
> +                   (uint8_t)  xive_get_field64(EAS2_END_BLOCK, eas->w),
> +                   (uint32_t) xive_get_field64(EAS2_END_INDEX, eas->w),
> +                   (uint32_t) xive_get_field64(EAS2_END_DATA, eas->w));
> +}
> +
> +static void xive2_end_enqueue(Xive2End *end, uint32_t data)
> +{
> +    uint64_t qaddr_base =3D xive2_end_qaddr(end);
> +    uint32_t qsize =3D xive_get_field32(END2_W3_QSIZE, end->w3);
> +    uint32_t qindex =3D xive_get_field32(END2_W1_PAGE_OFF, end->w1);
> +    uint32_t qgen =3D xive_get_field32(END2_W1_GENERATION, end->w1);
> +
> +    uint64_t qaddr =3D qaddr_base + (qindex << 2);
> +    uint32_t qdata =3D cpu_to_be32((qgen << 31) | (data & 0x7fffffff));
> +    uint32_t qentries =3D 1 << (qsize + 10);
> +
> +    if (dma_memory_write(&address_space_memory, qaddr, &qdata, sizeof(qd=
ata))) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: failed to write END data @=
0x%"
> +                      HWADDR_PRIx "\n", qaddr);
> +        return;
> +    }
> +
> +    qindex =3D (qindex + 1) & (qentries - 1);
> +    if (qindex =3D=3D 0) {
> +        qgen ^=3D 1;
> +        end->w1 =3D xive_set_field32(END2_W1_GENERATION, end->w1, qgen);
> +
> +        /* TODO(PowerNV): reset GF bit on a cache watch operation */
> +        end->w1 =3D xive_set_field32(END2_W1_GEN_FLIPPED, end->w1, qgen);
> +    }
> +    end->w1 =3D xive_set_field32(END2_W1_PAGE_OFF, end->w1, qindex);
> +}
> +/*
> + * XIVE Router (aka. Virtualization Controller or IVRE)
> + */
> +
> +int xive2_router_get_eas(Xive2Router *xrtr, uint8_t eas_blk, uint32_t ea=
s_idx,
> +                         Xive2Eas *eas)
> +{
> +    Xive2RouterClass *xrc =3D XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +    return xrc->get_eas(xrtr, eas_blk, eas_idx, eas);
> +}
> +
> +int xive2_router_get_end(Xive2Router *xrtr, uint8_t end_blk, uint32_t en=
d_idx,
> +                         Xive2End *end)
> +{
> +   Xive2RouterClass *xrc =3D XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +   return xrc->get_end(xrtr, end_blk, end_idx, end);
> +}
> +
> +int xive2_router_write_end(Xive2Router *xrtr, uint8_t end_blk, uint32_t =
end_idx,
> +                           Xive2End *end, uint8_t word_number)
> +{
> +   Xive2RouterClass *xrc =3D XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +   return xrc->write_end(xrtr, end_blk, end_idx, end, word_number);
> +}
> +
> +int xive2_router_get_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t nv=
p_idx,
> +                         Xive2Nvp *nvp)
> +{
> +   Xive2RouterClass *xrc =3D XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +   return xrc->get_nvp(xrtr, nvp_blk, nvp_idx, nvp);
> +}
> +
> +int xive2_router_write_nvp(Xive2Router *xrtr, uint8_t nvp_blk, uint32_t =
nvp_idx,
> +                           Xive2Nvp *nvp, uint8_t word_number)
> +{
> +   Xive2RouterClass *xrc =3D XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +   return xrc->write_nvp(xrtr, nvp_blk, nvp_idx, nvp, word_number);
> +}
> +
> +static int xive2_router_get_block_id(Xive2Router *xrtr)
> +{
> +   Xive2RouterClass *xrc =3D XIVE2_ROUTER_GET_CLASS(xrtr);
> +
> +   return xrc->get_block_id(xrtr);
> +}
> +
> +static void xive2_router_realize(DeviceState *dev, Error **errp)
> +{
> +    Xive2Router *xrtr =3D XIVE2_ROUTER(dev);
> +
> +    assert(xrtr->xfb);
> +}
> +
> +/*
> + * Notification using the END ESe/ESn bit (Event State Buffer for
> + * escalation and notification). Profide futher coalescing in the
> + * Router.
> + */
> +static bool xive2_router_end_es_notify(Xive2Router *xrtr, uint8_t end_bl=
k,
> +                                       uint32_t end_idx, Xive2End *end,
> +                                       uint32_t end_esmask)
> +{
> +    uint8_t pq =3D xive_get_field32(end_esmask, end->w1);
> +    bool notify =3D xive_esb_trigger(&pq);
> +
> +    if (pq !=3D xive_get_field32(end_esmask, end->w1)) {
> +        end->w1 =3D xive_set_field32(end_esmask, end->w1, pq);
> +        xive2_router_write_end(xrtr, end_blk, end_idx, end, 1);
> +    }
> +
> +    /* ESe/n[Q]=3D1 : end of notification */
> +    return notify;
> +}
> +
> +/*
> + * An END trigger can come from an event trigger (IPI or HW) or from
> + * another chip. We don't model the PowerBus but the END trigger
> + * message has the same parameters than in the function below.
> + */
> +static void xive2_router_end_notify(Xive2Router *xrtr, uint8_t end_blk,
> +                                    uint32_t end_idx, uint32_t end_data)
> +{
> +    Xive2End end;
> +    uint8_t priority;
> +    uint8_t format;
> +    bool found;
> +    Xive2Nvp nvp;
> +    uint8_t nvp_blk;
> +    uint32_t nvp_idx;
> +
> +    /* END cache lookup */
> +    if (xive2_router_get_end(xrtr, end_blk, end_idx, &end)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: No END %x/%x\n", end_blk,
> +                      end_idx);
> +        return;
> +    }
> +
> +    if (!xive2_end_is_valid(&end)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: END %x/%x is invalid\n",
> +                      end_blk, end_idx);
> +        return;
> +    }
> +
> +    if (xive2_end_is_enqueue(&end)) {
> +        xive2_end_enqueue(&end, end_data);
> +        /* Enqueuing event data modifies the EQ toggle and index */
> +        xive2_router_write_end(xrtr, end_blk, end_idx, &end, 1);
> +    }
> +
> +    /*
> +     * When the END is silent, we skip the notification part.
> +     */
> +    if (xive2_end_is_silent_escalation(&end)) {
> +        goto do_escalation;
> +    }
> +
> +    /*
> +     * The W7 format depends on the F bit in W6. It defines the type
> +     * of the notification :
> +     *
> +     *   F=3D0 : single or multiple NVP notification
> +     *   F=3D1 : User level Event-Based Branch (EBB) notification, no
> +     *         priority
> +     */
> +    format =3D xive_get_field32(END2_W6_FORMAT_BIT, end.w6);
> +    priority =3D xive_get_field32(END2_W7_F0_PRIORITY, end.w7);
> +
> +    /* The END is masked */
> +    if (format =3D=3D 0 && priority =3D=3D 0xff) {
> +        return;
> +    }
> +
> +    /*
> +     * Check the END ESn (Event State Buffer for notification) for
> +     * even futher coalescing in the Router
> +     */
> +    if (!xive2_end_is_notify(&end)) {
> +        /* ESn[Q]=3D1 : end of notification */
> +        if (!xive2_router_end_es_notify(xrtr, end_blk, end_idx,
> +                                       &end, END2_W1_ESn)) {
> +            return;
> +        }
> +    }
> +
> +    /*
> +     * Follows IVPE notification
> +     */
> +    nvp_blk =3D xive_get_field32(END2_W6_VP_BLOCK, end.w6);
> +    nvp_idx =3D xive_get_field32(END2_W6_VP_OFFSET, end.w6);
> +
> +    /* NVP cache lookup */
> +    if (xive2_router_get_nvp(xrtr, nvp_blk, nvp_idx, &nvp)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: no NVP %x/%x\n",
> +                      nvp_blk, nvp_idx);
> +        return;
> +    }
> +
> +    if (!xive2_nvp_is_valid(&nvp)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: NVP %x/%x is invalid\n",
> +                      nvp_blk, nvp_idx);
> +        return;
> +    }
> +
> +    found =3D xive_presenter_notify(xrtr->xfb, format, nvp_blk, nvp_idx,
> +                          xive_get_field32(END2_W6_IGNORE, end.w7),
> +                          priority,
> +                          xive_get_field32(END2_W7_F1_LOG_SERVER_ID, end=
=2Ew7));
> +
> +    /* TODO: Auto EOI. */
> +
> +    if (found) {
> +        return;
> +    }
> +
> +    /*
> +     * If no matching NVP is dispatched on a HW thread :
> +     * - specific VP: update the NVP structure if backlog is activated
> +     * - logical server : forward request to IVPE (not supported)
> +     */
> +    if (xive2_end_is_backlog(&end)) {
> +        uint8_t ipb;
> +
> +        if (format =3D=3D 1) {
> +            qemu_log_mask(LOG_GUEST_ERROR,
> +                          "XIVE: END %x/%x invalid config: F1 & backlog\=
n",
> +                          end_blk, end_idx);
> +            return;
> +        }
> +
> +        /*
> +         * Record the IPB in the associated NVP structure for later
> +         * use. The presenter will resend the interrupt when the vCPU
> +         * is dispatched again on a HW thread.
> +         */
> +        ipb =3D xive_get_field32(NVP2_W2_IPB, nvp.w2) |
> +            priority_to_ipb(priority);
> +        nvp.w2 =3D xive_set_field32(NVP2_W2_IPB, nvp.w2, ipb);
> +        xive2_router_write_nvp(xrtr, nvp_blk, nvp_idx, &nvp, 2);
> +
> +        /*
> +         * On HW, follows a "Broadcast Backlog" to IVPEs
> +         */
> +    }
> +
> +do_escalation:
> +    /*
> +     * If activated, escalate notification using the ESe PQ bits and
> +     * the EAS in w4-5
> +     */
> +    if (!xive2_end_is_escalate(&end)) {
> +        return;
> +    }
> +
> +    /*
> +     * Check the END ESe (Event State Buffer for escalation) for even
> +     * futher coalescing in the Router
> +     */
> +    if (!xive2_end_is_uncond_escalation(&end)) {
> +        /* ESe[Q]=3D1 : end of escalation notification */
> +        if (!xive2_router_end_es_notify(xrtr, end_blk, end_idx,
> +                                       &end, END2_W1_ESe)) {
> +            return;
> +        }
> +    }
> +
> +    /*
> +     * The END trigger becomes an Escalation trigger
> +     */
> +    xive2_router_end_notify(xrtr,
> +                           xive_get_field32(END2_W4_END_BLOCK,     end.w=
4),
> +                           xive_get_field32(END2_W4_ESC_END_INDEX, end.w=
4),
> +                           xive_get_field32(END2_W5_ESC_END_DATA,  end.w=
5));
> +}
> +
> +void xive2_router_notify(XiveNotifier *xn, uint32_t lisn)
> +{
> +    Xive2Router *xrtr =3D XIVE2_ROUTER(xn);
> +    uint8_t eas_blk =3D XIVE_EAS_BLOCK(lisn);
> +    uint32_t eas_idx =3D XIVE_EAS_INDEX(lisn);
> +    Xive2Eas eas;
> +
> +    /* EAS cache lookup */
> +    if (xive2_router_get_eas(xrtr, eas_blk, eas_idx, &eas)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: Unknown LISN %x\n", lisn);
> +        return;
> +    }
> +
> +    if (!xive2_eas_is_valid(&eas)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: Invalid LISN %x\n", lisn);
> +        return;
> +    }
> +
> +    if (xive2_eas_is_masked(&eas)) {
> +        /* Notification completed */
> +        return;
> +    }
> +
> +    /*
> +     * The event trigger becomes an END trigger
> +     */
> +    xive2_router_end_notify(xrtr,
> +                             xive_get_field64(EAS2_END_BLOCK, eas.w),
> +                             xive_get_field64(EAS2_END_INDEX, eas.w),
> +                             xive_get_field64(EAS2_END_DATA,  eas.w));
> +}
> +
> +static Property xive2_router_properties[] =3D {
> +    DEFINE_PROP_LINK("xive-fabric", Xive2Router, xfb,
> +                     TYPE_XIVE_FABRIC, XiveFabric *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void xive2_router_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +    XiveNotifierClass *xnc =3D XIVE_NOTIFIER_CLASS(klass);
> +
> +    dc->desc    =3D "XIVE2 Router Engine";
> +    device_class_set_props(dc, xive2_router_properties);
> +    /* Parent is SysBusDeviceClass. No need to call its realize hook */
> +    dc->realize =3D xive2_router_realize;
> +    xnc->notify =3D xive2_router_notify;
> +}
> +
> +static const TypeInfo xive2_router_info =3D {
> +    .name          =3D TYPE_XIVE2_ROUTER,
> +    .parent        =3D TYPE_SYS_BUS_DEVICE,
> +    .abstract      =3D true,
> +    .instance_size =3D sizeof(Xive2Router),
> +    .class_size    =3D sizeof(Xive2RouterClass),
> +    .class_init    =3D xive2_router_class_init,
> +    .interfaces    =3D (InterfaceInfo[]) {
> +        { TYPE_XIVE_NOTIFIER },
> +        { TYPE_XIVE_PRESENTER },
> +        { }
> +    }
> +};
> +
> +static inline bool addr_is_even(hwaddr addr, uint32_t shift)
> +{
> +    return !((addr >> shift) & 1);
> +}
> +
> +static uint64_t xive2_end_source_read(void *opaque, hwaddr addr, unsigne=
d size)
> +{
> +    Xive2EndSource *xsrc =3D XIVE2_END_SOURCE(opaque);
> +    uint32_t offset =3D addr & 0xFFF;
> +    uint8_t end_blk;
> +    uint32_t end_idx;
> +    Xive2End end;
> +    uint32_t end_esmask;
> +    uint8_t pq;
> +    uint64_t ret;
> +
> +    /*
> +     * The block id should be deduced from the load address on the END
> +     * ESB MMIO but our model only supports a single block per XIVE chip.
> +     */
> +    end_blk =3D xive2_router_get_block_id(xsrc->xrtr);
> +    end_idx =3D addr >> (xsrc->esb_shift + 1);
> +
> +    if (xive2_router_get_end(xsrc->xrtr, end_blk, end_idx, &end)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: No END %x/%x\n", end_blk,
> +                      end_idx);
> +        return -1;
> +    }
> +
> +    if (!xive2_end_is_valid(&end)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: END %x/%x is invalid\n",
> +                      end_blk, end_idx);
> +        return -1;
> +    }
> +
> +    end_esmask =3D addr_is_even(addr, xsrc->esb_shift) ? END2_W1_ESn :
> +        END2_W1_ESe;
> +    pq =3D xive_get_field32(end_esmask, end.w1);
> +
> +    switch (offset) {
> +    case XIVE_ESB_LOAD_EOI ... XIVE_ESB_LOAD_EOI + 0x7FF:
> +        ret =3D xive_esb_eoi(&pq);
> +
> +        /* Forward the source event notification for routing ?? */
> +        break;
> +
> +    case XIVE_ESB_GET ... XIVE_ESB_GET + 0x3FF:
> +        ret =3D pq;
> +        break;
> +
> +    case XIVE_ESB_SET_PQ_00 ... XIVE_ESB_SET_PQ_00 + 0x0FF:
> +    case XIVE_ESB_SET_PQ_01 ... XIVE_ESB_SET_PQ_01 + 0x0FF:
> +    case XIVE_ESB_SET_PQ_10 ... XIVE_ESB_SET_PQ_10 + 0x0FF:
> +    case XIVE_ESB_SET_PQ_11 ... XIVE_ESB_SET_PQ_11 + 0x0FF:
> +        ret =3D xive_esb_set(&pq, (offset >> 8) & 0x3);
> +        break;
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid END ESB load addr =
%d\n",
> +                      offset);
> +        return -1;
> +    }
> +
> +    if (pq !=3D xive_get_field32(end_esmask, end.w1)) {
> +        end.w1 =3D xive_set_field32(end_esmask, end.w1, pq);
> +        xive2_router_write_end(xsrc->xrtr, end_blk, end_idx, &end, 1);
> +    }
> +
> +    return ret;
> +}
> +
> +static void xive2_end_source_write(void *opaque, hwaddr addr,
> +                                   uint64_t value, unsigned size)
> +{
> +    Xive2EndSource *xsrc =3D XIVE2_END_SOURCE(opaque);
> +    uint32_t offset =3D addr & 0xFFF;
> +    uint8_t end_blk;
> +    uint32_t end_idx;
> +    Xive2End end;
> +    uint32_t end_esmask;
> +    uint8_t pq;
> +    bool notify =3D false;
> +
> +    /*
> +     * The block id should be deduced from the load address on the END
> +     * ESB MMIO but our model only supports a single block per XIVE chip.
> +     */
> +    end_blk =3D xive2_router_get_block_id(xsrc->xrtr);
> +    end_idx =3D addr >> (xsrc->esb_shift + 1);
> +
> +    if (xive2_router_get_end(xsrc->xrtr, end_blk, end_idx, &end)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: No END %x/%x\n", end_blk,
> +                      end_idx);
> +        return;
> +    }
> +
> +    if (!xive2_end_is_valid(&end)) {
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: END %x/%x is invalid\n",
> +                      end_blk, end_idx);
> +        return;
> +    }
> +
> +    end_esmask =3D addr_is_even(addr, xsrc->esb_shift) ? END2_W1_ESn :
> +        END2_W1_ESe;
> +    pq =3D xive_get_field32(end_esmask, end.w1);
> +
> +    switch (offset) {
> +    case 0 ... 0x3FF:
> +        notify =3D xive_esb_trigger(&pq);
> +        break;
> +
> +    case XIVE_ESB_STORE_EOI ... XIVE_ESB_STORE_EOI + 0x3FF:
> +        /* TODO: can we check StoreEOI availability from the router ? */
> +        notify =3D xive_esb_eoi(&pq);
> +        break;
> +
> +    default:
> +        qemu_log_mask(LOG_GUEST_ERROR, "XIVE: invalid END ESB write addr=
 %d\n",
> +                      offset);
> +        return;
> +    }
> +
> +    if (pq !=3D xive_get_field32(end_esmask, end.w1)) {
> +        end.w1 =3D xive_set_field32(end_esmask, end.w1, pq);
> +        xive2_router_write_end(xsrc->xrtr, end_blk, end_idx, &end, 1);
> +    }
> +
> +    /* TODO: Forward the source event notification for routing */
> +    if (notify) {
> +        ;
> +    }
> +}
> +
> +static const MemoryRegionOps xive2_end_source_ops =3D {
> +    .read =3D xive2_end_source_read,
> +    .write =3D xive2_end_source_write,
> +    .endianness =3D DEVICE_BIG_ENDIAN,
> +    .valid =3D {
> +        .min_access_size =3D 8,
> +        .max_access_size =3D 8,
> +    },
> +    .impl =3D {
> +        .min_access_size =3D 8,
> +        .max_access_size =3D 8,
> +    },
> +};
> +
> +static void xive2_end_source_realize(DeviceState *dev, Error **errp)
> +{
> +    Xive2EndSource *xsrc =3D XIVE2_END_SOURCE(dev);
> +
> +    assert(xsrc->xrtr);
> +
> +    if (!xsrc->nr_ends) {
> +        error_setg(errp, "Number of interrupt needs to be greater than 0=
");
> +        return;
> +    }
> +
> +    if (xsrc->esb_shift !=3D XIVE_ESB_4K &&
> +        xsrc->esb_shift !=3D XIVE_ESB_64K) {
> +        error_setg(errp, "Invalid ESB shift setting");
> +        return;
> +    }
> +
> +    /*
> +     * Each END is assigned an even/odd pair of MMIO pages, the even page
> +     * manages the ESn field while the odd page manages the ESe field.
> +     */
> +    memory_region_init_io(&xsrc->esb_mmio, OBJECT(xsrc),
> +                          &xive2_end_source_ops, xsrc, "xive.end",
> +                          (1ull << (xsrc->esb_shift + 1)) * xsrc->nr_end=
s);
> +}
> +
> +static Property xive2_end_source_properties[] =3D {
> +    DEFINE_PROP_UINT32("nr-ends", Xive2EndSource, nr_ends, 0),
> +    DEFINE_PROP_UINT32("shift", Xive2EndSource, esb_shift, XIVE_ESB_64K),
> +    DEFINE_PROP_LINK("xive", Xive2EndSource, xrtr, TYPE_XIVE2_ROUTER,
> +                     Xive2Router *),
> +    DEFINE_PROP_END_OF_LIST(),
> +};
> +
> +static void xive2_end_source_class_init(ObjectClass *klass, void *data)
> +{
> +    DeviceClass *dc =3D DEVICE_CLASS(klass);
> +
> +    dc->desc    =3D "XIVE END Source";
> +    device_class_set_props(dc, xive2_end_source_properties);
> +    dc->realize =3D xive2_end_source_realize;
> +}
> +
> +static const TypeInfo xive2_end_source_info =3D {
> +    .name          =3D TYPE_XIVE2_END_SOURCE,
> +    .parent        =3D TYPE_DEVICE,
> +    .instance_size =3D sizeof(Xive2EndSource),
> +    .class_init    =3D xive2_end_source_class_init,
> +};
> +
> +static void xive2_register_types(void)
> +{
> +    type_register_static(&xive2_router_info);
> +    type_register_static(&xive2_end_source_info);
> +}
> +
> +type_init(xive2_register_types)
> diff --git a/hw/intc/meson.build b/hw/intc/meson.build
> index 6e52a166e38a..42af518f1c48 100644
> --- a/hw/intc/meson.build
> +++ b/hw/intc/meson.build
> @@ -39,7 +39,7 @@ specific_ss.add(when: 'CONFIG_OMAP', if_true: files('om=
ap_intc.c'))
>  specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
>  specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_OPENPIC'],
>  		if_true: files('openpic_kvm.c'))
> -specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pn=
v_xive.c'))
> +specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pn=
v_xive.c', 'pnv_xive2.c'))
>  specific_ss.add(when: 'CONFIG_PPC_UIC', if_true: files('ppc-uic.c'))
>  specific_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c', 'bc=
m2836_control.c'))
>  specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('rx_icu.c'))
> @@ -48,7 +48,7 @@ specific_ss.add(when: 'CONFIG_S390_FLIC_KVM', if_true: =
files('s390_flic_kvm.c'))
>  specific_ss.add(when: 'CONFIG_SH_INTC', if_true: files('sh_intc.c'))
>  specific_ss.add(when: 'CONFIG_SIFIVE_CLINT', if_true: files('sifive_clin=
t.c'))
>  specific_ss.add(when: 'CONFIG_SIFIVE_PLIC', if_true: files('sifive_plic.=
c'))
> -specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c'))
> +specific_ss.add(when: 'CONFIG_XICS', if_true: files('xics.c', 'xive2.c'))
>  specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XICS'],
>  		if_true: files('xics_kvm.c'))
>  specific_ss.add(when: 'CONFIG_PSERIES', if_true: files('xics_spapr.c', '=
spapr_xive.c'))

--=20
David Gibson			| I'll have my music baroque, and my code
david AT gibson.dropbear.id.au	| minimalist, thank you.  NOT _the_ _other_
				| _way_ _around_!
http://www.ozlabs.org/~dgibson

--VD7A2DyUtwPGj1By
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEdfRlhq5hpmzETofcbDjKyiDZs5IFAmESF2sACgkQbDjKyiDZ
s5KgZhAAyVwKarTdXKJ6c7kxAm8LAKCLRkRIGUWQ6Y5zhFXGHHQQLk+mSaT6tQOs
NeRxdSGCCal1PZajJxonhap2idOsChKJS8zo/r1GFFTb2KXU268RXeC3w6H4Yzwd
/Ztc2nYARLbV46yWqu01NzAOkRCyiKQSNphy3g3gy/8agyDjUcGXjegY0ttz1frc
8Kh9RfGxoBGsmflhWwpDglAe/q8seBw5Y+gSLnxsxXG8/mS4JNVLkO0uQ9zw2Yzy
Rs7dhf7l6vK5ziDjds90iLfysI+cdtCIkcLr3jBP2AScVyjWvp7wILsiwfcVldl8
GYoJ2h81ee3WiE+EsAifQFztT0cd/epX9rIQLbnr7N3W17Am1PbamVevncjZiIvw
4DpDvBlERTCLP4KCMlHn7zHal58jlMEL+I/KU0fSDAI1m6NKKK1gyNKmsU7gz6Mp
U3jz45VwcEvGttxpDCd2/sXmP5B0r2CCMo1hNaOaRIzVdAKDicIs+4AjCqBrRF0p
cHu6aY6lHZ/MW+rfVzbZIFFFrqfF2KoFnNnFIqczaRqydzduD8VQo7R0Jp1IdZnU
cNPIXrT6Kd1NLAd7OHO1lujShjm/J3MVZjbEIpJgP7rrOki2uP1VBnfGV5GBIner
U4qh2MIj0kRGE3CkukUqwOmKB1tsUO56/Q6boxALYH9AnC4swUc=
=KiaO
-----END PGP SIGNATURE-----

--VD7A2DyUtwPGj1By--

