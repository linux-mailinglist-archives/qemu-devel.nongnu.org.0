Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E10F644F101
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 04:20:47 +0100 (CET)
Received: from localhost ([::1]:52644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mljaw-0001RN-IS
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 22:20:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42250)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mljZJ-0000kB-Eh
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 22:19:05 -0500
Received: from mail.xen0n.name ([115.28.160.31]:60068
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mljZG-00012x-Iv
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 22:19:05 -0500
Received: from [192.168.9.172] (unknown [101.88.31.179])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id AA53A600B5;
 Sat, 13 Nov 2021 11:18:51 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1636773531; bh=E77eFXRoD5Qff7N36yl9OGWx96+gqjAH0jCWoQoejvU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iDKJ11GsmKQPW0CgkZaH3eJCAQSStiZzvwLBDVnxlkkjLcz13QPoVQToY4l2cGQYW
 eqM7zQPX9KDK0AflqQ1nS+tSktbyUawtXe+oHXrA3VAnab6KOUaiwWCcsndX9v4Ynb
 5s9AnjE+6d7rQPTlPEofdMtiLena1OGhIp4EBx5w=
Message-ID: <8662eafa-8cef-4e54-1d07-db093c924cda@xen0n.name>
Date: Sat, 13 Nov 2021 11:18:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:96.0) Gecko/20100101
 Thunderbird/96.0a1
Subject: Re: [PATCH v10 04/26] target/loongarch: Add fixed point arithmetic
 instruction translation
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1636700049-24381-1-git-send-email-gaosong@loongson.cn>
 <1636700049-24381-5-git-send-email-gaosong@loongson.cn>
 <7e6e5c26-2c1a-e4b5-a724-c2db33a36180@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <7e6e5c26-2c1a-e4b5-a724-c2db33a36180@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.449,
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/12/21 22:05, Richard Henderson wrote:
> On 11/12/21 7:53 AM, Song Gao wrote:
>> +#
>> +# Fields
>> +#
>> +%rd      0:5
>> +%rj      5:5
>> +%rk      10:5
>> +%sa2     15:2
>> +%si12    10:s12
>> +%ui12    10:12
>> +%si16    10:s16
>> +%si20    5:s20
>
> You should only create separate field definitions like this when they 
> are complex: e.g. the logical field is disjoint or there's a need for 
> !function.
>
>> +
>> +#
>> +# Argument sets
>> +#
>> +&fmt_rdrjrk         rd rj rk
>> +&fmt_rdrjsi12       rd rj si12
>> +&fmt_rdrjrksa2      rd rj rk sa2
>> +&fmt_rdrjsi16       rd rj si16
>> +&fmt_rdrjui12       rd rj ui12
>> +&fmt_rdsi20         rd si20
>
> Some of these should be combined.  The width of the immediate is a 
> detail of the format, not the decoded argument set.  Thus you should have
>
> &fmt_rdimm     rd imm
> &fmt_rdrjimm   rd rj imm
> &fmt_rdrjrk    rd rj rk
> &fmt_rdrjrksa  rd rj rk sa

I'd like to add, that the organization of the whole decodetree file 
closely resembles that of the ISA manual, most likely on purpose (while 
not stated anywhere in the patch). However the manual itself is not 
without errors or inconsistencies; for example, the 9 "base instruction 
formats" classification is nowhere near accurate, and here we can see 
the author is forced to create ad-hoc names (repeating the operand 
slots). I suggest just generating the descriptions from the 
loongarch-opcodes project [1]; no need to duplicate work. I'll happily 
help if you decide to do that.

[1]: https://github.com/loongson-community/loongarch-opcodes

>
>> +alsl_w           0000 00000000 010 .. ..... ..... .....   
>> @fmt_rdrjrksa2
>> +alsl_wu          0000 00000000 011 .. ..... ..... ..... @fmt_rdrjrksa2
>> +alsl_d           0000 00000010 110 .. ..... ..... ..... @fmt_rdrjrksa2
>
> The encoding of these insns is that the shift is sa+1.
>
> While you compensate for this in gen_alsl_*, we print the "wrong" 
> number in the disassembly.  I think it would be better to do
>
> %sa2p1     15:2 !function=plus_1
> @fmt_rdrjrksa2p1  .... ........ ... .. rk:5 rj:5 rd:5 \
>                   &fmt_rdrjrksa sa=%sa2p1

Here again, the manual was inconsistent with the binutils 
implementation; the manual says (for ALSL.W, it's SLADD in 
loongarch-opcodes project's revised mnemonics):

"ALSL.W logically left-shifts rj[31:0] by (sa2+1) bits, [snip]" 
(translation mine, not copied from the official translation)

Clearly the "+1" part is not meant to show up in disassembly. Yet the 
binutils implementation acts as if the operand should be pre-added 1 in 
source code, and disassembles and prints as such, obvious mismatch here. 
I'd suggest fixing the disassembly code to remove this inconsistency. 
And the "+1" "feature" is not used anywhere else AFAIK, so it wouldn't 
hurt to just delete everything about it.

>
>
> r~
>

