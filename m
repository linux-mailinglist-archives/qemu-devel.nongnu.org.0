Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80BA9365714
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 13:04:24 +0200 (CEST)
Received: from localhost ([::1]:44990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYoB5-0000Vy-Cu
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 07:04:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lYo0a-0001oS-UH
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:53:32 -0400
Received: from mx2.suse.de ([195.135.220.15]:50570)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lYo0Y-00056g-O6
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:53:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5076AAEBB;
 Tue, 20 Apr 2021 10:53:29 +0000 (UTC)
Subject: Re: [RFC v14 52/80] tests: device-introspect-test: cope with ARM
 TCG-only devices
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210416162824.25131-1-cfontana@suse.de>
 <20210416162824.25131-53-cfontana@suse.de>
 <75c0236b-a8f1-c462-355b-945e509d90f5@redhat.com>
 <50171d6a-21dc-3017-c8f9-8d068fd843f5@suse.de>
 <653b0188-c909-ba0c-00b2-735fb25d6703@redhat.com>
 <3ab0e4d3-1494-95cf-e4a9-1b9ef968e7b9@suse.de> <87y2dd8fjh.fsf@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <843453e8-e8d7-7f8d-b8f5-d9c63672275f@suse.de>
Date: Tue, 20 Apr 2021 12:53:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87y2dd8fjh.fsf@linaro.org>
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/20/21 11:34 AM, Alex Bennée wrote:
> 
> Claudio Fontana <cfontana@suse.de> writes:
> 
>> On 4/19/21 12:29 PM, Thomas Huth wrote:
>>> On 19/04/2021 12.24, Claudio Fontana wrote:
>>>> On 4/19/21 12:22 PM, Thomas Huth wrote:
>>>>> On 16/04/2021 18.27, Claudio Fontana wrote:
>>>>>> Skip the test_device_intro_concrete for now for ARM KVM-only build,
>>>>>> as on ARM we currently build devices for ARM that are not
>>>>>> compatible with a KVM-only build.
>>>>>>
>>>>>> We can remove this workaround when we fix this in KConfig etc,
>>>>>> and we only list and build machines that are compatible with KVM
>>>>>> for KVM-only builds.
>>>>>>
>>>>>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>>>>>> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>>> ---
>>>>>>    tests/qtest/device-introspect-test.c | 18 ++++++++++++++++++
>>>>>>    1 file changed, 18 insertions(+)
>>>>>>
>>>>>> diff --git a/tests/qtest/device-introspect-test.c b/tests/qtest/device-introspect-test.c
>>>>>> index bbec166dbc..1ff15e2247 100644
>>>>>> --- a/tests/qtest/device-introspect-test.c
>>>>>> +++ b/tests/qtest/device-introspect-test.c
>>>>>> @@ -329,12 +329,30 @@ int main(int argc, char **argv)
>>>>>>        qtest_add_func("device/introspect/none", test_device_intro_none);
>>>>>>        qtest_add_func("device/introspect/abstract", test_device_intro_abstract);
>>>>>>        qtest_add_func("device/introspect/abstract-interfaces", test_abstract_interfaces);
>>>>>> +
>>>>>> +    /*
>>>>>> +     * XXX currently we build also boards for ARM that are incompatible with KVM.
>>>>>> +     * We therefore need to check this explicitly, and only test virt for kvm-only
>>>>>> +     * arm builds.
>>>>>> +     * After we do the work of Kconfig etc to ensure that only KVM-compatible boards
>>>>>> +     * are built for the kvm-only build, we could remove this.
>>>>>> +     */
>>>>>> +#ifndef CONFIG_TCG
>>>>>> +    {
>>>>>> +        const char *arch = qtest_get_arch();
>>>>>> +        if (strcmp(arch, "arm") == 0 || strcmp(arch, "aarch64") == 0) {
>>>>>> +            goto add_machine_test_done;
>>>>>> +        }
>>>>>> +    }
>>>>>> +#endif /* !CONFIG_TCG */
>>>>>>        if (g_test_quick()) {
>>>>>>            qtest_add_data_func("device/introspect/concrete/defaults/none",
>>>>>>                                g_strdup(common_args), test_device_intro_concrete);
>>>>>>        } else {
>>>>>>            qtest_cb_for_every_machine(add_machine_test_case, true);
>>>>>>        }
>>>>>> +    goto add_machine_test_done;
>>>>>
>>>>> That last goto does not make much sense, since the label is right below.
>>>>
>>>> It is necessary to remove the warning that is otherwise produced about the unused label IIRC.
>>>
>>> Ah, ok.
>>>
>>> Alternatively, you could maybe also drop the label completely and simply 
>>> write the #ifndef block above like this (note the "else"):
>>>
>>> #ifndef CONFIG_TCG
>>>      const char *arch = qtest_get_arch();
>>>      if (!strcmp(arch, "arm") || !strcmp(arch, "aarch64")) {
>>>          /* Do nothing */
>>>      }
>>>      else
>>> #endif /* !CONFIG_TCG */
>>>
>>> ... not sure what's nicer, though.
>>>
>>>   Thomas
>>>
>>
>> Indeed, I tried a couple of combinations, in the end to me the less confusing was the goto one,
>> the #ifdef containing an open else is in my opinion worse, more
>> error-prone, but I am open to additional comments/ideas.
> 
> Surely a helper makes intent clearer?

Yes, thank you :-)

Ciao,

Claudio

> 
>   /*
>    * XXX currently we build also boards for ARM that are incompatible with KVM.
>    * We therefore need to check this explicitly, and only test virt for kvm-only
>    * arm builds.
>    * After we do the work of Kconfig etc to ensure that only KVM-compatible boards
>    * are built for the kvm-only build, we could remove this.
>    */
>   static bool skip_machine_tests(void)
>   {
>   #ifndef CONFIG_TCG
>       const char *arch = qtest_get_arch();
>       if (strcmp(arch, "arm") == 0 || strcmp(arch, "aarch64") == 0) {
>           return true;
>       }
>   #endif /* !CONFIG_TCG */
>       return false;
>   }
> 
> 
>   int main(int argc, char **argv)
>   {
>       g_test_init(&argc, &argv, NULL);
> 
>       qtest_add_func("device/introspect/list", test_device_intro_list);
>       qtest_add_func("device/introspect/list-fields", test_qom_list_fields);
>       qtest_add_func("device/introspect/none", test_device_intro_none);
>       qtest_add_func("device/introspect/abstract", test_device_intro_abstract);
>       qtest_add_func("device/introspect/abstract-interfaces", test_abstract_interfaces);
> 
>       if (!skip_machine_tests()) {
>           if (g_test_quick()) {
>               qtest_add_data_func("device/introspect/concrete/defaults/none",
>                                   g_strdup(common_args), test_device_intro_concrete);
>           } else {
>               qtest_cb_for_every_machine(add_machine_test_case, true);
>           }
>       }
> 
>       return g_test_run();
>   }
> 
> 
>>
>> Thanks,
>>
>> Claudio
> 
> 


