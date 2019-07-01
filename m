Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6BBF187EA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 11:45:16 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOfc4-0005a8-38
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 05:45:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34794)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1hOfb6-0005GL-It
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:44:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kbastian@mail.uni-paderborn.de>) id 1hOfax-0003Dj-FJ
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:44:11 -0400
Received: from hoth.uni-paderborn.de ([131.234.189.19]:50316)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kbastian@mail.uni-paderborn.de>)
	id 1hOfau-00038b-S7
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:44:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=mail.uni-paderborn.de; s=20170601;
	h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Sender:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Lg7YElQ1pBNXkzMRb1HdTAwe1EmkHX96o8Qjviu31Do=;
	b=ZI9kvnMddGE7i/JSx/4WXKj9Rk
	PZisxLw0f3Et2KtTRuqO3/EOsmr4h95vxM646ujgEIeE+QAGwG06gnHtNJ93kZPnIZRIip6NEb1fB
	geJ+HLB+kXScrVvxU6NjhvNp79Xjv0uFESBxCZZv+82lPH1jl93RndQrC6JrZ4WTHyzY=; 
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190509060246.4031-1-richard.henderson@linaro.org>
	<20190509060246.4031-23-richard.henderson@linaro.org>
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Message-ID: <cb9cf2f1-7f6e-236c-db7d-8f9ce1db0286@mail.uni-paderborn.de>
Date: Thu, 9 May 2019 11:43:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509060246.4031-23-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US-large
X-IMT-Spam-Score: 0.0 ()
X-PMX-Version: 6.4.6.2792898, Antispam-Engine: 2.7.2.2107409,
	Antispam-Data: 2019.5.9.93916, AntiVirus-Engine: 5.60.1,
	AntiVirus-Data: 2019.5.8.5601001
X-IMT-Authenticated-Sender: kbastian@UNI-PADERBORN.DE
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (barebone)
	[generic] [fuzzy]
X-Received-From: 131.234.189.19
Subject: Re: [Qemu-devel] [PATCH v2 22/27] target/tricore: Convert to
 CPUClass::tlb_fill
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/19 8:02 AM, Richard Henderson wrote:
> Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   target/tricore/cpu.h       |  6 +++---
>   target/tricore/cpu.c       |  1 +
>   target/tricore/helper.c    | 27 +++++++++++++++++++--------
>   target/tricore/op_helper.c | 26 --------------------------
>   4 files changed, 23 insertions(+), 37 deletions(-)

Acked-by: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>

Cheers,

Bastian


