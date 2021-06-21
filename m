Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891993AEB7B
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 16:35:19 +0200 (CEST)
Received: from localhost ([::1]:35268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvL1C-00024m-Io
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 10:35:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lvKyV-0000e4-FJ
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:32:31 -0400
Received: from collins.uni-paderborn.de ([2001:638:502:c003::14]:48774)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1lvKyS-0004hg-Ow
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 10:32:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KdADDj15dJcUUn1kDrUmpYWCObklnRocY6g6KkUvnGM=; b=iGjhBeI/EJZDAc5mdAahzOCJ2f
 B3iF+G1n8xcY0D+S7Ghmz2GUn9G97XnyuZ1G9tlbF9Vzoj+07aNwYJBKdfNaQVn6XZpMR/E+1qvwn
 MidRRuiETFO1c7QWDY05hYqRCSQTvL24ccVQdyL2RhBmJXH4L6SSikXBhuH3n84660NY=;
Date: Mon, 21 Jun 2021 16:32:24 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 25/26] target/tricore: Use tcg_gen_lookup_and_goto_ptr
Message-ID: <20210621143224.oyq4mbyjor7efmu4@schnipp-desktop>
References: <20210621013439.1791385-1-richard.henderson@linaro.org>
 <20210621013439.1791385-26-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210621013439.1791385-26-richard.henderson@linaro.org>
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=2a02:908:2214:e5bc::95d, fs=39923328, da=111895009,
 mc=622, sc=4, hc=618, sp=0, fso=39923328, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2021.6.21.142116, AntiVirus-Engine: 5.83.0,
 AntiVirus-Data: 2021.6.21.5830000
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::14;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=collins.uni-paderborn.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jun 20, 2021 at 06:34:38PM -0700, Richard Henderson wrote:
> The non-single-step case of gen_goto_tb may use
> tcg_gen_lookup_and_goto_ptr to indirectly chain.
> 
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/tricore/translate.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian

