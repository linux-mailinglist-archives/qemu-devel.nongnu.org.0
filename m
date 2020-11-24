Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FC082C2FFA
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 19:32:24 +0100 (CET)
Received: from localhost ([::1]:35958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khd70-00025e-Vj
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 13:32:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khd4h-0001Vp-HT
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 13:29:59 -0500
Received: from mx2.suse.de ([195.135.220.15]:60500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1khd4b-0003Vu-Lx
 for qemu-devel@nongnu.org; Tue, 24 Nov 2020 13:29:59 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CE69ACF1;
 Tue, 24 Nov 2020 18:29:52 +0000 (UTC)
Subject: Re: [RFC v5 09/12] module: introduce MODULE_INIT_ACCEL_CPU
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20201124162210.8796-1-cfontana@suse.de>
 <20201124162210.8796-10-cfontana@suse.de>
 <20201124170832.GS2271382@habkost.net>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <a7bed792-5c6f-c49e-946c-f705707ce685@suse.de>
Date: Tue, 24 Nov 2020 19:29:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201124170832.GS2271382@habkost.net>
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
Cc: Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>, haxm-team@intel.com,
 Colin Xu <colin.xu@intel.com>, Olaf Hering <ohering@suse.de>,
 Stefano Stabellini <sstabellini@kernel.org>, Bruce Rogers <brogers@suse.com>,
 "Emilio G . Cota" <cota@braap.org>, Anthony Perard <anthony.perard@citrix.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Dario Faggioli <dfaggioli@suse.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, Wenchao Wang <wenchao.wang@intel.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/24/20 6:08 PM, Eduardo Habkost wrote:
> On Tue, Nov 24, 2020 at 05:22:07PM +0100, Claudio Fontana wrote:
>> apply this to the registration of the cpus accel interfaces,
>>
>> but this will be also in preparation for later use of this
>> new module init step to also register per-accel x86 cpu type
>> interfaces.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> ---
> [...]
>> diff --git a/accel/qtest/qtest.c b/accel/qtest/qtest.c
>> index b4e731cb2b..482f89729f 100644
>> --- a/accel/qtest/qtest.c
>> +++ b/accel/qtest/qtest.c
>> @@ -32,7 +32,6 @@ const CpusAccel qtest_cpus = {
>>  
>>  static int qtest_init_accel(MachineState *ms)
>>  {
>> -    cpus_register_accel(&qtest_cpus);
>>      return 0;
>>  }
>>  
>> @@ -58,3 +57,12 @@ static void qtest_type_init(void)
>>  }
>>  
>>  type_init(qtest_type_init);
>> +
>> +static void qtest_accel_cpu_init(void)
>> +{
>> +    if (qtest_enabled()) {
>> +        cpus_register_accel(&qtest_cpus);
>> +    }
>> +}
>> +
>> +accel_cpu_init(qtest_accel_cpu_init);
> 
> I don't understand why this (and the similar changes on other
> accelerators) is an improvement.
> 
> You are replacing a trivial AccelClass-specific init method with
> a module_init() function that has a hidden dependency on runtime
> state.
> 

Not a big advantage I agree,
I think however there is one, in using the existing framework that exists, for the purposes that it was built for.

As I understand it, the global module init framework is supposed to mark the major initialization steps,
and this seems to fit the bill.

The "hidden" dependency on the fact that accels need to be initialized at that time, is not hidden at all I think,
it is what this module init step is all about.

It is explicitly meaning, "_now that the current accelerator is chosen_, perform these initializations".

But, as you mentioned elsewhere, I will in the meantime anyway squash these things so they do not start fragmented at all, and centralize immediately.


Thanks,

Claudio

