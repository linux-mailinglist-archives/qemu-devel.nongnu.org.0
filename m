Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBB067457A
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Jan 2023 23:04:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pId16-0002dj-04; Thu, 19 Jan 2023 17:04:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pId0t-0002UN-3F; Thu, 19 Jan 2023 17:04:04 -0500
Received: from linux.microsoft.com ([13.77.154.182])
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eiakovlev@linux.microsoft.com>)
 id 1pId0j-0006h8-Uu; Thu, 19 Jan 2023 17:04:02 -0500
Received: from [192.168.0.20] (unknown [77.64.253.186])
 by linux.microsoft.com (Postfix) with ESMTPSA id 1DEEF20E09FD;
 Thu, 19 Jan 2023 14:03:41 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 1DEEF20E09FD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
 s=default; t=1674165823;
 bh=IrlmIyq6dXkAWOFnaVlWqG8mJktcmtMCI/lEVURgqO0=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=AMStUl97NRTwGsJPeshrT44Fp9pR+G8P4IzD8VVl4p2e01sbmo84pQ4FRVs/9pN5t
 yuUDIq+xcZE2hvibfuRAErzjirfto8q9hKdD+ku4/iTi4joAdMPGaJtfh43tuFZD12
 3M/wdz9D9/rehLq9zb5A55ify3vcVtVWrT9jQRFI=
Message-ID: <640fb5b5-6524-9cce-22c6-fe94df80e91d@linux.microsoft.com>
Date: Thu, 19 Jan 2023 23:03:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v2 1/2] target/arm: implement DBGCLAIM registers
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org
References: <20230117150405.2940-1-eiakovlev@linux.microsoft.com>
 <20230117150405.2940-2-eiakovlev@linux.microsoft.com>
 <16c2871a-9e2a-5113-a121-5373d6e4bb71@linaro.org>
From: Evgeny Iakovlev <eiakovlev@linux.microsoft.com>
In-Reply-To: <16c2871a-9e2a-5113-a121-5373d6e4bb71@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=13.77.154.182;
 envelope-from=eiakovlev@linux.microsoft.com; helo=linux.microsoft.com
X-Spam_score_int: -198
X-Spam_score: -19.9
X-Spam_bar: -------------------
X-Spam_report: (-19.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, ENV_AND_HDR_SPF_MATCH=-0.5,
 NICE_REPLY_A=-0.094, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 1/17/2023 16:48, Richard Henderson wrote:
> On 1/17/23 05:04, Evgeny Iakovlev wrote:
>> +    { .name = "DBGCLAIMCLR_EL1", .state = ARM_CP_STATE_BOTH,
>> +      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 7, .crm = 9, .opc2 = 6,
>> +      .access = PL1_RW, .accessfn = access_tda,
>> +      .writefn = dbgclaimclr_write, .raw_writefn = 
>> dbgclaimclr_raw_write,
>> +      .fieldoffset = offsetof(CPUARMState, cp15.dbgclaim) },
>
> You didn't need a new function, just .raw_writefn = raw_write
> (which then uses .fieldoffset to dtrt).


Ah, i see, okay.


>
> Otherwise,
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
>
> r~

