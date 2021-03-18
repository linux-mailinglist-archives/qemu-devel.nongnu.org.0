Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5378340B9C
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 18:22:05 +0100 (CET)
Received: from localhost ([::1]:54560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMwLR-0002HX-BA
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 13:22:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMvqy-0002O0-MR
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:50:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lMvqs-0008M7-Qz
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 12:50:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616086224;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DnQQidJJ9qB9pbFIHHnpf0zjfp42KD0XeR9KcT2mTkU=;
 b=EvTR1rDWupIQDrdHxdvqGsSpXJdSDZXt2N4a2lnLZaXKSTednY66ouuylBNjalpdlTusfK
 njUihkbHpxwkUJDqqi8FxmY3ZJUlGD4F56s0NiV8mkKYbBndEgAYLEHiSRP0ZBZ7LVW2D9
 ADvobh25/6jxOpea5f7f+XJ+BiQJ9J0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-208-8y2xvjrHMzqOhlakKCbMyA-1; Thu, 18 Mar 2021 12:50:23 -0400
X-MC-Unique: 8y2xvjrHMzqOhlakKCbMyA-1
Received: by mail-wm1-f72.google.com with SMTP id i14so12054544wmq.7
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 09:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DnQQidJJ9qB9pbFIHHnpf0zjfp42KD0XeR9KcT2mTkU=;
 b=t6sCLCVo0WEkkaTC4AAlVXj6sXnem/YjSDqZSUblGP54r2X/JiydWqXvu2QneUDBBp
 QsDCOaGXoW8HPeTBEmfWw+EF9IrUrAInOGt/WYrOeP1NZGZqVuJFAwn2Z5ZgQEBoN+YN
 UEC30Lr4m4qkoML7w1FqkVScyE/4DTIYiCrvscdeIxO3p0/hzQtJErEBCbp4mibs8oX0
 Fu9lYtKkqE1vnot5Sth45HJjIr1PYmUqsddCqqZTI98rwO0TLkkNdGHK/OZYI0thmagk
 z7Cn6mzuwdK7db+92CDMtmcw92ECIcetssNm8B3ITJ482RSk09DrAr0TpjoxRMAfdrrK
 JCtg==
X-Gm-Message-State: AOAM530G5z4yCwCXDk1HWd+89IyhGBtApdVikhkxSbDxrNlk5Az53IfR
 oVyvNyD5Elza3tfyEUba6ZU33GnMdx04o5y8k9WCyFNYTotLg20CX9vpumsijJYs2OIg17Ic4sD
 KMdKqsz4Qd+SH5qg=
X-Received: by 2002:a05:600c:3556:: with SMTP id
 i22mr102617wmq.116.1616086221963; 
 Thu, 18 Mar 2021 09:50:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnWbupdO+xQhy6yZBEaEvQrNpkQdYL+qjYysueA1CDECU7HfijRQD++KEKBUE9lxMliW7xsw==
X-Received: by 2002:a05:600c:3556:: with SMTP id
 i22mr102600wmq.116.1616086221787; 
 Thu, 18 Mar 2021 09:50:21 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id t23sm3787778wra.50.2021.03.18.09.50.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Mar 2021 09:50:21 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
 <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
 <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
 <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
 <b06c176d-c4ab-6c27-c96f-0bf27f7fd036@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
Message-ID: <c3ec2566-2e28-bbfd-2393-441e0b680643@redhat.com>
Date: Thu, 18 Mar 2021 17:50:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <b06c176d-c4ab-6c27-c96f-0bf27f7fd036@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.249,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/03/21 16:36, Philippe Mathieu-Daudé wrote:
> diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> index 66ee9fbf450..d7f3fad51c1 100644
> --- a/tests/qtest/meson.build
> +++ b/tests/qtest/meson.build
> @@ -217,13 +217,17 @@
>     'emc141x-test.c',
>     'usb-hcd-ohci-test.c',
>     'virtio-test.c',
> -  'virtio-blk-test.c',
> -  'virtio-net-test.c',
> -  'virtio-rng-test.c',
> -  'virtio-scsi-test.c',
>     'virtio-serial-test.c',
>     'vmxnet3-test.c',
>   )
> +if config_all_devices.has_key('CONFIG_VIRTIO_PCI')
> +  qos_test_ss.add(
> +    'virtio-blk-test.c',
> +    'virtio-net-test.c',
> +    'virtio-rng-test.c',
> +    'virtio-scsi-test.c',
> +  )
> +endif
>   if have_virtfs
>     qos_test_ss.add(files('virtio-9p-test.c'))
>   endif

I don't understand, what would this be trying to do?  (And besides, why 
would it work?  The CI failure is in qemu-iotests that has no connection 
to qtest at all).

> Maybe you need to complete it for your arch? I've been using that:

Instead of completing it, you can drop your arch from virtio-*-pci, so:

> +    { "virtio-blk-pci", "virtio-blk", QEMU_ARCH_ALL
> +                                      & ~(QEMU_ARCH_S390X |
> QEMU_ARCH_M68K) },

but do not add m68k anywhere.

Paolo


