Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7654D42215A
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 10:54:45 +0200 (CEST)
Received: from localhost ([::1]:36248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXgDk-0007Kk-FL
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 04:54:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mXgBD-0005b0-BW
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:52:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mXgB8-0005m6-Q4
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 04:52:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633423922;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5w6yWdraMS4mhffKvq2tSiwILJJz5NtgkKwwqdR2oCk=;
 b=FIpqMY+4k1tBDB5TCfo+vLed5suBfkV2Sts5nA+bINfYfk452BA57ZdNnXAITpwxHJh17c
 GKyTSJpY+zhk54HnQEij6OCRlxKGjIs+8nf0fD9Talte6dBGzutpXmbMn3ZAnNh1qA879S
 Dyp7J8a7d04h9HqhSq7UV1qHywzhyDM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-342-c3QaaLlHNBaiPdQR_36C8w-1; Tue, 05 Oct 2021 04:52:01 -0400
X-MC-Unique: c3QaaLlHNBaiPdQR_36C8w-1
Received: by mail-wm1-f71.google.com with SMTP id
 m9-20020a05600c4f4900b003057c761567so1018524wmq.1
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 01:52:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:references:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5w6yWdraMS4mhffKvq2tSiwILJJz5NtgkKwwqdR2oCk=;
 b=bPcUaiozZUMuTm/QrXsuL7zBsyX4UJJ9GVq/9f7lnme0gtV9wiYrdbx1iSNcmqXgZd
 YDJxaIQQ41/3hOq4ydbFIb9lq3vADhofw83z+6etvbExduRlD4hxHKqUppyGVkn3Ae/5
 9UxECZOlTpZ5YQrfoMP0jSkuI4AU08yoyAEgxowolJ2zb/ralTMIpdM/nCny9LtTPpKG
 jXJYmCTWa35/+LKPVgkxpyP+5kg0u/5ki6+wEo5UVXJFyW6LOZfutsHZoVHFyUX3reWL
 h5Z6UDzrE5xBhVd4ywO8GV1XbPEIPBkFj8FeEeP8Zh+Lfff9tjFpx+RCiMJHGz3/jo0N
 YC6w==
X-Gm-Message-State: AOAM5300zfGtSk3njmbKNDTz9/VXu4i9ZmqUXFExrSYFuoRqGkupiPPH
 93fD5LkRQoQKmfIhoHfYKr3ZJwPlUrAE9Gdlvyegvrk1Vhg4iSXLentJm0AKQe4taTgPpqZXEU5
 o0ASDSO4k73DxYd4=
X-Received: by 2002:adf:cf10:: with SMTP id o16mr19597384wrj.12.1633423919904; 
 Tue, 05 Oct 2021 01:51:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1uQOVJ85GVwrFZqI6euCEJDjI2yspMO7OYnUeUfFX5UfIAUnGyKljsYSbiOF5n0Wke6P9KA==
X-Received: by 2002:adf:cf10:: with SMTP id o16mr19597355wrj.12.1633423919691; 
 Tue, 05 Oct 2021 01:51:59 -0700 (PDT)
Received: from thuth.remote.csb (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id l124sm1150890wml.8.2021.10.05.01.51.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Oct 2021 01:51:59 -0700 (PDT)
From: Thomas Huth <thuth@redhat.com>
To: Alexey Kardashevskiy <aik@ozlabs.ru>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 David Gibson <david@gibson.dropbear.id.au>
References: <20210927044808.73391-1-david@gibson.dropbear.id.au>
 <20210927044808.73391-5-david@gibson.dropbear.id.au>
 <18fa56ee-956e-ee2f-9270-82aa96dfde09@redhat.com>
 <df767942-be5f-c920-2924-a5221e9db2b3@csgroup.eu>
 <40cdb137-60c9-43fd-7b48-4858cbd9307c@redhat.com>
 <CAFEAcA82L5JiHXUmc0vt7EgiiyrYHyJ+qQ7pFHp+CsvJCPyKqA@mail.gmail.com>
 <6c2ff4e6-4bf4-d310-5e26-c8d2741177bc@redhat.com>
 <42e5a8c2-b8fa-b9e2-71f1-c8e5cd7f5cef@csgroup.eu>
 <1397f18f-f187-6f48-ed6c-13c0b77abed9@redhat.com> <YVug7l8LWl3e+DN5@yekko>
 <9aeb7010-0a17-864a-cfac-ea5d90356085@csgroup.eu>
 <f0871969-190a-d15e-50d8-e6c1b1043652@ozlabs.ru>
 <0beb4744-5421-2cec-1fe4-6a8b7353d932@redhat.com>
 <cdbfbb3c-2e79-7853-afe0-fe8a65683db1@ozlabs.ru>
 <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
Subject: Re: Deprecate the ppc405 boards in QEMU?
Message-ID: <881242de-fec8-3296-ffb4-36d2a551d21f@redhat.com>
Date: Tue, 5 Oct 2021 10:51:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <3b1570d3-56f5-1184-239a-72791fc8ef83@redhat.com>
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
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
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
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, Greg Kurz <groug@kaod.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@csgraf.de>,
 qemu-ppc <qemu-ppc@nongnu.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/10/2021 10.07, Thomas Huth wrote:
> On 05/10/2021 10.05, Alexey Kardashevskiy wrote:
[...]
>> What is so special about taihu?
> 
> taihu is the other 405 board defined in hw/ppc/ppc405_boards.c (which I 
> suggested to deprecate now)

I've now also played with the u-boot sources a little bit, and with some bit 
of tweaking, it's indeed possible to compile the old taihu board there. 
However, it does not really work with QEMU anymore, it immediately triggers 
an assert():

$ qemu-system-ppc -M taihu -bios u-boot.bin -serial null -serial mon:stdio
**
ERROR:accel/tcg/tcg-accel-ops.c:79:tcg_handle_interrupt: assertion failed: 
(qemu_mutex_iothread_locked())
Aborted (core dumped)

Going back to QEMU v2.3.0, I can see at least a little bit of output, but it 
then also triggers an assert() during DRAM initialization:

$ qemu-system-ppc -M taihu -bios u-boot.bin -serial null -serial mon:stdio

Reset PowerPC core

U-Boot 2014.10-rc2-00123-g461be2f96e-dirty (Oct 05 2021 - 10:02:56)

CPU:   AMCC PowerPC 405EP Rev. B at 770 MHz (PLB=256 OPB=128 EBC=128)
        I2C boot EEPROM disabled
        Internal PCI arbiter enabled
        16 KiB I-Cache 16 KiB D-Cache
Board: Taihu - AMCC PPC405EP Evaluation Board
I2C:   ready
DRAM:  qemu-system-ppc: memory.c:1693: memory_region_del_subregion: 
Assertion `subregion->container == mr' failed.
Aborted (core dumped)

Not sure if this ever worked in QEMU, maybe in the early 0.15 time, but that 
version of QEMU also does not compile easily anymore on modern systems. So 
I'm afraid, getting this into a workable shape again will take a lot of 
time. At least I'll stop my efforts here now.

  Thomas


