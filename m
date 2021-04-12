Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFB935CFE9
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Apr 2021 19:59:32 +0200 (CEST)
Received: from localhost ([::1]:52256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lW0qR-0005Pk-2U
	for lists+qemu-devel@lfdr.de; Mon, 12 Apr 2021 13:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lW0mz-0004Rl-PM
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 13:55:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24577)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lW0mw-00070p-Df
 for qemu-devel@nongnu.org; Mon, 12 Apr 2021 13:55:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618250152;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4I/jK6qGFeqeeX1jfX4FwqC54GIlyL+4m5g/knaNbjw=;
 b=GRd/IstGszhxgJdhERKG2BxH6dU+rK/XWIFFLMkjttM7kCxDXM3B89ELG0qbDNOH1Q3ZXz
 GIiOyTvoa8AsOWgrtaZNIdwqn2IGtKF6gVCAEjFXj7zZ0I0RRY6lUpdp2ovzjXR57TqO8A
 VDcut4fG7dFMchM8uGkWTfS1UgpUuco=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-aCbsx5njO6S1F6-9-6CJVg-1; Mon, 12 Apr 2021 13:55:51 -0400
X-MC-Unique: aCbsx5njO6S1F6-9-6CJVg-1
Received: by mail-ej1-f69.google.com with SMTP id v27so4286169ejq.0
 for <qemu-devel@nongnu.org>; Mon, 12 Apr 2021 10:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4I/jK6qGFeqeeX1jfX4FwqC54GIlyL+4m5g/knaNbjw=;
 b=gldDrS6ATSbco/IczegT6zwlozDKfBFVmUJtLwG9PzpP6gYKJ4r2Or+/bu5AY6f6wD
 PbZ9aJGI74ZGJv9Mv8Nzxq4yAWNWmuoVzZaZUwmT2aBuf2rt130dWoJYwAElyv8MUce7
 f6yeTJyZUEY03KG3QJMtKb6fH6kbKMIMyRvnqRQ9gIzoapKBM9vPnFU24bEwrCj2YoSN
 0K1ae5qhDhwpuh29W8RqEKIOpLqqJx0LKiCEHtGWFjVBPk4EUU7qdo7i9Bu7CnPHAiWU
 YTwm4bPVjSXxkN5yNzzbtn2a7M12iO+/8ORac8pYbdhKa1NaQ+4hLsM4WG/2xvwI01eH
 aoLw==
X-Gm-Message-State: AOAM532mDwuPelgrhuf3L+ub5ps4/p6tW5bRhY1cKyAYFkVKDNPHVUBH
 tTqzO4XI5lrWSeoOTXl2Ksxud+bYLSYx+Pz6iTQi3NTNpUBfvA/vmWiOOgnLih+v3n/oo1fLVa0
 WbkuA9IWaaxzj3ayKazkJUV7B5s56Av2wS0OuKthfkdEBro+kkSaibwAPHm/tXBy4
X-Received: by 2002:a50:a699:: with SMTP id e25mr30175955edc.276.1618250149745; 
 Mon, 12 Apr 2021 10:55:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwI5Hhl03KLRu7fmtdH630+Cu7/J8ehebSpNaCtpt28B4lTrh6cFj98kLSpoOuuOG6GwtkeWA==
X-Received: by 2002:a50:a699:: with SMTP id e25mr30175936edc.276.1618250149516; 
 Mon, 12 Apr 2021 10:55:49 -0700 (PDT)
Received: from [192.168.1.36] (63.red-83-51-208.dynamicip.rima-tde.net.
 [83.51.208.63])
 by smtp.gmail.com with ESMTPSA id e20sm1288829ejy.66.2021.04.12.10.55.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Apr 2021 10:55:48 -0700 (PDT)
Subject: Re: [PATCH] tests/acceptance: Add a 'virt_kvm' test using the GICv3
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200929224857.1225107-1-philmd@redhat.com>
 <87eefvnx3s.fsf@linaro.org> <7a720701-a34f-ccf4-d116-a0f0703b5f83@redhat.com>
 <87ft03wd3w.fsf@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b9fa6362-7899-884e-58b9-f670143de6ae@redhat.com>
Date: Mon, 12 Apr 2021 19:55:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87ft03wd3w.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/6/21 7:12 PM, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 3/31/21 5:45 PM, Alex Bennée wrote:
>>>
>>> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
>>>
>>>> The current 'virt_kvm' test is restricted to GICv2, but can also
>>>> work with a GICv3. Duplicate it but add a GICv3 test which can be
>>>> tested on some hardware.
>>>>
>>>> Noticed while running:
>>>>
>>>>  $ avocado --show=app run -t machine:virt tests/acceptance/
>>>>  ...
>>>>  (2/6) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm: ERROR: Unexpected empty reply from server (1.82 s)
>>>>
>>>> The job.log content is:
>>>>
>>>>   L0351 DEBUG| Output: 'qemu-system-aarch64: host does not support in-kernel GICv2 emulation\n'
>>>>
>>>> With this patch:
>>>>
>>>>  $ avocado --show=app run -t device:gicv3 tests/acceptance/
>>>>  (1/1)
>>>>  tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
>>>>  PASS (55.10 s)
>>>
>>> On the new aarch64 machine which is GICv3 I get the following:
>>>
>>>  (006/142) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2: ERROR: Unexpected empty reply from server (0.47 s)
>>>
>>> which it shouldn't have run. However:
>>>
>>>   ./tests/venv/bin/avocado --show=app run -t device:gic3 tests/acceptance/
>>>   Test Suite could not be create. No test references provided nor any other arguments resolved into tests
>>>
>>> Is this something that has regressed or am I doing it wrong?
>>
>> Typo in the tag: "device:gic3" -> "device:gicv3"
> 
> Doh!
> 
> But what about:
> 
> /tests/venv/bin/avocado run tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2
> JOB ID     : 396696d8f9d31d970878cb46025b2ced76f3623f
> JOB LOG    : /home/alex/avocado/job-results/job-2021-04-06T17.11-396696d/job.log
>  (1/1) tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv2: ERROR: Unexpected empty reply from server (0.65 s)
> RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
> JOB TIME   : 0.96 s
> 
> why doesn't that skip?

/home/phil/avocado/job-results/job-2021-04-12T17.51-efdca81/job.log
2021-04-12 17:52:44,589 machine          L0389 DEBUG| Output:
"qemu-system-aarch64: Could not find ROM image
'/home/phil/qemu/build/host/pc-bios/edk2-aarch64-code.fd'\n"

Missing prerequisite:

$ ninja pc-bios/edk2-aarch64-code.fd
[1/1] Generating edk2-aarch64-code.fd with a custom command (wrapped by
meson to capture output)

Then we are good:

$ avocado --show=app,console run -t device:gicv3 tests/acceptance
JOB ID     : e84401e5cc3ae53a3094c79491e661385cc7b4a7
JOB LOG    :
/home/phil/avocado/job-results/job-2021-04-12T17.53-e84401e/job.log
 (1/1)
tests/acceptance/boot_linux.py:BootLinuxAarch64.test_virt_kvm_gicv3:
PASS (16.38 s)
RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 |
CANCEL 0
JOB TIME   : 16.70 s

Probably some missing dependency in Makefile/Meson?


