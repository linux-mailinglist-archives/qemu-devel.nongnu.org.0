Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57A225720B8
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 18:24:58 +0200 (CEST)
Received: from localhost ([::1]:36558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBIgy-0005pm-Vl
	for lists+qemu-devel@lfdr.de; Tue, 12 Jul 2022 12:24:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1oBIei-00048i-5A; Tue, 12 Jul 2022 12:22:36 -0400
Received: from [200.168.210.66] (port=61184 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1oBIeg-0005y3-HS; Tue, 12 Jul 2022 12:22:35 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 12 Jul 2022 13:22:29 -0300
Received: from [127.0.0.1] (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTPS id C6989800146;
 Tue, 12 Jul 2022 13:22:28 -0300 (-03)
Message-ID: <4d4e642b-3ecd-1fd5-3416-2c6353f84601@eldorado.org.br>
Date: Tue, 12 Jul 2022 13:22:28 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH RESEND v2 2/2] target/ppc: Implement ISA 3.00 tlbie[l]
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, npiggin@gmail.com
References: <20220624191424.190471-1-leandro.lupori@eldorado.org.br>
 <20220624191424.190471-3-leandro.lupori@eldorado.org.br>
 <fa56c2e6-3f05-e446-4b31-d6b88ee115de@linaro.org>
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
In-Reply-To: <fa56c2e6-3f05-e446-4b31-d6b88ee115de@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 12 Jul 2022 16:22:29.0169 (UTC)
 FILETIME=[94BD9A10:01D8960B]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 6/24/22 16:50, Richard Henderson wrote:
> On 6/24/22 12:14, Leandro Lupori wrote:
>> This initial version supports the invalidation of one or all
>> TLB entries. Flush by PID/LPID, or based in process/partition
>> scope is not supported, because it would make using the
>> generic QEMU TLB implementation hard. In these cases, all
>> entries are flushed.
>>
>> Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
>> ---
>>   target/ppc/helper.h                          |  18 +++
>>   target/ppc/mmu_helper.c                      | 154 +++++++++++++++++++
>>   target/ppc/translate/storage-ctrl-impl.c.inc |  15 ++
>>   3 files changed, 187 insertions(+)
>>
>> diff --git a/target/ppc/helper.h b/target/ppc/helper.h
>> index d627cfe6ed..5e663a0a50 100644
>> --- a/target/ppc/helper.h
>> +++ b/target/ppc/helper.h
>> @@ -672,6 +672,24 @@ DEF_HELPER_FLAGS_1(tlbia, TCG_CALL_NO_RWG, void, 
>> env)
>>   DEF_HELPER_FLAGS_2(tlbie, TCG_CALL_NO_RWG, void, env, tl)
>>   DEF_HELPER_FLAGS_2(tlbiva, TCG_CALL_NO_RWG, void, env, tl)
>>   #if defined(TARGET_PPC64)
>> +
>> +/*
>> + * tlbie[l] helper flags
>> + *
>> + * RIC, PRS, R and local are passed as flags in the last argument.
>> + */
>> +#define TLBIE_F_RIC_SHIFT       0
>> +#define TLBIE_F_PRS_SHIFT       2
>> +#define TLBIE_F_R_SHIFT         3
>> +#define TLBIE_F_LOCAL_SHIFT     4
>> +
>> +#define TLBIE_F_RIC_MASK        (3 << TLBIE_F_RIC_SHIFT)
>> +#define TLBIE_F_PRS             (1 << TLBIE_F_PRS_SHIFT)
>> +#define TLBIE_F_R               (1 << TLBIE_F_R_SHIFT)
>> +#define TLBIE_F_LOCAL           (1 << TLBIE_F_LOCAL_SHIFT)
>> +
> 
> Better to put these somewhere else -- internal.h probably -- helper.h is 
> included multiple
> times.

I guess I forgot about this change.
I'll move these defines to another header file.

Thanks,
Leandro

> 
> r~


