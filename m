Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A490B414F09
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 19:27:51 +0200 (CEST)
Received: from localhost ([::1]:56594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT62A-0002Hm-NR
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 13:27:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT5z8-0008DT-FA
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:24:42 -0400
Received: from [115.28.160.31] (port=39766 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT5z6-0002Np-Ru
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:24:42 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 0D35F633F2;
 Thu, 23 Sep 2021 01:24:36 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632331477; bh=N7hOZ4nx03RWvqGqiPir9YE8QzljraRSBKIRtiIbk5g=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=Um8g8wY0qbgzUFVhd77OnrPmAB4EBwjHRXXOGRzJD3Fu5iMIh4l3innN71d+Xo77T
 uyWAb2to3q8hvvf4NFD4eFIDD13+fgsPJbV3jyI28IdX1VVgZi18lFWs9CRzA1OIer
 2lbdlwauFi+oK4xiBFxt7Rhu0eUkrrmohP6NXFYI=
Message-ID: <511e9308-cd42-ea25-08c3-2f5ca2edcb65@xen0n.name>
Date: Thu, 23 Sep 2021 01:24:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v2 14/30] tcg/loongarch64: Implement
 bswap32_i32/bswap32_i64/bswap64_i64
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-15-git@xen0n.name>
 <6c009208-6afe-5efe-a067-dcc44421cd7b@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <6c009208-6afe-5efe-a067-dcc44421cd7b@linaro.org>
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

On 9/22/21 22:54, Richard Henderson wrote:
> On 9/21/21 1:18 PM, WANG Xuerui wrote:
>> +    case INDEX_op_bswap32_i32:
>> +        /* All 32-bit values are computed sign-extended in the 
>> register.  */
>> +        a2 = TCG_BSWAP_OS;
>> +        /* fallthrough */
>> +    case INDEX_op_bswap32_i64:
>> +        tcg_out_opc_revb_2w(s, a0, a1);
>> +        if (a2 & TCG_BSWAP_OS) {
>> +            tcg_out_ext32s(s, a0, a0);
>> +        } else if ((a2 & (TCG_BSWAP_IZ | TCG_BSWAP_OZ)) == 
>> TCG_BSWAP_OZ) {
>> +            tcg_out_ext32u(s, a0, a0);
>> +        }
>> +        break;
>
> Looks good so far, so:
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> We'll also want INDEX_op_bswap16_{i32,i64}.  This should look just 
> like bswap32_i64, except with revb_2h and ext16{s,u}.
Thanks for the suggestion; I'll add these in v3, since they're 
relatively light-weight to implement.
>
>
> r~

