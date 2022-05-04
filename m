Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4245197B8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 08:59:26 +0200 (CEST)
Received: from localhost ([::1]:41662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm8yr-0005Ig-6X
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 02:59:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nm8uS-0003lc-MI
 for qemu-devel@nongnu.org; Wed, 04 May 2022 02:54:52 -0400
Received: from mail.ispras.ru ([83.149.199.84]:40484)
 by eggs.gnu.org with esmtps (TLS1.2:DHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavel.dovgalyuk@ispras.ru>)
 id 1nm8uQ-00089J-5X
 for qemu-devel@nongnu.org; Wed, 04 May 2022 02:54:52 -0400
Received: from [10.12.102.111] (unknown [85.142.117.226])
 by mail.ispras.ru (Postfix) with ESMTPSA id 56EDC40755D8;
 Wed,  4 May 2022 06:54:20 +0000 (UTC)
Message-ID: <318d672a-9ad2-cfe0-4361-933d81fa28f4@ispras.ru>
Date: Wed, 4 May 2022 09:54:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/9] replay: notify vCPU when BH is scheduled
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: wrampazz@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
References: <165062838915.526882.13230207960407998257.stgit@pasha-ThinkPad-X280>
 <165062840023.526882.4524922830180183891.stgit@pasha-ThinkPad-X280>
 <40c2ef33-2775-5d85-e9ff-122d6aae4ced@linaro.org>
From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
In-Reply-To: <40c2ef33-2775-5d85-e9ff-122d6aae4ced@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=83.149.199.84;
 envelope-from=pavel.dovgalyuk@ispras.ru; helo=mail.ispras.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.04.2022 21:45, Richard Henderson wrote:
> On 4/22/22 04:53, Pavel Dovgalyuk wrote:
>> +void icount_notify_exit(void)
>> +{
>> +    if (icount_enabled() && first_cpu) {
>> +        cpu_exit(first_cpu);
>> +        qemu_clock_notify(QEMU_CLOCK_VIRTUAL);
>> +    }
>> +}
> 
> Why first_cpu?  Did you really want to continue to the end of the 
> round-robin?
> Otherwise I'd expect qemu_cpu_kick(current_cpu), or something.

Looks reasonable, thank you.



