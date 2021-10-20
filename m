Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C5264349DE
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 13:13:00 +0200 (CEST)
Received: from localhost ([::1]:35800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1md9Wl-00031Z-I8
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 07:12:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48814)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1md8j6-0006JZ-Gx
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59838)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1md8j4-0004Yr-O5
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 06:21:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634725297;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0INw4569ZAeS+8ZketPmsMjEJrarPHE1e3gy36H82SE=;
 b=OxTI+MSANHkfusWptl7QYctxdxSndeVk98am1kT+91CHhoJftb5bc0dXcp/MzUtiUXTJQf
 xnlZg00oXH72H5rlU1V4klvktpVzu19avgPLESJVW7J/HASE+sLpdWMs5eXAZ98c4w4uW3
 /DcvxR+A2uwxRbzGkKjyA98Vsfx51tk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-rupUohxHNiu2EpDhNaOFcw-1; Wed, 20 Oct 2021 06:21:33 -0400
X-MC-Unique: rupUohxHNiu2EpDhNaOFcw-1
Received: by mail-wm1-f71.google.com with SMTP id
 b131-20020a1c1b89000000b0030d95485d90so82119wmb.2
 for <qemu-devel@nongnu.org>; Wed, 20 Oct 2021 03:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=0INw4569ZAeS+8ZketPmsMjEJrarPHE1e3gy36H82SE=;
 b=xSneUnA9Spekwz/vXAFUY20mSRCW7oJ6u54YlGT8v5IBydZaT58jlhe1EK9K47fGqX
 TxEeAJdYjV3bojBBfvqeoPxxeXflm3SGBD+Cly61AG14zD9Fv7RKbXj2WhHlUYR000cO
 9OMN/82f/lZMScmGwsv8aNadxoqkrjh6rn+k68bl0ORhOAepJVT3oTfVE6zrpdGET3+W
 aucyVIp1zlzQTGMcGY+b4EPBwD1C76C/bID+5c9Row4QmuYoeWucFD1gdpzfKnz9VlPS
 5LnKEPVib621yu5GpZDSbXFwWEYVJGzB7wfKk+7/lW4Vyq80U/UMbgzD4RSyiLkl/u0Q
 +igg==
X-Gm-Message-State: AOAM532FTfRc/FSfTrgdMZXkN8PzAmY7smNXDQ0FhBFEMplsNfnhIefW
 oj5wcrr9Risufp9eerbv+8MWTeRdeAxv61Tw/uiTC1bft9/aFj90Ll0WvuLWihBNl/gtJqngAPG
 86dft6W8cd+KD2Xc=
X-Received: by 2002:adf:97cc:: with SMTP id t12mr50340962wrb.189.1634725291188; 
 Wed, 20 Oct 2021 03:21:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw1rb7mPPaLWDUF91/SOF9RQBt1e+uSMBZo5fTgPZaKwIbrDmGIKahKk0vytOpVzGuS7r9n8A==
X-Received: by 2002:adf:97cc:: with SMTP id t12mr50340917wrb.189.1634725290897; 
 Wed, 20 Oct 2021 03:21:30 -0700 (PDT)
Received: from [192.168.1.36] (33.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.33])
 by smtp.gmail.com with ESMTPSA id r27sm1517824wrr.70.2021.10.20.03.21.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Oct 2021 03:21:30 -0700 (PDT)
Message-ID: <75686a5d-63da-fda7-8dab-7e0f190b6282@redhat.com>
Date: Wed, 20 Oct 2021 12:21:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: Deprecate the ppc405 boards in QEMU?
To: Thomas Huth <thuth@redhat.com>, BALATON Zoltan <balaton@eik.bme.hu>,
 Christophe Leroy <christophe.leroy@csgroup.eu>
References: <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
 <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
 <e551634d-c6e7-c57-5b7f-b9ad8621824@eik.bme.hu>
 <119bc1c7-22e0-c455-9f34-57a7424f0c52@redhat.com>
 <a60b6ad-801c-6783-a81d-1d2b8ed97e34@eik.bme.hu>
 <7526ae07-0054-69df-c71f-8751858ef0db@redhat.com>
 <ad151b9d-27a7-bb5d-2cad-1196ceecfdd6@redhat.com> <YWQB1FMhQfmqRYxN@yekko>
 <bcdf63a4-8d22-8b25-d980-7fc574f80e82@redhat.com>
 <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
 <8c382ce4-f706-376c-289a-b8c64393decb@redhat.com>
 <880f4bde-19fc-1267-3a04-3d9efd660897@csgroup.eu>
 <c09d92d9-a5a3-328f-824c-07653f8e649@eik.bme.hu>
 <be7a734a-b88b-3130-fee8-398387fb65b4@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <be7a734a-b88b-3130-fee8-398387fb65b4@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.074, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/21 13:11, Thomas Huth wrote:
