Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BAB93C6089
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:28:03 +0200 (CEST)
Received: from localhost ([::1]:36638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2ymo-0006nv-HA
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:28:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2ylT-000629-0w
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:26:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24557)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2ylR-0001O1-D5
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:26:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626107196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wCBeXofnyls/ISFBISrqD5YXRvG6NgivsR/zSbmawWc=;
 b=XL6TzAVt4eY1Uur4srwfuCO6g1uPYiEn8G4Ox/QKfu28omEWeqIwVJUN/jd5Y22yQtdF85
 ISP0/pXQejST0i4AtuVkf9ZOvSaQO9txc4NyI8TTu3dRaXM6TRqWLaE7l08X418660tQPl
 wACMDx5ZF0XkKEgFQ0MMt7qHzL/tgPQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-464-iEyTqIwbOaK308n56IGGCg-1; Mon, 12 Jul 2021 12:26:35 -0400
X-MC-Unique: iEyTqIwbOaK308n56IGGCg-1
Received: by mail-wm1-f70.google.com with SMTP id
 y6-20020a7bc1860000b0290227b53c7cefso249995wmi.1
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 09:26:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wCBeXofnyls/ISFBISrqD5YXRvG6NgivsR/zSbmawWc=;
 b=i+DDKb2XHYaEmXst7gcXE3YzOS6pn4stg0JAOLTzPns1hLn1ZQiPaPKcMSD4OOZ+jk
 XYOmLj13kd5BnnCEn7driQEaIOxpQUoOxyT7AYgrnFuifm/td90HA3nfg/jGmGSGo4t4
 HFyMysDcIei2tmEKTEZoNCCSj37N9XDYkaXmlST3kl4ZbQyYTMwaekyOpjNRDCyz2dkg
 xO+8XdnXzjhz5X+65thQ37DahjzuSDxUULaCdtMEW12TO9qfqbHJfIYcRoHcg5cJZzuO
 AW/3G7X1QpnpRHEzwtYuKo9ywaAqAa7LNiI/882KkhlnVOVDqyYbnf+7JVpy11eHopml
 mcmA==
X-Gm-Message-State: AOAM530Us4o+5FGpkGkBv4z4m2WHbwWHnZynYsbH2BSpTicA7monewe5
 23oXRaAOEPqT5N36bA65mwHNK+fruUz2TIYcbxImpcDXBbIDqxhRZnEZdrl7fMhe0gaQD+g2usR
 C1BbV+spnIrjmUfo=
X-Received: by 2002:a5d:457b:: with SMTP id a27mr33604589wrc.280.1626107194151; 
 Mon, 12 Jul 2021 09:26:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkiOfwMP2QWT5vjVfLNMc/dSl1odVLZHTmncgtQu1ovbvZiy0lUQWWS3K+B7H1Mbs1AH1Obg==
X-Received: by 2002:a5d:457b:: with SMTP id a27mr33604565wrc.280.1626107193939; 
 Mon, 12 Jul 2021 09:26:33 -0700 (PDT)
Received: from [192.168.1.27] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id m12sm12712024wms.24.2021.07.12.09.26.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jul 2021 09:26:33 -0700 (PDT)
Subject: Re: [PATCH v3 0/9] tests: Add test cases for TPM 1.2 ACPI tables
To: Stefan Berger <stefanb@linux.ibm.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-devel@nongnu.org,
 marcandre.lureau@redhat.com
References: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
 <bb8d222a-be8a-02b7-3ddc-de443290e29d@redhat.com>
 <36bcf543-0b56-7e2f-26e7-648ca3cf58dd@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <dd9e11e5-c39f-296b-e74a-4c66c8531500@redhat.com>
Date: Mon, 12 Jul 2021 18:26:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <36bcf543-0b56-7e2f-26e7-648ca3cf58dd@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.479, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Markus

