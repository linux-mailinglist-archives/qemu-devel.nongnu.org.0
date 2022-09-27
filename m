Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8E0D5EC645
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 16:34:16 +0200 (CEST)
Received: from localhost ([::1]:49616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odBf4-0000RV-G0
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 10:34:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odA0Q-0001cx-Ia
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:48:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:54491)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1odA0N-00077E-0D
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 08:48:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664282886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=t2CwYiFfPFe7zNn6fpJXNcmxgp+8AQ3T6CXcmqBQgGM=;
 b=TGXl1xPJ8CcZ+f4oftDfKBTypFWdQ88gMgcod4KNsXRZaBUWQOacELypRwcfm86CArekM0
 jr0TCTAoFhbk3ZlEVACh8VoS711nHXFr0DlGxwIH6GELPE0n4JnOVHf6TL2w+264nGGuNT
 iLNU/LIZSIGAotUTAFspaU+1fmect4Y=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-489-TTP1FyboOUqHAdL3fEibhg-1; Tue, 27 Sep 2022 08:48:04 -0400
X-MC-Unique: TTP1FyboOUqHAdL3fEibhg-1
Received: by mail-ed1-f70.google.com with SMTP id
 dz21-20020a0564021d5500b0045217702048so7616211edb.5
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 05:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=t2CwYiFfPFe7zNn6fpJXNcmxgp+8AQ3T6CXcmqBQgGM=;
 b=R9citQaGu/kF1yyozmbHrw+H9l2xhY6Xp5ZSX+lkYkV/m3HVoQLE8RqYupnxOJF0qn
 Axs+bXMpiBLRkw0z/EsEa6de6EOg7L2HHWVDFPTZdzIVi7id+AJ+YL5wGW6q86rvErqE
 pLh4p922dHOTzAUBaDYaDZFqMxTxD63Wtq6qsmut7DjBF7ON9CjLxEOnltaZxqMBndnx
 UXrZbogWJEjbqGLJjkFJ+9O2aoyuazxuln5zgiHt/M990JEn3WmGme1z8RiL1MXbnHh9
 Mi25XOJpfAgSU1ZfK0DCKYJNhKL5FEZmXSGgJK5/AFbCRUU37+0P0m0WGpqQncw+kkpM
 FFDA==
X-Gm-Message-State: ACrzQf3YJ0ZH1ZSRLBYb16wgOIAsN1qIGUPqum2ZoP25oHdB8uqlRJNw
 rqqJcWneSWbkuQIX8H0azp+TlPjeX8P/qCscHmiRPLePgDQZMGnHUgV0ZFceA0raDp9DoaOd7Sa
 6FF3fo90pEtJNsqc=
X-Received: by 2002:a17:907:970c:b0:782:e3f1:af60 with SMTP id
 jg12-20020a170907970c00b00782e3f1af60mr15449379ejc.757.1664282883495; 
 Tue, 27 Sep 2022 05:48:03 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6KqBlrfrTCWOEts48f9X5zbEiNZ76QNq6trRyUur/PBpfLp1Wu3VUEUytgd0Fun9nOtVgr0w==
X-Received: by 2002:a17:907:970c:b0:782:e3f1:af60 with SMTP id
 jg12-20020a170907970c00b00782e3f1af60mr15449361ejc.757.1664282883291; 
 Tue, 27 Sep 2022 05:48:03 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 z5-20020aa7c645000000b0044f0c01196esm1186148edr.65.2022.09.27.05.48.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 27 Sep 2022 05:48:02 -0700 (PDT)
Message-ID: <58ecf105-9767-25fd-6781-86dcf149bc31@redhat.com>
Date: Tue, 27 Sep 2022 14:48:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v2 4/8] hw/arm/virt: Fix devicetree warning about the
 gpio-key node
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, robh+dt@kernel.org
References: <20220927100347.176606-1-jean-philippe@linaro.org>
 <20220927100347.176606-5-jean-philippe@linaro.org>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20220927100347.176606-5-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.319, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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



On 9/27/22 12:03, Jean-Philippe Brucker wrote:
> The node name of the gpio-key devicetree node should be "key-poweroff":
> 
>   gpio-keys: 'poweroff' does not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', 'pinctrl-[0-9]+'
>   From schema: linux/Documentation/devicetree/bindings/input/gpio-keys.yaml
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  hw/arm/virt.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 8605f5058a..6805c57530 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -932,12 +932,12 @@ static void create_gpio_keys(char *fdt, DeviceState *pl061_dev,
>      qemu_fdt_add_subnode(fdt, "/gpio-keys");
>      qemu_fdt_setprop_string(fdt, "/gpio-keys", "compatible", "gpio-keys");
>  
> -    qemu_fdt_add_subnode(fdt, "/gpio-keys/poweroff");
> -    qemu_fdt_setprop_string(fdt, "/gpio-keys/poweroff",
> +    qemu_fdt_add_subnode(fdt, "/gpio-keys/key-poweroff");
> +    qemu_fdt_setprop_string(fdt, "/gpio-keys/key-poweroff",
>                              "label", "GPIO Key Poweroff");
> -    qemu_fdt_setprop_cell(fdt, "/gpio-keys/poweroff", "linux,code",
> +    qemu_fdt_setprop_cell(fdt, "/gpio-keys/key-poweroff", "linux,code",
>                            KEY_POWER);
> -    qemu_fdt_setprop_cells(fdt, "/gpio-keys/poweroff",
> +    qemu_fdt_setprop_cells(fdt, "/gpio-keys/key-poweroff",
>                             "gpios", phandle, 3, 0);
>  }
>  


