Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A7D4AC28A
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 16:10:26 +0100 (CET)
Received: from localhost ([::1]:53848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nH5ep-0000uF-Pg
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 10:10:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1nH51H-0001DR-Vw; Mon, 07 Feb 2022 09:29:32 -0500
Received: from mail.csgraf.de ([85.25.223.15]:33762 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1nH51G-0006ei-Br; Mon, 07 Feb 2022 09:29:31 -0500
Received: from [0.0.0.0] (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com
 [3.122.114.9]) by csgraf.de (Postfix) with ESMTPSA id 1B2CC6080F17;
 Mon,  7 Feb 2022 15:29:27 +0100 (CET)
Message-ID: <07b3893c-afdc-6077-9187-eea87c747200@csgraf.de>
Date: Mon, 7 Feb 2022 15:29:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH 10/16] Revert "Revert "arm: tcg: Adhere to SMCCC 1.3
 section 5.2""
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20220127154639.2090164-1-peter.maydell@linaro.org>
 <20220127154639.2090164-11-peter.maydell@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20220127154639.2090164-11-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, Rob Herring <robh@kernel.org>,
 Andrew Jeffery <andrew@aj.id.au>, Andre Przywara <andre.przywara@arm.com>,
 Tyrone Ting <kfting@nuvoton.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Yanan Wang <wangyanan55@huawei.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Havard Skinnemoen <hskinnemoen@google.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 27.01.22 16:46, Peter Maydell wrote:
> Now that we have arranged for all the affected board models
> to not enable the PSCI emulation if they are running guest code
> at EL3, we can revert commit 4825eaae4fdd56fba0f, thus
> reinstating commit 9fcd15b9193e819b, without bringing back the
> regressions that caused us to revert it.
>
> For clarity, here is the original commit message of 9fcd15b9193e819b:
>
> The SMCCC 1.3 spec section 5.2 says
>
>    The Unknown SMC Function Identifier is a sign-extended value of (-1)
>    that is returned in the R0, W0 or X0 registers. An implementation must
>    return this error code when it receives:
>
>      * An SMC or HVC call with an unknown Function Identifier
>      * An SMC or HVC call for a removed Function Identifier
>      * An SMC64/HVC64 call from AArch32 state
>
> To comply with these statements, let's always return -1 when we encounter
> an unknown HVC or SMC call.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


Wouldn't it make more sense to apply the original patch again so that 
git blame points to the correct offender? ;)


Alex



