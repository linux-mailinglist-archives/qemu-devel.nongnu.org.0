Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF6435C5BC
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 13:54:50 +0200 (CEST)
Received: from localhost ([::1]:58532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lVv9V-0004jg-Dg
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 07:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lVv8I-0004F9-2G
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 07:53:34 -0400
Received: from mx2.suse.de ([195.135.220.15]:59850)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lVv8G-00075a-H5
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 07:53:33 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 17485AE89;
 Mon, 12 Apr 2021 11:53:31 +0000 (UTC)
Subject: Re: [RFC v12 55/65] target/arm: cpu-exceptions: new module
To: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210326193701.5981-1-cfontana@suse.de>
 <20210326193701.5981-56-cfontana@suse.de>
 <14c8e2aa-a49a-2b0e-cdb4-815a58cf504b@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <07920d2c-acab-10e5-49d1-1ad5e017ba7d@suse.de>
Date: Mon, 12 Apr 2021 13:53:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <14c8e2aa-a49a-2b0e-cdb4-815a58cf504b@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/28/21 8:40 PM, Richard Henderson wrote:
> On 3/26/21 1:36 PM, Claudio Fontana wrote:
>> extract the exception handling code from cpu-sysemu,
>> and split it into general arm code and an AArch64-specific part.
>>
>> Signed-off-by: Claudio Fontana<cfontana@suse.de>
>> ---
>>   target/arm/cpu-exceptions-aa64.h |  32 +
>>   target/arm/cpu.h                 |   4 -
>>   target/arm/arch_dump.c           |   1 +
>>   target/arm/cpu-exceptions-aa64.c | 553 ++++++++++++++++++
>>   target/arm/cpu-exceptions.c      | 481 +++++++++++++++
>>   target/arm/cpu-sysemu.c          | 975 -------------------------------
>>   target/arm/cpu-user.c            |   1 +
>>   target/arm/cpu64.c               |   1 +
>>   target/arm/kvm/kvm64.c           |   1 +
>>   target/arm/tcg/helper-a64.c      |   1 +
>>   target/arm/tcg/helper.c          |   1 +
>>   target/arm/meson.build           |   5 +
>>   12 files changed, 1077 insertions(+), 979 deletions(-)
>>   create mode 100644 target/arm/cpu-exceptions-aa64.h
>>   create mode 100644 target/arm/cpu-exceptions-aa64.c
>>   create mode 100644 target/arm/cpu-exceptions.c
> 
> This is the second move for all of this code.
> Not a fan of that.  Come up with a plan and move it once.

I tried to reduce the double move, I failed at my first attempt: I tried to move the exception code directly in place
but failed due to first the code needing to be extracted out from being tcg-only fairly early to enable the build,
but then the code in exceptions.c / exceptions-aa64.c needing the cpu-sve stuff and the aa64 split of other patches.


> 
> I think the sve_exception_el move is a mistake, since as you have pointed out 
> it is used far beyond exception handling.

I think that's right, also switch_mode and the _sync_ functions probably do not belong there.. I'll revisit this.

> 
> 
> r~
>
 
Thanks,

C

