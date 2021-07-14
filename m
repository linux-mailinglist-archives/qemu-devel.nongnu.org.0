Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92ABA3C91ED
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 22:17:46 +0200 (CEST)
Received: from localhost ([::1]:55476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3lKD-0000SR-4S
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 16:17:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3lIl-00077b-Ju
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 16:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m3lIh-0005BS-UI
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 16:16:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626293768;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+96Uly0hJqHnow8Pb5Rlc8gOnNql3vpPum949J6F5uE=;
 b=OND4MJIzPzCtq006RNGfOlXJgOUrmcCbU7owF1ngyNUF0T4Gh1+yco16NXYE+dpTxRaQJN
 jeLD50uzeKuQtRFE32+g44yeCm+Z9Sz27fsfkte8/pUqN2KpLowyI5xjiyJXTi/J+6QgCR
 WvIbt0b0XRluMSCXRbi35vQ0jTiCQBk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-Zrj2hK8SMWC9YRwEtJxCNA-1; Wed, 14 Jul 2021 16:16:07 -0400
X-MC-Unique: Zrj2hK8SMWC9YRwEtJxCNA-1
Received: by mail-wr1-f69.google.com with SMTP id
 h15-20020adffd4f0000b0290137e68ed637so2089467wrs.22
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 13:16:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=+96Uly0hJqHnow8Pb5Rlc8gOnNql3vpPum949J6F5uE=;
 b=Dl/iDF7bku8CQWPwLVXAKpPzcCbJookckdBZrttooU3slA/41ZJKmAIA2lyG3qfWUE
 q0A3JMXkGnYBdpEQYYg4T37XxRH15EiyHBgA7d15qLta5tJ2Pktkm7xg+xnCf8rv+c+c
 BuAfEDlaThP3TXW0rrhXMm8lM7cCeGmNmmCzFluS4uEp3GoXJO/sWibTCxw5WwMIQSFa
 0cPvuf7hETtxchq+8czyFiGBDJi/Tf6zhN/DSzLN2byCYKHlIxJ6+s38UlaJqNz4psnv
 QtuhWsUppoFR3rCqri8V+uiLSr/Z5l5oBXfZzDcGRkWC6Qxmr++SF7I4zVMp76NQF2/b
 O8kw==
X-Gm-Message-State: AOAM531o7kktEQM1zqw0Tz75Ft+VnaB+QvdwbFmLwxXgnHlIXpdz+gWv
 7JCFFuGWOQpuFfHFiXnonr4v2MS2uUkbfoLpCTUTNM/EZvF/radc7I/Q9WULC1npPGWsnnPgbd1
 EYBjQKJZpLxBjuKg=
X-Received: by 2002:a7b:c452:: with SMTP id l18mr5950827wmi.164.1626293766594; 
 Wed, 14 Jul 2021 13:16:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR//77vDOkh/5f9lKMgw7ufrrTWLx+v3Iw4n9OHfJrCXb4kDhT/3ET2wbjmg1lvhUCZxWJQg==
X-Received: by 2002:a7b:c452:: with SMTP id l18mr5950809wmi.164.1626293766342; 
 Wed, 14 Jul 2021 13:16:06 -0700 (PDT)
Received: from [192.168.1.24] (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr.
 [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id l14sm3582088wrs.22.2021.07.14.13.16.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 13:16:05 -0700 (PDT)
Subject: Re: [PATCH v3 0/9] tests: Add test cases for TPM 1.2 ACPI tables
To: Markus Armbruster <armbru@redhat.com>
References: <20210712150949.165725-1-stefanb@linux.vnet.ibm.com>
 <bb8d222a-be8a-02b7-3ddc-de443290e29d@redhat.com>
 <36bcf543-0b56-7e2f-26e7-648ca3cf58dd@linux.ibm.com>
 <dd9e11e5-c39f-296b-e74a-4c66c8531500@redhat.com>
 <87a6mpez2b.fsf@dusky.pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <97703096-ad9d-f676-ffcb-46ad4bf340c2@redhat.com>
Date: Wed, 14 Jul 2021 22:16:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87a6mpez2b.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Berger <stefanb@linux.vnet.ibm.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 marcandre.lureau@redhat.com, Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/14/21 4:43 PM, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> +Markus
>>
>> On 7/12/21 5:47 PM, Stefan Berger wrote:
>>>
>>> On 7/12/21 11:29 AM, Philippe Mathieu-Daudé wrote:
>>>> Hi Stefan,
>>>>
>>>> On 7/12/21 5:09 PM, Stefan Berger wrote:
>>>>> This series of patches adds test case for TPM 1.2 ACPI tables.
>>>>>
>>>>>    Stefan
>>>>>
>>>>> v3:
>>>>>    - Define enum TPMVersion for when CONFIG_TPM is not defined
>>>>>      affected patches 2 and 6
>>>> I think in 11fb99e6f48..e542b71805d we missed an extra patch
>>>> for qtests. Probably (untested):
>>>
>>> Shouldn't we have seen test compilation errors already?
>>>
>>> I didn't go down this route for the build system (as you show below)
>>> because in this series we are testing ACPI tables and I introduce the
>>> reference to enum TPMVersion here, which wasn't needed before. The
>>> alternative may be to go into 8/9 and eliminate all TPM code if
>>> CONFIG_TPM is not set. The introduction of the enum now passes the tests
>>> with --enable-tpm and --disable-tpm.
>>>
>>> Otherwise the BIOS test are skipped due to this here:
>>>
>>>
>>> static void test_acpi_tcg_tpm(const char *machine, const char *tpm_if,
>>>                               uint64_t base, enum TPMVersion tpm_version)
>>> {
>>> #ifdef CONFIG_TPM
>>> [...]
>>>
>>> #else
>>>     g_test_skip("TPM disabled");
>>> #endif
>>> }
>>>
>>> So I didn't want to clutter this code with more #ifdef CONFIG_TPM but
>>> maybe that would be the right solution.
>>
>> IMO the "right" solution is to check via QMP if TMP is supported
>> or not. This is now doable since commit caff255a546 ("tpm: Return
>> QMP error when TPM is disabled in build").
>>
>> Long term we'd like to decouple the tests/ build from the various
>> QEMU configurations, and build the tests once.
> 
> This argument applies only to macros from target-specific headers like
> $TARGET-config-target.h, not to macros from config-host.h.  #ifdef
> CONFIG_TPM should be fine, shouldn't it?

Some definitions depend on the host (OS, libraries installed, ...),
others depend on the --enable/--disable ./configure options.

IMO it would be nice if we could get qtests independent of the latter.

I suppose config-host.h holds both kinds.


