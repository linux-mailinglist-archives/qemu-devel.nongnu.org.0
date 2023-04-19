Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25B5E6E75CF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Apr 2023 10:58:05 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pp3c9-0005ew-RI; Wed, 19 Apr 2023 04:56:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pp3c5-0005ZC-IR
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 04:56:29 -0400
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pp3c3-0000a6-4u
 for qemu-devel@nongnu.org; Wed, 19 Apr 2023 04:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rp17YwaJfT5dcoD8tiplul+Ecv0DL86m3ZyGvU1CRxs=; b=C4gtPk+27DIBkQlaoxsDu9xArd
 2JIXmuG+gGJWy55vrytjs0oTWXLV3D7pCxPJ3zF/2q2BhPQts4++YCzlvTKTnvAOUQDkDq9uUQzno
 AtFuSpk/aJNAcVAkwF11QUSaj1CKOGcn5t4T4EffulkOqBuWo2utpwXurdsUqaot5M10=;
Date: Wed, 19 Apr 2023 10:56:11 +0200
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Anton Johansson via <qemu-devel@nongnu.org>
Cc: ale@rev.ng, richard.henderson@linaro.org, pbonzini@redhat.com, 
 eduardo@habkost.net, peter.maydell@linaro.org, mrolnik@gmail.com, 
 tsimpson@quicinc.com, gaosong@loongson.cn, yangxiaojuan@loongson.cn, 
 edgar.iglesias@gmail.com, philmd@linaro.org, shorne@gmail.com,
 palmer@dabbelt.com, 
 alistair.francis@wdc.com, bin.meng@windriver.com, ysato@users.sourceforge.jp, 
 mark.cave-ayland@ilande.co.uk, atar4qemu@gmail.com
Subject: Re: [PATCH v3 13/27] target/tricore: Replace `tb_pc()` with `tb->pc`
Message-ID: <oss2bubx2fofds4llsg4qntnij42u2vq45glg44sxcvl5udb7w@phzn6ypc37k2>
References: <20230227135202.9710-1-anjo@rev.ng>
 <20230227135202.9710-14-anjo@rev.ng>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230227135202.9710-14-anjo@rev.ng>
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-IMT-rspamd-score: 19
X-IMT-rspamd-bar: +
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.4.19.84816, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
X-Sophos-SenderHistory: ip=84.184.52.177, fs=481016, da=169503638, mc=2, sc=0,
 hc=2, sp=0, fso=481016, re=0, sd=0, hd=0
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
Received-SPF: pass client-ip=2001:638:502:c003::17;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=zuban.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, Feb 27, 2023 at 02:51:48PM +0100, Anton Johansson via wrote:
> Signed-off-by: Anton Johansson <anjo@rev.ng>
> Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  target/tricore/cpu.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Reviewed-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,
Bastian

