Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB9F39FD81
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:21:58 +0200 (CEST)
Received: from localhost ([::1]:54454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfQM-00042K-0R
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:21:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lqfPB-00030q-Hp; Tue, 08 Jun 2021 13:20:45 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:49304)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lqfP5-0004iu-PJ; Tue, 08 Jun 2021 13:20:45 -0400
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 731651FD33;
 Tue,  8 Jun 2021 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623172836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0wjZp6qwOdS0AS0uCZsELS10rs5SxlujA4M04dPb0M=;
 b=MZGjq7iwCfQ1JUXL6vt/hjgEyuB2s0JYElHnlO5BnoSTCzBgq1687NyoqkQEv793OkTcJJ
 F7bZWwXZoZfJ2tzSuq4wXOanlIMZtixvsyFdXzdE9eWmdQDDSRffG/VZIq5Cl9aAFV7XiQ
 0O+/nfQpSCQfAJhnZlryYxW0ELFXuAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623172836;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0wjZp6qwOdS0AS0uCZsELS10rs5SxlujA4M04dPb0M=;
 b=bQTAFPOh/nrEtX+C7JYAzw/FphmifLUtLJKYNwKoQh5CuXPbi484Z0NdqN75ScxU6ktWAU
 hu6fJVmTKre9ZHAg==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 13217118DD;
 Tue,  8 Jun 2021 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1623172836; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0wjZp6qwOdS0AS0uCZsELS10rs5SxlujA4M04dPb0M=;
 b=MZGjq7iwCfQ1JUXL6vt/hjgEyuB2s0JYElHnlO5BnoSTCzBgq1687NyoqkQEv793OkTcJJ
 F7bZWwXZoZfJ2tzSuq4wXOanlIMZtixvsyFdXzdE9eWmdQDDSRffG/VZIq5Cl9aAFV7XiQ
 0O+/nfQpSCQfAJhnZlryYxW0ELFXuAs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1623172836;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E0wjZp6qwOdS0AS0uCZsELS10rs5SxlujA4M04dPb0M=;
 b=bQTAFPOh/nrEtX+C7JYAzw/FphmifLUtLJKYNwKoQh5CuXPbi484Z0NdqN75ScxU6ktWAU
 hu6fJVmTKre9ZHAg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id TAeyAuSmv2AwbgAALh3uQQ
 (envelope-from <cfontana@suse.de>); Tue, 08 Jun 2021 17:20:36 +0000
