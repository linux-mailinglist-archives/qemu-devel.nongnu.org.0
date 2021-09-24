Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B89D41787F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 18:28:19 +0200 (CEST)
Received: from localhost ([::1]:46338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTo3d-0003NX-IE
	for lists+qemu-devel@lfdr.de; Fri, 24 Sep 2021 12:28:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mTo2B-0002UM-5e
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:26:47 -0400
Received: from [115.28.160.31] (port=40718 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mTo28-0007b0-MA
 for qemu-devel@nongnu.org; Fri, 24 Sep 2021 12:26:46 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 701B560B0D;
 Sat, 25 Sep 2021 00:26:27 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632500787; bh=63zw+w5HmmCJ4TvSlKq7A14/IAGsOK7S72WT4rCqtic=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=EKkbOxrmvfm3L0gJO5CU0D55apS98lUzfiReHLYWO8WWyTYIDIFtxyGFPpf9zyOhY
 Lc9xiib9XDtWr/aRpZAVQ0iOvhrruhMNwFPKE0dohvDiVuooqQA4Y4eB7Z8DhD150V
 oujzQSIlMJQKtudhFernqO5vNWuA/QDdbOYwSejw=
Message-ID: <21860285-7cec-28a7-0c01-5ab244d562ab@xen0n.name>
Date: Sat, 25 Sep 2021 00:26:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v3 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>
References: <20210922180927.666273-1-git@xen0n.name>
 <20210922180927.666273-10-git@xen0n.name>
 <5ace7b10-b7de-46e2-2021-01129024ffe2@linaro.org>
 <7ca2e822-839f-96ab-9dc9-276565d03478@xen0n.name>
 <26730e70-e5be-1dd2-7c19-d4c6a82d36ec@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <26730e70-e5be-1dd2-7c19-d4c6a82d36ec@linaro.org>
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Richard,

On 9/24/21 23:53, Richard Henderson wrote:
> On 9/24/21 11:08 AM, WANG Xuerui wrote:
>> Oops, for some reason I only received this at about 8 pm...
>
> That was my fault.  I wrote a bunch of stuff off-line yesterday while 
> traveling, and the mail queue only flushed this morning.
>
> I'll note there's a bug in my example code wrt initializing rd with 
> addi, then overwriting with cu32i.d.
>
> I like your v4 version of movi, with the high-bit-set predicate. The 
> only case I can think of that you miss is e.g. 0x7fffffffffffffff, 
> which can be
>
>     addi.w    rd, zero, -1
>     cu52i.d    rd, rd, 0x7ff
>
> One possibility is to extract a subroutine:
>
> static void tcg_out_movi_i32(TCGContext *s, TCGReg rd, int32_t val)
> {
>     /* Single instruction cases */
>     /* else lu12i.w + ori */
> }
>
> static void tcg_out_movi(TCGContext *s, TCGType type, TCGReg rd,
>                          tcg_target_long val)
> {
>     if (type == TCG_TYPE_I32 || val == (int32_t)val) {
>         tcg_out_movi_i32(s, rd, val);
>         return;
>     }
>
>     /* PC-relative cases */
>
>     if (ctz64(val) >= 52) {
>         tcg_out_opc_cu52i_d(s, rd, TCG_REG_ZERO, val >> 52);
>         return;
>     }
>
>     /* Slow path.  Initialize the low 32-bits, then concat high bits. */
>     tcg_out_movi_i32(s, rd, val);
>
>     rd_high_bits_are_ones = (int32_t)val < 0);
>
>     /* Your imm_part_needs_loading checks; rd is always written. */
> }
>
This is so impressive understanding of the LoongArch assembly, working 
around cu32i.d's single operand limitation so nicely. I'll just 
(shamelessly) take this for v5, thanks again!
>
> r~

