Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 806F9412EC5
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Sep 2021 08:44:15 +0200 (CEST)
Received: from localhost ([::1]:60118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mSZVm-0000SE-KH
	for lists+qemu-devel@lfdr.de; Tue, 21 Sep 2021 02:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSZPB-00046D-Qx
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:37:25 -0400
Received: from [115.28.160.31] (port=48226 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mSZP9-0005j7-6A
 for qemu-devel@nongnu.org; Tue, 21 Sep 2021 02:37:25 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 947FD600FF;
 Tue, 21 Sep 2021 14:37:14 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632206234; bh=pOQvKMyBJYWPrF8mHqkCPfctmtovFugbHIxT2vNk0m4=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=x61cBtWXJdH6RiDHya6Dfmf/KLjuahQcl6Dj1ueqnxj9ECF6YWTMMTSNbt1avNlRD
 rDlBCLUjPhUvAkCmuWjOeSdzYwX58C33rU8uIJ2WEoaeu5v/VdovEugagfChNTvzkN
 HIcilZS/E2LhxZcFS52Z8451rprXa8qw56jKkLDw=
Message-ID: <f9c0c0c2-73e6-4cd3-aded-7c00b7d9b871@xen0n.name>
Date: Tue, 21 Sep 2021 14:37:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH 14/30] tcg/loongarch: Implement bswap32_i32/bswap64_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210920080451.408655-1-git@xen0n.name>
 <20210920080451.408655-15-git@xen0n.name>
 <7e8ae810-fd12-a62e-2039-3b1cc4c824cb@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <7e8ae810-fd12-a62e-2039-3b1cc4c824cb@linaro.org>
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

On 9/20/21 23:11, Richard Henderson wrote:
> On 9/20/21 1:04 AM, WANG Xuerui wrote:
>> +    case INDEX_op_bswap32_i32:
>> +        tcg_out_opc_revb_2h(s, a0, a1);
>> +        tcg_out_opc_rotri_w(s, a0, a0, 16);
>> +        break;
>> +    case INDEX_op_bswap64_i64:
>> +        tcg_out_opc_revb_d(s, a0, a1);
>> +        break;
>
> You're missing INDEX_op_bswap32_i64, which in addition has a third 
> argument consisting of TCG_BSWAP_* bits.
>
> I would have expected revb_2w to be the preferred implementation of 
> bswap32.  I would expect something like
>
>
>     case INDEX_op_bswap32_i32:
>         /* All 32-bit values are computed sign-extended in the 
> register. */
>         a2 = TCG_BSWAP_OS;
>         /* fall through */
>     case INDEX_op_bswap32_i64:
>         tcg_out_opc_revb_2w(s, a0, a1);
>         if (a2 & TCG_BSWAP_OS) {
>             tcg_out_ext32s(s, a0, a0);
>         } else if (a2 & TCG_BSWAP_OZ) {
>             tcg_out_ext32u(s, a0, a0);
>         }
>         break;
>
You're right when we're supporting only 64-bit hosts. While I was 
writing that code I hadn't decided whether to remove support for 32-bit 
hosts, so I didn't make use of 64-bit instructions for the 32-bit ops. 
I'll fix this in v2.
>
> r~

