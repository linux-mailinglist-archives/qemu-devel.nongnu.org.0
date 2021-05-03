Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAD7371A28
	for <lists+qemu-devel@lfdr.de>; Mon,  3 May 2021 18:38:13 +0200 (CEST)
Received: from localhost ([::1]:59706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldbaG-0003lJ-8X
	for lists+qemu-devel@lfdr.de; Mon, 03 May 2021 12:38:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldbVo-0001yp-My
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:33:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ldbVa-0002Xr-KK
 for qemu-devel@nongnu.org; Mon, 03 May 2021 12:33:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620059600;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0/v7w83apqs4Z9feQey4AfXSRxHG2joE+1aa7RyPXXQ=;
 b=dIVTME5pEg+x3Q/cEWPr325A2pCw0Tme6kOHLh8uSZi0T0yxtwVxQpzgVPuM1bBBCfXzt9
 5BjvyBgO/TYYFx9mMydra+f0wIK9AtJo8HxYonYenc+s/aAYgZeOX4TC+R+CplC/wufav1
 A3kjMVikm8/uio9LXkbg9/Io+Unk468=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-576-XZjrHcKQPkaKG0lT8IwVwA-1; Mon, 03 May 2021 12:33:19 -0400
X-MC-Unique: XZjrHcKQPkaKG0lT8IwVwA-1
Received: by mail-wr1-f70.google.com with SMTP id
 67-20020adf81490000b029010756d109e6so4198202wrm.13
 for <qemu-devel@nongnu.org>; Mon, 03 May 2021 09:33:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=0/v7w83apqs4Z9feQey4AfXSRxHG2joE+1aa7RyPXXQ=;
 b=g3l/+t9YQkiGu8dHZftdbMzRgvd3BmmFrQQ8YRDtZmBfwHkE/Dl6/8uFAnBuK6ux1f
 lu1HI7KDXr+9r76/e/CoKsSdEQmHrfKkLCmPIEHVvFQ52vs1+2QVB1TA/LKexeM0ApVP
 rqHHDbZ/FIffd5Jy89rr+OiWntT3v3DZmRH8UwGNp0P2tg7DJknFyeBacfoN432wTSgd
 WU5jQ7PgophHyEDZRcHBOD7QpotnJEMxv+DUkA9NF3/Ai11fl/1o/FtIhOfzTDRmjfzd
 anqR3xBpfOoxKcUoczwba7rh6pA6GqTEYjbHqkKyKWIbtYxLAyr3y4NTfyarpUXdGcRx
 X3IA==
X-Gm-Message-State: AOAM531SpRQKfF/OTvwnY+t5w0kHU++NHg2SYKOnF3BOTavnKb+e13Mb
 OXIWTiXmA7puz2JZerBtRHRphY/fVigQEZiy7AnhmdmNKx5T9eIgsTbxeuPaAkeFozJnGO2lIEH
 FiG7Tk6m2UJkBh6k=
X-Received: by 2002:a05:6000:2c5:: with SMTP id
 o5mr26497309wry.4.1620059598400; 
 Mon, 03 May 2021 09:33:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTU8V+O3W35PHlJkoG4KCQ1YpBI1a3ef9EmQHlmvYg80zLePxw393zKf6UL9tGY7v7vbhKAw==
X-Received: by 2002:a05:6000:2c5:: with SMTP id
 o5mr26497258wry.4.1620059598048; 
 Mon, 03 May 2021 09:33:18 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id s15sm7538509wrt.19.2021.05.03.09.33.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 May 2021 09:33:17 -0700 (PDT)
Subject: Re: [PATCH v5 08/10] qtest/bios-tables-test: Make test
 build-independent from accelerator
To: Igor Mammedov <imammedo@redhat.com>
References: <20210501223638.510712-1-philmd@redhat.com>
 <20210501223638.510712-9-philmd@redhat.com>
 <20210503143639.57e7c52c@redhat.com>
 <dd561115-0586-3920-6236-32a3abd043f2@redhat.com>
 <20210503180415.3c798f64@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <ced07efc-996f-929a-44dc-993ab86ad4ab@redhat.com>
Date: Mon, 3 May 2021 18:33:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210503180415.3c798f64@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/3/21 6:04 PM, Igor Mammedov wrote:
> On Mon, 3 May 2021 14:44:32 +0200
> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
> 
>> Hi Igor,
>>
>> On 5/3/21 2:36 PM, Igor Mammedov wrote:
>>> On Sun,  2 May 2021 00:36:36 +0200
>>> Philippe Mathieu-Daudé <philmd@redhat.com> wrote:
>>>   
>>>> Now than we can probe if the TCG accelerator is available
>>>> at runtime with a QMP command, do it once at the beginning
>>>> and only register the tests we can run.
>>>> We can then replace the #ifdef'ry by an assertion.
>>>>
>>>> Reviewed-by: Eric Blake <eblake@redhat.com>
>>>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>>>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>>>> ---
>>>>  tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------
>>>>  1 file changed, 52 insertions(+), 47 deletions(-)
>>>>
>>>> diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
>>>> index 156d4174aa3..a4c7bddf6f3 100644
>>>> --- a/tests/qtest/bios-tables-test.c
>>>> +++ b/tests/qtest/bios-tables-test.c
>>>> @@ -97,6 +97,7 @@ typedef struct {
>>>>      QTestState *qts;
>>>>  } test_data;
>>>>  
>>>> +static bool tcg_accel_available;
>>>>  static char disk[] = "tests/acpi-test-disk-XXXXXX";
>>>>  static const char *data_dir = "tests/data/acpi";
>>>>  #ifdef CONFIG_IASL
>>>> @@ -718,15 +719,11 @@ static void test_acpi_one(const char *params, test_data *data)
>>>>      char *args;
>>>>      bool use_uefi = data->uefi_fl1 && data->uefi_fl2;
>>>>  
>>>> -#ifndef CONFIG_TCG
>>>> -    if (data->tcg_only) {
>>>> -        g_test_skip("TCG disabled, skipping ACPI tcg_only test");
>>>> -        return;
>>>> -    }
>>>> -#endif /* CONFIG_TCG */
>>>> +    assert(!data->tcg_only || tcg_accel_available);
>>>>  
>>>>      args = test_acpi_create_args(data, params, use_uefi);
>>>>      data->qts = qtest_init(args);
>>>> +  
>>> stray new line?  
>>
>> Oops.
>>
>>>   
>>>>      test_acpi_load_tables(data, use_uefi);
>>>>  
>>>>      if (getenv(ACPI_REBUILD_EXPECTED_AML)) {
>>>> @@ -1504,6 +1501,8 @@ int main(int argc, char *argv[])
>>>>      const char *arch = qtest_get_arch();
>>>>      int ret;
>>>>  
>>>> +    tcg_accel_available = qtest_has_accel("tcg");
>>>> +
>>>>      g_test_init(&argc, &argv, NULL);
>>>>  
>>>>      if (strcmp(arch, "i386") == 0 || strcmp(arch, "x86_64") == 0) {
>>>> @@ -1512,56 +1511,62 @@ int main(int argc, char *argv[])
>>>>              return ret;
>>>>          }
>>>>          qtest_add_func("acpi/q35/oem-fields", test_acpi_oem_fields_q35);
>>>> -        qtest_add_func("acpi/q35/tpm-tis", test_acpi_q35_tcg_tpm_tis);
>>>> -        qtest_add_func("acpi/piix4", test_acpi_piix4_tcg);
>>>>          qtest_add_func("acpi/oem-fields", test_acpi_oem_fields_pc);
>>>> -        qtest_add_func("acpi/piix4/bridge", test_acpi_piix4_tcg_bridge);
>>>> +        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
>>>>          qtest_add_func("acpi/piix4/pci-hotplug/no_root_hotplug",
>>>>                         test_acpi_piix4_no_root_hotplug);
>>>>          qtest_add_func("acpi/piix4/pci-hotplug/no_bridge_hotplug",
>>>>                         test_acpi_piix4_no_bridge_hotplug);
>>>>          qtest_add_func("acpi/piix4/pci-hotplug/off",
>>>>                         test_acpi_piix4_no_acpi_pci_hotplug);
>>>> -        qtest_add_func("acpi/q35", test_acpi_q35_tcg);
>>>> -        qtest_add_func("acpi/q35/bridge", test_acpi_q35_tcg_bridge);
>>>> -        qtest_add_func("acpi/q35/mmio64", test_acpi_q35_tcg_mmio64);
>>>> -        qtest_add_func("acpi/piix4/ipmi", test_acpi_piix4_tcg_ipmi);
>>>> -        qtest_add_func("acpi/q35/ipmi", test_acpi_q35_tcg_ipmi);
>>>> -        qtest_add_func("acpi/piix4/cpuhp", test_acpi_piix4_tcg_cphp);
>>>> -        qtest_add_func("acpi/q35/cpuhp", test_acpi_q35_tcg_cphp);
>>>> -        qtest_add_func("acpi/piix4/memhp", test_acpi_piix4_tcg_memhp);
>>>> -        qtest_add_func("acpi/q35/memhp", test_acpi_q35_tcg_memhp);
>>>> -        qtest_add_func("acpi/piix4/numamem", test_acpi_piix4_tcg_numamem);
>>>> -        qtest_add_func("acpi/q35/numamem", test_acpi_q35_tcg_numamem);
>>>> -        qtest_add_func("acpi/piix4/nosmm", test_acpi_piix4_tcg_nosmm);
>>>> -        qtest_add_func("acpi/piix4/smm-compat",
>>>> -                       test_acpi_piix4_tcg_smm_compat);
>>>> -        qtest_add_func("acpi/piix4/smm-compat-nosmm",
>>>> -                       test_acpi_piix4_tcg_smm_compat_nosmm);
>>>> -        qtest_add_func("acpi/piix4/nohpet", test_acpi_piix4_tcg_nohpet);
>>>> -        qtest_add_func("acpi/q35/nosmm", test_acpi_q35_tcg_nosmm);
>>>> -        qtest_add_func("acpi/q35/smm-compat",
>>>> -                       test_acpi_q35_tcg_smm_compat);
>>>> -        qtest_add_func("acpi/q35/smm-compat-nosmm",
>>>> -                       test_acpi_q35_tcg_smm_compat_nosmm);
>>>> -        qtest_add_func("acpi/q35/nohpet", test_acpi_q35_tcg_nohpet);
>>>> -        qtest_add_func("acpi/piix4/dimmpxm", test_acpi_piix4_tcg_dimm_pxm);
>>>> -        qtest_add_func("acpi/q35/dimmpxm", test_acpi_q35_tcg_dimm_pxm);
>>>> -        qtest_add_func("acpi/piix4/acpihmat", test_acpi_piix4_tcg_acpi_hmat);
>>>> -        qtest_add_func("acpi/q35/acpihmat", test_acpi_q35_tcg_acpi_hmat);
>>>> -        qtest_add_func("acpi/microvm", test_acpi_microvm_tcg);
>>>> -        qtest_add_func("acpi/microvm/usb", test_acpi_microvm_usb_tcg);
>>>> -        qtest_add_func("acpi/microvm/rtc", test_acpi_microvm_rtc_tcg);
>>>> -        qtest_add_func("acpi/microvm/ioapic2", test_acpi_microvm_ioapic2_tcg);
>>>> -        qtest_add_func("acpi/microvm/oem-fields", test_acpi_oem_fields_microvm);
>>>> -        if (strcmp(arch, "x86_64") == 0) {
>>>> -            qtest_add_func("acpi/microvm/pcie", test_acpi_microvm_pcie_tcg);
>>>> +        if (tcg_accel_available) {  
>>>
>>> most of this can run without TCG if KVM is available, so why are you limiting it to TCG only
>>> or am I missing something?  
>>
>> This patch is a simple API change, these tests are already restricted by
>> the 'g_test_skip("TCG disabled, skipping ACPI tcg_only test");' call.
>>
> 
> 
> with current code, assume we have TCG compiled out:
>  - test_acpi_one() will execute any test that is not marked as tcg_only
> 
> with this patch if tcg_accel_available == False,
> it will not even register any test under "if (tcg_accel_available) {" branch
> and in this patch that includes a bunch of _non_ tcg_only tests.
> So tests won't be executed on KVM only build, where previously they were executed just fine.

I guess you refer to the 'data->tcg_only' field, OK, now I understood.


