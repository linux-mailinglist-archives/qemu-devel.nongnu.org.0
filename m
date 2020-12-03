Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4E32CD2D0
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 10:48:02 +0100 (CET)
Received: from localhost ([::1]:45242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kklDS-00049D-LQ
	for lists+qemu-devel@lfdr.de; Thu, 03 Dec 2020 04:48:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kklBE-0003MK-Bw
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:45:40 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:53078)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kklBC-0002jW-HY
 for qemu-devel@nongnu.org; Thu, 03 Dec 2020 04:45:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606988737;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HEECtQhh45Xhcxaf0CIfw2aRkJxgAp+4YDRXmIMfvM8=;
 b=YQwncXbjzjtgaC/a9bhEiTeQ4suP1HIcF3qYlFXKXIABWYPMRdpZ1/lv64g/7D4eQIS/hk
 Szdf4TsorVADBkatT6QoHScly7czO67vQEJNAY0MGTDXfg6adyx7aDZpjxw271Rn4nKaqA
 tDYVaixEjWSNJ3wp2vHxqud9/DzuFJE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-336-DzV9Sbr0PyGxWZZfFU9eKw-1; Thu, 03 Dec 2020 04:45:35 -0500
X-MC-Unique: DzV9Sbr0PyGxWZZfFU9eKw-1
Received: by mail-wr1-f72.google.com with SMTP id m2so1052849wro.1
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 01:45:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HEECtQhh45Xhcxaf0CIfw2aRkJxgAp+4YDRXmIMfvM8=;
 b=QC9OSN3RMTwlVXxkye5xJgBH1XUgRdXXUZRAOowQL89TZDRUEXLmf5SLuxDT+8w4iS
 1CcDRfbnj/iMfdMKMb4Tg9Y3080EH4TzxtoS1YlVA6+16M7CRMs+jACcL493HKA6E611
 nwi7v6JXq3DMdz40BOqx8GdINe63J9SfAPKeo2nSR9ndgaZaCk8xPCrYPKOWuPhBjQZK
 yszCtifz0jrFEJQq6gc4858cK7TiOcbYEwDmU7h9jMAXUss90wxNCG7TMIVgJqbvX3aK
 EnxAY8tmVIkbR8YJmeNwtY0MX6HKYqJjuj5ueY7rpwfcjAfz7D/LhZEnKt2jMWdx01SA
 Wb+Q==
X-Gm-Message-State: AOAM532VXGp6RKT0DE4Jypyp+4ux+LnHTYTKoGKJVfMqu9OfbbV8APLN
 wBBiVbJk2HUkNVdl+3wrau9VEB7x/2nat187hXctjKO9s+8okl2nnFwZvUS0nfBDAfCiuFWmCU7
 GhNI6CI7xb/7kbww=
X-Received: by 2002:a5d:4641:: with SMTP id j1mr2726653wrs.94.1606988734368;
 Thu, 03 Dec 2020 01:45:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz2mNOgsWEluiOhFJmha2+tV8jJvKnmZYWO4eGCP50CUMmwbycSWmpAhiAim7wVtGx52e9gLQ==
X-Received: by 2002:a5d:4641:: with SMTP id j1mr2726620wrs.94.1606988734050;
 Thu, 03 Dec 2020 01:45:34 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id m9sm1014096wrx.59.2020.12.03.01.45.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Dec 2020 01:45:33 -0800 (PST)
Subject: Re: [PATCH] fuzz: Add more i386 configurations for fuzzing
To: Alexander Bulekov <alxndr@bu.edu>, qemu-devel@nongnu.org,
 Emanuele Giuseppe Esposito <e.emanuelegiuseppe@gmail.com>,
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>
References: <20201123184352.242907-1-alxndr@bu.edu>
 <20201202164002.sot3byy2jesllmlb@mozz.bu.edu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <7fbd9ca0-f740-a988-e2a7-54c427fbad3b@redhat.com>
Date: Thu, 3 Dec 2020 10:45:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201202164002.sot3byy2jesllmlb@mozz.bu.edu>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Hannes Reinecke <hare@suse.com>,
 Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>, Bandan Das <bsd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/2/20 5:40 PM, Alexander Bulekov wrote:
> On 201123 1343, Alexander Bulekov wrote:
>> This adds configurations for fuzzing the following devices on oss-fuzz:
>>
...
>> I have little context for how useful these configurations are for
>> fuzzing. I appreciate if you can Ack/Nack them or provide feedback if
>> the devices should be configured differently.  Of course, if you think
>> we should be fuzzing some additional device configurations, you can also
>> submit a patch adding the necessary lines to this generic_fuzz_configs.h
>> file. 
>> Thanks
>> -Alex
>>
> 
> Ping. We could just add all of these configurations and, later, remove
> any that produce too many useless reports.

