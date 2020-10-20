Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F16287B3A
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 19:54:17 +0200 (CEST)
Received: from localhost ([::1]:36680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQa7M-000495-AP
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 13:54:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kQa6P-0003cN-T9
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 13:53:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:56332)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kQa6O-0003wf-6i
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 13:53:17 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 84CCDAFD4;
 Thu,  8 Oct 2020 17:53:14 +0000 (UTC)
Subject: Re: does make check now require TCG? Or is it a parallelism issue?
To: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <11ef73ff-4178-b3e8-2e49-44ff014a13ed@suse.de>
 <569520f6-adf6-6212-9625-a184bf499e24@redhat.com>
 <d21dff22-90b1-4769-0948-6bc37eaeb885@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <6fe91a5a-c136-9af3-c48a-97ccdca7a543@suse.de>
Date: Thu, 8 Oct 2020 19:53:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <d21dff22-90b1-4769-0948-6bc37eaeb885@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/07 23:49:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.214,
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
Cc: Alex Bennee <alex.bennee@linaro.org>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/8/20 7:44 PM, Richard Henderson wrote:
> On 10/8/20 10:02 AM, Paolo Bonzini wrote:
>> On 08/10/20 16:48, Claudio Fontana wrote:
>>> on master, a build without tcg like:
>>>
>>> exec '../configure' '--disable-tcg' '--enable-kvm' '--enable-hax' "$@"
>>>
>>> make -j120 check
>>> Generating qemu-version.h with a meson_exe.py custom command
>>> make: *** No rule to make target 'qemu-system-aarch64', needed by 'check-block'.  Stop.
>>> make: *** Waiting for unfinished jobs....
>>>
>>> qemu-system-aarch64 is required for check-block now?
>>
>> No, it's not, it's an unnecessary dependency.  This will fix it:
>>
>> diff --git a/tests/Makefile.include b/tests/Makefile.include
>> index 5aca98e60c..1ca70d88ce 100644
>> --- a/tests/Makefile.include
>> +++ b/tests/Makefile.include
>> @@ -140,7 +140,7 @@ QEMU_IOTESTS_HELPERS-$(CONFIG_LINUX) = tests/qemu-iotests/socket_scm_helper$(EXE
>>  check: check-block
>>  check-block: $(SRC_PATH)/tests/check-block.sh qemu-img$(EXESUF) \
>>  		qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y) \
>> -		$(patsubst %-softmmu,qemu-system-%,$(filter %-softmmu,$(TARGET_DIRS)))
>> +		qemu-system-$(patsubst ppc64%,ppc64, $(shell uname -m))
> 
> Why doesn't the original line work?  Waiting until all of the configured

The original line breaks because without TCG built-in there will be no qemu-system-aarch64 to wait for.

> qemu-system-* executables to finish building doesn't seem wrong, even if they
> won't all be used by check-block.
> 
> This replacement would seem to break e.g.
> 
> ./configure --target-list=arm-softmmu
> 
> by making check-block dependent on qemu-system-x86_64, which will never be built.
> 
> 
> r~
> 

Your concern makes sense to me, it seems we just end up breaking another use case..
is there a way here to get in this makefile context the list of actual targets we are waiting for?

Ciao,

C



