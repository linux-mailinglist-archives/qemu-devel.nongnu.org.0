Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E915AE8A0
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Sep 2022 14:45:02 +0200 (CEST)
Received: from localhost ([::1]:46944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVXwl-00055G-WE
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 08:44:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVW5A-0006eK-T7
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:45:29 -0400
Received: from ams.source.kernel.org ([145.40.68.75]:53348)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org>)
 id 1oVW56-0001q4-7D
 for qemu-devel@nongnu.org; Tue, 06 Sep 2022 06:45:28 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C73B6B815F8
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 10:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396D9C433D7
 for <qemu-devel@nongnu.org>; Tue,  6 Sep 2022 10:45:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=fail reason="key not found in DNS" (0-bit key) header.d=redhat.com
 header.i=@redhat.com header.b="ZgD1+ljz"; 
 dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com
 header.b="dSmb63T4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com; s=20210105;
 t=1662461119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:resent-to:
 resent-from:resent-message-id:in-reply-to:in-reply-to:  references:references; 
 bh=zQ+nxdNHfBzFHzo3I0Zc9pH8Do81phDNz57tYgaH4fI=;
 b=ZgD1+ljz0RcgGkqiPVjYw4m666+h+xFVFrBkd5fhCeXjdrIBwQPo6xhEbUNf2b4kIJ3vrU
 cWAq8IfziBBvkH1pr8FiJS+pSUcSz3Tf0a5cSQaV2wSBh66Om5p3dhX8tuTpQlu9CtL9MA
 6NQ7HRqATAzDb9e3CQvr6Zdy5y0KdIM=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 76248f76
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO) for <qemu-devel@nongnu.org>;
 Tue, 6 Sep 2022 10:45:19 +0000 (UTC)
Resent-From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Resent-Date: Tue, 6 Sep 2022 12:45:17 +0200
Resent-Message-ID: <YxckvTmKzWmw7OzB@zx2c4.com>
Resent-To: qemu-devel@nongnu.org
Delivered-To: jason.donenfeld@gmail.com
Received: by 2002:a05:7110:6084:b0:193:64ce:56a5 with SMTP id k4csp3272691gea; 
 Tue, 6 Sep 2022 03:40:54 -0700 (PDT)
X-Received: by 2002:ae9:e709:0:b0:6bc:2dfd:5859 with SMTP id
 m9-20020ae9e709000000b006bc2dfd5859mr34742193qka.610.1662460854786; 
 Tue, 06 Sep 2022 03:40:54 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; t=1662460854; cv=pass;
 d=google.com; s=arc-20160816;
 b=jLCm0sym1HG4xbB4s3amYOqoevmVrEmgoGddlaHQ9KxUL0Uv/gOJOxuV+a/3zouOXm
 YifXRaQaZ6Q8y45yRcqIDoNlAQTAuWgov6AhlmPU4JfI0g3alChVcscWgq8fHnG50eKV
 hvVnE5QjWpVQO6wQ+tOxl4NKf6P+EcT9y9wrGW9gu5dDlOjAxLpnFyXeBxt7EVlP7Wl5
 AW2EUYc1jZUPws/0eP4/cs9Czgl5kFQq9GvBZcrzEGIFZh1+Dp6uB016FxbgOiCpBE/+
 WwsvABCMdBvBULlBJJd4EYI0ETKGiz8qPtxEBoVbyOvoszBm6yYlyzFKVTP8XLhEr3wG
 knkQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:message-id:subject:cc:to:from:date
 :dkim-signature;
 bh=zQ+nxdNHfBzFHzo3I0Zc9pH8Do81phDNz57tYgaH4fI=;
 b=mfauMgVquITFawQPDi/XeT3LIM+tQlN4a0KRGY79BAt6Mxr83U4udVNHCvGvPvjpnF
 qR6suRT1Nlb88v+fcg+ejsrIuNENXBZCtE3BnhbOCKZqTVzViSzF/dtUCsLVyg7QDje0
 oNFzTSVI3Ay6pVHHCq7Am5sckc3l2yRaduc5YhxxzLsgfXgREqAouU0rFzursLSYEYQO
 R12RrR2ZqMx8I9poHzkJ03+D3783aw2XLt8EncsDkw3xZWir3I98A4ob4pFnMLG3Rz36
 RaKgwRgsaOkd3CXUmIMxzt3Qi8B0Gf3Roj/tN4cb+m2vEMLhIHnjXLwx9HG0mgzuKzCx
 EUfA==
ARC-Authentication-Results: i=2; mx.google.com;
 dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dSmb63T4;
 arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com
 dmarc=pass fromdomain=redhat.com); 
 spf=pass (google.com: domain of mst@redhat.com designates 209.85.220.41 as
 permitted sender) smtp.mailfrom=mst@redhat.com; 
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com.
 [209.85.220.41]) by mx.google.com with SMTPS id
 s24-20020ac85298000000b00343561a33e8sor8631707qtn.2.2022.09.06.03.40.54
 for <jason.donenfeld@gmail.com> (Google Transport Security);
 Tue, 06 Sep 2022 03:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates
 209.85.220.41 as permitted sender) client-ip=209.85.220.41; 
