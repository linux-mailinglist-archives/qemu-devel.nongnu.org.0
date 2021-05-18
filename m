Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95AA93876BB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:40:16 +0200 (CEST)
Received: from localhost ([::1]:36594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lix95-0008M3-Ik
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:40:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lix6q-0005eK-1W
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:37:56 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:51792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lix6o-0008KK-Cx
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:37:55 -0400
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-QKIqDoceMsGlT0qUVYCJhQ-1; Tue, 18 May 2021 06:37:41 -0400
X-MC-Unique: QKIqDoceMsGlT0qUVYCJhQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7F509107ACE3;
 Tue, 18 May 2021 10:37:40 +0000 (UTC)
Received: from bahia.lan (ovpn-112-173.ams2.redhat.com [10.36.112.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1E491349A;
 Tue, 18 May 2021 10:37:38 +0000 (UTC)
Date: Tue, 18 May 2021 12:37:37 +0200
From: Greg Kurz <groug@kaod.org>
To: Giuseppe Musacchio <thatlemon@gmail.com>
Subject: Re: [PATCH] target/ppc: Fix load endianness for lxvwsx/lxvdsx
Message-ID: <20210518123737.28f86491@bahia.lan>
In-Reply-To: <20210518092352.43610-1-thatlemon@gmail.com>
References: <20210518092352.43610-1-thatlemon@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
Cc: qemu-stable@nongnu.org, david@gibson.dropbear.id.au, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, pc@us.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 18 May 2021 11:23:52 +0200
Giuseppe Musacchio <thatlemon@gmail.com> wrote:

> TARGET_WORDS_BIGENDIAN may not match the machine endianness if that's a
> runtime-configurable parameter.
>=20
> Fixes: bcb0b7b1a1c05707304f80ca6f523d557816f85c

and

Fixes: afae37d98ae991c0792c867dbd9f32f988044318

for lxvwsx.

Reviewed-by: Greg Kurz <groug@kaod.org>

Cc'ing qemu-stable since this looks like a regression of QEMU 6.0.

> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/212
>=20
> Signed-off-by: Giuseppe Musacchio <thatlemon@gmail.com>
> ---
>  target/ppc/translate/vsx-impl.c.inc | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
>=20
> diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/v=
sx-impl.c.inc
> index b817d31260..3e840e756f 100644
> --- a/target/ppc/translate/vsx-impl.c.inc
> +++ b/target/ppc/translate/vsx-impl.c.inc
> @@ -139,7 +139,11 @@ static void gen_lxvwsx(DisasContext *ctx)
>      gen_addr_reg_index(ctx, EA);
> =20
>      data =3D tcg_temp_new_i32();
> -    tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_TEUL);
> +    if (ctx->le_mode) {
> +        tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_LEUL);
> +    } else {
> +        tcg_gen_qemu_ld_i32(data, EA, ctx->mem_idx, MO_BEUL);
> +    }
>      tcg_gen_gvec_dup_i32(MO_UL, vsr_full_offset(xT(ctx->opcode)), 16, 16=
, data);
> =20
>      tcg_temp_free(EA);
> @@ -162,7 +166,11 @@ static void gen_lxvdsx(DisasContext *ctx)
>      gen_addr_reg_index(ctx, EA);
> =20
>      data =3D tcg_temp_new_i64();
> -    tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_TEQ);
> +    if (ctx->le_mode) {
> +        tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_LEQ);
> +    } else {
> +        tcg_gen_qemu_ld_i64(data, EA, ctx->mem_idx, MO_BEQ);
> +    }
>      tcg_gen_gvec_dup_i64(MO_Q, vsr_full_offset(xT(ctx->opcode)), 16, 16,=
 data);
> =20
>      tcg_temp_free(EA);


