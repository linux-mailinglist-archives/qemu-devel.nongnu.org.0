Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E134B83A
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Jun 2019 14:28:26 +0200 (CEST)
Received: from localhost ([::1]:37894 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hdZhR-0007Ab-AU
	for lists+qemu-devel@lfdr.de; Wed, 19 Jun 2019 08:28:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54487)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1hdZf2-00065g-Vs
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 08:25:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kbastian@mail.uni-paderborn.de>) id 1hdZf1-0007eu-Tk
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 08:25:56 -0400
Received: from spheron.uni-paderborn.de ([131.234.189.16]:42240)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1hdZf1-0007eA-Mh
 for qemu-devel@nongnu.org; Wed, 19 Jun 2019 08:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=Content-Transfer-Encoding:Content-Type
 :In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SWMF5fqNxxMR2KFQPDy3qzjGuOOzpPoU3eOUExXz56I=; b=sysX6ZGAISfllFjDO1IPJZMlxP
 q1azms9NWNe3flNEKP/LnVmCKRa/tHertm4o4E6hf5fRXzmvjqWjDZVmhLZyqfANzCpkHSEnlaRuD
 Qp3bz+BStHevaaEtQ9ARa0NuSFnp7AacXKZrGNwnxZjGyd+fgN265PnNaDxchLzzMBUw=;
To: David Brenken <david.brenken@efs-auto.org>, qemu-devel@nongnu.org
References: <20190619075643.10048-1-david.brenken@efs-auto.org>
 <20190619075643.10048-6-david.brenken@efs-auto.org>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <caa5aca5-a41e-4d58-33f8-acba5062a46e@mail.uni-paderborn.de>
Date: Wed, 19 Jun 2019 14:25:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <20190619075643.10048-6-david.brenken@efs-auto.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2019.6.19.121817, AntiVirus-Engine: 5.63.0,
 AntiVirus-Data: 2019.6.18.5630002
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 131.234.189.16
Subject: Re: [Qemu-devel] [PATCH v2 5/5] tricore: reset DisasContext before
 generating code
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
Cc: Andreas Konopik <andreas.konopik@efs-auto.de>,
 David Brenken <david.brenken@efs-auto.de>,
 Robert Rasche <robert.rasche@efs-auto.de>,
 Georg Hofstetter <georg.hofstetter@efs-auto.de>,
 Lars Biermanski <lars.biermanski@efs-auto.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 6/19/19 9:56 AM, David Brenken wrote:
> From: Georg Hofstetter <georg.hofstetter@efs-auto.de>
>
> Signed-off-by: Andreas Konopik <andreas.konopik@efs-auto.de>
> Signed-off-by: David Brenken <david.brenken@efs-auto.de>
> Signed-off-by: Georg Hofstetter <georg.hofstetter@efs-auto.de>
> Signed-off-by: Robert Rasche <robert.rasche@efs-auto.de>
> Signed-off-by: Lars Biermanski <lars.biermanski@efs-auto.de>
> ---
>   target/tricore/translate.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/target/tricore/translate.c b/target/tricore/translate.c
> index b3bfb3ca51..8f90c76d35 100644
> --- a/target/tricore/translate.c
> +++ b/target/tricore/translate.c
> @@ -8806,6 +8806,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>       target_ulong pc_start;
>       int num_insns = 0;
>   
> +    memset(&ctx, 0x00, sizeof(DisasContext));
>       pc_start = tb->pc;
>       ctx.pc = pc_start;
>       ctx.saved_pc = -1;

Still the old patch. Did you make a rebase mistake? :)

Cheers,

Bastian