Subject: Re: [PATCH v16 04/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-5-alex.bennee@linaro.org>
 <d5162188-bea4-24ed-189b-198f9d3ed55d@redhat.com>
 <92071d16-3ff1-0274-2e45-59ed7624f358@redhat.com>
 <e30516ff-a5f8-6785-3988-daae26dc5151@redhat.com>
 <976d1acf-8536-1baa-b5da-c156b0830724@redhat.com>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <7a261d08-b9f2-4caf-1a66-3d9e01488ff5@suse.de>
Date: Tue, 8 Jun 2021 19:20:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <976d1acf-8536-1baa-b5da-c156b0830724@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.29; envelope-from=cfontana@suse.de;
 helo=smtp-out2.suse.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
 Peter Maydell <peter.maydell@linaro.org>, Andrew Jones <drjones@redhat.com>,
 Jim Fehlig <jfehlig@suse.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Jos=c3=a9_Ricardo_Ziviani?= <jose.ziviani@suse.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 2:39 PM, Philippe Mathieu-Daudé wrote:
> On 6/8/21 12:49 PM, Philippe Mathieu-Daudé wrote:
>> On 6/8/21 10:22 AM, Philippe Mathieu-Daudé wrote:
>>> On 6/7/21 3:22 PM, Thomas Huth wrote:
>>>> On 04/06/2021 17.51, Alex Bennée wrote:
>>>>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>>
>>>>> Use the recently added generic qtest_has_accel() method to
>>>>> check if KVM is available.
>>>>>
>>>>> Suggested-by: Claudio Fontana <cfontana@suse.de>
>>>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>>> Message-Id: <20210505125806.1263441-5-philmd@redhat.com>
>>>>> ---
>>>>>   tests/qtest/arm-cpu-features.c | 25 +------------------------
>>>>>   1 file changed, 1 insertion(+), 24 deletions(-)
>>>>>
>>>>> diff --git a/tests/qtest/arm-cpu-features.c
>>>>> b/tests/qtest/arm-cpu-features.c
>>>>> index 8252b85bb8..7f4b252127 100644
>>>>> --- a/tests/qtest/arm-cpu-features.c
>>>>> +++ b/tests/qtest/arm-cpu-features.c
>>>>> @@ -26,21 +26,6 @@
>>>>>                       "  'arguments': { 'type': 'full', "
>>>>>   #define QUERY_TAIL  "}}"
>>>>>   -static bool kvm_enabled(QTestState *qts)
>>>>> -{
>>>>> -    QDict *resp, *qdict;
>>>>> -    bool enabled;
>>>>> -
>>>>> -    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
>>>>> -    g_assert(qdict_haskey(resp, "return"));
>>>>> -    qdict = qdict_get_qdict(resp, "return");
>>>>> -    g_assert(qdict_haskey(qdict, "enabled"));
>>>>> -    enabled = qdict_get_bool(qdict, "enabled");
>>>>> -    qobject_unref(resp);
>>>>> -
>>>>> -    return enabled;
>>>>> -}
>>>>> -
>>>>>   static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
>>>>>   {
>>>>>       return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
>>>>> @@ -493,14 +478,6 @@ static void
>>>>> test_query_cpu_model_expansion_kvm(const void *data)
>>>>>         qts = qtest_init(MACHINE_KVM "-cpu max");
>>>>>   -    /*
>>>>> -     * These tests target the 'host' CPU type, so KVM must be enabled.
>>>>> -     */
>>>>> -    if (!kvm_enabled(qts)) {
>>>>> -        qtest_quit(qts);
>>>>> -        return;
>>>>> -    }
>>>>> -
>>>>>       /* Enabling and disabling kvm-no-adjvtime should always work. */
>>>>>       assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
>>>>>       assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
>>>>> @@ -624,7 +601,7 @@ int main(int argc, char **argv)
>>>>>        * order avoid attempting to run an AArch32 QEMU with KVM on
>>>>>        * AArch64 hosts. That won't work and isn't easy to detect.
>>>>>        */
>>>>> -    if (g_str_equal(qtest_get_arch(), "aarch64")) {
>>>>> +    if (g_str_equal(qtest_get_arch(), "aarch64") &&
>>>>> qtest_has_accel("kvm")) {
>>>>>           qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>>>>>                               NULL, test_query_cpu_model_expansion_kvm);
>>>>
>>>> I think this is wrong: query-kvm checks whether kvm is *enabled*, while
>>>> your new function only checks whether kvm has been built into the
>>>> binary. There is still the possibility that kvm has been built into the
>>>> binary, but is not available on the host, so in that case the test will
>>>> fail now.
>>
>> Not enough coffee earlier. I think this is a documentation problem,
>> query-kvm returns a list of *runtime* accelerators:
>> https://www.mail-archive.com/qemu-devel@nongnu.org/msg811144.html
>>
>> IIUC what Paolo said, if something asks for an accelerator that
>> is not present at build-time, then this is a configuration problem,
>> not relevant for the management interface.
> 
> Argh no... sigh. So we have 4 cases:
> 
> 1- accelerator not built
> 2- accelerator built in as module but not loaded
> 3- accelerator built in & loaded but not usable
> 4- accelerator built in & loaded and usable
> 
> QMP query-accels returns "accelerator built in & loaded"
> without precising it is usable.
> 
> qtest kvm_enabled() checks if the accelerator is enabled
> without checking it is built-in.
> 
> QMP query-kvm returns 'present' as in built-in (so case 1),
> and 'enabled' (a.k.a. 'allowed') updated once init_machine()
> succeeded (so case 4).
> 
> So, again, IIUC Paolo, what he said is for the management layer
> 1 and 2 are the same, the accelerator is not present.
> 
> For qtests, we want the 'usable' case (4) right? Whether the
> accelerator is builtin / loaded is irrelevant.
> 
> Could we improve the terminology here? Maybe is_present() and
> is_usable()? Suggestions?


Let me try some terms:

1 - bool accelerator_built()      ->   accelerator has been part of this QEMU build.
2 - bool accelerator_loaded()     ->   accelerator has been loaded, either because it is built-in, or because its code has been dynamically loaded

and probably the management layers do not care about the distinction between 1, 2.

Maybe instead of "usable", "available" is better?

3 - bool accelerator_available()

Then we have the accelerator that is actually active, selected or chosen.

4 - bool accelerator_enabled()? bool accelerator_active()? bool accelerator_chosen()? bool accelerator_used()?

We already use the term "allowed", with different meaning and implementations depending on --enable-xxx,
which is quite confusing I think..


Ciao,

Claudoi


> 
> Do we need to add both query-present-accels query-usable-accels
> commands? Is it actually possible to return an array of 'usable'
> accelerators?
> 
> Maybe simply add query-present-accels() -> [] and
> query-usable-accel(accel) -> bool.
> 
>>
>>>>
>>>> Thus please drop / rework this patch.
>>>
>>> Indeed, this is unfortunate :(
>>>
> 


