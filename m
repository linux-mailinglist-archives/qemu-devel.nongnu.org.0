Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B61158DA37
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 16:22:11 +0200 (CEST)
Received: from localhost ([::1]:33168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLQ7W-0005jy-Kv
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 10:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oLQ4r-0003RF-FV
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 10:19:25 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:35672)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1oLQ4p-0000Qh-Bh
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 10:19:25 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w3so15349230edc.2
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 07:19:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y9uYdy3bduQCBpWjUDHu3oclImwIBNlrcqMqxoKLwew=;
 b=NIQVm14K8whJvA2TZC7Oygw+v/YO50x8920N2kKVCHE2spSwO18eC/lpvyrHP8ullh
 74bnUoUjsZl9mlGhGqy6afN8Hyh2FSX7oiOrDlfKPvNMDpDTtJtzMLovTqkmqch5DjHa
 Sz6hhLj0HadTYWT1TQrRy1sZJGWEBZUSbKQ8h2kznczZAH1ypjhXXq26fve0cdLnq9J5
 T+sQNo5Wxu2kR+pscG4UL87s7ZQaZA9iSzELAXfysiZruTQT/QVW7xuwlVpd+90lLKEs
 kSz/N3dhvmmJBrnYBMxuSWuQyKM2zyKEQOLPHekP5lGT/APVt3T2gV0jN9t5qj9XqR/p
 FfjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Y9uYdy3bduQCBpWjUDHu3oclImwIBNlrcqMqxoKLwew=;
 b=lOrqnJ+SA3l6aRLgw1GX7wu5w4JgBroFVwD+wY16ap0ZLftqnwoZJ/SdAvKxoQ5Q5q
 hsXj8bShFCDaSmD6kQqtgBVKKLn8bD40AC0BQhtUC4SYzKXaqaCqfTzK7l+zl6flZv4A
 VXM8fVaUUqtPN4B2AexAqRoxW5Vakp+xXUuqRLcRw+6xndhFKmKoLqEAsjoO7LHyqA/7
 hQdMRiLVaN/Te/j3u8yVyoiZn3F7tASQUVJviRCy4zedip9c1OU7PrfHMaXDDYL0hXOA
 N1FYPKWYubQfge+G7QViL5hlN0vinMnhbdFKmJ50ehd9a1orpJ8X+5TkmIBjCCNaj9PZ
 lEeg==
X-Gm-Message-State: ACgBeo3nxpzbRmqZ/x2q++Btek3rrsNb0rV0AI9uoq8jQ/fvzDPvFPeK
 xztZ8hAzGsxZ2ocPzztABKI=
X-Google-Smtp-Source: AA6agR78WAg3Kv3B4gkjY86IkmeGenrNftIHZx2lR0ACTrQ15Ln1bUoz1BEB1tXOyqqqUb2H7XGKtA==
X-Received: by 2002:a05:6402:369a:b0:43d:75c5:f16c with SMTP id
 ej26-20020a056402369a00b0043d75c5f16cmr21792123edb.57.1660054759945; 
 Tue, 09 Aug 2022 07:19:19 -0700 (PDT)
Received: from ?IPV6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.googlemail.com with ESMTPSA id
 p8-20020a17090653c800b007305b8aa36bsm1174995ejo.157.2022.08.09.07.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Aug 2022 07:19:19 -0700 (PDT)
Message-ID: <50215d9d-0a72-dea1-30dd-6abec36b0c14@redhat.com>
Date: Tue, 9 Aug 2022 16:19:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3] hw/i386: place setup_data at fixed place in memory
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Ard Biesheuvel <ardb@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>, 
 qemu-devel@nongnu.org, Xiaoyao Li <xiaoyao.li@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 linux-efi@vger.kernel.org
References: <YuxOgtykRQb1HU3e@zx2c4.com>
 <20220804230411.17720-1-Jason@zx2c4.com>
 <40fdfb11-1e40-a36a-d3a4-fcbef546a78a@redhat.com>
 <CAMj1kXFDs8HCCCcVAVwjLcATh6MYcUSAha5yvi0ftMw+Ddy_Xg@mail.gmail.com>
 <0bd57fab-836b-9898-9e3f-84dc66eca175@redhat.com>
 <20220809051644-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220809051644-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
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

On 8/9/22 11:17, Michael S. Tsirkin wrote:
>> 1) if we believe "build setup_data in QEMU" is a feasible design that only
>> needs more yak shaving, we can keep the code in, but disabled by default,
>> and sort it out in 7.2.
>>
>> 2) if we go for an alternative design, it needs to be reverted.  For example
>> the randomness could be in _another_ fw_cfg file, and the linuxboot DMA can
>> patch it in the setup_data.
>>
>> With (2) the OVMF breakage would be limited to -dtb, which more or less
>> nobody cares about, and we can just look the other way.
> 
> So IIUC you retract your pc: add property for Linux setup_data random
> number seed then? It's neither of the two options above.

That one would be a base for (1).

Another choice (3) is to put a pointer to the first setup_data in a new 
fw_cfg entry, and let the option ROMs place it in the header.

In any case, as Laszlo said this [PATCH v3] does not work because 
0xf0000 is mapped as ROM (and if it worked, it would have the same 
problem as the first 640K).

Paolo

