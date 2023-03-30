Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8ED6D048C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:22:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrHN-0006yF-1I; Thu, 30 Mar 2023 08:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phrHK-0006xw-TT
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:21:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1phrHJ-00082N-4U
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:21:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680178875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vSo4rLmTbJ5Bl1TumR2QRbeje7osUwiOaEXio2w2d+Q=;
 b=MBhgTrN64c+pDU6l2O3b1FR2Jk5GnX5544rl7/gjVCG11852xLpxOkV0DODv2gU2qv1Af3
 GhkB8rzOKIR63DW6gEQzyyGk0VO7cqr+msVVDa+imjQOSq5VpqlXljR29BAt2e8cnHnxvj
 3/FusEfR8KtRqumnBmcRwZsf0iNwZ5A=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-550-2z4RG8gxPAef72IOmohZVQ-1; Thu, 30 Mar 2023 08:21:14 -0400
X-MC-Unique: 2z4RG8gxPAef72IOmohZVQ-1
Received: by mail-qt1-f199.google.com with SMTP id
 y10-20020a05622a164a00b003e38e0a3cc3so12253766qtj.14
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 05:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680178874;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vSo4rLmTbJ5Bl1TumR2QRbeje7osUwiOaEXio2w2d+Q=;
 b=WhKAE8TH4iYUkOhIK7FyDTcA0X1msvIBM0lGPXC1L4mFzxAYh2vnBOhFJihrGrydX2
 nIeNcppa5rE66FiyThvrYb1jlZATFCk57nVd2CKytkjEzHUAWvGFYvguhfYWguhnzZEH
 Un0hwQuXfnfpPf+yHGDTowb0aPD2qB8PF0V1hSprlPj59+Yf+bgjHwceI7riX72FNvJC
 GBeo/MxnAVDbY4+ZJXOIZRydtS8eNcP3gOVKI0EyEPP4ZqsCAP0ksvBrT5jpwjdVKZld
 GkREM76iCfyRaM7nf0roEtUFSX5h7qGzIt5/U5L6A4yRD9QrTrLD0VVZNV6yZMU7esw8
 /HzA==
X-Gm-Message-State: AAQBX9eZnt/gqnuSqyUNAF67owbZ5hRJanGMrQMfYdCLXS/jIrx8OwQo
 n+muSlAN7kjuPOYBbexpVUU21+Tb0Z032RNmdC6kTfyI26X/XE5lkQmHRReXD4xSM4VyQIkq2fI
 bY2bkXvqHDdIkfC0=
X-Received: by 2002:a05:6214:240d:b0:5ad:45f2:4309 with SMTP id
 fv13-20020a056214240d00b005ad45f24309mr37924656qvb.50.1680178874008; 
 Thu, 30 Mar 2023 05:21:14 -0700 (PDT)
X-Google-Smtp-Source: AKy350abjS5fumFMAqSo1N/peyzTYRhc1DLmsELmrmR9PywdzcWilMDHjjs7GSLkTGcDzlnTisrDZQ==
X-Received: by 2002:a05:6214:240d:b0:5ad:45f2:4309 with SMTP id
 fv13-20020a056214240d00b005ad45f24309mr37924609qvb.50.1680178873708; 
 Thu, 30 Mar 2023 05:21:13 -0700 (PDT)
Received: from [10.33.192.205] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 s20-20020a374514000000b00746b2ca65edsm8831543qka.75.2023.03.30.05.21.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:21:11 -0700 (PDT)
Message-ID: <92ed3dc1-32c2-cce2-57be-28f5aa702d60@redhat.com>
Date: Thu, 30 Mar 2023 14:21:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 09/11] tests/requirements.txt: bump up avocado-framework
 version to 101.0
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Warner Losh <imp@bsdimp.com>, Ryo ONODERA <ryoon@netbsd.org>,
 Kevin Wolf <kwolf@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Kyle Evans <kevans@freebsd.org>, Reinoud Zandijk <reinoud@netbsd.org>,
 Kautuk Consul <kconsul@linux.vnet.ibm.com>,
 Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
References: <20230330101141.30199-1-alex.bennee@linaro.org>
 <20230330101141.30199-10-alex.bennee@linaro.org>
 <b23ab886-e9f5-bb94-c98d-ccdd45cdeff1@redhat.com> <87zg7uo2pi.fsf@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <87zg7uo2pi.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 30/03/2023 14.12, Alex Bennée wrote:
> 
> Thomas Huth <thuth@redhat.com> writes:
> 
>> On 30/03/2023 12.11, Alex Bennée wrote:
>>> From: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>> Avocado version 101.0 has a fix to re-compute the checksum
>>> of an asset file if the algorithm used in the *-CHECKSUM
>>> file isn't the same as the one being passed to it by the
>>> avocado user (i.e. the avocado_qemu python module).
>>> In the earlier avocado versions this fix wasn't there due
>>> to which if the checksum wouldn't match the earlier
>>> checksum (calculated by a different algorithm), the avocado
>>> code would start downloading a fresh image from the internet
>>> URL thus making the test-cases take longer to execute.
>>> Bump up the avocado-framework version to 101.0.
>>> Signed-off-by: Kautuk Consul <kconsul@linux.vnet.ibm.com>
>>> Tested-by: Hariharan T S <hariharan.ts@linux.vnet.ibm.com>
>>> Message-Id: <20230327115030.3418323-2-kconsul@linux.vnet.ibm.com>
>>> ---
>>>    tests/requirements.txt | 2 +-
>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>> diff --git a/tests/requirements.txt b/tests/requirements.txt
>>> index 0ba561b6bd..a6f73da681 100644
>>> --- a/tests/requirements.txt
>>> +++ b/tests/requirements.txt
>>> @@ -2,5 +2,5 @@
>>>    # in the tests/venv Python virtual environment. For more info,
>>>    # refer to: https://pip.pypa.io/en/stable/user_guide/#id1
>>>    # Note that qemu.git/python/ is always implicitly installed.
>>> -avocado-framework==88.1
>>> +avocado-framework==101.0
>>>    pycdlib==1.11.0
>>
>> Did you check whether the same amount of avocado tests still works as
>> before? ... last time I tried to bump the version, a lot of things
>> were failing, and I think Cleber was recently working  on fixing
>> things, but I haven't heart anything back from him yet that it would
>> be OK to bump to a newer version now ...
> 
> I ran it on my default build and the only failure was:
> 
>   (008/222) tests/avocado/boot_linux.py:BootLinuxS390X.test_s390_ccw_virtio_tcg: INTERRUPTED: timeout (240.01 s)
> 
> which passed on a retry. But now I realise with failfast it skipped a bunch:

That one is also failing for me here when I apply the patch. Without the 
patch, the test is working fine. I think this needs more careful testing 
first - e.g. the tests are run in parallel now by default, which breaks a 
lot of our timeout settings.

  Thomas


