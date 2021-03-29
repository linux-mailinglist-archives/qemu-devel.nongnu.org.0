Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8FD34CE53
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Mar 2021 12:57:17 +0200 (CEST)
Received: from localhost ([::1]:45372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lQpa8-0006MK-9c
	for lists+qemu-devel@lfdr.de; Mon, 29 Mar 2021 06:57:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lQpYh-0005vV-03
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 06:55:47 -0400
Received: from mail.ispras.ru ([83.149.199.84]:58048)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1lQpYY-0000Zb-8T
 for qemu-devel@nongnu.org; Mon, 29 Mar 2021 06:55:46 -0400
Received: from [192.168.0.92] (unknown [62.118.151.149])
 by mail.ispras.ru (Postfix) with ESMTPSA id 110034076258;
 Mon, 29 Mar 2021 10:55:30 +0000 (UTC)
Subject: Re: [PATCH] replay: don't wait in run_on_cpu
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <161700514781.1141125.8890164582302771524.stgit@pasha-ThinkPad-X280>
 <e18262ca-c41b-2257-323a-ff22ba462ed5@redhat.com>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Message-ID: <2f94f9b5-0a90-dbc1-e35e-d6c43580c127@ispras.ru>
Date: Mon, 29 Mar 2021 13:55:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <e18262ca-c41b-2257-323a-ff22ba462ed5@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
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
Cc: richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 29.03.2021 12:42, Paolo Bonzini wrote:
> On 29/03/21 10:05, Pavel Dovgalyuk wrote:
>> @@ -136,7 +137,13 @@ void do_run_on_cpu(CPUState *cpu, run_on_cpu_func 
>> func, run_on_cpu_data data,
>>   {
>>       struct qemu_work_item wi;
>> -    if (qemu_cpu_is_self(cpu)) {
>> +    if (qemu_cpu_is_self(cpu)
>> +        /*
>> +         * vCPU thread is waiting when replay mutex is locked
>> +         * and the task is not exclusive, the function may be called
>> +         * without other synchronization.
>> +         */
>> +        || (replay_mode != REPLAY_MODE_NONE && replay_mutex_locked())) {
>>           func(cpu, data);
>>           return;
>>       }
> 
> Is the "or" saying that the execution is using the lockstep mode?  If 
> so, can you put it in a separate function so that it's more 
> self-explanatory and check if it should be used elsewhere?

It was replay (is that lockstep that you mentioned?).
I check that the mutex is already locked, which means, that vCPU
does nothing at this moment.

Pavel Dovgalyuk

