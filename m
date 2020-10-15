Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD69028F333
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Oct 2020 15:30:10 +0200 (CEST)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kT3Kb-0002kM-Ov
	for lists+qemu-devel@lfdr.de; Thu, 15 Oct 2020 09:30:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kT3JD-0001wJ-7f
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 09:28:43 -0400
Received: from mx2.suse.de ([195.135.220.15]:52810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kT3J9-0007Iv-Kj
 for qemu-devel@nongnu.org; Thu, 15 Oct 2020 09:28:42 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5DE40AD79;
 Thu, 15 Oct 2020 13:28:38 +0000 (UTC)
Subject: Re: [PATCH v2 2/3] accel/tcg: split tcg_start_vcpu_thread
From: Claudio Fontana <cfontana@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>
References: <20201014192324.6390-1-cfontana@suse.de>
 <20201014192324.6390-3-cfontana@suse.de>
 <a3c48dd0-643b-a433-08b7-cdd637f2752d@linaro.org>
 <3e46ce6a-e2a9-87f8-d301-ec41ff320938@suse.de>
Message-ID: <4bd9bc07-d474-16a6-7f7f-ec9c4390657f@suse.de>
Date: Thu, 15 Oct 2020 15:28:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3e46ce6a-e2a9-87f8-d301-ec41ff320938@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 01:21:00
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.019,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/15/20 2:33 PM, Claudio Fontana wrote:
> On 10/14/20 10:08 PM, Richard Henderson wrote:
>> On 10/14/20 12:23 PM, Claudio Fontana wrote:
>>> +++ b/accel/tcg/tcg-cpus-mttcg.h
>>> @@ -10,14 +10,4 @@
>>>  #ifndef TCG_CPUS_MTTCG_H
>>>  #define TCG_CPUS_MTTCG_H
>>>  
>>> -/*
>>> - * Multi-threaded TCG
>>> - *
>>> - * In the multi-threaded case each vCPU has its own thread. The TLS
>>> - * variable current_cpu can be used deep in the code to find the
>>> - * current CPUState for a given thread.
>>> - */
>>> -
>>> -void *tcg_cpu_thread_fn(void *arg);
>>> -
>>>  #endif /* TCG_CPUS_MTTCG_H */
>>
>> Hum.  Do we really need to create these headers in the previous patch?  Because
>> now we have an empty one.
>>
>> Why not just put all of tcg-cpus-*.h into tcg-cpus.h?
>>
>> Otherwise this looks ok.
>>
>>
>> r~
>>
> 
> There are some symbols required between -icount, -rr, and -mttcg, and in particular in the -mttcg case, this requirement goes away after start_vcpu is also refactored.
> 
> Will take a look again, at the very least the mttcg.h should be removed completely.
> 
> Ciao,
> 
> Claudio
> 

To be more precise, 

tcg-cpus-icount.h ends up with functions that icount provides (to -rr) to be able to consider icount in the part of the code that is mostly rr.

tcg-cpus-rr.h contains the functions that "rr" provides (to -icount), since icount just reuses those.

Ciao,

Claudio

