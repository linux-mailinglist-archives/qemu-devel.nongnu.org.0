Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8E135EB20C
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 22:27:16 +0200 (CEST)
Received: from localhost ([::1]:35450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocuh9-0004GG-CR
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 16:27:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40898)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1ocuWV-0001Tg-In; Mon, 26 Sep 2022 16:16:20 -0400
Received: from mail.csgraf.de ([85.25.223.15]:33924 helo=zulu616.server4you.de)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1ocuWQ-00013J-8F; Mon, 26 Sep 2022 16:16:14 -0400
Received: from [10.95.79.201]
 (ec2-3-122-114-9.eu-central-1.compute.amazonaws.com [3.122.114.9])
 by csgraf.de (Postfix) with ESMTPSA id A543D608061F;
 Mon, 26 Sep 2022 22:15:59 +0200 (CEST)
Message-ID: <91ee005f-d9a9-eb77-43a8-96365b088ee0@csgraf.de>
Date: Mon, 26 Sep 2022 22:15:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.0
Subject: Re: [PATCH v2 01/11] hw: encode accessing CPU index in MemTxAttrs
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: f4bug@amsat.org, mads@ynddal.dk, qemu-arm@nongnu.org
References: <20220926133904.3297263-1-alex.bennee@linaro.org>
 <20220926133904.3297263-2-alex.bennee@linaro.org>
From: Alexander Graf <agraf@csgraf.de>
In-Reply-To: <20220926133904.3297263-2-alex.bennee@linaro.org>
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
> We currently have hacks across the hw/ to reference current_cpu to
> work out what the current accessing CPU is. This breaks in some cases
> including using gdbstub to access HW state. As we have MemTxAttrs to
> describe details about the access lets extend it to mention if this is
> a CPU access and which one it is.
>
> There are a number of places we need to fix up including:
>
>    CPU helpers directly calling address_space_*() fns
>    models in hw/ fishing the data out of current_cpu
>    hypervisors offloading device emulation to QEMU
>
> I'll start addressing some of these in following patches.
>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>
> ---
> v2
>    - use separate field cpu_index
>    - bool for requester_is_cpu
> v3
>    - switch to enum MemTxRequesterType
>    - move helper #define to patch
>    - revert to overloading requester_id
>    - mention hypervisors in commit message
>    - drop cputlb tweaks, they will move to target specific code
> ---
>   include/exec/memattrs.h | 17 ++++++++++++++++-
>   1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/include/exec/memattrs.h b/include/exec/memattrs.h
> index 9fb98bc1ef..0fb5f29d25 100644
> --- a/include/exec/memattrs.h
> +++ b/include/exec/memattrs.h
> @@ -14,6 +14,15 @@
>   #ifndef MEMATTRS_H
>   #define MEMATTRS_H
>   
> +/*
> + * Where the memory transaction comes from
> + */
> +typedef enum MemTxRequesterType {
> +    MEMTXATTRS_CPU,
> +    MEMTXATTRS_MSI,


I don't think MSI is any sensible identifier here. What you actually are 
trying to describe are bus messages that may carry additional source 
information - and what you describe as "MSI" here most likely means "no 
further information".

How about you just call it "BUS", "DMA" or literally "UNSPECIFIED" for 
now? Also, why is unspecified not part of the requester type enum?


Alex

> +} MemTxRequesterType;
> +
> +
>   /* Every memory transaction has associated with it a set of
>    * attributes. Some of these are generic (such as the ID of
>    * the bus master); some are specific to a particular kind of
> @@ -43,7 +52,9 @@ typedef struct MemTxAttrs {
>        * (see MEMTX_ACCESS_ERROR).
>        */
>       unsigned int memory:1;
> -    /* Requester ID (for MSI for example) */
> +    /* Requester type (e.g. CPU or PCI MSI) */
> +    MemTxRequesterType requester_type:2;
> +    /* Requester ID */
>       unsigned int requester_id:16;
>       /* Invert endianness for this page */
>       unsigned int byte_swap:1;
> @@ -66,6 +77,10 @@ typedef struct MemTxAttrs {
>    */
>   #define MEMTXATTRS_UNSPECIFIED ((MemTxAttrs) { .unspecified = 1 })
>   
> +/* Helper for setting a basic CPU sourced transaction */
> +#define MEMTXATTRS_CPU(id) ((MemTxAttrs) \
> +                            {.requester_type = MEMTXATTRS_CPU, .requester_id = id})
> +
>   /* New-style MMIO accessors can indicate that the transaction failed.
>    * A zero (MEMTX_OK) response means success; anything else is a failure
>    * of some kind. The memory subsystem will bitwise-OR together results

