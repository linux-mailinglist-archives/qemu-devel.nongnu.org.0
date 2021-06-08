Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A98739F6F5
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 14:40:13 +0200 (CEST)
Received: from localhost ([::1]:52168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqb1f-0006xH-SA
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 08:40:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqb0j-0005xn-Hj
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:39:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lqb0g-0003kl-3N
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 08:39:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623155949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C/Ha0P0JDciacdBK8Vz1Sw31PaRlPh4mfk8EdEBGVEI=;
 b=PlJYnoI5fBlDKB98bxrJuM2/9OP/pVYkPrL1ViMb5eEVHwjFep591oWqPRD9aPKGq9Iggh
 D1EDZEyJVjZC6CxlK7olMxh8jkgGbwPajhtcPaH4GmlEGn4ebrepKw8VR4T+GSKrNsYZaD
 2YODTTAvIpXEOZbqAwWYVI0JLUJso7k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-585-azqB3g6VMnOHiotBgD7nMQ-1; Tue, 08 Jun 2021 08:39:05 -0400
X-MC-Unique: azqB3g6VMnOHiotBgD7nMQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 u17-20020a05600c19d1b02901af4c4deac5so695216wmq.7
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 05:39:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=C/Ha0P0JDciacdBK8Vz1Sw31PaRlPh4mfk8EdEBGVEI=;
 b=qMRjvrYPnDH7chgS1g55524taPunoNGQi10mt304N4D3THzC9sv+zgwPqc/inV0Ch7
 ycS9yC+/fRcwyEXRbEjYj5T2WLJefnhpV8/UmeeSrBOkYGc2ErnO+C0AdvE3uNUTOUB/
 hnuXICKUSsMCcjWwspF2KPNh8t7X1KwQ/GGxvqM7HZ38+qS8jwAEMIZpLI5AXe4JZ4O5
 hk5LFg3XGD7/Yny0cvNTJR28sS/WNMvK4v2Tc4OO5qTKfaMHNeeTHjg0knjcQMRDNeMe
 cyCm+t6aLt4wtcdytwRJe4Qb6wl3LealBEo/UVk6FdloTAuX7FfvN7ggRae6TucodJiv
 y0tg==
X-Gm-Message-State: AOAM530LHPrxZOG7rQat/MUSDWFosPdf2ncL70HefCTHKx1mpV4hVLLN
 gY2dcifBZOQvzdbxDeaGrIZ6DrICOOU5KNBg5pEWV0R7Qh8EMC9TC/FkBGlDyLPwFfZWN6gUIN9
 avOxYWx5HpbGrYdg=
X-Received: by 2002:adf:ba02:: with SMTP id o2mr3044922wrg.234.1623155944795; 
 Tue, 08 Jun 2021 05:39:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzaIjrT/o/qdnxKqYEJf1tIkCd6/pUUZ6LY20XnpVDwcil3Nv4/QBWOTs4GoVqiIEXUyWPs/w==
X-Received: by 2002:adf:ba02:: with SMTP id o2mr3044899wrg.234.1623155944602; 
 Tue, 08 Jun 2021 05:39:04 -0700 (PDT)
Received: from [192.168.1.36] (235.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.235])
 by smtp.gmail.com with ESMTPSA id j34sm12516576wms.7.2021.06.08.05.39.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 05:39:04 -0700 (PDT)
Subject: Re: [PATCH v16 04/99] qtest/arm-cpu-features: Use generic
 qtest_has_accel() to check for KVM
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-5-alex.bennee@linaro.org>
 <d5162188-bea4-24ed-189b-198f9d3ed55d@redhat.com>
 <92071d16-3ff1-0274-2e45-59ed7624f358@redhat.com>
 <e30516ff-a5f8-6785-3988-daae26dc5151@redhat.com>
