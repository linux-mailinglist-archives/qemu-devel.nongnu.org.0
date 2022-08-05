Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09AE958AEF6
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Aug 2022 19:34:11 +0200 (CEST)
Received: from localhost ([::1]:33160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oK1D8-00082E-46
	for lists+qemu-devel@lfdr.de; Fri, 05 Aug 2022 13:34:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oK18g-0004rY-PZ
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:29:34 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:46967)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oK18f-00040z-8I
 for qemu-devel@nongnu.org; Fri, 05 Aug 2022 13:29:34 -0400
Received: by mail-ej1-x632.google.com with SMTP id y13so6108545ejp.13
 for <qemu-devel@nongnu.org>; Fri, 05 Aug 2022 10:29:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UNS86hfrKr5PjDXv5fVr7SKBuuY/cCQChY55vbePDlw=;
 b=LlRkQfojbDHMer07Mi7PSDRP6J7y5x4g8Z2hvK6+XwxUgILIDjjGg5HsQxfIQBaRQC
 hokrGVF7O5r9WJbP/yFQhZG5AIIDCZIH4T0lRtYM2vQ1Cw2TL2W72pbANRt2+28d6vAs
 lVQoLqce/Su4MxPWI5flpM8rUItn/mOBhNArYvPc4CW3Lb/FQRHw9ZmPcwuFvDF06UTQ
 c4I93n5tvcJCbbjH7o9s9TnED+gaP9pEAQQ2QT8TdPOM6cETQSiZCfTxq4ReIsj5Eero
 xFVtz9S2M/O9M/NbQh91Jf9/mytnNhJK6YgSI1SEh/GltDC9Hvfho1o9Y2r6o1KWEBIj
 ZvzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UNS86hfrKr5PjDXv5fVr7SKBuuY/cCQChY55vbePDlw=;
 b=l+EwRXShoTV6AFUOK3wEnFLnVqyVg5vKReMRDEO5F6Z6Je2MrLT+iCrl4w76pI7Wah
 sUoymhIScAsSLxid/qfXeaHeABMKPRH9r3GHOkuWOUbF/WH6M5Hy/BZOjB9/3Slh/MIh
 w18vkKS7NJLSBZf+TcG9jKy/wsPkplHVTO9CW8E1lwPM+7c+HcTID7bGJ2YZwbE5GGte
 BtAhj/NmEzaNgaCJomEO7TPVVTIKcz/Nm7JTG3Xi2XV4KKPFPT4mjpwRsiHjePUDrzaF
 olpIrJKRprr4V4+HR6+O3OWCauFe8PD2jp/P4OR46QkcmoY7tN4N0Qc+HrukqPTt7dzG
 x93A==
X-Gm-Message-State: ACgBeo07rNmF8ThjF/gyBuB0HQsL5vC+YzUoeZBGJ69BIBZGypdXPS7g
 Mu6HDelwJZTaam+M15w2mO0=
X-Google-Smtp-Source: AA6agR4JpoSoFCvOy4jpeEJWseIzUrYJ0H1qm4Zu3ZHXaXFCOpLpqXK2dd9ON3YfE3OSw7NBoQTKwQ==
X-Received: by 2002:a17:906:974c:b0:731:14e2:af11 with SMTP id
 o12-20020a170906974c00b0073114e2af11mr787658ejy.220.1659720571348; 
 Fri, 05 Aug 2022 10:29:31 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:9af8:e5f5:7516:fa89?
 ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.googlemail.com with ESMTPSA id
 b18-20020a170906d11200b00730a18a8b68sm1794108ejz.130.2022.08.05.10.29.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Aug 2022 10:29:30 -0700 (PDT)
Message-ID: <0bd57fab-836b-9898-9e3f-84dc66eca175@redhat.com>
Date: Fri, 5 Aug 2022 19:29:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] hw/i386: place setup_data at fixed place in memory
Content-Language: en-US
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, qemu-devel@nongnu.org,
 Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 linux-efi@vger.kernel.org
References: <YuxOgtykRQb1HU3e@zx2c4.com>
 <20220804230411.17720-1-Jason@zx2c4.com>
 <40fdfb11-1e40-a36a-d3a4-fcbef546a78a@redhat.com>
 <CAMj1kXFDs8HCCCcVAVwjLcATh6MYcUSAha5yvi0ftMw+Ddy_Xg@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <CAMj1kXFDs8HCCCcVAVwjLcATh6MYcUSAha5yvi0ftMw+Ddy_Xg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x632.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On 8/5/22 13:08, Ard Biesheuvel wrote:
>>
>> Does it work to place setup_data at the end of the cmdline file instead
>> of having it at the end of the kernel file?  This way the first item
>> will be at 0x20000 + cmdline_size.
>>
> Does QEMU always allocate the command line statically like that?
> AFAIK, OVMF never accesses that memory to read the command line, it
> uses fw_cfg to copy it into a buffer it allocates itself. And I guess
> that implies that this region could be clobbered by OVMF unless it is
> told to preserve it.

No it's not. :(  It also goes to gBS->AllocatePages in the end.

At this point it seems to me that without extra changes the whole 
setup_data concept is dead on arrival for OVMF.  In principle there's no 
reason why the individual setup_data items couldn't include interior 
pointers, meaning that the setup_data _has_ to be at the address 
provided in fw_cfg by QEMU.

One way to "fix" it would be for OVMF to overwrite the pointer to the 
head of the list, so that the kernel ignores the setup data provided by 
QEMU. Another way would be to put it in the command line fw_cfg blob and 
teach OVMF to use a fixed address for the command line.  Both are ugly, 
and both are also broken for new QEMU / old OVMF.

In any case, I don't think this should be fixed so close to the release. 
  We have two possibilities:

1) if we believe "build setup_data in QEMU" is a feasible design that 
only needs more yak shaving, we can keep the code in, but disabled by 
default, and sort it out in 7.2.

2) if we go for an alternative design, it needs to be reverted.  For 
example the randomness could be in _another_ fw_cfg file, and the 
linuxboot DMA can patch it in the setup_data.


With (2) the OVMF breakage would be limited to -dtb, which more or less 
nobody cares about, and we can just look the other way.

Paolo

