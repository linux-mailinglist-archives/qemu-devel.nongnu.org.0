Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9030B4B792F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 22:22:41 +0100 (CET)
Received: from localhost ([::1]:45428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nK5HU-0008Lf-4n
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 16:22:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1nK5Fc-0007SB-Sd; Tue, 15 Feb 2022 16:20:46 -0500
Received: from gloria.sntech.de ([185.11.138.130]:56060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <heiko@sntech.de>)
 id 1nK5FP-0007a3-4e; Tue, 15 Feb 2022 16:20:35 -0500
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=diego.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nK5FF-0002gN-6s; Tue, 15 Feb 2022 22:20:21 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Atish Patra <atishp@atishpatra.org>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair.francis@wdc.com>, Bin Meng <bin.meng@windriver.com>,
 Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>
Subject: Re: [PATCH] target/riscv: Add isa extenstion strings to the device
 tree
Date: Tue, 15 Feb 2022 22:20:19 +0100
Message-ID: <3681957.RLg0Pos3oq@diego>
In-Reply-To: <CAOnJCU+K6dKda0gwE_+V8qAp9CUg1RWseuCAOCPKoWs3_p6kUA@mail.gmail.com>
References: <20220215090530.911828-1-atishp@rivosinc.com>
 <2828317.Et2jP947se@diego>
 <CAOnJCU+K6dKda0gwE_+V8qAp9CUg1RWseuCAOCPKoWs3_p6kUA@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
Received-SPF: none client-ip=185.11.138.130; envelope-from=heiko@sntech.de;
 helo=gloria.sntech.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_NONE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

Am Dienstag, 15. Februar 2022, 20:39:10 CET schrieb Atish Patra:
> On Tue, Feb 15, 2022 at 8:20 AM Heiko St=FCbner <heiko@sntech.de> wrote:
> >
> > Am Dienstag, 15. Februar 2022, 10:05:30 CET schrieb Atish Patra:
> > > Append the available ISA extensions to the "riscv,isa" string if it
> > > is enabled so that kernel can process it.
> > >
> > > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > > ---
> > >  target/riscv/cpu.c | 23 ++++++++++++++++++++++-
> > >  1 file changed, 22 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
> > > index b0a40b83e7a8..c70260d0df15 100644
> > > --- a/target/riscv/cpu.c
> > > +++ b/target/riscv/cpu.c
> > > @@ -34,6 +34,9 @@
> > >
> > >  /* RISC-V CPU definitions */
> > >
> > > +/* This includes the null terminated character '\0' */
> > > +#define MAX_ISA_EXT_LEN 256
> > > +
> > >  static const char riscv_exts[26] =3D "IEMAFDQCLBJTPVNSUHKORWXYZG";
> > >
> > >  const char * const riscv_int_regnames[] =3D {
> > > @@ -881,10 +884,26 @@ static void riscv_cpu_class_init(ObjectClass *c=
, void *data)
> > >      device_class_set_props(dc, riscv_cpu_properties);
> > >  }
> > >
> > > +static void riscv_isa_string_ext(RISCVCPU *cpu, char *isa_str, int m=
ax_str_len)
> > > +{
> > > +    int offset =3D strnlen(isa_str, max_str_len);
> > > +
> > > +    if (cpu->cfg.ext_svpbmt) {
> > > +        offset +=3D snprintf(isa_str + offset, max_str_len, "_%s", "=
_svpbmt");
> > > +    }
> > > +    if ((offset < max_str_len) && cpu->cfg.ext_svinval) {
> >
> > shouldn't offset + strlen("svinval") +1 be < max_str_len?
> > snprintf will write partial strings but this would throw off a
> > qemu client completely I guess.
> >
>=20
> We need that check to put out warnings to the user.

That is what I meant :-)

The current check above is for "there is still space for _something_"
but it doesn't check if the whole extension name fits.

That is what I'm trying to do in my example below check (and warn if not)
if the whole name fits into the remaining space.

>=20
> >
> > > +        offset +=3D snprintf(isa_str + offset, max_str_len, "_%s", "=
_svinval");
> > > +    }
> > > +    if ((offset < max_str_len) && (cpu->cfg.ext_svnapot)) {
> > > +        offset +=3D snprintf(isa_str + offset, max_str_len, "_%s", "=
_svnapot");
> > > +    }
> >
> > wouldn't it make more sense to do something like:
> >
> > +    struct {
> > +        const char *value;
> > +        bool enabled;
> > +    } extensions[] =3D {
> > +        { "svpbmt", cpu->cfg.ext_svpbmt },
> > +        { "svinval", cpu->cfg.ext_svinval },
> > +        { "svnapot", cpu->cfg.ext_svnapot },
> > +    };
> > +    int i;
> > +
> > +    for (i =3D 0; i < ARRAY_SIZE(extensions); i++) {
> > +        if (!extensions[i].enabled)
> > +            continue;
> > +
> > +        /* check available space */
> > +        if (offset + strlen(extensions[i].value) + 1 > max_str_len) {
> > +            //do warn about exceeded length
> > +            return;
> > +        }
> > +
> > +        offset +=3D snprintf(isa_str + offset, max_str_len, "_%s",
> > +                                                          extensions[i=
].value);
> > +    }
> >
> > instead?
> >
> > Because that list will get longer over time and repeating checks
> > and snprintf calls will get harder to keep in sync over time?
> >
>=20
> Yeah. This is much better.
>=20
> >
> > Heiko
> >
> >
> >
> >
> > > +}
> > > +
> > >  char *riscv_isa_string(RISCVCPU *cpu)
> > >  {
> > >      int i;
> > > -    const size_t maxlen =3D sizeof("rv128") + sizeof(riscv_exts) + 1;
> > > +    const size_t maxlen =3D sizeof("rv128") + sizeof(riscv_exts) +
> > > +                          MAX_ISA_EXT_LEN;
> > >      char *isa_str =3D g_new(char, maxlen);
> > >      char *p =3D isa_str + snprintf(isa_str, maxlen, "rv%d", TARGET_L=
ONG_BITS);
> > >      for (i =3D 0; i < sizeof(riscv_exts); i++) {
> > > @@ -893,6 +912,8 @@ char *riscv_isa_string(RISCVCPU *cpu)
> > >          }
> > >      }
> > >      *p =3D '\0';
> > > +    riscv_isa_string_ext(cpu, isa_str, maxlen);
> > > +
> > >      return isa_str;
> > >  }
> > >
> > >
> >
> >
> >
> >
> >
>=20
>=20
>=20





