Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 427713F0346
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 14:07:48 +0200 (CEST)
Received: from localhost ([::1]:34580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGKME-0003gV-Up
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 08:07:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mGKIQ-0001Mg-B6; Wed, 18 Aug 2021 08:03:50 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:60528)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1mGKIN-0007sf-6Z; Wed, 18 Aug 2021 08:03:50 -0400
Received: from [192.168.15.250] (unknown [195.68.53.70])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 79E6020783;
 Wed, 18 Aug 2021 12:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1629288222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GCPClIadaSHLoRtE8XPqz88rJHF0fVEOWxuu86gmRAc=;
 b=wLeLPFKrnurHxohlPvNnLPk44a5o/05w/puud1sxsakQje+pjpkMPr/atLZgrzsFaM4aDx
 JSq6bMwQdu/mxqN4nXewmHubUoO+KCLYNH42yTwdJOD2dlSBzmxGrynLoRBzeg5P2ae0z7
 JZmkEbVC9LWuVsWj+t5yTmGRArVnCzk=
Subject: Re: [PATCH for-6.2 24/25] hw/timer/stellaris-gptm: Use Clock input
 instead of system_clock_scale
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210812093356.1946-1-peter.maydell@linaro.org>
 <20210812093356.1946-25-peter.maydell@linaro.org>
From: Damien Hedde <damien.hedde@greensocs.com>
Message-ID: <6fdf26e2-7d08-0c3b-baa9-666f0a2419da@greensocs.com>
Date: Wed, 18 Aug 2021 14:03:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210812093356.1946-25-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US-large
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.961,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 Alistair Francis <alistair@alistair23.me>, Luc Michel <luc@lmichel.fr>,
 Joel Stanley <joel@jms.id.au>, Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 8/12/21 11:33 AM, Peter Maydell wrote:
> The stellaris-gptm timer currently uses system_clock_scale for one of
> its timer modes where the timer runs at the CPU clock rate.  Make it
> use a Clock input instead.
> 
> We don't try to make the timer handle changes in the clock frequency
> while the downcounter is running.  This is not a change in behaviour
> from the previous system_clock_scale implementation -- we will pick
> up the new frequency only when the downcounter hits zero.  Handling
> dynamic clock changes when the counter is running would require state
> that the current gptm implementation doesn't have.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> As noted in the comment, ideally we would convert the device to use
> ptimer for its downcounter, which supports frequency changes while
> the counter is running and would also allow reading the timer value.
> But I don't want to make and test that change to a minor timer device
> in a board model I wouldn't recommend anybody actually use; this
> series is long enough as it is...
> ---
>  include/hw/timer/stellaris-gptm.h |  3 +++
>  hw/arm/stellaris.c                | 12 +++++++++---
>  hw/timer/stellaris-gptm.c         | 26 ++++++++++++++++++++++----
>  3 files changed, 34 insertions(+), 7 deletions(-)
> 

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

