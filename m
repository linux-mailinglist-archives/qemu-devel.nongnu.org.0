Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4ED64332B8
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 11:42:12 +0200 (CEST)
Received: from localhost ([::1]:60700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcldL-0003o8-Su
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 05:42:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mclad-0002Fl-T1
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:39:23 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mclab-0002OQ-Nf
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 05:39:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634636360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yC1umgLY6KYV/daPZuMyknWRjHyUiUwVc03wLovhdqY=;
 b=VHbVyURboF0xISAge9L/nJXwXhxIBFt/M1cRvTCa1MWwk4qmvKpfwEMgsmZMV3q02RyUYv
 v1rJPRDCeJw5PLFh0wmGhvvh0LsmvY442QQyHTk5QoUiOXdWdXAMJvRSkvO+uOSFuAMhhm
 IbAoJC7ZrIFD12iqzULlmHGTyLS4X9I=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-594-VBqgMcAjNwCKhjrNbvaT0w-1; Tue, 19 Oct 2021 05:39:18 -0400
X-MC-Unique: VBqgMcAjNwCKhjrNbvaT0w-1
Received: by mail-wr1-f69.google.com with SMTP id
 d13-20020adf9b8d000000b00160a94c235aso9947607wrc.2
 for <qemu-devel@nongnu.org>; Tue, 19 Oct 2021 02:39:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yC1umgLY6KYV/daPZuMyknWRjHyUiUwVc03wLovhdqY=;
 b=p/7dPNsi5A1RFFproEfiuWrgz0yInw/YQPhmj/jFMXWqb7enjC7lE03sZNPg0ajgnW
 MLGaBCFfUAB7XPd12xBQIVC88SbyelSic/uIThgXf70DpG/NZNAt3tBkwprzVfqapF21
 1T1Mb1yK4IxPIluWDoOJS9jsDmJGf+t10t9fS6HqNSc09cIAxEEv5Yo5YzwyH+D6u1lP
 C/hBI8f0rf7048Rql2EZZar20NFeCzcsubs+XGxjE1lxv46pT1UxSSXLU7bq3qYabnWC
 0juh+peMx/Gm7y2LwTXDOT4AhiDKLiGNbwcJiJh31Rx2MDlInm8e5nRzXdqYv/nmGnzV
 /evA==
X-Gm-Message-State: AOAM530Mn8zhlD5y5nx53QdMrmHoIsOYQEZ8VXY3cYjCqR9bh4HTJmXv
 SZnlh06etFS2AbUvtf8WgyBmO2zghKgHSwRwwZ5U3E7Yfd6dPZEmafk5bJHbba0WIKzYP8yzihb
 PNAM3wP/rOC5gqfk=
X-Received: by 2002:a5d:5849:: with SMTP id i9mr43678257wrf.331.1634636357026; 
 Tue, 19 Oct 2021 02:39:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzn7t3BZxVY206dHhFWQRqss2TxSKlvDSUe1yLI5tWMY1UZf498f2GYjtnYSE9LUO0pmNqulg==
X-Received: by 2002:a5d:5849:: with SMTP id i9mr43678230wrf.331.1634636356815; 
 Tue, 19 Oct 2021 02:39:16 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id i188sm1787438wmi.5.2021.10.19.02.39.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Oct 2021 02:39:16 -0700 (PDT)
Subject: Re: Deprecate the ppc405 boards in QEMU?
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 David Gibson <david@gibson.dropbear.id.au>
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
From: Thomas Huth <thuth@redhat.com>
Message-ID: <8c382ce4-f706-376c-289a-b8c64393decb@redhat.com>
Date: Tue, 19 Oct 2021 11:39:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <be84c7bf-47d3-1ba8-20ca-084a487db29d@csgroup.eu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Christophe Leroy <christophe.leroy@c-s.fr>,
 Peter Maydell <peter.maydell@linaro.org>, dbarboza@redhat.com,
 Alexey Kardashevskiy <aik@ozlabs.ru>, QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Greg Kurz <groug@kaod.org>,
 Alexander Graf <agraf@csgraf.de>, qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/10/2021 11.31, Christophe Leroy wrote:
> 
> 
> Le 11/10/2021 à 15:24, Thomas Huth a écrit :
>> On 11/10/2021 11.20, David Gibson wrote:
>>> On Mon, Oct 11, 2021 at 10:10:36AM +0200, Thomas Huth wrote:
>>>> On 06/10/2021 09.25, Thomas Huth wrote:
>>>>> On 05/10/2021 23.53, BALATON Zoltan wrote:
>>>>> [...]
>>>>>> Maybe these 405 boards in QEMU ran with modified firmware where the
>>>>>> memory detection was patched out but it seems to detect the RAM so I
>>>>>> wonder where it gets that from. Maybe by reading the SDRAM
>>>>>> controller DCRs ppc4xx_sdram_init() sets up. Then I'm not sure what
>>>>>> it needs the SPD for, I forgot how this worked on sam460ex. Maybe
>>>>>> for the speed calibration, so could be it detects ram by reading
>>>>>> DCRs then tries to get SPD data and that's where it stops as i2c is
>>>>>> not emulated on taihu. This could be confirmed by checking what it
>>>>>> pokes with -d guest_errors that shows accesses to missing devices
>>>>>> but don't know where 405 has the i2c controller and if it's the same
>>>>>> as newer SoCs. If so that could be reused and an i2c bus could be
>>>>>> added with the SPD data like in sam460ex to make u-boot happy or you
>>>>>> could skip this in u-boot.
>>>>>
>>>>> FWIW, I've just tried the latter (skipping the sdram init in u-boot),
>>>>> and indeed, I can get to the u-boot prompt now.
>>>> [...]> I've also attached the patch with my modifications to u-boot.
>>>>
>>>> FYI, the changes can now be found on this branch here:
>>>>
>>>>   https://gitlab.com/huth/u-boot/-/commits/taihu
>>>>
>>>> I also added a gitlab-CI file, so you can now download the u-boot.bin as an
>>>> artifact from the corresponding pipeline, e.g.:
>>>>
>>>>   https://gitlab.com/huth/u-boot/-/jobs/1667201028
>>>
>>> Thanks.
>>>
>>> Are you going to send a v2 of your proposed deprecation patches?
>>
>> No, since there was interest in keeping the 405 boards for testing the 405 
>> code in the Linux kernel, and since there is now a way to do at least some 
>> very basic testing of these boards (with the u-boot firmware), I don't 
>> plan to respin the deprecation patch. I just sent a patch for adding the 
>> boards to our CI instead:
>>
>>   https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg02072.html
>>
> 
> I have downloaded your u-boot.bin and tried it with both QEMU 5.2.0 and 
> mainline, and I get:
> 
> ERROR:../accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: assertion 
> failed: (qemu_mutex_iothread_locked())
> Bail out! ERROR:../accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: 
> assertion failed: (qemu_mutex_iothread_locked())
> Abandon (core dumped)
> 
> I see in the mail history that you got that problem as well at some point. 
> How did you fix it ?

You need this patch here to fix this issue:

  https://lists.gnu.org/archive/html/qemu-devel/2021-10/msg01019.html
  ("hw/ppc: Fix iothread locking in the 405 code")

  Thomas


