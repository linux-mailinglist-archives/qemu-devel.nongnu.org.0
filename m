Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8BD66039CE
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Oct 2022 08:32:09 +0200 (CEST)
Received: from localhost ([::1]:44718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ol2cZ-0007Gm-Na
	for lists+qemu-devel@lfdr.de; Wed, 19 Oct 2022 02:32:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ol2T7-0004UG-2k
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 02:22:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46934)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ol2T1-0007dj-9v
 for qemu-devel@nongnu.org; Wed, 19 Oct 2022 02:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1666160533;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSGllwlGnWpUgm/XnyhNybnoK3wCl8QAVS7mPF96xvE=;
 b=fngzVcnTgc3NX2UQb7PFWq87b+3U36xzT/+RfTBGIoFtar4rM3lSpTgEbJmnHR29NllsmN
 mxEY5su/I19O+Ne6H4aMOla1HtjNIk2zgGN0xSzbG7rFeLBp95fwJO5VKQtwNljItAMLCk
 HbUQiV1HZW7JloStR+WPWzzwa/zI0ZU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-422-sYyAAXO9M92V-wuZ3MDLBw-1; Wed, 19 Oct 2022 02:22:12 -0400
X-MC-Unique: sYyAAXO9M92V-wuZ3MDLBw-1
Received: by mail-ej1-f71.google.com with SMTP id
 sa6-20020a1709076d0600b0078d84ed54b9so7455553ejc.18
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 23:22:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=dSGllwlGnWpUgm/XnyhNybnoK3wCl8QAVS7mPF96xvE=;
 b=RHrQR4k+rGcgKlTF0uwSfeVod3PNDCnzb/Flvfb8QIyISraCAassfW+vttbfBP8Ek8
 6+8JSDT7TQHtBVAbTXPSAzkK4+XchjKdWnKvdNOtNFjSrYNdTqAGtrMz0HY1w9VfIERx
 0u55b3rXvI3HOox75Z8Ed5Bos6TuK74IXnnqydfNp4i0FDOmfVtskQKTY3rimv15Lub6
 ReveOS88tyNnpJO8/gQYiTOxAiRUsuyxO7TCnUCAj738VU6JpTA7cd8UWbCwXsAZlkd/
 d9QaxQ8M1dSH321PyLktiU+N+iubkhrTnALyEOi86eFUGp9UbU0VMWsSWXFrwnv032ma
 D1aA==
X-Gm-Message-State: ACrzQf1IC3g+vMiEfzjM355aHmwD6dF5MJ6yUxipkB2tgLV/YZRs6G5D
 hXD1sRp92GNP5Of9hWMF5p6g3cY9SOMp/bkLy+S5HuvHs800P1RgZWvcAJr7/aqUN2M5meNKUTN
 Dp2tGLi6u+ByuRpA=
X-Received: by 2002:a17:907:7292:b0:78e:2eb5:6af2 with SMTP id
 dt18-20020a170907729200b0078e2eb56af2mr5419426ejc.261.1666160530951; 
 Tue, 18 Oct 2022 23:22:10 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5WoegsCq6dSW2vlPxVLkJse1QyIB55ZmRLXkjjC/zorSzBqtSq8fBd64Xv/f/ZJfo5iQWefw==
X-Received: by 2002:a17:907:7292:b0:78e:2eb5:6af2 with SMTP id
 dt18-20020a170907729200b0078e2eb56af2mr5419407ejc.261.1666160530719; 
 Tue, 18 Oct 2022 23:22:10 -0700 (PDT)
Received: from [192.168.0.5] (ip-109-43-179-54.web.vodafone.de.
 [109.43.179.54]) by smtp.gmail.com with ESMTPSA id
 k13-20020a17090627cd00b0077826b92d99sm8523093ejc.12.2022.10.18.23.22.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 23:22:10 -0700 (PDT)
Message-ID: <b8ceab73-bca8-e2c0-daac-e72d0e4e48d2@redhat.com>
Date: Wed, 19 Oct 2022 08:22:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 00/10] Introduce new acpi/smbios avocado tests using
 biosbits
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>
Cc: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu Devel <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Maydell Peter
 <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>
References: <20221014173508.222823-1-ani@anisinha.ca>
 <875yghcfnq.fsf@linaro.org>
 <CAARzgww2sDAYonM61N1OYvGeWCQRrr6NKY1YezpeJXiej_gNHQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <CAARzgww2sDAYonM61N1OYvGeWCQRrr6NKY1YezpeJXiej_gNHQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/2022 17.34, Ani Sinha wrote:
> On Tue, Oct 18, 2022 at 9:01 PM Alex Bennée <alex.bennee@linaro.org> wrote:
>>
>>
>> Ani Sinha <ani@anisinha.ca> writes:
>>
>>> Please see the README file in patch 9 for more details.
>>> Sample runs are as follows:
>>>
>>> Passed tests:
>>>
>>> $ ./tests/venv/bin/avocado run -t acpi tests/avocado
>>> Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
>>> JOB ID     : e95c7413e996bfb59389839e5ca5105464ef098f
>>> JOB LOG    : /home/anisinha/avocado/job-results/job-2022-10-14T19.15-e95c741/job.log
>>>   (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: PASS (33.08 s)
>>> RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>>> JOB TIME   : 39.18 s
>>
>> Hmm something went wrong:
>>
>>    ➜  ./tests/venv/bin/avocado run -t acpi tests/avocado
>>    Fetching asset from tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits
>>    JOB ID     : 08b6d26bf52a22ccbe1908b14d5b7b27f76ad7fa
>>    JOB LOG    : /home/alex/avocado/job-results/job-2022-10-18T16.29-08b6d26/job.log
>>     (1/1) tests/avocado/acpi-bits.py:AcpiBitsTest.test_acpi_smbios_bits: ERROR: Error while generating the bits iso. Pass V=1 in the environment to get more details. Command '[
>>    '/var/tmp/acpi-bits-yy4mfxrz.tmp/grub-inst-x86_64-efi/bin/grub-mkrescue', '-o', '/var/tmp/acpi-bits-yy4mfxrz.tmp/bits-2020.iso', '/var/tmp/acpi-bits-yy4mfxrz.t... (7.21 s)
>>    RESULTS    : PASS 0 | ERROR 1 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
>>    JOB TIME   : 7.79 s
>>
>> have we added another binary dependency?
> 
> Try with V=1 , Maybe you do not have xorriso? If that is the case, you
> need to install it in your test environment.

If a tool is missing, the test should be SKIP and not ERROR, I think?

  Thomas



