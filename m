Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD64635BA8
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Nov 2022 12:27:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oxnu6-0006C7-Py; Wed, 23 Nov 2022 06:26:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oxnu1-00067s-Bs
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:26:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oxntz-0000ss-0t
 for qemu-devel@nongnu.org; Wed, 23 Nov 2022 06:26:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669202810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/uVeYx6CjoYEK3tX9urIsDYRKGgSlWj2VcVgfP/GhA0=;
 b=JzfarWVrpQNcU6mppvTfZlp8nIXgSRowqES19EA5iLHQ3euTIK3xObB8fr5OLGKzElnqA+
 0b1ECiDD/NdBZV5XsCe5m3CB3LRRTRpWMxXveYRaVa9wOJe+ToM7CDRgs6s/+xihQlQhHI
 4VbMP9FmuNSv5Xx7oF7UEXP7f76EgAk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-507-PQuhg_eROzibS4XPr75S3g-1; Wed, 23 Nov 2022 06:26:49 -0500
X-MC-Unique: PQuhg_eROzibS4XPr75S3g-1
Received: by mail-wr1-f72.google.com with SMTP id
 n13-20020adf8b0d000000b0023658a75751so4958078wra.23
 for <qemu-devel@nongnu.org>; Wed, 23 Nov 2022 03:26:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:subject:from:references:cc:to
 :content-language:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/uVeYx6CjoYEK3tX9urIsDYRKGgSlWj2VcVgfP/GhA0=;
 b=6VhKOl1eRJchA6KOfwOK8BmBxwThTjkCJ4X3su3qu5Hz3nW3WJIHtycWDEMVhLvmGE
 Io1ZwLHAgdx4gwHAyyeishgTPSbBzhhL0shL3q4M9NJ++f31Tb9dvf7f9daASLqcRuD0
 7wzTzk0YCtm6yGXPseXENOgQy2D/zvVUXnzdJo9ttDJgLPsEy3PT+6iSK8VE9ztcYJc8
 L+dJsvP9kS99OTegVNybentotJ+SGqq02oCi/hF1oIo0s2ip72qltFU3LgHZ2Qs+FDVi
 vS63OBsxz9/V0TW2IWP8GH8y+BEomc2ReJTUoyuCODyOIZhvt2SPK9OYYf2+jcD/ryeg
 Iyhg==
X-Gm-Message-State: ANoB5plVpaKwNJqMpu75KVz422PZGmsO9tWyuYxnu+8TxjP69hfqI9nr
 ITWNpJcxoTtxWSliOtSCDj1vuHyyhoMCsSXjljF1+6vcfWeabdPZWBhSSv8gClHChdxhj4fLrjB
 JA5JnSSHV4H1Ty0c=
X-Received: by 2002:adf:d4cb:0:b0:241:e680:b5be with SMTP id
 w11-20020adfd4cb000000b00241e680b5bemr3909646wrk.717.1669202807866; 
 Wed, 23 Nov 2022 03:26:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4ty6pJqOeN7hHH/KlVkwB9Ti1tzmh/137oXCPteawJKbfV2Az4Xc145Vj61LRtTCZLnCiOiQ==
X-Received: by 2002:adf:d4cb:0:b0:241:e680:b5be with SMTP id
 w11-20020adfd4cb000000b00241e680b5bemr3909636wrk.717.1669202807665; 
 Wed, 23 Nov 2022 03:26:47 -0800 (PST)
Received: from [192.168.0.5] (ip-109-43-178-58.web.vodafone.de.
 [109.43.178.58]) by smtp.gmail.com with ESMTPSA id
 t10-20020a5d6a4a000000b00241f467f888sm781662wrw.74.2022.11.23.03.26.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Nov 2022 03:26:47 -0800 (PST)
Message-ID: <8f6f531f-3ed9-6a14-9ad6-8c0ff6b32c22@redhat.com>
Date: Wed, 23 Nov 2022 12:26:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20221118113309.1057790-1-alex.bennee@linaro.org>
 <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Subject: Re: [RFC PATCH] tests/avocado: use new rootfs for orangepi test
In-Reply-To: <8c4b6387-450d-88af-c1d4-3171a9c3067b@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 23/11/2022 12.15, Philippe Mathieu-Daudé wrote:
> On 18/11/22 12:33, Alex Bennée wrote:
>> The old URL wasn't stable. I suspect the current URL will only be
>> stable for a few months so maybe we need another strategy for hosting
>> rootfs snapshots?
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> ---
>>   tests/avocado/boot_linux_console.py | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/avocado/boot_linux_console.py 
>> b/tests/avocado/boot_linux_console.py
>> index 4c9d551f47..5a2923c423 100644
>> --- a/tests/avocado/boot_linux_console.py
>> +++ b/tests/avocado/boot_linux_console.py
>> @@ -793,8 +793,8 @@ def test_arm_orangepi_sd(self):
>>           dtb_path = 
>> '/usr/lib/linux-image-current-sunxi/sun8i-h3-orangepi-pc.dtb'
>>           dtb_path = self.extract_from_deb(deb_path, dtb_path)
>>           rootfs_url = 
>> ('http://storage.kernelci.org/images/rootfs/buildroot/'
>> -                      'kci-2019.02/armel/base/rootfs.ext2.xz')
>> -        rootfs_hash = '692510cb625efda31640d1de0a8d60e26040f061'
>> +                      'buildroot-baseline/20221116.0/armel/rootfs.ext2.xz')
>> +        rootfs_hash = 'fae32f337c7b87547b10f42599acf109da8b6d9a'
> If Avocado doesn't find an artifact in its local cache, it will fetch it
> from the URL.
> The cache might be populated with artifacts previously downloaded, but
> their URL is not valid anymore (my case for many tests).
> We can also add artifacts manually, see [1].
> 
> I'd rather keep pre-existing tests if possible, to test older (kernel / 
> user-space) images. We don't need to run all the tests all the time:
> tests can be filtered by tags (see [2]).
> 
> My preference here is to refactor this test, adding the "kci-2019.02"
> and "baseline-20221116.0" releases. I can prepare the patch if you /
> Thomas don't object.

IMHO we shouldn't keep tests in the upstream git repository where the 
binaries are not available in public anymore. They won't get run by new 
contributors anymore, and also could vanish from the disks of the people who 
previously downloaded it, once they wipe their cache or upgrade to a new 
installation, so the test code will sooner or later be bitrotting. But if 
you want to keep the tests around on your hard disk, you could also stick 
the test in a local branch on your hard disk instead.

The other possibility is to upload the binaries to a new public location in 
the web ... but for software that contains GPLed software, you should then 
also make sure to provide the source code to comply with the license.

  Thomas