Authentication-Results: mx.google.com;
 dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dSmb63T4;
 arc=pass (i=1 spf=pass spfdomain=redhat.com dkim=pass dkdomain=redhat.com
 dmarc=pass fromdomain=redhat.com); 
 spf=pass (google.com: domain of mst@redhat.com designates 209.85.220.41 as
 permitted sender) smtp.mailfrom=mst@redhat.com; 
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:message-id:subject:cc:to:from:date
 :dkim-signature:x-gm-message-state:from:to:cc:subject:date;
 bh=zQ+nxdNHfBzFHzo3I0Zc9pH8Do81phDNz57tYgaH4fI=;
 b=rSkYexC7iZb4570xQTw7ILd+MPVW+8wGNu6090QF+hNkFikPbLRqphXObLIY7Zzn9o
 IGvBwf6hiXe3vKmpcyaVLiHmbQL5OHGpp/hXOAaPFv5rg+4OzVlu4wa37yOZ+UyVkuWn
 LEr60xiqkTVe1IjLZ+cR4kJp7CdppZamZJRSqjqm+oGPgF6ycenY646vsUrJ2/+GXxpQ
 UkkM8ghPLg+0wSrqM8y4j69nIcRymYrpB3QuoHLqOVKZYQC3XHfRz2GFLQyIbdba7YTL
 H4zRIwW9DyuPG+E3wJbZ/o4B2pvwu1orphOvBVw0RCuriTqVz7grmnxqcsUvuh14xzpC
 G0CA==
X-Gm-Message-State: ACgBeo0fx4ikP48QFOVU7ijLi4kIWIJw/cVNWDYBAIES2uBcb2IVYUv3
 +l2LrYzOLZDJk/ZNbZEhQA0MEt1O5ry3qiA/49artGTGZCC+kqMrQyTKsJrbQY+VqDqqPS+Q7y+
 vGf6YFL1ly9XLSKiX/DzteUd9tom9/RFTaKRIHh6Jv/hXUjovpgzS8EebZhX0Zwqsxgg=
X-Google-Smtp-Source: AA6agR69lHgO0LUH+NHnjnSsT/gKcPrZkPehaXeYGyTLEvLD8fTKxMqcGIjLZsojOt3iFSHzf3ay7zB8GAya8WfQnmF8kHbxSj4=
X-Received: by 2002:a05:622a:d5:b0:343:5def:8155 with SMTP id
 p21-20020a05622a00d500b003435def8155mr42423660qtw.642.1662460854658; 
 Tue, 06 Sep 2022 03:40:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1662460854; cv=none;
 d=google.com; s=arc-20160816;
 b=PFKb/IJQVDD7G0Ghkt1NjdLtJPpmJ8VgSpCQuFq3aJJnqz8UPaHnh8XCuB3c/6d6pw
 AptMunt1AA1oSB0zanEA11aQDK4Rzx4OYb4GBAyrlNgjBEyh6tZGn5tzYGoEaZ5di4aJ
 MDOE2UbQd/qk6B4ST00GntpPpYs3uGVBcikBnh4AllGFXxjKAqkGpWGdnVUb8nOMfhTD
 WzdR1mcmsd0aRIIE1EBXIbWbCa/AvAlqEh3bjlucJMYSkKXx94XLW2I6r6ZymBiF3n2W
 2c10AHWhv3SIGWacdwTVptyvSD/dC3w6N6rD9M8zW0hvXWBhGztVQ3uT6luO2QyrTsp5
 NvyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; 
 h=content-transfer-encoding:content-disposition:in-reply-to
 :mime-version:references:message-id:subject:cc:to:from:date
 :dkim-signature;
 bh=zQ+nxdNHfBzFHzo3I0Zc9pH8Do81phDNz57tYgaH4fI=;
 b=rXoCFWmDfwmXKDxOPQzyqTH2hH1gRLAtsE/FV78iaqyrn7D7DAIse4VTJDmhrG9gGF
 hCpwBXJSGm+LneQ+bydQULKgJkOCK8hSXZ3vNCfYqXdo1LxQ3T8pKrLYX4ClfQeOxiNM
 Vq39R2IdvC7LNx3MYPwK9650Ju+oJoLfAQUAcoyKJM0Bg3aYsFxT7WZbSTmxxDrKR+Ls
 7vFdcCOmlm8ccuYx0VLXqCjiSumDc/6SX6iQAx/eR9drWJCuBHu2pG174WBVY3gWm7ZQ
 Wz4Y3OZo/8qW50DJVg/1FhGj72Syabv28KPYi6wTQ8cMTj1iEyIJLRf7n3FqoA5tPHUi
 DtkQ==