Message-ID: <976d1acf-8536-1baa-b5da-c156b0830724@redhat.com>
Date: Tue, 8 Jun 2021 14:39:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <e30516ff-a5f8-6785-3988-daae26dc5151@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 12:49 PM, Philippe Mathieu-Daudé wrote:
> On 6/8/21 10:22 AM, Philippe Mathieu-Daudé wrote:
>> On 6/7/21 3:22 PM, Thomas Huth wrote:
>>> On 04/06/2021 17.51, Alex Bennée wrote:
>>>> From: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>>
>>>> Use the recently added generic qtest_has_accel() method to
>>>> check if KVM is available.
>>>>
>>>> Suggested-by: Claudio Fontana <cfontana@suse.de>
>>>> Reviewed-by: Andrew Jones <drjones@redhat.com>
>>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Message-Id: <20210505125806.1263441-5-philmd@redhat.com>
>>>> ---
>>>>   tests/qtest/arm-cpu-features.c | 25 +------------------------
>>>>   1 file changed, 1 insertion(+), 24 deletions(-)
>>>>
>>>> diff --git a/tests/qtest/arm-cpu-features.c
>>>> b/tests/qtest/arm-cpu-features.c
>>>> index 8252b85bb8..7f4b252127 100644
>>>> --- a/tests/qtest/arm-cpu-features.c
>>>> +++ b/tests/qtest/arm-cpu-features.c
>>>> @@ -26,21 +26,6 @@
>>>>                       "  'arguments': { 'type': 'full', "
>>>>   #define QUERY_TAIL  "}}"
>>>>   -static bool kvm_enabled(QTestState *qts)
>>>> -{
>>>> -    QDict *resp, *qdict;
>>>> -    bool enabled;
>>>> -
>>>> -    resp = qtest_qmp(qts, "{ 'execute': 'query-kvm' }");
>>>> -    g_assert(qdict_haskey(resp, "return"));
>>>> -    qdict = qdict_get_qdict(resp, "return");
>>>> -    g_assert(qdict_haskey(qdict, "enabled"));
>>>> -    enabled = qdict_get_bool(qdict, "enabled");
>>>> -    qobject_unref(resp);
>>>> -
>>>> -    return enabled;
>>>> -}
>>>> -
>>>>   static QDict *do_query_no_props(QTestState *qts, const char *cpu_type)
>>>>   {
>>>>       return qtest_qmp(qts, QUERY_HEAD "'model': { 'name': %s }"
>>>> @@ -493,14 +478,6 @@ static void
>>>> test_query_cpu_model_expansion_kvm(const void *data)
>>>>         qts = qtest_init(MACHINE_KVM "-cpu max");
>>>>   -    /*
>>>> -     * These tests target the 'host' CPU type, so KVM must be enabled.
>>>> -     */
>>>> -    if (!kvm_enabled(qts)) {
>>>> -        qtest_quit(qts);
>>>> -        return;
>>>> -    }
>>>> -
>>>>       /* Enabling and disabling kvm-no-adjvtime should always work. */
>>>>       assert_has_feature_disabled(qts, "host", "kvm-no-adjvtime");
>>>>       assert_set_feature(qts, "host", "kvm-no-adjvtime", true);
>>>> @@ -624,7 +601,7 @@ int main(int argc, char **argv)
>>>>        * order avoid attempting to run an AArch32 QEMU with KVM on
>>>>        * AArch64 hosts. That won't work and isn't easy to detect.
>>>>        */
>>>> -    if (g_str_equal(qtest_get_arch(), "aarch64")) {
>>>> +    if (g_str_equal(qtest_get_arch(), "aarch64") &&
>>>> qtest_has_accel("kvm")) {
>>>>           qtest_add_data_func("/arm/kvm/query-cpu-model-expansion",
>>>>                               NULL, test_query_cpu_model_expansion_kvm);
>>>
>>> I think this is wrong: query-kvm checks whether kvm is *enabled*, while
>>> your new function only checks whether kvm has been built into the
>>> binary. There is still the possibility that kvm has been built into the
>>> binary, but is not available on the host, so in that case the test will
>>> fail now.
> 
> Not enough coffee earlier. I think this is a documentation problem,
> query-kvm returns a list of *runtime* accelerators:
> https://www.mail-archive.com/qemu-devel@nongnu.org/msg811144.html
> 
> IIUC what Paolo said, if something asks for an accelerator that
> is not present at build-time, then this is a configuration problem,
> not relevant for the management interface.

Argh no... sigh. So we have 4 cases:

1- accelerator not built
2- accelerator built in as module but not loaded
3- accelerator built in & loaded but not usable
4- accelerator built in & loaded and usable

QMP query-accels returns "accelerator built in & loaded"
without precising it is usable.

qtest kvm_enabled() checks if the accelerator is enabled
without checking it is built-in.

QMP query-kvm returns 'present' as in built-in (so case 1),
and 'enabled' (a.k.a. 'allowed') updated once init_machine()
succeeded (so case 4).

So, again, IIUC Paolo, what he said is for the management layer
1 and 2 are the same, the accelerator is not present.

For qtests, we want the 'usable' case (4) right? Whether the
accelerator is builtin / loaded is irrelevant.

Could we improve the terminology here? Maybe is_present() and
is_usable()? Suggestions?

Do we need to add both query-present-accels query-usable-accels
commands? Is it actually possible to return an array of 'usable'
accelerators?

Maybe simply add query-present-accels() -> [] and
query-usable-accel(accel) -> bool.

> 
>>>
>>> Thus please drop / rework this patch.
>>
>> Indeed, this is unfortunate :(
>>


