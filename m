Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84CC668EAF9
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 10:17:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgZf-0002Ag-CR; Wed, 08 Feb 2023 04:17:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgZa-00024i-KN
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:17:02 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgZY-0000HP-Nc
 for qemu-devel@nongnu.org; Wed, 08 Feb 2023 04:17:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U4O98BK7B3gB27TbMzZW+OrwtBhiXUn8oGBv7u7JQJk=; b=nqkpl7hlBi2P6Zt8COJoCcehfm
 5Kg+5Pt2rNH1/V+TeVsH4gzucv4+i2JMhigTng4f2dJT9FNJ85w2AjpEfEp3A8W6kpK6ymICshmwu
 b4vGsTPnrpPF3TmEwd+MKhuOCVC6BBcRmmTlCgATw5c/EalfISjsx/OpRE6QcyrvxNG0=;
Date: Wed, 8 Feb 2023 10:16:55 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Anton Kochkov <anton.kochkov@proton.me>
Cc: qemu-devel@nongnu.org, eitan_eliahu@hotmail.com
Subject: Re: [PATCH] target/tricore: Fix OPC1_16_SRO_LD_H translation
Message-ID: <20230208091655.r4wkjvmjqv7xbjum@schnipp-desktop>
References: <20230112142258.514079-1-anton.kochkov@proton.me>
 <20230112210350.2y67zmep37menm6d@schnipp-desktop>
 <zVKqNjvXXybofvAQ1peoJ-6Qv2YI4evjBePkbPAKl57D1kPiq3yTQxRytUED9AwfV2EDfROy9BPQhK-e1aoCqUZrfw3yCWMVN15_B7yk_WY=@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <zVKqNjvXXybofvAQ1peoJ-6Qv2YI4evjBePkbPAKl57D1kPiq3yTQxRytUED9AwfV2EDfROy9BPQhK-e1aoCqUZrfw3yCWMVN15_B7yk_WY=@proton.me>
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=84.154.177.181, fs=778966, da=163456882, mc=24, sc=0,
 hc=24, sp=0, fso=778966, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.8.90317, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::17;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=zuban.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Thu, Feb 02, 2023 at 03:55:53PM +0000, Anton Kochkov wrote:
> ------- Original Message -------
> On Friday, January 13th, 2023 at 5:03 AM, Bastian Koppelmann <kbastian@mail.uni-paderborn.de> wrote:
> 
> 
> > 
> > 
> > On Thu, Jan 12, 2023 at 02:24:02PM +0000, Anton Kochkov wrote:
> > 
> > > Signed-off-by: Eitan Eliahu eitan_eliahu@hotmail.com
> > > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/652
> > > ---
> > > target/tricore/translate.c | 2 +-
> > > 1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/target/tricore/translate.c b/target/tricore/translate.c
> > > index df9e46c649..b2a5e11778 100644
> > > --- a/target/tricore/translate.c
> > > +++ b/target/tricore/translate.c
> > > @@ -3878,7 +3878,7 @@ static void decode_sro_opc(DisasContext *ctx, int op1)
> > > gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address, MO_UB);
> > > break;
> > > case OPC1_16_SRO_LD_H:
> > > - gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address, MO_LESW);
> > > + gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address * 2, MO_LESW);
> > > break;
> > > case OPC1_16_SRO_LD_W:
> > > gen_offset_ld(ctx, cpu_gpr_d[15], cpu_gpr_a[r2], address * 4, MO_LESL);
> > > --
> > > 2.39.0
> > 
> > 
> > Reviewed-by: Bastian Koppelmann kbastian@mail.uni-paderborn.de
> > 
> > 
> > As Phil said, good catch. I added it to my TriCore queue.
> > 
> > I saw on the bugtracker that you have testcase. Are you interested in adding it to
> > tests/tcg/tricore?
> 
> Sorry for the late answer - it's not me who initially opened the original issue thus I don't have a test case.

No worries. I created a test myself (see
https://lore.kernel.org/qemu-devel/20230203132132.511254-1-kbastian@mail.uni-paderborn.de/)

Cheers,
Bastian


> 

