Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9BA06ED276
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:29:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqz2Q-00067k-Fj; Mon, 24 Apr 2023 12:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqz2N-00066h-Og
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:27:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqz2M-0005Fi-5L
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:27:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682353653;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wb2iTLITE/bUto0SOG3AjYW6klbWdDBsSr5RZno75sM=;
 b=h5DxOsUUb4eVsrLfyfU3/XBWdkQfIMAVVGR7M1zturbz/5tfrH1GBTYn3mS0dHUQ4YisGh
 jak9YmSbxrkzu1dtT8qzMNGntGg9xts4ptkqwdWw/ATRetQPDeK5Dy5vw1P01+Sub5UGyF
 oBm3dISiTxUjN7UL0JAEkJNNE1zl7Ws=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-606-XMo4IKRBOXKTA-4k8osF3g-1; Mon, 24 Apr 2023 12:27:32 -0400
X-MC-Unique: XMo4IKRBOXKTA-4k8osF3g-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-3f187a7a626so15881815e9.0
 for <qemu-devel@nongnu.org>; Mon, 24 Apr 2023 09:27:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682353650; x=1684945650;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Wb2iTLITE/bUto0SOG3AjYW6klbWdDBsSr5RZno75sM=;
 b=equbKbUZII1zWF5c/z3AQOyZqzhLcz+Y0DeKuKiOB1R7Jkqhtcqdj3p6GuIQUXyIYu
 Tq351ppQF/dQ4zwrQ9IwQpl6tIUGR5zC+tfEBEo/L6inLFJci34NidZxx568fapiwM7v
 MqRjZJI4/R9lI1Sc5RePIsGQdceZtXx+4/Z1iNDRCuWpRrkuY/YCuLUyMldqFRjAN3g1
 Kh1OLy2731LWWFPCcWRkpzBqrK1JMHyjCu4VALJgnjbiwWu2xtRu07Shvkftonu54iHg
 tzypc+2EvdEPGb4QpVlWjH0IcpsiAvTWZQmhehjx3VOV9Ul7elN5Xb9fJmkC6K/An3Be
 68rw==
X-Gm-Message-State: AAQBX9cSSJSfnuWpDiCBl1oKHOBINDsMRWYcr3OZyo543CVdSXhnpUnv
 TgzSCpdc6W2sRv06+06BUlZI+E9lIObz3c2k+N1iUfBOcZstDDINHPksO+0kQgWLncM1Bfe7l83
 BDkBpMb4Ihq2eTjQ=
X-Received: by 2002:a1c:7505:0:b0:3f0:373d:c32b with SMTP id
 o5-20020a1c7505000000b003f0373dc32bmr8128593wmc.30.1682353650770; 
 Mon, 24 Apr 2023 09:27:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350b42zoFcH7nJtNm74zgMBLTiUTNAD/3fdSkRPYznGse58zn1HwDOkrqZG7rmOl+jTvWl+4TLg==
X-Received: by 2002:a1c:7505:0:b0:3f0:373d:c32b with SMTP id
 o5-20020a1c7505000000b003f0373dc32bmr8128579wmc.30.1682353650406; 
 Mon, 24 Apr 2023 09:27:30 -0700 (PDT)
Received: from [192.168.0.3] (ip-109-43-178-102.web.vodafone.de.
 [109.43.178.102]) by smtp.gmail.com with ESMTPSA id
 m18-20020adffa12000000b003047297a5e8sm4494170wrr.54.2023.04.24.09.27.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Apr 2023 09:27:29 -0700 (PDT)
Message-ID: <a38b1bbd-1c46-3ea6-d7c1-f77e414bb6bf@redhat.com>
Date: Mon, 24 Apr 2023 18:27:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] hw/net/msf2-emac: Don't modify descriptor in-place in
 emac_store_desc()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, Jason Wang <jasowang@redhat.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <20230424151919.1333299-1-peter.maydell@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20230424151919.1333299-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.194, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 24/04/2023 17.19, Peter Maydell wrote:
> The msf2-emac ethernet controller has functions emac_load_desc() and
> emac_store_desc() which read and write the in-memory descriptor
> blocks and handle conversion between guest and host endianness.
> 
> As currently written, emac_store_desc() does the endianness
> conversion in-place; this means that it effectively consumes the
> input EmacDesc struct, because on a big-endian host the fields will
> be overwritten with the little-endian versions of their values.
> Unfortunately, in all the callsites the code continues to access
> fields in the EmacDesc struct after it has called emac_store_desc()
> -- specifically, it looks at the d.next field.
> 
> The effect of this is that on a big-endian host networking doesn't
> work because the address of the next descriptor is corrupted.
> 
> We could fix this by making the callsite avoid using the struct; but
> it's more robust to have emac_store_desc() leave its input alone.
> 
> (emac_load_desc() also does an in-place conversion, but here this is
> fine, because the function is supposed to be initializing the
> struct.)
> 
> Cc: qemu-stable@nongnu.org
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is one of a number of issues that prevent 'make check-avocado'
> working for arm targets on a big-endian host...
> 
>   hw/net/msf2-emac.c | 14 +++++++++-----
>   1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/net/msf2-emac.c b/hw/net/msf2-emac.c
> index 7ccd3e51427..34c1f768db0 100644
> --- a/hw/net/msf2-emac.c
> +++ b/hw/net/msf2-emac.c
> @@ -120,12 +120,16 @@ static void emac_load_desc(MSF2EmacState *s, EmacDesc *d, hwaddr desc)
>   
>   static void emac_store_desc(MSF2EmacState *s, EmacDesc *d, hwaddr desc)

You could likely also add a "const" to "EmacDesc *d" now.

>   {
> -    /* Convert from host endianness into LE. */
> -    d->pktaddr = cpu_to_le32(d->pktaddr);
> -    d->pktsize = cpu_to_le32(d->pktsize);
> -    d->next = cpu_to_le32(d->next);
> +    EmacDesc outd;
> +    /*
> +     * Convert from host endianness into LE. We use a local struct because
> +     * calling code may still want to look at the fields afterwards.
> +     */
> +    outd.pktaddr = cpu_to_le32(d->pktaddr);
> +    outd.pktsize = cpu_to_le32(d->pktsize);
> +    outd.next = cpu_to_le32(d->next);
>   
> -    address_space_write(&s->dma_as, desc, MEMTXATTRS_UNSPECIFIED, d, sizeof *d);
> +    address_space_write(&s->dma_as, desc, MEMTXATTRS_UNSPECIFIED, &outd, sizeof outd);
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


