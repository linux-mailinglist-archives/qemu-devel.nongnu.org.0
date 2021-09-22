Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0919415090
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 21:39:03 +0200 (CEST)
Received: from localhost ([::1]:53622 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT858-0001DM-50
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 15:39:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT7Vi-0006Hb-Uc
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:02:26 -0400
Received: from [115.28.160.31] (port=41074 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT7Vg-0008L3-0M
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 15:02:26 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id AC7C763415;
 Thu, 23 Sep 2021 03:02:14 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632337334; bh=G18VwkLwJz0MJCkMD3Fd8QqdfRPpoVB5wGZucaHO4dc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=YhTYtciMqatmI4MT+6fLb1NLIxY7o98sdHAhsCv34QXfwskrRSckhrMxhU75RciYc
 7DVaeapQ+ub3yYKokvlyso7S7da/f5nYPoio+b3GGZ6aeuiToJla2UoCXyJwzgVs5J
 WzcF5xULsrJEkX6HcRKcWONufSLyw5nbxDZm9F64=
Message-ID: <fc3d2c98-4d01-e7b3-0ebe-48338870538a@xen0n.name>
Date: Thu, 23 Sep 2021 03:02:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v3 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-10-git@xen0n.name>
 <9e63bd14-8957-65a3-0eef-65a533a9e55d@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <9e63bd14-8957-65a3-0eef-65a533a9e55d@linaro.org>
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

On 9/23/21 02:39, Richard Henderson wrote:
> On 9/22/21 11:09 AM, WANG Xuerui wrote:
>> +    if (pc_offset == (int32_t)pc_offset) {
>> +        tcg_target_long lo = sextreg(pc_offset, 0, 12);
>> +        tcg_target_long hi = pc_offset - lo;
>> +        tcg_out_opc_pcaddu12i(s, rd, hi >> 12);
>> +        tcg_out_opc_addi_d(s, rd, rd, lo);
>
> pc_offset = 0x7ffff800 will fail:
>
> lo = 0xfffffffffffff800
> hi = 0x0000000080000000
>
> but hi will be interpreted as negative by pcaddu12i.
>
> This is the same problem I pointed out with tcg_out_call, but with 
> different constants.
>
Hmm, I think I'll have to look into this, but not now (it's again 3 am 
here)... I'll try to come up with something tomorrow.
>
> r~