Not a Nack, but I'd rather enhance qtest coverage by adding
these configs via <libqos/qgraph.h>, and then consume this
with tests/qtest/fuzz/qos_fuzz.c.

>>  tests/qtest/fuzz/generic_fuzz_configs.h | 80 +++++++++++++++++++++++++
>>  1 file changed, 80 insertions(+)
>>
>> diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
>> index c4d925f9e6..0b1fe0f836 100644
>> --- a/tests/qtest/fuzz/generic_fuzz_configs.h
>> +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
>> @@ -115,6 +115,86 @@ const generic_fuzz_config predefined_configs[] = {
>>          .name = "pc-q35",
>>          .args = "-machine q35",
>>          .objects = "*",
>> +    },{
>> +        .name = "vmxnet3",
>> +        .args = "-machine q35 -nodefaults "
>> +        "-device vmxnet3,netdev=net0 -netdev user,id=net0",
>> +        .objects = "vmxnet3"
>> +    },{
>> +        .name = "ne2k_pci",
>> +        .args = "-machine q35 -nodefaults "
>> +        "-device ne2k_pci,netdev=net0 -netdev user,id=net0",
>> +        .objects = "ne2k*"
>> +    },{
>> +        .name = "pcnet",
>> +        .args = "-machine q35 -nodefaults "
>> +        "-device pcnet,netdev=net0 -netdev user,id=net0",
>> +        .objects = "pcnet"
>> +    },{
>> +        .name = "rtl8139",
>> +        .args = "-machine q35 -nodefaults "
>> +        "-device rtl8139,netdev=net0 -netdev user,id=net0",
>> +        .objects = "rtl8139"
>> +    },{
>> +        .name = "i82550",
>> +        .args = "-machine q35 -nodefaults "
>> +        "-device i82550,netdev=net0 -netdev user,id=net0",
>> +        .objects = "eepro*"
>> +    },{
>> +        .name = "sdhci-v3",
>> +        .args = "-nodefaults -device sdhci-pci,sd-spec-version=3 "
>> +        "-device sd-card,drive=mydrive "
>> +        "-drive if=sd,index=0,file=null-co://,format=raw,id=mydrive -nographic",
>> +        .objects = "sd*"
>> +    },{
>> +        .name = "ehci",
>> +        .args = "-machine q35 -nodefaults "
>> +        "-device ich9-usb-ehci1,bus=pcie.0,addr=1d.7,"
>> +        "multifunction=on,id=ich9-ehci-1 "
>> +        "-device ich9-usb-uhci1,bus=pcie.0,addr=1d.0,"
>> +        "multifunction=on,masterbus=ich9-ehci-1.0,firstport=0 "
>> +        "-device ich9-usb-uhci2,bus=pcie.0,addr=1d.1,"
>> +        "multifunction=on,masterbus=ich9-ehci-1.0,firstport=2 "
>> +        "-device ich9-usb-uhci3,bus=pcie.0,addr=1d.2,"
>> +        "multifunction=on,masterbus=ich9-ehci-1.0,firstport=4 "
>> +        "-drive if=none,id=usbcdrom,media=cdrom "
>> +        "-device usb-tablet,bus=ich9-ehci-1.0,port=1,usb_version=1 "
>> +        "-device usb-storage,bus=ich9-ehci-1.0,port=2,drive=usbcdrom",
>> +        .objects = "*usb* *hci*",
>> +    },{
>> +        .name = "ohci",
>> +        .args = "-machine q35 -nodefaults  -device pci-ohci -device usb-kbd",
>> +        .objects = "*usb* *ohci*",
>> +    },{
>> +        .name = "megaraid",
>> +        .args = "-machine q35 -nodefaults -device megasas -device scsi-cd,drive=null0 "
>> +        "-blockdev driver=null-co,read-zeroes=on,node-name=null0",
>> +        .objects = "megasas*",
>> +    },{
>> +        .name = "ac97",
>> +        .args = "-machine q35 -nodefaults "
>> +        "-device ac97,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
>> +        .objects = "ac97*",
>> +    },{
>> +        .name = "cs4231a",
>> +        .args = "-machine q35 -nodefaults "
>> +        "-device cs4231a,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
>> +        .objects = "cs4231a* i8257*",
>> +    },{
>> +        .name = "es1370",
>> +        .args = "-machine q35 -nodefaults "
>> +        "-device es1370,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
>> +        .objects = "es1370*",
>> +    },{
>> +        .name = "sb16",
>> +        .args = "-machine q35 -nodefaults "
>> +        "-device sb16,audiodev=snd0 -audiodev none,id=snd0 -nodefaults",
>> +        .objects = "sb16* i8257*",
>> +    },{
>> +        .name = "parallel",
>> +        .args = "-machine q35 -nodefaults "
>> +        "-parallel file:/dev/null",
>> +        .objects = "parallel*",
>>      }
>>  };
>>  
>> -- 
>> 2.28.0
>>
> 


