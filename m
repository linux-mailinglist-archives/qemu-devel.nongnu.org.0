Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 960406E197B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Apr 2023 03:13:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pn7yv-00010o-LN; Thu, 13 Apr 2023 21:12:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangfeng@kylinos.cn>)
 id 1pn7ys-00010I-Tz; Thu, 13 Apr 2023 21:12:02 -0400
Received: from mailgw.kylinos.cn ([124.126.103.232])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jiangfeng@kylinos.cn>)
 id 1pn7yj-0003MY-Ou; Thu, 13 Apr 2023 21:12:02 -0400
X-UUID: a6414d5da9ed44a68f7a6c30977b8ed6-20230414
X-CID-O-RULE: Release_Ham
X-CID-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.22, REQID:11798ae5-d620-4f2c-b0e6-87a700a54af3, IP:5,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION
 :release,TS:-4
X-CID-INFO: VERSION:1.1.22, REQID:11798ae5-d620-4f2c-b0e6-87a700a54af3, IP:5,
 URL
 :0,TC:0,Content:0,EDM:0,RT:0,SF:-9,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
 elease,TS:-4
X-CID-META: VersionHash:120426c, CLOUDID:2deee6ea-db6f-41fe-8b83-13fe7ed1ef52,
 B
 ulkID:230414091141UNMC4M8A,BulkQuantity:0,Recheck:0,SF:24|17|19|42|102,TC:
 nil,Content:0,EDM:-3,IP:-2,URL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
 ,OSI:0,OSA:0,AV:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-UUID: a6414d5da9ed44a68f7a6c30977b8ed6-20230414
X-User: jiangfeng@kylinos.cn
Received: from [172.20.12.214] [(116.128.244.169)] by mailgw
 (envelope-from <jiangfeng@kylinos.cn>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 237505331; Fri, 14 Apr 2023 09:11:41 +0800
Message-ID: <f23651dabdba5c02f44c5d3f9fe90c2db2483284.camel@kylinos.cn>
Subject: Re: [PATCH] exynos: Fix out-of-bounds access in exynos4210_gcomp_find
From: Feng Jiang <jiangfeng@kylinos.cn>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: i.mitsyanko@gmail.com, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Date: Fri, 14 Apr 2023 09:11:39 +0800
In-Reply-To: <CAFEAcA_VP-Y2x9efKW8atddUL64D03eSE8A7h3hk8N7s9spMhg@mail.gmail.com>
References: <20230404074506.112615-1-jiangfeng@kylinos.cn>
 <CAFEAcA_VP-Y2x9efKW8atddUL64D03eSE8A7h3hk8N7s9spMhg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4 (3.46.4-1.fc37) 
MIME-Version: 1.0
Received-SPF: pass client-ip=124.126.103.232;
 envelope-from=jiangfeng@kylinos.cn; helo=mailgw.kylinos.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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

On Tue, 2023-04-11 at 14:02 +0100, Peter Maydell wrote:
> On Tue, 4 Apr 2023 at 08:45, Feng Jiang <jiangfeng@kylinos.cn> wrote:
> >=20
> > When 'res' equals -1, the array 's->g_timer.reg.comp[]' is accessed
> > out of bounds.
> >=20
> > Signed-off-by: Feng Jiang <jiangfeng@kylinos.cn>
> > ---
> >  hw/timer/exynos4210_mct.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
>=20
> Only happens if you change the source code to enable the debug
> printfs though, which isn't the default. I'll tweak the
> commit message to make that clearer.
>=20
> Applied to target-arm.next for 8.1, thanks.
>=20
> -- PMM
>=20
Hi Peter, Thanks very much for your review!

Next time I will write the commit message more clearly and in detail.

Best regards,
Feng

