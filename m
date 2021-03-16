Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E766333D90D
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 17:21:26 +0100 (CET)
Received: from localhost ([::1]:49236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMCRh-0002dA-Ux
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 12:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMCM8-0006P3-GF
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:15:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29883)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMCM5-0000Yf-G3
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 12:15:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615911336;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ttYXQmH/PRuA8tMdJbEpo6i3PKwS8YrCuqmSEqRtEHs=;
 b=fdqz4fqsObp8LIAUYMb4U43bM24XzEayep4P3oSh4PPGmOHR9c8gtoN6MMFBCunq/mf9Al
 Hphj1L+RF9LswrKBib1id0oOFNfeA8GSVWj4bczYTTBUMQY2vIPg4UpKy3Bl6o7Ed2f4GU
 KBj++me6maT7qJ0uj0x5PuR88Z16uOU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-262-M9i2DL2IO8aDkofPgDsCEw-1; Tue, 16 Mar 2021 12:15:34 -0400
X-MC-Unique: M9i2DL2IO8aDkofPgDsCEw-1
Received: by mail-wm1-f70.google.com with SMTP id n2so9826476wmi.2
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 09:15:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ttYXQmH/PRuA8tMdJbEpo6i3PKwS8YrCuqmSEqRtEHs=;
 b=qs/FSi3zo8OBLd77nzfuYCKfoOU/FlHtPQbRhzzQ5URYx6meE2AZx5oqEatgJLNYVs
 pCxmuZc4cHuoeuvlugj/3HEVdtNQ6d3/LvhYFzjjS0p2Yi9JVXNsCR1LeJk4ffEvOr6o
 CHf3V10N7RkQ3E/x0Kq+1W3U06MLJUotlFrth0U26rSSU9JGK9+RGkmU+QwrCYv7+Kl/
 o+O47IlDYJLxGnh0qBSJ2LIYJNmFXGSGNzERWx8pVfpcGxtVlGgdP1MvHV5ESm8ELU5s
 RUgIm37p45/3GEc65PsgdvvCGgfTd5VoLxNR1XgPFhyILTD1V9lrlAENPOPflswMrdOI
 WRuQ==
X-Gm-Message-State: AOAM531qTEIjqucRjawaxqLty0Z+u6FCMa31Gbof+HKz/dn2cGapgVAa
 eaDKS6Nwq8avYw8FNuZ8DH7PU/qz297YMeemy7lUbfctSgupjMQmf0HeAkAmum2PQMtGHqXuLJ3
 YjluDuqRViYFA4P0=
X-Received: by 2002:a1c:1f8f:: with SMTP id f137mr405587wmf.66.1615911333071; 
 Tue, 16 Mar 2021 09:15:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOdeIWBw6K4O8l0NLuISkA/TG37hsbB+tjD/8hsyTtyXpA8eEwqbYsuN7Ufs5n8yxusOjaAw==
X-Received: by 2002:a1c:1f8f:: with SMTP id f137mr405570wmf.66.1615911332826; 
 Tue, 16 Mar 2021 09:15:32 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id l9sm3347120wmq.2.2021.03.16.09.15.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Mar 2021 09:15:32 -0700 (PDT)
Subject: Re: [PATCH 9/9] edid: add support for DisplayID extension (5k
 resolution)
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20210316143812.2363588-1-kraxel@redhat.com>
 <20210316143812.2363588-10-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <980cbb3b-3870-ec1f-cbd7-f9e52ea0ebd3@redhat.com>
Date: Tue, 16 Mar 2021 17:15:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210316143812.2363588-10-kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Konstantin Nazarov <mail@knazarov.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/16/21 3:38 PM, Gerd Hoffmann wrote:
> From: Konstantin Nazarov <mail@knazarov.com>
> 
> The Detailed Timing Descriptor has only 12 bits to store the
> resolution. This limits the guest to 4095 pixels.
> 
> This patch adds support for the DisplayID extension, that has 2 full
> bytes for that purpose, thus allowing 5k resolutions and above.
> 
> Based-on: <20210303152948.59943-2-akihiko.odaki@gmail.com>
> Signed-off-by: Konstantin Nazarov <mail@knazarov.com>
> Message-Id: <20210315114639.91953-3-mail@knazarov.com>
> 
> [ kraxel: minor workflow tweaks ]
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  hw/display/edid-generate.c | 78 +++++++++++++++++++++++++++++++++++---
>  hw/display/vga-pci.c       |  2 +-
>  2 files changed, 74 insertions(+), 6 deletions(-)

> +static void qemu_displayid_generate(uint8_t *did, uint32_t refresh_rate,
> +                                    uint32_t xres, uint32_t yres,
> +                                    uint32_t xmm, uint32_t ymm)
> +{
> +    Timings timings;
> +    generate_timings(&timings, refresh_rate, xres, yres);
> +
> +    did[0] = 0x70; /* display id extension */
> +    did[1] = 0x13; /* version 1.3 */
> +    did[2] = 23;   /* length */
> +    did[3] = 0x03; /* product type (0x03 == standalone display device) */
> +
> +    did[5] = 0x03; /* Detailed Timings Data Block */
> +    did[6] = 0x00; /* revision */
> +    did[7] = 0x14; /* block length */
> +
> +    did[8]  = timings.clock  & 0xff;
> +    did[9]  = (timings.clock & 0xff00) >> 8;
> +    did[10] = (timings.clock & 0xff0000) >> 16;
> +
> +    did[11] = 0x88; /* leave aspect ratio undefined */
> +
> +    stw_le_p(did + 12, 0xffff & (xres - 1));
> +    stw_le_p(did + 14, 0xffff & (timings.xblank - 1));
> +    stw_le_p(did + 16, 0xffff & (timings.xfront - 1));
> +    stw_le_p(did + 18, 0xffff & (timings.xsync - 1));
> +
> +    stw_le_p(did + 20, 0xffff & (yres - 1));
> +    stw_le_p(did + 22, 0xffff & (timings.yblank - 1));
> +    stw_le_p(did + 24, 0xffff & (timings.yfront - 1));
> +    stw_le_p(did + 26, 0xffff & (timings.ysync - 1));

Pointless 0xffff mask.

> +
> +    edid_checksum(did + 1, did[2] + 4);
> +}


