Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 29FCF325761
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 21:15:41 +0100 (CET)
Received: from localhost ([::1]:58940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFN2y-0004uq-77
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 15:15:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFN1M-0004OK-JS
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:14:00 -0500
Received: from mx2.suse.de ([195.135.220.15]:35136)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lFN1K-0007vn-Vt
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 15:14:00 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 63EF7AAAE;
 Thu, 25 Feb 2021 20:13:57 +0000 (UTC)
Subject: Re: [RFC v1 27/38] target/arm: move sve_zcr_len_for_el to common_cpu
From: Claudio Fontana <cfontana@suse.de>
To: Richard Henderson <richard.henderson@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <20210221092449.7545-28-cfontana@suse.de>
 <15668067-2537-07c9-bb76-a429c9af4a08@linaro.org>
 <11aa0f15-1c05-f29b-f6c7-392a8464a57a@suse.de>
Message-ID: <11ed31d0-2103-abde-9e6d-99f94d7f5d78@suse.de>
Date: Thu, 25 Feb 2021 21:13:56 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <11aa0f15-1c05-f29b-f6c7-392a8464a57a@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.435,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 6:28 PM, Claudio Fontana wrote:
> On 2/22/21 7:06 AM, Richard Henderson wrote:
>> On 2/21/21 1:24 AM, Claudio Fontana wrote:
>>> From: Claudio Fontana <cfontana@centriq4.arch.suse.de>
>>>
>>> it is needed for KVM too.
>>>
>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>> ---
>>>  target/arm/cpu-common.c | 33 +++++++++++++++++++++++++++++++++
>>>  target/arm/tcg/helper.c | 33 ---------------------------------
>>>  2 files changed, 33 insertions(+), 33 deletions(-)
>>
>> This is related to rebuild_hflags, I assume.
>> Fix that and this isn't needed.
>>
>>
>> r~
>>
> 
> This stuff comes in also from the dump state code, 
> 
> if (cpu_isar_feature(aa64_sve, cpu) && sve_exception_el(env, el) == 0) {
>     int j, zcr_len = sve_zcr_len_for_el(env, el);
> ...
> }
> 
> will take another look..
> 

that was in cpu.c.

sve_zcr_len_for_el is also called in arch_dump.c in aarch64_write_el64_sve, via sve_current_vq().

Wonder if a stub is needed, or we need the whole implementation..

thanks,

CLaudio

