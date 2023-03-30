Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 532636D0586
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Mar 2023 14:58:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1phrrI-0004hY-Tm; Thu, 30 Mar 2023 08:58:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1phrrG-0004hA-9K
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:58:26 -0400
Received: from mail-il1-x12c.google.com ([2607:f8b0:4864:20::12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <rob@landley.net>) id 1phrrD-0006Uf-Tb
 for qemu-devel@nongnu.org; Thu, 30 Mar 2023 08:58:26 -0400
Received: by mail-il1-x12c.google.com with SMTP id j2so2726539ila.8
 for <qemu-devel@nongnu.org>; Thu, 30 Mar 2023 05:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=landley-net.20210112.gappssmtp.com; s=20210112; t=1680181102;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7yjMcc/Z1xzueOlJxm0wAt/Cd63eYJdlsjzFrExwQqg=;
 b=Tcmxak+PoquUT/ygIiy90pZCBvqCBOsge4yzzi+HHcSXhRPtZiE/kZjNl1vCfllknp
 qJr4+Y0kKPVYxRzun2NHw8Ysxzh7Tn/nVsfKTM0iA3hT27znrtK/MP2ccxyXLanM6a2v
 sruanmEwOUDBIH4OtIaxdT/mY6pyUbnPRA5FsP7SMcWJFpPXcUAs7cF+DLep9qwmOiKA
 fApLNAh9xSWS2yr93PsyPAQAYPU3rYSO7Uwmss3MbvKuY2LitLDlQgdC/UUpuP5zGuWX
 NqFyK83SIPfSf7WsWDIYrNn3m0Mo3TCP8L+Kq1liD5Si7667+FB+iO7iMEyu+mQK5kZN
 uCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680181102;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7yjMcc/Z1xzueOlJxm0wAt/Cd63eYJdlsjzFrExwQqg=;
 b=rIwnb6zZ/kaFh6tezW6kdDVSzQn8Op3T7VLod1jTNZZ/iDFeBy/bZFNei6yJIBSZd4
 5PG4vssfhA+D3g5dPDHOapMyNChi5msiPzMJ2jau552Io+DTCDuPJQnhvi31uzpTdSmV
 1fE+MOhwZbiwANu/yc09eWZuat3WBArgoLJ+swy8lMySFxZMHvLJ9hDleDDyLdtkz2nn
 OKeiXm692Atv1RIumGMohqgh+U7eEdDxxdi9Lw9kTZILZpVW3QTubo3d5NV0mKJE+7u6
 FHEIlcEDOqDTyl6BDwz+X7VDYDeC0CVVyLjIGUh1N33pP+KkuRgPbMSk57EWeJJPaA76
 be+A==
X-Gm-Message-State: AAQBX9f4wb+KT1x78DIYyqD2gAHBg9UryjDNMElAJ6Y6aXYpb6g4ZxUn
 2cyrb9diyIoFCJE8EQoLkbu5aw==
X-Google-Smtp-Source: AKy350b7Qishj9RV3KT9uUi6P8+snbgODBZO8y0Ulpsr80OPPMhIsS0NWZvfHUzZFIBaLh0RwXFT6w==
X-Received: by 2002:a05:6e02:1543:b0:326:1bd8:9a0e with SMTP id
 j3-20020a056e02154300b003261bd89a0emr3998243ilu.5.1680181102668; 
 Thu, 30 Mar 2023 05:58:22 -0700 (PDT)
Received: from [172.16.32.78] ([198.232.126.202])
 by smtp.gmail.com with ESMTPSA id
 g12-20020a92cdac000000b0031578323bc5sm1955237ild.56.2023.03.30.05.58.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:58:22 -0700 (PDT)
Message-ID: <c8fd4b42-7c7b-8e65-5fe6-ed7d02644725@landley.net>
Date: Thu, 30 Mar 2023 08:12:54 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH] hw/mips/gt64xxx_pci: Don't endian-swap GT_PCI0_CFGADDR
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Nathan Chancellor <nathan@kernel.org>
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, qemu-devel@nongnu.org,
 balaton@eik.bme.hu, Bernhard Beschow <shentey@gmail.com>,
 Thomas Huth <thuth@redhat.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