On 7/12/21 5:47 PM, Stefan Berger wrote:
> 
> On 7/12/21 11:29 AM, Philippe Mathieu-Daudé wrote:
>> Hi Stefan,
>>
>> On 7/12/21 5:09 PM, Stefan Berger wrote:
>>> This series of patches adds test case for TPM 1.2 ACPI tables.
>>>
>>>    Stefan
>>>
>>> v3:
>>>    - Define enum TPMVersion for when CONFIG_TPM is not defined
>>>      affected patches 2 and 6
>> I think in 11fb99e6f48..e542b71805d we missed an extra patch
>> for qtests. Probably (untested):
> 
> Shouldn't we have seen test compilation errors already?
> 
> I didn't go down this route for the build system (as you show below)
> because in this series we are testing ACPI tables and I introduce the
> reference to enum TPMVersion here, which wasn't needed before. The
> alternative may be to go into 8/9 and eliminate all TPM code if
> CONFIG_TPM is not set. The introduction of the enum now passes the tests
> with --enable-tpm and --disable-tpm.
> 
> Otherwise the BIOS test are skipped due to this here:
> 
> 
> static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>                               uint64_t base, enum TPMVersion tpm_version)
> {
> #ifdef CONFIG_TPM
> [...]
> 
> #else
>     g_test_skip("TPM disabled");
> #endif
> }
> 
> So I didn't want to clutter this code with more #ifdef CONFIG_TPM but
> maybe that would be the right solution.

IMO the "right" solution is to check via QMP if TMP is supported
or not. This is now doable since commit caff255a546 ("tpm: Return
QMP error when TPM is disabled in build").

Long term we'd like to decouple the tests/ build from the various
QEMU configurations, and build the tests once.

>> -- >8 --
>> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
>> index ee7347b7275..eeaa0d7302b 100644
>> --- a/tests/qtest/meson.build
>> +++ b/tests/qtest/meson.build
>> @@ -60,10 +60,14 @@
>>     (config_all_devices.has_key('CONFIG_USB_UHCI') and
>>                       \
>>      config_all_devices.has_key('CONFIG_USB_EHCI') ?
>> ['usb-hcd-ehci-test'] : []) +            \
>>     (config_all_devices.has_key('CONFIG_USB_XHCI_NEC') ?
>> ['usb-hcd-xhci-test'] : []) +        \
>> -  (config_all_devices.has_key('CONFIG_TPM_CRB') ? ['tpm-crb-test'] :
>> []) +                  \
>> -  (config_all_devices.has_key('CONFIG_TPM_CRB') ?
>> ['tpm-crb-swtpm-test'] : []) +            \
>> -  (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test']
>> : []) +              \
>> -  (config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ?
>> ['tpm-tis-swtpm-test'] : []) +        \
>> +  (config_host.has_key('CONFIG_TPM') and \
>> +   config_all_devices.has_key('CONFIG_TPM_CRB') ? ['tpm-crb-test'] :
>> []) +                  \
>> +  (config_host.has_key('CONFIG_TPM') and \
>> +   config_all_devices.has_key('CONFIG_TPM_CRB') ?
>> ['tpm-crb-swtpm-test'] : []) +            \
>> +  (config_host.has_key('CONFIG_TPM') and \
>> +   config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ? ['tpm-tis-test']
>> : []) +              \
>> +  (config_host.has_key('CONFIG_TPM') and \
>> +   config_all_devices.has_key('CONFIG_TPM_TIS_ISA') ?
>> ['tpm-tis-swtpm-test'] : []) +        \
>>     (config_all_devices.has_key('CONFIG_RTL8139_PCI') ? ['rtl8139-test']
>> : []) +              \
>>     (config_all_devices.has_key('CONFIG_E1000E_PCI_EXPRESS') ?
>> ['fuzz-e1000e-test'] : []) +   \
>>     (config_all_devices.has_key('CONFIG_ESP_PCI') ? ['am53c974-test'] :
>> []) +                 \
>> ---
>>
>> Cc'ing Paolo/Thomas because there surely exists a clever way to do it...
>>
> 


