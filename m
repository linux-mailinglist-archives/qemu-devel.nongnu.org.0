Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53133387358
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 09:32:30 +0200 (CEST)
Received: from localhost ([::1]:56706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1liuDN-0002fg-4D
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 03:32:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1liuBn-0001p5-UV
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:30:51 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:37475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1liuBm-0003Kc-9u
 for qemu-devel@nongnu.org; Tue, 18 May 2021 03:30:51 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-282-e-bBhxFqO-CZg3lKl1ljvw-1; Tue, 18 May 2021 03:30:43 -0400
X-MC-Unique: e-bBhxFqO-CZg3lKl1ljvw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A82D56D4F0;
 Tue, 18 May 2021 07:30:41 +0000 (UTC)
Received: from bahia.lan (ovpn-112-173.ams2.redhat.com [10.36.112.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B4A0B5D762;
 Tue, 18 May 2021 07:30:39 +0000 (UTC)
Date: Tue, 18 May 2021 09:30:38 +0200
From: Greg Kurz <groug@kaod.org>
To: Giuseppe Musacchio <thatlemon@gmail.com>
Subject: Re: [PATCH] Fix `lxvdsx` (issue #212)
Message-ID: <20210518093038.28ca0c3d@bahia.lan>
In-Reply-To: <91759ae2-f1f0-f839-6938-1271165e0a10@gmail.com>
References: <20210517214032.156187-1-pc@us.ibm.com> <YKMZwVmfec0IocfV@yekko>
 <91759ae2-f1f0-f839-6938-1271165e0a10@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=groug@kaod.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: kaod.org
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org, "Paul A. Clarke" <pc@us.ibm.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 May 2021 08:40:36 +0200
Giuseppe Musacchio <thatlemon@gmail.com> wrote:

> The ISA [1] specifies the load order to be the target one, hence
> the use of MO_TEQ in my patch (in both lxvwsx and lxvdsx).
>=20
> I believe the error is hidden in some of the .mak files: I could not
> reproduce this problem with Qemu's user-mode emulation in either
> BE nor LE mode, this lead me to discover that ppc64-softmmu.mak is
> always defining TARGET_WORDS_BIGENDIAN=3Dy. The user-mode targets are
> correctly split into ppc64 and ppc64le, where only the former is
> declared as BE.
>=20

Yes. In system-mode emulation, modern POWER CPUs are expected to
be able to switch from BE to LE and vice-versa at runtime. Older
PowerPC CPUs are BE. The qemu-system-ppc64 binary is thus built
with TARGET_WORDS_BIGENDIAN=3Dy and every place where runtime
endianness matters need to do a check and only byteswap if needed.

Mark's suggestion in another mail of this thread is the way to go.

> The presence of that define is unconditionally making MO_TE an alias
> for MO_BE, that's why Paul's patch seems to fix the problem.
>=20
> I didn't catch this problem earlier as pretty much of our testing is
> done using the Linux user-mode emulation.
>=20
> Cheers,
> G.M.
>=20
> [1] https://ibm.ent.box.com/s/1hzcwkwf8rbju5h9iyf44wm94amnlcrv
>=20
> On 18/05/21 03:34, David Gibson wrote:
> >=20
> > On Mon, May 17, 2021 at 04:40:32PM -0500, Paul A. Clarke wrote:
> >> `lxvdsx` is byte-swapping the data it loads, which it should not
> >> do.  Fix it.
> >>
> >> Fixes #212.
> >>
> >> Fixes: bcb0b7b1a1c05707304f80ca6f523d557816f85c
> >> Signed-off-by:  Paul A. Clarke <pc@us.ibm.com
> >                            nit, missing '>' ...^
> >=20
> > I'm having a hard time convincing myself this is correct in all cases.
> > Have you tested it with all combinations of BE/LE host and BE/LE guest
> > code?
> >=20
> > The description in the ISA is pretty inscrutable, since it's in terms
> > of the confusing numbering if different element types in BE vs LE
> > mode.
> >=20
> > It looks to me like before bcb0b7b1a1c0 this originally resolved to
> > MO_Q modified by ctx->default_tcg_memop_mask, which appears to depend
> > on the current guest endian mode.  That's pretty hard to trace through
> > the various layers of macros, but for reference, before bcb0b7b1a1c0
> > this used gen_qemu_ld64_i64(), which appears to be constructed by the
> > line GEN_QEMU_LOAD_64(ld64,  DEF_MEMOP(MO_Q)) in translate.c.
> >=20
> > Richard or Giuseppe, care to weigh in?
> >=20
> >> ---
> >>  target/ppc/translate/vsx-impl.c.inc | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translat=
e/vsx-impl.c.inc
> >> index b817d31260bb..46f97c029ca8 100644
> >> --- a/target/ppc/translate/vsx-impl.c.inc
> >> +++ b/target/ppc/translate/vsx-impl.c.inc
> >> @@ -162,7 +162,7 @@ static void gen_lxvdsx(DisasContext *ctx)
> >>      gen_addr_reg_index(ctx, EA);
> >> =20
> >>      data =3D tcg_temp_new_i64();
> >> -    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
> >> +    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_LEQ);
> >>      tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, =
16, data);
> >> =20
> >>      tcg_temp_free(EA);
> >=20
>=20


