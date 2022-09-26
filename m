Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4275EB219
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 22:30:47 +0200 (CEST)
Received: from localhost ([::1]:57866 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocukY-0000Ll-D7
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 16:30:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1ocuaA-0004us-5D; Mon, 26 Sep 2022 16:20:02 -0400
Received: from mail.csgraf.de ([85.25.223.15]:56728 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1ocua8-0001SQ-Hp; Mon, 26 Sep 2022 16:20:01 -0400
Received: from [10.95.79.201]
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with ESMTPSA id C1A3E608061F;
 Mon, 26 Sep 2022 22:19:57 +0200 (CEST)
Message-ID: <a4461fc5-bfb4-9be8-459b-4f469e19d25a@csgraf.de>
Date: Mon, 26 Sep 2022 22:19:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v2 03/11] target/arm: ensure HVF traps set appropriate
 MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-4-alex.bennee@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20220926133904.3297263-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=85.25.223.15; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.319,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 26.09.22 15:38, Alex Bennée wrote:
> As most HVF devices are done purely in software we need to make sure
> we properly encode the source CPU in MemTxAttrs. This will allow the
> device emulations to use those attributes rather than relying on
> current_cpu (although current_cpu will still be correct in this case).
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Mads Ynddal <mads@ynddal.dk>
> Cc: Alexander Graf <agraf@csgraf.de>
> ---
>   target/arm/hvf/hvf.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 060aa0ccf4..13b7971560 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1233,11 +1233,11 @@ int hvf_vcpu_exec(CPUState *cpu)
>               val = hvf_get_reg(cpu, srt);
>               address_space_write(&address_space_memory,
>                                   hvf_exit->exception.physical_address,
> -                                MEMTXATTRS_UNSPECIFIED, &val, len);
> +                                MEMTXATTRS_CPU(cpu->cpu_index), &val, len);


I think it would make a safer API if MEMTXATTRS_CPU() would take 
CPUState * as argument so you can just pass in cpu here.

For the HVF part however,

Acked-by: Alexander Graf <agraf@csgraf.de>


Alex



