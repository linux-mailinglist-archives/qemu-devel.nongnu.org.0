Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1ACD3296B0
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 08:51:05 +0100 (CET)
Received: from localhost ([::1]:51470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGzo8-00013D-QL
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 02:51:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38144)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGznM-0000Rn-Qi; Tue, 02 Mar 2021 02:50:16 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:45700)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lGznL-0002uC-5v; Tue, 02 Mar 2021 02:50:16 -0500
Received: by mail-ej1-x633.google.com with SMTP id mm21so33084658ejb.12;
 Mon, 01 Mar 2021 23:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=Et1NC1uC0Fp6a0ZqhALd6cJxbsMezzUerbzpYjanJjA=;
 b=fKQ1HXWvEnpcEFuEDAOWfo4ckaQD14J9Oje1zDFxLsUSYJSbkO35L38g4UpriUijry
 53+YI2cDjapoqbT8VGXiu8VGoGiwSmzlUBnOacc6AbEKekAiLDC22qBZdE5uQYNI2lYy
 LffoLx2Bf3xcwrSPMKodYtEhWR4mc2D8nZW7pmG+lX98hHG6u7565Ek551+/43j6TvWv
 iyCxsuSuF7bJqaGQKdiSUlE6Vs+KpGrzXhjDJ/GGfAM1Mk64bJh+BxL4XQ2sFbOXggfk
 KwwvugD4VQh4T9zPSSOM2vXz5lU3GHxLk6YFW3nTMSwTbt9aJMjccw0wd+ScopCDtZwq
 AYog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Et1NC1uC0Fp6a0ZqhALd6cJxbsMezzUerbzpYjanJjA=;
 b=irzQy3glDR13B4pLi6dbMhnAe/rCS8dKC+wIlcZy56AWgi7MryXgBBqNVOBt0Gq1SZ
 yjLSZVCy27xZAImnb8WNQglFAccZMGgHTO0E4/1htWltnZ1UtYex/JFAF2ra0IypRQJy
 8tcrvsXgzY2Uf0V/+xNZjOOKAiwp0UE2BfEfQ8s695XIoQUrJ4jo08y9m0uzG85itaTt
 tn1fjhZ1tTl9p2Sq0DQD802G+QWJvNu3RI+off7FtBiSxMI6ij0J7amoYQbeza0zBElZ
 PMa5Onf8D7rYlpMRBw0aD7l1HlMnHJ7oICIFvOStKAriyM0D37u+rZMkI5BxJnSymywt
 +KaQ==
X-Gm-Message-State: AOAM530kyKA3rNY8eaGua4Dp9XucF1CCRxiF/8mt3AMLhWSrOmxs/G+v
 TOBtBEoZ5m9ClzYfHprgBpw=
X-Google-Smtp-Source: ABdhPJylRIk137iv6/k25S2RO4X36ALs5KW9sVFbQGNyBCf3EXgeJeB001B5NmT0UWpEbZRHw89PQw==
X-Received: by 2002:a17:906:f9db:: with SMTP id
 lj27mr10038347ejb.399.1614671413228; 
 Mon, 01 Mar 2021 23:50:13 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id z16sm16838721ejd.102.2021.03.01.23.50.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 01 Mar 2021 23:50:12 -0800 (PST)
Subject: Re: [PATCH v4 3/6] vt82c686: Add VT8231_SUPERIO based on VIA_SUPERIO
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
References: <cover.1614282456.git.balaton@eik.bme.hu>
 <8116435b3f8155c4a6e39df917be8183f65ccf1a.1614282456.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <efc62679-56b3-ea0f-4baa-788115629494@amsat.org>
Date: Tue, 2 Mar 2021 08:50:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <8116435b3f8155c4a6e39df917be8183f65ccf1a.1614282456.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/25/21 8:47 PM, BALATON Zoltan wrote:
> The VT8231 south bridge is very similar to VT82C686B but there are
> some differences in register addresses and functionality, e.g. the
> VT8231 only has one serial port. This commit adds VT8231_SUPERIO
> subclass based on the abstract VIA_SUPERIO class to emulate the
> superio part of VT8231.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/isa/vt82c686.c | 121 ++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 121 insertions(+)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 9b2ffecc79..72234bc4d1 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -489,6 +489,126 @@ static const TypeInfo vt82c686b_superio_info = {
>  };
>  
>  
> +#define TYPE_VT8231_SUPERIO "vt8231-superio"
> +
> +static void vt8231_superio_cfg_write(void *opaque, hwaddr addr,
> +                                     uint64_t data, unsigned size)
> +{
> +    ViaSuperIOState *sc = opaque;
> +    uint8_t idx = sc->regs[0];
> +
> +    if (addr == 0) { /* config index register */
> +        sc->regs[0] = data;
> +        return;
> +    }
> +
> +    /* config data register */
> +    trace_via_superio_write(idx, data);
> +    switch (idx) {
> +    case 0x00 ... 0xdf:
> +    case 0xe7 ... 0xef:
> +    case 0xf0 ... 0xf1:
> +    case 0xf5:
> +    case 0xf8:
> +    case 0xfd:
> +        /* ignore write to read only registers */
> +        return;
> +    case 0xf2: /* Function select */
> +    {
> +        data &= 0x17;

I'd prefer a definition for this mask (and @0xf4) but well...
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +        if (data & BIT(2)) { /* Serial port enable */
> +            ISADevice *dev = sc->superio.serial[0];
> +            if (!memory_region_is_mapped(sc->serial_io[0])) {
> +                memory_region_add_subregion(isa_address_space_io(dev),
> +                                            dev->ioport_id, sc->serial_io[0]);
> +            }
> +        } else {
> +            MemoryRegion *io = isa_address_space_io(sc->superio.serial[0]);
> +            if (memory_region_is_mapped(sc->serial_io[0])) {
> +                memory_region_del_subregion(io, sc->serial_io[0]);
> +            }
> +        }
> +        break;
> +    }
> +    case 0xf4: /* Serial port io base address */
> +    {
> +        data &= 0xfe;
> +        sc->superio.serial[0]->ioport_id = data << 2;
> +        if (memory_region_is_mapped(sc->serial_io[0])) {
> +            memory_region_set_address(sc->serial_io[0], data << 2);
> +        }
> +        break;
> +    }
> +    default:
> +        qemu_log_mask(LOG_UNIMP,
> +                      "via_superio_cfg: unimplemented register 0x%x\n", idx);
> +        break;
> +    }
> +    sc->regs[idx] = data;
> +}