References: <20230223161958.48696-1-jiaxun.yang@flygoat.com>
 <aa1e6559-55ae-0f7b-80cb-890bb34b9544@linaro.org>
 <20230320165821.GA4064187@dev-arch.thelio-3990X>
 <edea2619-8fe9-638e-cfa0-684123f7ee99@linaro.org>
 <037d00b7-9df9-e888-a4d7-235e6d08f784@landley.net>
 <89504c25-5265-d6c5-6e48-dcdc0be43ea0@linaro.org>
 <0ae35be3-794a-deee-1c96-507d5be2306c@landley.net>
 <cf1deca3-49ef-06a3-0f20-92c25968ae7d@linaro.org>
From: Rob Landley <rob@landley.net>
In-Reply-To: <cf1deca3-49ef-06a3-0f20-92c25968ae7d@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=2607:f8b0:4864:20::12c;
 envelope-from=rob@landley.net; helo=mail-il1-x12c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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

On 3/29/23 12:23, Philippe Mathieu-Daudé wrote:
> On 29/3/23 18:48, Rob Landley wrote:
>>>> Works fine for me. Somebody said it was the wrong fix but I don't remember why...
>>>
>>> This is a correct /partial/ fix. With this patch, Malta works on little
>>> endian hosts. No luck with big-endian hosts, but this was broken
>>> previous to 3db29dcac2 rework, so apparently not a big deal ¯\_(ツ)_/¯
>> 
>> No, big endian worked for me with that patch?
>> 
>> The build in my $PATH is QEMU emulator version 7.2.50
>> (v7.2.0-873-g65cc5ccf06-dirty) with that patch, and if you wget
>> https://landley.net/toybox/downloads/binaries/mkroot/0.8.9/mips.tgz and
>> ./run-emulator.sh in there, the virtual net can wget http://site (the sample
> 
> Oh, we are having some QEMU semantic confusion here...
> 
> You are testing a QEMU big-endian *guest* (or "target") in this example.
> 
> I presume you are testing on a little-endian *host* (x86_64, aarch64,
> ppc64el or mips64el).

Ah, yes.

I have not tried running qemu on a big endian host system in forever, but there
are some IBM people with great interest in supporting every possible thing on
s390x. Elizabeth Joseph would be one and would know a bunch more:

https://floss.social/@pleia2/110095815201601529

>> image hasn't got https:// support enabled because I didn't include the build
>> dependency), and the virtual disk works (if you do "./run-emulator.sh -hda
>> blah.img" anyway, the test wrapper I mentioned creates a squashfs image for it
>> to mount)). Without the patch I don't even get a PCI bus. Running "file
>> /bin/toybox" says MSB, and the mipsel image is the little endian one anyway. I
> 
> Here you describe the little-endian MIPS *target* image.

Which was broken without that patch, yes. So that's why the fix was "partial"...

>> also test s390x (which is big endian 64 bit), but I don't think this needed a
>> patch? (Hadn't been broken last I checked?)
> 
> Here you describe big-endian s390x *target* image.

I don't have s390x hardware to run it on. I do have an sh2eb board but it's
nommu and only has 128 megs of ram, so running qemu on it would be... unlikely.

> I expect if you run your test with QEMU v7.2.0-873-g65cc5ccf06-dirty
> on any big-endian *host* (like a s390x), the test fails.

I don't have powerpc mac hardware, which seems the easiest way to get such a
test system.

(Well, ok, the EASY way would be to feed qemu-system-s390x a couple gigs of ram
and then build and run qemu within qemu. While I do have a native toolchain for
s390x, qemu's grown an insane dependency stack these days that would be a pain
to bootstrap under a musl beyond-linux-from-scratch environment...)

Rob

