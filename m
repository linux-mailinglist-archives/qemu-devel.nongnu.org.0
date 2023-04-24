Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E38E6ECC60
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 14:53:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqvge-0006iR-3Y; Mon, 24 Apr 2023 08:52:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pqvgb-0006hz-Uy
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 08:52:53 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pqvgX-0001BZ-4T
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 08:52:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8t/vhPm0vh5Jg3ADihCMMJfjxUo6x8S6Mb8zgF4JGVE=; b=vDgKXH/B9I8UBudR+JrYRMnbLo
 uwvbR51WGepI/NlNcCQQR42pBNOD+CsVW47s/w/P3dr3rh3fC29eSdDPVX4SC9QnqHVYRwg7eOafK
 u35LupuJov9/OHh2+28ikiFCf4ib4LNCuWtRE/RVpXm1Vd3rRGKFMRAv8BuYAaw4bBvw=;
Message-ID: <e9768a73-7055-bbca-3642-dbfc0c43075a@rev.ng>
Date: Mon, 24 Apr 2023 14:52:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 7/8] cpu: Replace target_ulong with vaddr in
 tb_invalidate_phys_addr()
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>, ale@rev.ng,
 pbonzini@redhat.com, eduardo@habkost.net, marcel.apfelbaum@gmail.com,
 wangyanan55@huawei.com, qemu-devel@nongnu.org
References: <20230420212850.20400-1-anjo@rev.ng>
 <20230420212850.20400-8-anjo@rev.ng>
 <19f888bd-f0f4-2307-90c1-744f16ca77c2@linaro.org>
 <fe84e730-88e6-3b68-1929-758868757c68@linaro.org>
 <2c803abc-0f24-ecc6-fc14-56e674994829@linaro.org> <87jzy2e6i2.fsf@linaro.org>
 <97043d98-60f1-8820-8ae6-998b44e41528@linaro.org>
Organization: rev.ng
In-Reply-To: <97043d98-60f1-8820-8ae6-998b44e41528@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.194,
 SPF_HELO_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 4/23/23 21:42, Richard Henderson wrote:
> On 4/23/23 20:35, Alex Bennée wrote:
>>
>> Richard Henderson <richard.henderson@linaro.org> writes:
>>
>>> On 4/23/23 18:29, Philippe Mathieu-Daudé wrote:
>>>> On 23/4/23 11:14, Richard Henderson wrote:
>>>>> On 4/20/23 22:28, Anton Johansson wrote:
>>>>>> -void tb_invalidate_phys_addr(target_ulong addr)
>>>>>> +void tb_invalidate_phys_addr(vaddr addr)
>>>>>
>>>>> Hmm.  This isn't a virtual address, so 'vaddr' isn't right.
>>>>> I'm sure we have something more appropriate.
>>>> tb_page_addr_t?
>>>
>>> No, it isn't a ram_addr_t either (see exec-all.h).
>>> Perhaps just uint64_t.
>>
>> Surely hwaddr?
>
> Duh.  Thanks,

Thanks guys, and hwaddr it shall be!

-- 
Anton Johansson,
rev.ng Labs Srl.


