Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7A83308FD
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 08:53:37 +0100 (CET)
Received: from localhost ([::1]:59678 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJAhs-0002mJ-MZ
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 02:53:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJAge-00027j-OS
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 02:52:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lJAgd-0002AC-1C
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 02:52:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615189938;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kCHG6ZonLLPeUU16u6jdq2kF6bKbHFf90lxlB6JWyzI=;
 b=AW62awBHMq/K5s50RVJ1Lr/gyIPYXpaSFZCk0dUjO4I1of3NhHKJxE5DUnmkHVDim+sxE+
 GVSKutCprh190Vr3cnIIicEwO6zzcb6fvzar5KFSgsmL86GjK9Y9LhrfTSYYr0o9zm5Ve+
 ilwJcPJGgiU/EeVMmBzgrKssTYcr49c=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-436-1uoZyCawO7muS9ga1PdI_g-1; Mon, 08 Mar 2021 02:52:15 -0500
X-MC-Unique: 1uoZyCawO7muS9ga1PdI_g-1
Received: by mail-wr1-f70.google.com with SMTP id x9so4417826wro.9
 for <qemu-devel@nongnu.org>; Sun, 07 Mar 2021 23:52:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kCHG6ZonLLPeUU16u6jdq2kF6bKbHFf90lxlB6JWyzI=;
 b=OhIoW09p2Ug8qEzdCA311WWHqXNSP5YMl3iUI/RryERWQuPN5U557sTVzRH56bo1uy
 gsH9kraC5QkHYJi5r3EgK2NuN4GwEh1+523Wefy+PiZsBB+yd4nNKCW3w111951Fmods
 38g9DZ8uCCbwa6/SINnzqRIg1sXCY0hsjeQm4NEBEnatvN+5qXwi7xsbRLsZ5zqZ4rhk
 bUkbgRLgmbJaikuG08VmXIgnnEBiNZhn9NFs5rAfN4t/8UMsik1Gqtex19kO768ljMHD
 5aj6Oa13tGCFQFjl585mS/AOcp67X5kttAT/PV8iHfNdD9QsqxApv0HvHbtqLRNCh1ko
 uQCA==
X-Gm-Message-State: AOAM533n/J5ca5CnaYB9l7biYy20u/qcWyHRPHdk/KV7f7VFTKnwL3bs
 /BHPH3iN1qLoy0/ebEXCd3CHJ2/14Qow3Fb//Kzc1DosnK237pvShZuDArL/TUwBovxj7cevcdU
 D6L+n9Vq59jfqn44=
X-Received: by 2002:a5d:6049:: with SMTP id j9mr1102392wrt.117.1615189934463; 
 Sun, 07 Mar 2021 23:52:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzeUDcPe/yMm7POjxcLfcAM5tHnOXwQkN+tXH0foM78OD0aa+MhHidky48woiitC/OkwGVf5Q==
X-Received: by 2002:a5d:6049:: with SMTP id j9mr1102371wrt.117.1615189934291; 
 Sun, 07 Mar 2021 23:52:14 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id k11sm17688212wmj.1.2021.03.07.23.52.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 07 Mar 2021 23:52:13 -0800 (PST)
Subject: Re: [PATCH v3 2/5] tests/acceptance/boot_linux_console: remove
 Armbian 19.11.3 bionic test for orangepi-pc machine
To: Willian Rampazzo <wrampazz@redhat.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>
References: <20210304203540.41614-1-nieklinnenbank@gmail.com>
 <20210304203540.41614-3-nieklinnenbank@gmail.com>
 <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <4d6d2e89-1152-249b-fe55-d1b611fd77e8@redhat.com>
Date: Mon, 8 Mar 2021 08:52:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAKJDGDZq_ioF91BUWRo_y0GKYGbjgZa46Pt83wp7t3b_ZC=ixw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 b.galvani@gmail.com, qemu-arm@nongnu.org,
 Pavel Dovgalyuk <Pavel.Dovgaluk@ispras.ru>,
 Cleber Rosa Junior <crosa@redhat.com>,
 Philippe Mathieu Daude <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/5/21 4:16 PM, Willian Rampazzo wrote:
> On Thu, Mar 4, 2021 at 5:44 PM Niek Linnenbank <nieklinnenbank@gmail.com> wrote:
>>
>> The image for Armbian 19.11.3 bionic has been removed from the armbian server.
>> Without the image as input the test arm_orangepi_bionic_19_11 cannot run.
>>
>> This commit removes the test completely and merges the code of the generic function
>> do_test_arm_orangepi_uboot_armbian back with the 20.08 test.
>>
>> Signed-off-by: Niek Linnenbank <nieklinnenbank@gmail.com>
>> ---
>>  tests/acceptance/boot_linux_console.py | 72 ++++++++------------------
>>  1 file changed, 23 insertions(+), 49 deletions(-)
>>
>> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/boot_linux_console.py
>> index eb01286799..9fadea9958 100644
>> --- a/tests/acceptance/boot_linux_console.py
>> +++ b/tests/acceptance/boot_linux_console.py
>> @@ -802,7 +802,29 @@ def test_arm_orangepi_sd(self):
>>          # Wait for VM to shut down gracefully
>>          self.vm.wait()
>>
>> -    def do_test_arm_orangepi_uboot_armbian(self, image_path):
>> +    @skipUnless(os.getenv('ARMBIAN_ARTIFACTS_CACHED'),
>> +                'Test artifacts fetched from unreliable apt.armbian.com')
>> +    @skipUnless(os.getenv('AVOCADO_ALLOW_LARGE_STORAGE'), 'storage limited')
>> +    def test_arm_orangepi_bionic_20_08(self):
>> +        """
>> +        :avocado: tags=arch:arm
>> +        :avocado: tags=machine:orangepi-pc
>> +        :avocado: tags=device:sd
>> +        """
>> +
>> +        # This test download a 275 MiB compressed image and expand it
>> +        # to 1036 MiB, but the underlying filesystem is 1552 MiB...
>> +        # As we expand it to 2 GiB we are safe.
>> +
>> +        image_url = ('https://dl.armbian.com/orangepipc/archive/'
>> +                     'Armbian_20.08.1_Orangepipc_bionic_current_5.8.5.img.xz')
> 
> The Armbian 20 is not available on this link anymore. I can browse just 21.

Cat-and-mouse game *sigh*.


