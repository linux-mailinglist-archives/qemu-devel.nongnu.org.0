Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3505A414F00
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 19:26:13 +0200 (CEST)
Received: from localhost ([::1]:52144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT60Z-0007Yl-DW
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 13:26:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT5xU-0005w6-Jv
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:23:00 -0400
Received: from [115.28.160.31] (port=39742 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1mT5xR-0000vg-F9
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 13:23:00 -0400
Received: from [192.168.9.172] (unknown [101.88.29.172])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id 3F709633F2;
 Thu, 23 Sep 2021 01:22:50 +0800 (CST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=xen0n.name; s=mail;
 t=1632331370; bh=jaJkrmIgB27M4P+V5/kKzlDabr09FQW9T7rUNfyQ3Ww=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=ofv56Dam3eJeZCKPtBcRj657vovZ8ibYaelzBgroTXDmfv19fYYZh4TFKiuAY+BFu
 tx3jqI1zZY8XDzXGA/EJsf31cFP9x2x5UhZw/tbQ9RCkDBIWl8uuPJbTma8LdjzOHG
 8k6e+crI/XZGNKDasmKjk/dH2BN+RcBJ8m9RIjT4=
Message-ID: <2e8e9087-2f17-1536-585e-c666ee568b1a@xen0n.name>
Date: Thu, 23 Sep 2021 01:22:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:94.0) Gecko/20100101
 Thunderbird/94.0a1
Subject: Re: [PATCH v2 09/30] tcg/loongarch64: Implement tcg_out_mov and
 tcg_out_movi
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210921201915.601245-1-git@xen0n.name>
 <20210921201915.601245-10-git@xen0n.name>
 <0717a7de-7c41-990d-ec7a-51b44f49724e@linaro.org>
 <75621c34-5cf8-3ae9-86cf-ce3cf53b4669@xen0n.name>
 <d0a802cf-a916-f7ff-6894-87930f07a667@linaro.org>
From: WANG Xuerui <i.qemu@xen0n.name>
In-Reply-To: <d0a802cf-a916-f7ff-6894-87930f07a667@linaro.org>
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

On 9/22/21 23:17, Richard Henderson wrote:
> On 9/22/21 8:16 AM, WANG Xuerui wrote:
>> Hi Richard,
>>
>> On 9/22/21 12:25, Richard Henderson wrote:
>>> On 9/21/21 1:18 PM, WANG Xuerui wrote:
>>>> +    /* Test for PC-relative values that can be loaded faster.  */
>>>> +    intptr_t pc_offset = val - (uintptr_t)s->code_ptr;
>>>
>>> This isn't quite right for split r^x code buffer.
>>> You should have seen this with --enable-debug-tcg...
>>>
>>> You need pc_offset = tcg_pcrel_diff(s, (void *)val).
>> Indeed; I just realized TCG debugging isn't fully enabled with 
>> --enable-debug only.
>
> Um... it should be.
Hmm, maybe I was having the wrong impression, I even grepped for 
CONFIG_DEBUG_TCG and it showed 1, yet my assertions didn't fire during 
one of my debugging sessions... Maybe I was just asserting at the wrong 
place. Never mind though, problems are all solved now.

