Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31BD654A8BC
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 07:27:40 +0200 (CEST)
Received: from localhost ([::1]:48888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0z5X-0007Hd-9U
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 01:27:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>) id 1o0ywP-0002zm-9I
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:18:13 -0400
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836]:44754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dz4list@gmail.com>) id 1o0ywL-00015E-ON
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 01:18:13 -0400
Received: by mail-qt1-x836.google.com with SMTP id t21so5381972qtw.11
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 22:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=4VlZisspERIkoocSsUymFUVBaIPYdtmXmY5RXzUtVck=;
 b=BKPZX6crtC5GM5KRr6eh/jZFc2utQQ/JZF3DjGsLNIPxy8cjgtXmHTTUSvPBt9UdbF
 rypzHcH0CZSPbG6teqqvx22gmpl4DghHNyCSS2oDjcFHr+WV1HX+n+YPsxxI6MuVcLwV
 BSGxhKofp1anUYCvLNppzmst7ivyfpb2Lsdu7/XdTQLuoYxs9GjRRFK+nu+WQ+NfYHpS
 9dedEyGyk8BSrRBjT1hQXW+6DPltU/SbyZRDQlsSM/JkHMggOhEi+C83Io4kG8dPZf6W
 gYjrpJk4CLfYlMUqs77vyX2uwITufdfIsG4ObgnIFq+5l+4BPmw3ViSpEAa3EnpJrSG4
 /I8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to
 :content-transfer-encoding;
 bh=4VlZisspERIkoocSsUymFUVBaIPYdtmXmY5RXzUtVck=;
 b=EIhjYAvZHk1OBvUkLKaSUZufCcynu/PYcHdRlsvo1ruuiiEW5SGmCAVZvw2fLYm0Vf
 aXSr0ASW2tenZrOLzSndPz1lC11pk7d3iV7UeIIm//nPZcZONKQoe8BTFHFIPetbwjpi
 CkcZdgVJEN/Ra46UUqYd1e0yFxV0K3tKFlWBWtENZJuLM1n7+auI6LdA7V6I6Y2jgVrI
 YevlKcRc40hKH8JDKTgW41jgPxnt9YVhrN3HEKY1yslf5asf7vEZpinG8Z36cUYRIVVk
 oJ04OuxNGLClW3FaqNNwhasH2ea65j9tP5daTWnhMYkZAZ6RCKn4myk46hhHO1ATXQtk
 LSBg==
X-Gm-Message-State: AOAM530bRUoucbv+GGcEVksCS5uPZ29M4cEetk5F3FI/eWhwZ0g6X0nS
 wy6iDRFyZ3kXRF91SfDD3odvCyEc56ElBGpDa2kd8mgW
X-Google-Smtp-Source: ABdhPJyuqiiRaVACqPADRXmkxPvbz+JXcCZFC5taSoR2un/a9kRD08ap7pk8CoKNmJfuXxUPXYScnve028I7Ad7c4yY=
X-Received: by 2002:a05:622a:c8:b0:305:2072:ed36 with SMTP id
 p8-20020a05622a00c800b003052072ed36mr2766744qtw.182.1655183888088; Mon, 13
 Jun 2022 22:18:08 -0700 (PDT)
MIME-Version: 1.0
From: Dan Zhang <dz4list@gmail.com>
Date: Mon, 13 Jun 2022 22:17:56 -0700
Message-ID: <CAJxKyLer-Vnn-J0RxgxpdX-z1F6C=ATuOV0p1NNRiUr3ynUh7w@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] hw: m25p80: add WP# pin and SRWD bit for write
 protection
To: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::836;
 envelope-from=dz4list@gmail.com; helo=mail-qt1-x836.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Thu, Jun 09, 2022 at 08:06:00PM +0000, Peter Delevoryas wrote:
