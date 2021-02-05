Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8A4310D5E
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 16:46:56 +0100 (CET)
Received: from localhost ([::1]:56108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l83Jv-0006Ze-Su
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 10:46:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1l83Ht-0005qo-VE; Fri, 05 Feb 2021 10:44:49 -0500
Received: from mx2.suse.de ([195.135.220.15]:50562)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1l83Hr-0003Cv-Gi; Fri, 05 Feb 2021 10:44:49 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16568AC43;
 Fri,  5 Feb 2021 15:44:45 +0000 (UTC)
Subject: Re: [RFC PATCH 9/9] tests/qtest/arm-cpu-features: Restrict TCG-only
 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
References: <20210205144345.2068758-1-f4bug@amsat.org>
 <20210205144345.2068758-10-f4bug@amsat.org>
 <17a58366-a25e-1c9b-eeba-2924803a48e7@suse.de>
 <db67a0e1-7933-736f-9e1c-78532444afdf@amsat.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <7bd6076d-8216-042d-515a-53936864a598@suse.de>
Date: Fri, 5 Feb 2021 16:44:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <db67a0e1-7933-736f-9e1c-78532444afdf@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.33,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-block@nongnu.org, Andrew Jones <drjones@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/5/21 4:30 PM, Philippe Mathieu-Daudé wrote:
> On 2/5/21 4:20 PM, Claudio Fontana wrote:
>> On 2/5/21 3:43 PM, Philippe Mathieu-Daudé wrote:
>>> Some tests explicitly request the TCG accelerator. As these
>>> tests will obviously fails if TCG is not present, disable
>>> them in such case.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> Cc: Roman Bolshakov <r.bolshakov@yadro.com>
>>> Cc: Claudio Fontana <cfontana@suse.de>
>>>
>>> RFC because of the TODO.
>>>
>>> Roman posted a series to have a QMP command to query enabled
>>> accelerators.
>>> ---
>>>  tests/qtest/arm-cpu-features.c | 33 +++++++++++++++++++++++++++++----
>>>  1 file changed, 29 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/tests/qtest/arm-cpu-features.c b/tests/qtest/arm-cpu-features.c
>>> index c59c3cb002b..c6e86282b66 100644
>>> --- a/tests/qtest/arm-cpu-features.c
>>> +++ b/tests/qtest/arm-cpu-features.c
>>> @@ -20,7 +20,7 @@
>>>   */
>>>  #define SVE_MAX_VQ 16
>>>  
>>> -#define MACHINE     "-machine virt,gic-version=max -accel tcg "
>>> +#define MACHINE_TCG "-machine virt,gic-version=max -accel tcg "
>>>  #define MACHINE_KVM "-machine virt,gic-version=max -accel kvm -accel tcg "
>>>  #define QUERY_HEAD  "{ 'execute': 'query-cpu-model-expansion', " \
>>>                      "  'arguments': { 'type': 'full', "
>>> @@ -41,6 +41,16 @@ static bool kvm_enabled(QTestState *qts)
>>>      return enabled;
>>>  }
>>>  
>>> +static bool tcg_enabled(QTestState *qts)
>>> +{
>>> +    /* TODO: Implement QMP query-accel? */
>>> +#ifdef CONFIG_TCG
>>> +    return true;
>>> +#else
>>> +    return false;
>>> +#endif /* CONFIG_TCG */
>>
>>
>> I would not use the same name as the existing tcg_enabled(), which has different semantics, even in test code;
>>
>> what you mean here is tcg_available() right?
> 
> No, I meant static tcg_enabled as the kvm_enabled() earlier method:

Aha, so it's the other way around, we are actually testing if the TCG accelerator is currently selected in QEMU,
and the patch implements it using CONFIG_TCG as a placeholder for it, since we do not have query-accel yet, got it.

> 
> static bool kvm_enabled(QTestState *qts)
> {
>     QDict *resp, *qdict;
>     bool enabled;
> 
>     resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
>     g_assert(qdict_haskey(resp, "return"));
>     qdict = qdict_get_qdict(resp, "return");
>     g_assert(qdict_haskey(qdict, "enabled"));
>     enabled = qdict_get_bool(qdict, "enabled");
>     qobject_unref(resp);
> 
>     return enabled;
> }
> 
> This should be moved to something generic to QTest IMO,
> and we need some runtime qtest_is_accelerator_enabled().
> 

Agreed,

thanks,

Claudio

