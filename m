Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 000E52FF56A
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 21:08:16 +0100 (CET)
Received: from localhost ([::1]:52928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2gFc-0003Tn-1h
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 15:08:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40860)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>) id 1l2gEI-000205-1Q
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:06:54 -0500
Received: from mail.csgraf.de ([188.138.100.120]:51356
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>) id 1l2gEG-0006Ch-0W
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 15:06:53 -0500
Received: from macbook.alex.local
 (dynamic-095-117-099-148.95.117.pool.telefonica.de [95.117.99.148])
 by csgraf.de (Postfix) with ESMTPSA id 6C07C39001A8;
 Thu, 21 Jan 2021 21:06:49 +0100 (CET)
Subject: Re: [PATCH v4] tcg: Toggle page execution for Apple Silicon
From: Alexander Graf <agraf@csgraf.de>
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20210121184752.1395873-1-richard.henderson@linaro.org>
 <6d5d9d93-30b6-2f71-e71b-94bd8f18198a@csgraf.de>
Message-ID: <c3913168-874a-cf6c-801f-5f61ff8d685f@csgraf.de>
Date: Thu, 21 Jan 2021 21:06:48 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <6d5d9d93-30b6-2f71-e71b-94bd8f18198a@csgraf.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Roman Bolshakov <r.bolshakov@yadro.com>, j@getutm.app
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 21.01.21 21:01, Alexander Graf wrote:
> On 21.01.21 19:47, Richard Henderson wrote:
>> From: Roman Bolshakov <r.bolshakov@yadro.com>
>>
>> Pages can't be both write and executable at the same time on Apple
>> Silicon. macOS provides public API to switch write protection [1] for
>> JIT applications, like TCG.
>>
>> 1. https://developer.apple.com/documentation/apple_silicon/porting_just-in-time_compilers_to_apple_silicon
>>
>> Signed-off-by: Roman Bolshakov <r.bolshakov@yadro.com>
>> Message-Id: <20210113032806.18220-1-r.bolshakov@yadro.com>
>> [rth: Inline the qemu_thread_jit_* functions;
>>  drop the MAP_JIT change for a follow-on patch.]
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>
>> Supercedes: <20210113032806.18220-1-r.bolshakov@yadro.com>
>>
>> This is the version of Roman's patch that I'm queuing to tcg-next.
>> What's missing from the full "Fix execution" patch is setting MAP_JIT
>> for !splitwx in alloc_code_gen_buffer().
>
> This patch segfaults in tcg_out32() for me if I add the MAP_JIT flag
> manually to the mmap call:


I take it all back. I forgot to actually git am the patch :(. It works
just fine.

Tested-by: Alexander Graf <agraf@csgraf.de>


Alex



