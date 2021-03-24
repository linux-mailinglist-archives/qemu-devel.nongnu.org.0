Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 959263473A9
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 09:31:00 +0100 (CET)
Received: from localhost ([::1]:47708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOyuo-00083Z-N4
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 04:30:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34182)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOyt9-0007d8-1W
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:29:15 -0400
Received: from mx2.suse.de ([195.135.220.15]:34026)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOyt5-0005pi-PQ
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 04:29:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id CB86EACBF;
 Wed, 24 Mar 2021 08:29:09 +0000 (UTC)
Subject: Re: [RFC v11 30/55] target/arm: wrap call to aarch64_sve_change_el in
 tcg_enabled()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-23-cfontana@suse.de> <87eeg5iivn.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <1ba15970-749a-27c5-ef72-6468b5501f46@suse.de>
Date: Wed, 24 Mar 2021 09:29:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87eeg5iivn.fsf@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 11:50 PM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> After this patch it is possible to build only kvm:
>>
>> ./configure --disable-tcg --enable-kvm


It's possible to build, but tests will fail until all the test-related patches are applied.


> 
> FWIW at this point we get a different failure than later on:
> 
>   21:10:25 [alex@aarch64-new:~/l/q/b/disable.tcg] (94e2abe0…)|… + make check-qtest
>     GIT     ui/keycodemapdb tests/fp/berkeley-testfloat-3 tests/fp/berkeley-softfloat-3 meson dtc capstone slirp
>   [1/19] Generating qemu-version.h with a meson_exe.py custom command
>   Running test qtest-aarch64/qom-test
>   qemu-system-aarch64: missing interface 'idau-interface' for object 'machine'

This one is broken by a recent commit in QEMU mainline, by removing the idau interface from KVM cpus.

This is fixed by: Revert "target/arm: Restrict v8M IDAU to TCG" in the series.

>   socket_accept failed: Resource temporarily unavailable
>   **
>   ERROR:../../tests/qtest/libqtest.c:319:qtest_init_without_qmp_handshake: assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
>   ERROR qtest-aarch64/qom-test - Bail out! ERROR:../../tests/qtest/libqtest.c:319:qtest_init_without_qmp_handshake: assertion failed: (s->fd >= 0 && s->qmp_fd >= 0)
>   make: *** [Makefile.mtest:24: run-test-1] Error 1
> 
> 
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
>>  target/arm/cpu-sysemu.c | 12 +++++++-----
>>  1 file changed, 7 insertions(+), 5 deletions(-)
>>
>> diff --git a/target/arm/cpu-sysemu.c b/target/arm/cpu-sysemu.c
>> index eb928832a9..05d6e79ad9 100644
>> --- a/target/arm/cpu-sysemu.c
>> +++ b/target/arm/cpu-sysemu.c
>> @@ -820,11 +820,13 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>>      unsigned int cur_el = arm_current_el(env);
>>      int rt;
>>  
>> -    /*
>> -     * Note that new_el can never be 0.  If cur_el is 0, then
>> -     * el0_a64 is is_a64(), else el0_a64 is ignored.
>> -     */
>> -    aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
>> +    if (tcg_enabled()) {
>> +        /*
>> +         * Note that new_el can never be 0.  If cur_el is 0, then
>> +         * el0_a64 is is_a64(), else el0_a64 is ignored.
>> +         */
>> +        aarch64_sve_change_el(env, cur_el, new_el, is_a64(env));
>> +    }
>>  
>>      if (cur_el < new_el) {
>>          /* Entry vector offset depends on whether the implemented EL
> 
> 