> On 19/10/2021 12.07, BALATON Zoltan wrote:
>> On Tue, 19 Oct 2021, Christophe Leroy wrote:
>>> Le 19/10/2021 à 11:39, Thomas Huth a écrit :
>>>> On 19/10/2021 11.31, Christophe Leroy wrote:
>>>>> Le 11/10/2021 à 15:24, Thomas Huth a écrit :
>>>>>> On 11/10/2021 11.20, David Gibson wrote:
>>>>>>> On Mon, Oct 11, 2021 at 10:10:36AM +0200, Thomas Huth wrote:
>>>>>>>> On 06/10/2021 09.25, Thomas Huth wrote:
>>>>>>>>> On 05/10/2021 23.53, BALATON Zoltan wrote:
>>>>>>>>> [...]
>>>>>>>>>> Maybe these 405 boards in QEMU ran with modified firmware
>>>>>>>>>> where the
>>>>>>>>>> memory detection was patched out but it seems to detect the
>>>>>>>>>> RAM so I
>>>>>>>>>> wonder where it gets that from. Maybe by reading the SDRAM
>>>>>>>>>> controller DCRs ppc4xx_sdram_init() sets up. Then I'm not sure
>>>>>>>>>> what
>>>>>>>>>> it needs the SPD for, I forgot how this worked on sam460ex. Maybe
>>>>>>>>>> for the speed calibration, so could be it detects ram by reading
>>>>>>>>>> DCRs then tries to get SPD data and that's where it stops as
>>>>>>>>>> i2c is
>>>>>>>>>> not emulated on taihu. This could be confirmed by checking
>>>>>>>>>> what it
>>>>>>>>>> pokes with -d guest_errors that shows accesses to missing devices
>>>>>>>>>> but don't know where 405 has the i2c controller and if it's
>>>>>>>>>> the same
>>>>>>>>>> as newer SoCs. If so that could be reused and an i2c bus could be
>>>>>>>>>> added with the SPD data like in sam460ex to make u-boot happy
>>>>>>>>>> or you
>>>>>>>>>> could skip this in u-boot.
>>>>>>>>>
>>>>>>>>> FWIW, I've just tried the latter (skipping the sdram init in
>>>>>>>>> u-boot),
>>>>>>>>> and indeed, I can get to the u-boot prompt now.
>>>>>>>> [...]> I've also attached the patch with my modifications to
>>>>>>>> u-boot.
>>>>>>>>
>>>>>>>> FYI, the changes can now be found on this branch here:
>>>>>>>>
>>>>>>>>   https://gitlab.com/huth/u-boot/-/commits/taihu
>>>>>>>>
>>>>>>>> I also added a gitlab-CI file, so you can now download the
>>>>>>>> u-boot.bin as an
>>>>>>>> artifact from the corresponding pipeline, e.g.:
>>>>>>>>
>>>>>>>>   https://gitlab.com/huth/u-boot/-/jobs/1667201028
>>>>>>>
>>>>>>> Thanks.
>>>>>>>
>>>>>>> Are you going to send a v2 of your proposed deprecation patches?
>>>>>>
>>>>>> No, since there was interest in keeping the 405 boards for testing
>>>>>> the 405 code in the Linux kernel, and since there is now a way to
>>>>>> do at least some very basic testing of these boards (with the
>>>>>> u-boot firmware), I don't plan to respin the deprecation patch. I
>>>>>> just sent a patch for adding the boards to our CI instead:
>>>>>>
>>>>>>   https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg02072.html
>>>>>>
>>>>>
>>>>> I have downloaded your u-boot.bin and tried it with both QEMU 5.2.0
>>>>> and mainline, and I get:
>>>>>
>>>>> ERROR:../accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt:
>>>>> assertion failed: (qemu_mutex_iothread_locked())
>>>>> Bail out!
>>>>> ERROR:../accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt:
>>>>> assertion failed: (qemu_mutex_iothread_locked())
>>>>> Abandon (core dumped)
>>>>>
>>>>> I see in the mail history that you got that problem as well at some
>>>>> point. How did you fix it ?
>>>>
>>>> You need this patch here to fix this issue:
>>>>
>>>>   https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg01019.html
>>>>   ("hw/ppc: Fix iothread locking in the 405 code")
>>>>
>>>
>>> Thank you.
>>>
>>> Is there anything special to do then in order to boot a Linux kernel ?
>>>
>>> I build the uImage for ppc40x_defconfig
>>>
>>> I use the following command, but it does nothing, it stays in uboot
>>> prompt as when I don't get a kernel argument
>>>
>>>     ~/qemu/build/qemu-system-ppc -M taihu -bios
>>> ~/Téléchargements/u-boot.bin -serial null -serial mon:stdio -kernel
>>> arch/powerpc/boot/uImage
>>
>> I'm not sure using -bios and -kernel together makes sense, it probably
>> starts u-boot in this case and you have to load and start the kernel
>> from u-boot as you'd notmally do on a real machine. Alternatively you
>> could use -kernel instead of -bios which then loads a kernel and
>> starts it directly but not sure if it needs a firmware to work.
>>
>> Ot I could be completely wrong as I don't know this machine and
>> haven't tried it.
> 
> Actually, these 405 machines are quite weird. They refuse to boot
> without bios image, so you currently need the firmware image for sure.

When using -kernel/-append, if a BIOS is required by the kernel,
then it should be crafted by the machine IMO. Usually OS only
access a configuration area in PROM. The PROM must be mapped,
and the minimum configuration structure filled.

Anyhow I find -bios confusing, I never know if this option parse
or expects a full/partial raw flash image, an ELF image, something
else...


