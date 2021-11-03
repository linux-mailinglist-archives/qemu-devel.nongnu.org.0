Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 20941443E8A
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 09:46:06 +0100 (CET)
Received: from localhost ([::1]:48784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miBuH-0006s5-0N
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 04:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36244)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1miBt1-00065O-Ms
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:44:47 -0400
Received: from mail.ispras.ru ([83.149.199.84]:42420)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1miBsy-0002SW-FE
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 04:44:47 -0400
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 2085140755D0;
 Wed,  3 Nov 2021 08:44:34 +0000 (UTC)
Subject: Re: [PATCH 4/4] icount: preserve cflags when custom tb is about to
 execute
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <163542167953.2127597.8760651610734002929.stgit@pasha-ThinkPad-X280>
 <163542170287.2127597.18369415404458239885.stgit@pasha-ThinkPad-X280>
 <f6e2ae69-e838-5475-035e-b19a510b18b0@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <7b7d0e15-9fb4-a1e0-508f-f890ca7aca69@ispras.ru>
Date: Wed, 3 Nov 2021 11:44:33 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <f6e2ae69-e838-5475-035e-b19a510b18b0@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.549,
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
Cc: pbonzini@redhat.com, alex.bennee@linaro.org, peterx@redhat.com,
 david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28.10.2021 22:26, Richard Henderson wrote:
> On 10/28/21 4:48 AM, Pavel Dovgalyuk wrote:
>> +        if (cpu->cflags_next_tb == -1
>> +            && (!use_icount || !(tb->cflags & CF_USE_ICOUNT)
>> +                || cpu_neg(cpu)->icount_decr.u16.low >= tb->icount)) {
>> +            /*
>> +             * icount is disabled or there are enough instructions
>> +             * in the budget, do not retranslate this block with
>> +             * different parameters.
>> +             */
>> +            cpu->cflags_next_tb = tb->cflags;
>> +        }
> 
> I can't see that this will work.

The issue was the following:
- icount is enabled
- watchpoint hit
- next block should contain a single instruction to stop the execution 
after memory access
- tb with one instruction is translated, cflags_next_tb is reset
- main loop breaks the execution for some reason
- after resuming the execution, we are trying to find new tb without any 
filter in cflags
- tb with multiple instructions is executed (instead of previously 
generated)

> 
> We've been asked to exit to the main loop; probably for an interrupt.  
> The next thing that's likely to happen is that cpu_cc->do_interrupt will 
> adjust cpu state to continue in the guest interrupt handler.  The 
> cflags_next_tb flag that you're setting up is not relevant to that context.
> 
> This seems related to Phil's reported problem
> 
>    https://gitlab.com/qemu-project/qemu/-/issues/245
> 
> in which an interrupt arrives before we finish processing the watchpoint.

Right, this is similar.

> 
> I *think* we need to make cflags_next_tb != -1 be treated like any other 
> interrupt disable bit, and delay delivery of the interrupt.  Which also 
> means that we should not check for exit_tb at the beginning of any TB we 
> generate for the watchpoint step.
> 
> I simply haven't taken the time to investigate this properly.
> 
> 
> r~


