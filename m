Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE7FC30BF64
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 14:31:03 +0100 (CET)
Received: from localhost ([::1]:55800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6vlm-00007a-Nh
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 08:31:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6vk0-0007nW-JY; Tue, 02 Feb 2021 08:29:12 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:33287)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6vjy-0001wV-Vb; Tue, 02 Feb 2021 08:29:12 -0500
Received: by mail-wm1-x32e.google.com with SMTP id a16so1939022wmm.0;
 Tue, 02 Feb 2021 05:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mWimJhWyS3kQS2H5OSAY/5LLE6RSxAaB8rUoU6xyX8Q=;
 b=NIJRaM8PnabO1QNCf7HhopljQpxzMbZVbv3HY35Zg1Hj3CrfC4oEEhuxcGGZuY1v0Y
 k15M25iM7AHhFlVXC2xvXHCC39dC4D8MUl3MM4Oit+lHv8JzQNBApOZ9cnccrP78XRn9
 fZPxKZTZhxxidzSymrt/a6yR3juGImY1KCMl95CdwcJZAym54WvJER82g5G+z6ILS42T
 m0NIMJ449XugO+6XUIRoMjlpkh4s8alSBeXoQi0rikIi31Y7zUq/8+KsrX+seOR6RXd0
 yvd5zspHnMj/UWrQOy43zR11N9RechdnejMKj3vdoBEyahSX4VvIUj0Yig5y0eQLea99
 f12g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mWimJhWyS3kQS2H5OSAY/5LLE6RSxAaB8rUoU6xyX8Q=;
 b=p29Z8a+DjnzeMfzPb6ryjWV1zPvNDo9jThwctjOmVbaGrZIhXTWxnSel1T3Tf5wJNh
 BIRKKa2xLmfGVSgmQhBo1xKcSn4QkW/XIDwUQo/yhtOnDyHmv+DZgJcIIYDalU1tOOar
 dhkzUNdt94iGl1deyD/+KG6GXYeKX8EVYtG9AOME/RGxzag+p9cCdX+3QomBpgRpGSuT
 niJdNHfqOJrcQdzP5isKK4j7nyabS8XIvcRE1b6ZsYP77VOFZ9zqIrgBy7rdTNSgjGoG
 Ankl0K2ZEjhYI3j5dN3Udpjt4UOs4Y4+t/btEECcsYFq5ZuCmqr08m394nXlEA+hh3/m
 kmUg==
X-Gm-Message-State: AOAM5315UhoB1Rk2INbyUnxhVxNgWDOtERPXmhXIOe7OrzJ6kceLVghJ
 h50hyAhO8JzsOO2DWFPyI98=
X-Google-Smtp-Source: ABdhPJydO9HEQkV51r/95Ak+zkjyJUg3lZrirxeS0ap4GTDpkYaMqP4vKs9eyId9M96XN2oUvf3tZw==
X-Received: by 2002:a7b:cd08:: with SMTP id f8mr3714757wmj.142.1612272548409; 
 Tue, 02 Feb 2021 05:29:08 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id u4sm7222739wrr.37.2021.02.02.05.29.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 05:29:07 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] hw/arm/raspi: Restrict BCM2835 / BCM2836 SoC to
 TCG
To: Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>
References: <20210131151410.318649-1-f4bug@amsat.org>
 <20210131151410.318649-3-f4bug@amsat.org>
 <20210201081826.yx34xjzbgsiwzcpd@sekoia-pc.home.lmichel.fr>
 <CAFEAcA8eDgsGY_Vq5SRuv9HxHY8Qz2j86A0PmKuHfj=H2wm7kQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <313440b0-95b8-a690-a7ed-65c8428d7c42@amsat.org>
Date: Tue, 2 Feb 2021 14:29:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8eDgsGY_Vq5SRuv9HxHY8Qz2j86A0PmKuHfj=H2wm7kQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.155,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Michael Tokarev <mjt@tls.msk.ru>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 1:28 PM, Peter Maydell wrote:
> On Mon, 1 Feb 2021 at 08:18, Luc Michel <luc@lmichel.fr> wrote:
>> On 16:14 Sun 31 Jan     , Philippe Mathieu-Daudé wrote:
>>> KVM requires the target cpu to be at least ARMv8 architecture
>>> (support on ARMv7 has been dropped in commit 82bf7ae84ce:
>>> "target/arm: Remove KVM support for 32-bit Arm hosts").
>> Wow, is there absolutely no way to do that then? What about using an
>> ARMv8 and starting in AArch32 mode? Is that possible with KVM? I guess
>> it might not be strictly identical as spawning the "real" CPU...
> 
> "Support hardware-accelerated emulation of older v7 CPUs" is
> not a design goal of the virtualization extensions; you can't
> do it. KVM does support having a guest CPU which is AArch32 for EL1,
> but that will never be a v7 CPU, because it will be the same as
> the host CPU, which will always be v8.
> 
> In general I would prefer that we don't try to do stuff to
> make KVM kinda-sorta-work on random 32-bit boards by stuffing
> in a not-the-right-type CPU, because this increases our
> security boundary massively.

Fine, as this simplifies many things.

> At the moment we can reasonably
> say "only the 'virt' board and one of the Xilinx boards are
> security-critical".

What about the SBSA-ref?

Thanks,

Phil.