>
>
> > On Jun 9, 2022, at 12:22 PM, Francisco Iglesias <frasse.iglesias@gmail.=
com> wrote:
> >
> > Hi Iris,
> >
> > Looks good some, a couple of comments below.
> >
> > On [2022 Jun 08] Wed 20:13:19, Iris Chen wrote:
> >> From: Iris Chen <irischenlj@gmail.com>
> >>
> >> Signed-off-by: Iris Chen <irischenlj@gmail.com>
> >> ---
> >> Addressed all comments from V1. The biggest change: removed object_cla=
ss_property_add.
> >>
> >> hw/block/m25p80.c             | 37 +++++++++++++++++++++++++++++++++++
> >> tests/qtest/aspeed_smc-test.c |  2 ++
> >> 2 files changed, 39 insertions(+)
> >>
> >> diff --git a/hw/block/m25p80.c b/hw/block/m25p80.c
> >> index 81ba3da4df..1a20bd55d4 100644
> >> --- a/hw/block/m25p80.c
> >> +++ b/hw/block/m25p80.c
> >> @@ -27,12 +27,14 @@
> >> #include "hw/qdev-properties.h"
> >> #include "hw/qdev-properties-system.h"
> >> #include "hw/ssi/ssi.h"
> >> +#include "hw/irq.h"
> >> #include "migration/vmstate.h"
> >> #include "qemu/bitops.h"
> >> #include "qemu/log.h"
> >> #include "qemu/module.h"
> >> #include "qemu/error-report.h"
> >> #include "qapi/error.h"
> >> +#include "qapi/visitor.h"
> >> #include "trace.h"
> >> #include "qom/object.h"
> >>
> >> @@ -472,11 +474,13 @@ struct Flash {
> >>     uint8_t spansion_cr2v;
> >>     uint8_t spansion_cr3v;
> >>     uint8_t spansion_cr4v;
> >> +    bool wp_level;
> >>     bool write_enable;
> >>     bool four_bytes_address_mode;
> >>     bool reset_enable;
> >>     bool quad_enable;
> >>     bool aai_enable;
> >> +    bool status_register_write_disabled;
> >>     uint8_t ear;
> >>
> >>     int64_t dirty_page;
> >> @@ -723,6 +727,21 @@ static void complete_collecting_data(Flash *s)
> >>         flash_erase(s, s->cur_addr, s->cmd_in_progress);
> >>         break;
> >>     case WRSR:
> >> +        /*
> >> +         * If WP# is low and status_register_write_disabled is high,
> >> +         * status register writes are disabled.
> >> +         * This is also called "hardware protected mode" (HPM). All o=
ther
> >> +         * combinations of the two states are called "software protec=
ted mode"
> >> +         * (SPM), and status register writes are permitted.
> >> +         */
> >> +        if ((s->wp_level =3D=3D 0 && s->status_register_write_disable=
d)
> >> +            || !s->write_enable) {
> >
> > 'write_enable' needs to be true in 'decode_new_cmd' when issueing the W=
RSR
> > command, otherwise the state machinery will not advance to this functio=
n
> > (meaning that above check for !s->write_enable will never hit as far as=
 I can
> > tell). A suggestion is to move the check for wp_level and
> > status_reg_wr_disabled into 'decode_new_cmd' to for keeping it consiste=
nt.
>
> Oh good catch! Yes actually, in our fork, we also removed the write_enabl=
e
> guard in decode_new_cmd. We either need both checks in decode_new_cmd,
> or both checks in complete_collecting_data.
>
> I think we had some difficulty deciding whether to block command decoding=
,
> or to decode and ignore the command if restrictions are enabled.
>
> The reason being that, in the qtest, the WRSR command code gets ignored, =
and
> then the subsequent write data gets interpreted as some random command co=
de.
> We had elected to decode and ignore the command, but I think the
> datasheet actually describes that the command won=E2=80=99t be decoded su=
ccessfully,
> so you=E2=80=99re probably right, we should put this logic in decode_new_=
cmd.
>
> Most likely, the qtest will also need to be modified to reset the transfe=
r
> state machine after a blocked write command. I can=E2=80=99t remember if
> exiting and re-entering user mode is sufficient for that, but something
> like that is probably possible.
>
> Thanks for catching this!
> Peter
>
I am proposing add a CMDState: STATE_HIZ to handle command decode fail
situation. When decode_new_command need abort the decoding and ignore follo=
wing
on input bytes of this transaction, set the state to STATE_HIZ.
And m25p80_transfer8() will ignore all the following on byte when in this s=
tate.

This is to simulating the real device operation behavior
i.e. Macronix MX66L1G45G data sheet section 8 DEVICE OPERATION described
`
2. When an incorrect command is written to this device, it enters
standby mode and stays in standby mode until the next CS# falling edge.
In standby mode, This device's SO pin should be High-Z.
`
> >
> >> +            qemu_log_mask(LOG_GUEST_ERROR,
> >> +                          "M25P80: Status register write is disabled!=
\n");
> >> +            break;
> >> +        }
> >> +        s->status_register_write_disabled =3D extract32(s->data[0], 7=
, 1);
> >> +
> >>         switch (get_man(s)) {
> >>         case MAN_SPANSION:
> >>             s->quad_enable =3D !!(s->data[1] & 0x02);
> >> @@ -1195,6 +1214,8 @@ static void decode_new_cmd(Flash *s, uint32_t va=
lue)
> >>
> >>     case RDSR:
> >>         s->data[0] =3D (!!s->write_enable) << 1;
> >> +        s->data[0] |=3D (!!s->status_register_write_disabled) << 7;
> >> +
> >>         if (get_man(s) =3D=3D MAN_MACRONIX || get_man(s) =3D=3D MAN_IS=
SI) {
> >>             s->data[0] |=3D (!!s->quad_enable) << 6;
> >>         }
> >> @@ -1484,6 +1505,14 @@ static uint32_t m25p80_transfer8(SSIPeripheral =
*ss, uint32_t tx)
> >>     return r;
> >> }
> >>
> >> +static void m25p80_write_protect_pin_irq_handler(void *opaque, int n,=
 int level)
> >> +{
> >> +    Flash *s =3D M25P80(opaque);
> >> +    /* WP# is just a single pin. */
> >> +    assert(n =3D=3D 0);
> >> +    s->wp_level =3D !!level;
> >> +}
> >> +
> >> static void m25p80_realize(SSIPeripheral *ss, Error **errp)
> >> {
> >>     Flash *s =3D M25P80(ss);
> >> @@ -1515,12 +1544,18 @@ static void m25p80_realize(SSIPeripheral *ss, =
Error **errp)
> >>         s->storage =3D blk_blockalign(NULL, s->size);
> >>         memset(s->storage, 0xFF, s->size);
> >>     }
> >> +
> >> +    qdev_init_gpio_in_named(DEVICE(s),
> >> +                            m25p80_write_protect_pin_irq_handler, "WP=
#", 1);
> >> }
> >>
> >> static void m25p80_reset(DeviceState *d)
> >> {
> >>     Flash *s =3D M25P80(d);
> >>
> >> +    s->wp_level =3D true;
> >> +    s->status_register_write_disabled =3D false;
> >> +
> >>     reset_memory(s);
> >> }
> >>
> >> @@ -1601,6 +1636,8 @@ static const VMStateDescription vmstate_m25p80 =
=3D {
> >>         VMSTATE_UINT8(needed_bytes, Flash),
> >>         VMSTATE_UINT8(cmd_in_progress, Flash),
> >>         VMSTATE_UINT32(cur_addr, Flash),
> >> +        VMSTATE_BOOL(wp_level, Flash),
> >> +        VMSTATE_BOOL(status_register_write_disabled, Flash),
> >
> > Above needs to be added through a subsection, you can see commit 465ef4=
7abe3
> > for an example an also read about this in docs/devel/migration.rst.
> >
> > Thank you,
> > Best regads,
> > Francisco Iglesias
> >
> >
> >>         VMSTATE_BOOL(write_enable, Flash),
> >>         VMSTATE_BOOL(reset_enable, Flash),
> >>         VMSTATE_UINT8(ear, Flash),
> >> diff --git a/tests/qtest/aspeed_smc-test.c b/tests/qtest/aspeed_smc-te=
st.c
> >> index ec233315e6..c5d97d4410 100644
> >> --- a/tests/qtest/aspeed_smc-test.c
> >> +++ b/tests/qtest/aspeed_smc-test.c
> >> @@ -56,7 +56,9 @@ enum {
> >>     BULK_ERASE =3D 0xc7,
> >>     READ =3D 0x03,
> >>     PP =3D 0x02,
> >> +    WRSR =3D 0x1,
> >>     WREN =3D 0x6,
> >> +    SRWD =3D 0x80,
> >>     RESET_ENABLE =3D 0x66,
> >>     RESET_MEMORY =3D 0x99,
> >>     EN_4BYTE_ADDR =3D 0xB7,
> >> --
> >> 2.30.2
> >>
> >>
>

