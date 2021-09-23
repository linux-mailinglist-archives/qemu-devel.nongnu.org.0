Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A841416241
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 17:42:59 +0200 (CEST)
Received: from localhost ([::1]:38430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTQsE-0000Y3-0Y
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 11:42:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mTQog-0006Fb-Ny
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 11:39:21 -0400
Received: from [115.28.160.31] (port=53350 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mTQoG-0001K3-C6
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 11:39:18 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id A881C601A1;
 Thu, 23 Sep 2021 23:38:38 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632411518; bh=0bzF801qb8qQP9xJleLzi8YNny0nSevpC2eiFvNJx8g=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NIMsuwbicnwtoEsa2/1J4KkQ0/sD+m990vmGphJS04W/36G1Rzh/znlDddscMKplw
 sfYEBSPM60YkVjUqaz7YDiR2biUy8g1+O40DYuiFGgN8MOImIJ3x00jfUYLLIofkPl
 r5/SZCKe6GufKPmkaplvpHMkkrtKfBdpgeg1cR2Q=
Message-ID: <92b56526-a7ea-7bb3-fecf-10ecfb11a183@xen0n.name>
Date: Thu, 23 Sep 2021 23:38:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v3 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-10-git@xen0n.name>
 <08290515-e717-714e-b0cd-f8284a47313a@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <08290515-e717-714e-b0cd-f8284a47313a@linaro.org>
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
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/23/21 02:51, Richard Henderson wrote:
> On 9/22/21 11:09 AM, WANG Xuerui wrote:
>> +    if (sextreg(val, 0, 52) == val) {
>> +        /*
>> +         * Fits in 52-bits, upper bits are already properly 
>> sign-extended by
>> +         * cu32i.d.
>> +         */
>> +        return;
>> +    }
>> +    tcg_out_opc_cu52i_d(s, rd, rd, top);
>> +}
>
> Oh, future improvement: constants with 52 low zero bits can be loaded 
> with cu52i(rd, zero, val >> 52).
>
> Which means there's a set of interesting constants:
>
>   abc0_0000_0000_0def
>
>     ori    rd, zero, 0xdef
>     cu52i    rd, rd, 0xabc
>
>   abcf_ffff_ffff_fdef
>
>     cu52i    rd, zero, 0xabc - 1
>     addi.d    rd, rd, 0xdef
I think I'll try to implement this in some kind of follow-up patch, yeah.
>
> Also,
>
>> +    tcg_out_opc_lu12i_w(s, rd, upper);
>> +    if (low != 0) {
>> +        tcg_out_opc_ori(s, rd, rd, low & 0xfff);
>> +    }
>
> when upper == 0 and low != 0, we can omit the lu12i.
>
This optimization can't be blindly implemented though; because cu32i.d 
only takes one input register, in case upper == low == 0 but higher != 
0, we would have no proper input. So in that case something like "move 
rd, zero" is necessary, and logic is a little bit complicated. I'll 
include this in v4 though.
>
> r~

