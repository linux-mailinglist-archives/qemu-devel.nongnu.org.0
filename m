Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFDF0414F11
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 19:28:38 +0200 (CEST)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT62v-0003sE-SQ
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 13:28:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT60t-0001b3-O7
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:26:33 -0400
Received: from [115.28.160.31] (port=39790 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT60q-0003q5-BV
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:26:30 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 32596633F2;
 Thu, 23 Sep 2021 01:26:23 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632331583; bh=5uS/HBSfwscyyDwfYtQhSd4T4eugzKMcGMICb7mrcB0=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=dxcGJh7Ok7H7g0WKR/4hLlR3kTk2RjLzT/IjE7lXuB8iJT1LjoRrVhpaPwK1vhyql
 EYaQnR7EClg0j0TmgC34DP6tqVau2k7Cl2njnMR2zbPCl2GOvY8g+8S70I5iSbKN+s
 /5v7E47NDWNbCDqei7Z87XG3V8ASFnfDnyk3Gfa8=
Message-ID: <22edcd8f-9299-2d7c-9cb9-973381b9c83c@xen0n.name>
Date: Thu, 23 Sep 2021 01:26:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v2 20/30] tcg/loongarch64: Implement setcond ops
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-21-git@xen0n.name>
 <596cef66-7b19-1ef8-92ec-1e916711b737@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <596cef66-7b19-1ef8-92ec-1e916711b737@linaro.org>
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

On 9/22/21 23:13, Richard Henderson wrote:
> On 9/21/21 1:19 PM, WANG Xuerui wrote:
>> +static void tcg_out_setcond(TCGContext *s, TCGCond cond, TCGReg ret,
>> +                            TCGReg arg1, TCGReg arg2, bool c1, bool c2)
>> +{
>> +    TCGReg tmp;
>> +
>> +    if (c1) {
>> +        tcg_debug_assert(arg1 == 0);
>> +    }
>> +    if (c2) {
>> +        tcg_debug_assert(arg2 == 0);
>> +    }
>
> You don't need to work quite this hard.  Only the second argument will 
> be constant.  If both are constant, we will have folded the operation 
> away.  If the first argument was constant, we will swap the condition.
Thanks for the clarification; again something I didn't discover during 
my (often cursory) read of tcg middle-end code. I'll drop all the c1 
thing in v3.

