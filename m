Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F0435937
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 11:03:10 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37754 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYRp7-0003cE-DR
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 05:03:09 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55510)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1hYRns-0003Ie-1k
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 05:01:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1hYRnq-0003L7-Nt
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 05:01:52 -0400
Received: from hoth.uni-paderborn.de ([131.234.189.19]:53668)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1hYRnq-0003Ev-0S
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 05:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.uni-paderborn.de; s=20170601;
	h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=TaSk9EVQDyphuCgIUGOmvyRh+f5f3UshLnr2W+0A+Hc=;
	b=T09nqebmSPKFcNMQehOYEkm835
	Ecq9tv8SZWRf3yZZor2tzDCE8TUbkeTA/xP3BvefFQ0iCQfncEFRKxPGtwZLkRE9ek4KCTd/9oUCZ
	NGQu0KJFXQhT4At2c9MaKRqki6LUbn9grsEQYHmiNBRAX8AS4VeIpB6k3NKjtT7Vt+IM=; 
To: David Brenken <david.brenken@efs-auto.org>, qemu-devel@nongnu.org
References: <20190605061126.10244-1-david.brenken@efs-auto.org>
	<20190605061126.10244-6-david.brenken@efs-auto.org>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <aaf05b6e-fb2b-1aa8-da49-b6ce29616073@mail.uni-paderborn.de>
Date: Wed, 5 Jun 2019 11:01:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190605061126.10244-6-david.brenken@efs-auto.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.6.5.85116, AntiVirus-Engine: 5.63.0,
	AntiVirus-Data: 2019.6.4.5630002
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 131.234.189.19
Subject: Re: [Qemu-devel] [PATCH 5/5] tricore: reset DisasContext before
 generating code
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
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

Hi,

On 6/5/19 8:11 AM, David Brenken wrote:
> From: Georg Hofstetter <georg.hofstetter@efs-auto.de>
>
> Signed-off-by: Andreas Konopik <andreas.konopik@efs-auto.de>
> Signed-off-by: David Brenken <david.brenken@efs-auto.de>
> Signed-off-by: Georg Hofstetter <georg.hofstetter@efs-auto.de>
> Signed-off-by: Robert Rasche <robert.rasche@efs-auto.de>
> Signed-off-by: Lars Biermanski <lars.biermanski@efs-auto.de>
>
> ---
>   target/tricore/translate.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/target/tricore/translate.c b/target/tricore/translate.c
> index db09f82c31..cdbc00d654 100644
> --- a/target/tricore/translate.c
> +++ b/target/tricore/translate.c
> @@ -8811,6 +8811,7 @@ void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
>       target_ulong pc_start;
>       int num_insns = 0;
>   
> +    memset(&ctx, 0x00, sizeof(DisasContext));
>       pc_start = tb->pc;
>       ctx.pc = pc_start;
>       ctx.saved_pc = -1;

To me this looks like fixing a symptom instead of the root cause. Which 
commit did you bisect to? Do you have a reproducer?

Cheers,

Bastian


