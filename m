Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C102D3BA989
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 18:42:36 +0200 (CEST)
Received: from localhost ([::1]:53214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lziix-0004sb-KQ
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 12:42:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzihX-0004CT-2S
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:41:07 -0400
Received: from mail-oi1-f174.google.com ([209.85.167.174]:43827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lzihV-0007zc-Fx
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 12:41:06 -0400
Received: by mail-oi1-f174.google.com with SMTP id 22so15395256oix.10
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 09:41:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qJETowNrHSpnk7b8ICbnURH2Bgc9xCrWhTr2tBLt1BY=;
 b=bpIDgRu58aSa+G7upElcbXJt5n5cnQ73VeX1AbGSJX1Pzf8aBG5Rp4JhHWx54j27Sw
 d3eOhHEcfk19r+PGcE9G56iVVoy6ooz5H+3x1mqMI2PgWL68vS35gOVdLvqzlkHXm9gC
 Lfw2GoMSAEVnOMcPYm9XD7hMPIA34UvGfvtxdOKSTXAAbRx2bU4vmM6G5anbX1S4BQKx
 Lvx8f4N6ZNQxl4bnkppxWDQ4SZRQ8gEuniEE8/r98pdGHa2VsdK42dPDMg9zNsF/qx2E
 Fa5TZl9NgbCoeh28g6vHkR7H5U2MrQY6CmhN8Sg62S7TQ2zM+GBfYuMlIb2cN3FFGUsa
 7PvQ==
X-Gm-Message-State: AOAM531HttSzzHnsmy49BzTh3SjHJO+SCgjWUzJO97Fdzbq/Uz63mBfY
 /ZFxQtkrjYdFL0TSXLHIReFGD031Nw8Co5rHAU8=
X-Google-Smtp-Source: ABdhPJx5r3Fm7FoOi2gNgop+VY2pM6hy0gZngsysT3L11LYNxr2ud4MZoBCGyv4i5x3eQTcsutJTk/mxHi/jy0xRWiM=
X-Received: by 2002:aca:2802:: with SMTP id 2mr4471246oix.46.1625330464511;
 Sat, 03 Jul 2021 09:41:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210703150219.364582-1-f4bug@amsat.org>
 <20210703150219.364582-3-f4bug@amsat.org>
 <45c57cbe-d0a1-b3d4-66c5-71cc882b2335@eik.bme.hu>
In-Reply-To: <45c57cbe-d0a1-b3d4-66c5-71cc882b2335@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Sat, 3 Jul 2021 18:40:52 +0200
Message-ID: <CAAdtpL4p5oUamGvh6DbFyH0C09OoBu7C0a0kso=xe8BWXyfWzQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] dp8393x: Do not amend CRC if it is inhibited
 (CRCI bit set)
To: BALATON Zoltan <balaton@eik.bme.hu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.167.174;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oi1-f174.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.248, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.248, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Finn Thain <fthain@linux-m68k.org>, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 3, 2021 at 6:32 PM BALATON Zoltan <balaton@eik.bme.hu> wrote:
> On Sat, 3 Jul 2021, Philippe Mathieu-Daud=C3=A9 wrote:
> > When the CRCI (CRC INHIBIT) bit is set, the 4-byte FCS field
> > is not transmitted.
>
> You say when CRCI is 1 then no checksum...
>
> >
> > Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> > ---
> > hw/net/dp8393x.c | 22 ++++++++++++++--------
> > 1 file changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> > index 99e179a5e86..dee8236400c 100644
> > --- a/hw/net/dp8393x.c
> > +++ b/hw/net/dp8393x.c
> > @@ -472,6 +472,7 @@ static void dp8393x_do_transmit_packets(dp8393xStat=
e *s)
> >              */
> >         } else {
> >             /* Remove existing FCS */
> > +            /* TODO check crc */
> >             tx_len -=3D 4;
> >             if (tx_len < 0) {
> >                 trace_dp8393x_transmit_txlen_error(tx_len);
> > @@ -758,7 +759,10 @@ static ssize_t dp8393x_receive(NetClientState *nc,=
 const uint8_t * buf,
> >         return pkt_size;
> >     }
> >
> > -    rx_len =3D pkt_size + sizeof(checksum);
> > +    rx_len =3D pkt_size;
> > +    if (s->regs[SONIC_TCR] & SONIC_TCR_CRCI) {
>
> ... but you seem to add checksum if bit is set.
>
> > +        rx_len +=3D sizeof(checksum);
> > +    }
> >     if (s->regs[SONIC_DCR] & SONIC_DCR_DW) {
> >         padded_len =3D ((rx_len - 1) | 3) + 1;
> >     } else {
> > @@ -801,9 +805,6 @@ static ssize_t dp8393x_receive(NetClientState *nc, =
const uint8_t * buf,
> >     s->regs[SONIC_TRBA1] =3D s->regs[SONIC_CRBA1];
> >     s->regs[SONIC_TRBA0] =3D s->regs[SONIC_CRBA0];
> >
> > -    /* Calculate the ethernet checksum */
> > -    checksum =3D crc32(0, buf, pkt_size);
> > -
> >     /* Put packet into RBA */
> >     trace_dp8393x_receive_packet(dp8393x_crba(s));
> >     address =3D dp8393x_crba(s);
> > @@ -811,10 +812,15 @@ static ssize_t dp8393x_receive(NetClientState *nc=
, const uint8_t * buf,
> >                         buf, pkt_size);
> >     address +=3D pkt_size;
> >
> > -    /* Put frame checksum into RBA */
> > -    address_space_stl_le(&s->as, address, checksum, MEMTXATTRS_UNSPECI=
FIED,
> > -                         NULL);
> > -    address +=3D sizeof(checksum);
> > +    if (s->regs[SONIC_TCR] & SONIC_TCR_CRCI) {
>
> Here too. Either these should be inverted or the commit message is wrong
> if the bit is active 0 (or I'm not getting this alltogether which is also
> possible as I've just had a quick look without really understanding it).

You are right indeed, this should be the opposite.

Thanks!

Phil.