ARC-Authentication-Results: i=1; gmr-mx.google.com;
 dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dSmb63T4;
 spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as
 permitted sender) smtp.mailfrom=mst@redhat.com; 
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
 by gmr-mx.google.com with ESMTPS id
 o4-20020a05620a22c400b006b95a1880d8si812090qki.7.2022.09.06.03.40.54
 for <jason.donenfeld@gmail.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 06 Sep 2022 03:40:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates
 170.10.129.124 as permitted sender) client-ip=170.10.129.124; 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662460854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zQ+nxdNHfBzFHzo3I0Zc9pH8Do81phDNz57tYgaH4fI=;
 b=dSmb63T4Nvvv3K+tzENbe7HMr8ENzoU20aPDnHnABA2GE+TgY9Jdk8UQScJdrR8bkIWNS0
 d4+r+WxmqMHXKWPaS+BrCQbbjvtWrZoZLD0/utxsx9PVX+UqCv896V87DoUtRiPkWlz89o
 C0uSVhxLVmW27EEOHj/69R7HWtAZlJM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-17-Au3llejrO8C2b1kTOkbV5A-1; Tue, 06 Sep 2022 06:40:53 -0400
X-MC-Unique: Au3llejrO8C2b1kTOkbV5A-1
Received: by mail-ej1-f72.google.com with SMTP id
 gs35-20020a1709072d2300b00730e14fd76eso3391326ejc.15
 for <Jason@zx2c4.com>; Tue, 06 Sep 2022 03:40:53 -0700 (PDT)
X-Received: by 2002:a17:906:cc0e:b0:73d:d898:3900 with SMTP id
 ml14-20020a170906cc0e00b0073dd8983900mr37148767ejb.82.1662460852149; 
 Tue, 06 Sep 2022 03:40:52 -0700 (PDT)
X-Received: by 2002:a17:906:cc0e:b0:73d:d898:3900 with SMTP id
 ml14-20020a170906cc0e00b0073dd8983900mr37148748ejb.82.1662460851874; 
 Tue, 06 Sep 2022 03:40:51 -0700 (PDT)
Received: from redhat.com ([2.52.135.118]) by smtp.gmail.com with ESMTPSA id
 k8-20020a17090632c800b0074134543f82sm6505597ejk.90.2022.09.06.03.40.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Sep 2022 03:40:51 -0700 (PDT)
Date: Tue, 6 Sep 2022 06:40:48 -0400
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: CAHmME9prkBV6WkbXrKWTFzZbeAsGHLZqqps3ieChj6ZF9S_v7A@mail.gmail.com,
 Gerd Hoffmann <kraxel@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH v2 1/2] x86: only modify setup_data if the boot protocol
 indicates safety
Message-ID: <20220906063954-mutt-send-email-mst@kernel.org>
References: <20220906103657.282785-1-Jason@zx2c4.com>
MIME-Version: 1.0
In-Reply-To: <20220906103657.282785-1-Jason@zx2c4.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=WINDOWS-1252
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=SRS0=X/Hh=ZJ=zx2c4.com=Jason@kernel.org;
 helo=ams.source.kernel.org
X-Spam_score_int: -53
X-Spam_score: -5.4
X-Spam_bar: -----
X-Spam_report: (-5.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, RCVD_IN_BL_SPAMCOP_NET=1.347,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  "Michael S. Tsirkin" <mst@redhat.com>
From:  "Michael S. Tsirkin" via <qemu-devel@nongnu.org>

On Tue, Sep 06, 2022 at 12:36:56PM +0200, Jason A. Donenfeld wrote:
> It's only safe to modify the setup_data pointer on newer kernels where
> the EFI stub loader will ignore it. So condition setting that offset on
> the newer boot protocol version. While we're at it, gate this on SEV too.
> This depends on the kernel commit linked below going upstream.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Laurent Vivier <laurent@vivier.eu>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Link: https://lore.kernel.org/linux-efi/20220904165321.1140894-1-Jason@zx2c4.com/
> Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

BTW what does it have to do with SEV?
Is this because SEV is not going to trust the data to be random anyway?

> ---
>  hw/i386/x86.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/i386/x86.c b/hw/i386/x86.c
> index 050eedc0c8..fddc20df03 100644
> --- a/hw/i386/x86.c
> +++ b/hw/i386/x86.c
> @@ -1088,8 +1088,15 @@ void x86_load_linux(X86MachineState *x86ms,
>          qemu_guest_getrandom_nofail(setup_data->data, RNG_SEED_LENGTH);
>      }
>  
> -    /* Offset 0x250 is a pointer to the first setup_data link. */
> -    stq_p(header + 0x250, first_setup_data);
> +    /*
> +     * Only modify the header if doing so won't crash EFI boot, which is the
> +     * case only for newer boot protocols, and don't do so either if SEV is
> +     * enabled.
> +     */
> +    if (protocol >= 0x210 && !sev_enabled()) {
> +        /* Offset 0x250 is a pointer to the first setup_data link. */
> +        stq_p(header + 0x250, first_setup_data);
> +    }
>  
>      /*
>       * If we're starting an encrypted VM, it will be OVMF based, which uses the
> -- 
> 2.37.3


