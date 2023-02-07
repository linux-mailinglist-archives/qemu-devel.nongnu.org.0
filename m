Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8CB968DFC0
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 19:18:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPSXC-000716-6v; Tue, 07 Feb 2023 13:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPSWL-0006yQ-Na
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:16:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pPSWH-0003ex-Li
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 13:16:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675793800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mXZiFWjPiIG3htzQ+ZRNHFAs0BptVI3EIW4KlRNQxJU=;
 b=cfn0OeiuX2ZMUmvHCvP8EEnW2rk9xMIHKVnVYdjrsPTtIxiCrTjLPnRjiWGu7jMUHFTmvL
 YNa8WgjguJkl/mujb3qCBwvdDni2FZd0bK1MMerfGDdLxGbp8IxdK0dn77F84G4rAnVMhi
 UVvMoB0q689VKYYxS9ArL+FNA5SoaRo=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-33-eLkXOOaAPoaVma-4crZKAg-1; Tue, 07 Feb 2023 13:16:39 -0500
X-MC-Unique: eLkXOOaAPoaVma-4crZKAg-1
Received: by mail-qv1-f70.google.com with SMTP id
 l6-20020ad44446000000b00537721bfd2dso8172350qvt.11
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 10:16:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=mXZiFWjPiIG3htzQ+ZRNHFAs0BptVI3EIW4KlRNQxJU=;
 b=QZHF91U2Ug2uIbaz2/S/BnRZj0d0Blwtk/HaGYki+L01DRxdxTwB5VMXc13E7SATCS
 zjAzsDSN/xEmsNDSBWplxx6kK9RJIFYHTA+3RKHqfJ/jA9j3cr0oCz4fGZ8tNb0uYE++
 bY7LMVpqT685pVSkdOS5VJ/tfhbOW1oMbPUCap/YiDdq7DkT1OrWIPjE2mSqIeGEtPcV
 gd8599Bxl2vfxKrecxdFK8Jmk9/1tVe46ZSRCECcoPEZ8qQOqfLQib3dO9PDm9zldrN0
 S3Pd9dLi47h6ZIH8vmtC+H+p0zpO0h0jrU40YuB/hydwdg5+s1Jnk82ukgC4H4WAJFDv
 ugSQ==
X-Gm-Message-State: AO0yUKX6F85uUW/bnwM7MWxrD3qlbuI2pOHnxy8c0FFhAbd9bNr0JlxO
 ANZKkl1Noh2aw7f1Dfn+Yl5mGTFh3CPbc8aU+YK48XZdnA6n9uzcVEaAZK7xPtstwNHuFKDyotl
 6K4i5GDQqnqyH4q0=
X-Received: by 2002:ac8:7f8e:0:b0:3b8:629e:afd1 with SMTP id
 z14-20020ac87f8e000000b003b8629eafd1mr6816851qtj.53.1675793798624; 
 Tue, 07 Feb 2023 10:16:38 -0800 (PST)
X-Google-Smtp-Source: AK7set/a3svxLD3j1CeovNkG72iLUvloFH5WdZrKLqMX63OBOkapEmdkFTznB819tWhRXKfrMTXrTw==
X-Received: by 2002:ac8:7f8e:0:b0:3b8:629e:afd1 with SMTP id
 z14-20020ac87f8e000000b003b8629eafd1mr6816819qtj.53.1675793798351; 
 Tue, 07 Feb 2023 10:16:38 -0800 (PST)
Received: from [192.168.8.105] (tmo-099-228.customers.d1-online.com.
 [80.187.99.228]) by smtp.gmail.com with ESMTPSA id
 b2-20020ac86bc2000000b003b7e8c04d2esm9709466qtt.64.2023.02.07.10.16.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 10:16:37 -0800 (PST)
Message-ID: <1df55822-6e09-7096-6d6a-a10fdfd9b45b@redhat.com>
Date: Tue, 7 Feb 2023 19:16:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 04/10] hw/i386: Select E1000_PCI for i440fx
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin"
 <mst@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 QEMU Trivial <qemu-trivial@nongnu.org>
References: <20230206140809.26028-1-farosas@suse.de>
 <20230206140809.26028-5-farosas@suse.de>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230206140809.26028-5-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.148, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 06/02/2023 15.08, Fabiano Rosas wrote:
> The i440fx machines uses the e1000 adapter as the default when no
> other network card is configured.
> 
> Move the E1000_PCI entry in Kconfig from 'imply' to 'select' to avoid
> the following situation:
> 
> ./qemu-system-i386 -machine pc-i440fx-8.0
> qemu-system-i386: Unsupported NIC model: e1000
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   hw/i386/Kconfig | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/i386/Kconfig b/hw/i386/Kconfig
> index 8e59cb6634..343783ea3e 100644
> --- a/hw/i386/Kconfig
> +++ b/hw/i386/Kconfig
> @@ -66,7 +66,6 @@ config PC_ACPI
>   
>   config I440FX
>       bool
> -    imply E1000_PCI
>       imply VMPORT
>       imply VMMOUSE
>       select ACPI_PIIX4
> @@ -78,6 +77,7 @@ config I440FX
>       select DIMM
>       select SMBIOS
>       select FW_CFG_DMA
> +    select E1000_PCI

Reviewed-by: Thomas Huth <thuth@redhat.com>


