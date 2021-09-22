Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C71415081
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:35:50 +0200 (CEST)
Received: from localhost ([::1]:45828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT820-000460-Qn
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:35:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT7Ol-00034s-1p
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:55:20 -0400
Received: from [115.28.160.31] (port=40986 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT7Oh-0001jT-42
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:55:14 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 11C0263414;
 Thu, 23 Sep 2021 02:55:06 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632336906; bh=bKNsJm/e1wwrhPmAJpj30SoX0n2KV8zyCDWTZLYpQk4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=kP5J7BvzpUVkXyl5dYC556toeyyDVb+l2/YdxxseFniGwpRPvoBDsNgPKcQuwLZzv
 N7YeMm3N16jHQoWFjA0mjQAfeCeoGlP8zGJmaZ/aRR+0kcfYNU/h93wK6bJXYMFnE0
 x2rFaSN92beYA7MB02L3uHwKijGU4fdEhVvs3XO0=
Message-ID: <e42af774-a4e1-c978-99e1-536e9737333d@xen0n.name>
Date: Thu, 23 Sep 2021 02:55:05 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v3 07/30] tcg/loongarch64: Implement necessary relocation
 operations
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 WANG Xuerui <git@xen0n.name>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-8-git@xen0n.name>
 <5e1286b2-83c7-db59-a4db-02af7c7dbcd2@amsat.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <5e1286b2-83c7-db59-a4db-02af7c7dbcd2@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 115.28.160.31 (failed)
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 9/23/21 02:41, Philippe Mathieu-Daudé wrote:
> On 9/22/21 20:09, WANG Xuerui wrote:
>> Signed-off-by: WANG Xuerui <git@xen0n.name>
>> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>   tcg/loongarch64/tcg-target.c.inc | 66 ++++++++++++++++++++++++++++++++
>>   1 file changed, 66 insertions(+)
>
>> +/* Field Sk16, shifted right by 2; suitable for conditional jumps */
>> +#define R_LOONGARCH_BR_SK16     256
>> +/* Field Sd10k16, shifted right by 2; suitable for B and BL */
>> +#define R_LOONGARCH_BR_SD10K16  257
>> +
>> +static bool reloc_br_sk16(tcg_insn_unit *src_rw, const tcg_insn_unit 
>> *target)
>> +{
>> +    const tcg_insn_unit *src_rx = tcg_splitwx_to_rx(src_rw);
>> +    intptr_t offset = (intptr_t)target - (intptr_t)src_rx;
>> +
>> +    tcg_debug_assert((offset & 3) == 0);
>> +    offset >>= 2;
>> +    if (offset == sextreg(offset, 0, 16)) {
>> +        *src_rw |= (offset << 10) & 0x3fffc00;
>
> Alternatively easier to read:
>
>            *src_rw = deposit64(*src_rw , 10, 16, offset);
Hmm, this helper could surely be reused at multiple places... I'll try 
to replace other operations like this in v4.
>
>> +        return true;
>> +    }
>> +
>> +    return false;
>> +}

