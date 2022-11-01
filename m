Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 560406148CD
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Nov 2022 12:30:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oppRr-0002Gi-AO; Tue, 01 Nov 2022 07:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oppRo-0002Fn-NO
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:28:48 -0400
Received: from mail.weilnetz.de ([37.120.169.71]
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1oppRm-0005ob-SN
 for qemu-devel@nongnu.org; Tue, 01 Nov 2022 07:28:48 -0400
Received: from [192.168.178.59] (p5b151d14.dip0.t-ipconnect.de [91.21.29.20])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 22FFCDA045D;
 Tue,  1 Nov 2022 12:28:44 +0100 (CET)
Message-ID: <4015d586-f0ff-40a3-7d66-49b05be8f00a@weilnetz.de>
Date: Tue, 1 Nov 2022 12:28:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.0
Subject: Re: [PATCH v3 16/24] disas/nanomips: Remove IMMEDIATE functions
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Milica Lazarevic <milica.lazarevic@syrmia.com>, thuth@redhat.com
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220912122635.74032-1-milica.lazarevic@syrmia.com>
 <20220912122635.74032-17-milica.lazarevic@syrmia.com>
 <78553699-00c1-ad69-1d58-02f75a1f4fe3@weilnetz.de>
 <3584ab7a-7a0f-753b-ea5a-c6e9bc546d0c@linaro.org>
In-Reply-To: <3584ab7a-7a0f-753b-ea5a-c6e9bc546d0c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Reply-to:  Stefan Weil <sw@weilnetz.de>
From:  Stefan Weil via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Am 01.11.22 um 10:27 schrieb Philippe Mathieu-Daudé:

> On 1/11/22 09:28, Stefan Weil via wrote:
>> Am 12.09.22 um 14:26 schrieb Milica Lazarevic:
>>> Both versions of IMMEDIATE functions have been removed.
>>>
>>> Before this patch, we'd been calling img_format twice, the first time
>>> through the IMMEDIATE to get an appropriate string and the second time
>>> to print that string. There's no more need for that. Therefore, 
>>> calls to
>>> IMMEDIATE are removed, and now we're directly printing the integer
>>> values instead.
>>>
>>> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
>>> ---
>>>   disas/nanomips.cpp | 756 
>>> ++++++++++++++++-----------------------------
>>>   1 file changed, 265 insertions(+), 491 deletions(-)
>>>
>>> diff --git a/disas/nanomips.cpp b/disas/nanomips.cpp
>>> index 816155527d..441204bb84 100644
>>> --- a/disas/nanomips.cpp
>>> +++ b/disas/nanomips.cpp
>> [...]
>>> @@ -3305,11 +3271,9 @@ static char *CACHE(uint64 instruction, 
>>> Dis_info *info)
>>>       uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
>>>       int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
>>> -    char *op = IMMEDIATE(op_value);
>>> -    char *s = IMMEDIATE(s_value);
>>>       const char *rs = GPR(rs_value);
>>> -    return img_format("CACHE %s, %s(%s)", op, s, rs);
>>> +    return img_format("CACHE 0x%" PRIx64 ", %s(%s)", op_value, 
>>> s_value, rs);
>>>   }
>>> @@ -3329,11 +3293,9 @@ static char *CACHEE(uint64 instruction, 
>>> Dis_info *info)
>>>       uint64 rs_value = extract_rs_20_19_18_17_16(instruction);
>>>       int64 s_value = extract_s__se8_15_7_6_5_4_3_2_1_0(instruction);
>>> -    char *op = IMMEDIATE(op_value);
>>> -    char *s = IMMEDIATE(s_value);
>>>       const char *rs = GPR(rs_value);
>>> -    return img_format("CACHEE %s, %s(%s)", op, s, rs);
>>> +    return img_format("CACHEE 0x%" PRIx64 ", %s(%s)", op_value, 
>>> s_value, rs);
>>>   }
>>
>> Do we really want to format "int64 s_value" as a string? The code now 
>> has lots of wrong format strings. Add the patch below to get the 
>> compiler report.
>>
>> We once had a discussion about using G_GNUC_PRINTF for local 
>> functions or not. I think that this example clearly shows that it 
>> should be mandatory.
>
> Yes. The problem here is nobody wants to maintain this code, but we
> inherited it. IIUC this series doesn't make it worst, it just remove
> the C++ dependency on UNIX-based hosts.
>

I expect that "%s" with an int64 s_value will cause a crash while the 
old code worked, so things are worse now and should be fixed for the 
release. If nobody maintains that code, I can try to prepare a patch.

Stefan



