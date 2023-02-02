Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E9451688380
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 16:56:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNbwb-0002Ge-CD; Thu, 02 Feb 2023 10:56:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1pNbwZ-0002GF-IW
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:56:11 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anton.kochkov@proton.me>)
 id 1pNbwV-00008b-SZ
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 10:56:11 -0500
Date: Thu, 02 Feb 2023 15:55:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
 s=protonmail; t=1675353363; x=1675612563;
 bh=TtynufYXtXAbYUFiQdJAnOTHX+WH8M9uatA8kBhFc64=;
 h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
 Message-ID:BIMI-Selector;
 b=KJ0tXUjl1GAvh+QD7vOCaSEeTf95Wf6zxA2G+vvK+owpFybEXUYYwBcTZBtFli4Hz
 S7Ip2Rcw5M2d+25L69UWeOHkidp6RjaO4AXi62G/kDO1p5xTIM/MqviPXjf35pFphq
 kVbUH8UaRmHKhf9n0R/cm3ezzw63kxbP3qF5tNq066Dcq5XDF4cMLEOryYNc2S6aaX
 gVjgHb4pekLGq5dbLkKYDmUI4R1ZsgnL91mHPHrkApKMbql09B10TwcktF0cresGE8
 ioSBi2UitxwHj7aqzd5SHxz7+AFroc53y0/ASX5l2OExgIpz620r8UbgUDbHwwFqfc
 BVodc2rCesE2g==
To: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
From: Anton Kochkov <anton.kochkov@proton.me>
Cc: qemu-devel@nongnu.org, eitan_eliahu@hotmail.com
Subject: Re: [PATCH] target/tricore: Fix OPC1_16_SRO_LD_H translation
Message-ID: <zVKqNjvXXybofvAQ1peoJ-6Qv2YI4evjBePkbPAKl57D1kPiq3yTQxRytUED9AwfV2EDfROy9BPQhK-e1aoCqUZrfw3yCWMVN15_B7yk_WY=@proton.me>
In-Reply-To: <20230112210350.2y67zmep37menm6d@schnipp-desktop>
References: <20230112142258.514079-1-anton.kochkov@proton.me>
 <20230112210350.2y67zmep37menm6d@schnipp-desktop>
Feedback-ID: 53490844:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=185.70.40.131;
 envelope-from=anton.kochkov@proton.me; helo=mail-40131.protonmail.ch
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

------- Original Message -------
On Friday, January 13th, 2023 at 5:03 AM, Bastian Koppelmann <kbastian@mail=
.uni-paderborn.de> wrote:


>=20
>=20
> On Thu, Jan 12, 2023 at 02:24:02PM +0000, Anton Kochkov wrote:
>=20
> > Signed-off-by: Eitan Eliahu eitan_eliahu@hotmail.com
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/652
> > ---
> > target/tricore/translate.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/target/tricore/translate.c b/target/tricore/translate.c
> > index df9e46c649..b2a5e11778 100644
> > --- a/target/tricore/translate.c
> > +++ b/target/tricore/translate.c
> > @@ -3878,7 +3878,7 @@ static void decode_sro_opc(DisasContext *ctx, int=
 op1)
> > gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address, MO_UB);
> > break;
> > case OPC1_16_SRO_LD_H:
> > - gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address, MO_LESW);
> > + gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address * 2, MO_LESW=
);
> > break;
> > case OPC1_16_SRO_LD_W:
> > gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address * 4, MO_LESL);
> > --
> > 2.39.0
>=20
>=20
> Reviewed-by: Bastian Koppelmann kbastian@mail.uni-paderborn.de
>=20
>=20
> As Phil said, good catch. I added it to my TriCore queue.
>=20
> I saw on the bugtracker that you have testcase. Are you interested in add=
ing it to
> tests/tcg/tricore?

Sorry for the late answer - it's not me who initially opened the original i=
ssue thus I don't have a test case.

