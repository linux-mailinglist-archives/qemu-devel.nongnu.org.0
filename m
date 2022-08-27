Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F001E5A3615
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Aug 2022 10:47:25 +0200 (CEST)
Received: from localhost ([::1]:59436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oRrTQ-00024Y-My
	for lists+qemu-devel@lfdr.de; Sat, 27 Aug 2022 04:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRrLY-0003Rw-W7
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 04:39:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52422)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oRrLW-0002o0-Hk
 for qemu-devel@nongnu.org; Sat, 27 Aug 2022 04:39:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661589553;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XwMMygxzGrV6AzpB2WmNasdxPTL95AfNWuldzf5j5M8=;
 b=YJB6WwZqHYRBCgUjjdLDsbihETq6xR+OS1WMQj3yUpz+8Rt/B9FMqufyIknW/d2EfJEf9j
 ObI74/pbJtsEFZLj9Pq9JpZEmmxO+8ySpcF5XHj7UNeJc/5uMlxMA/Xc9q+RWmvAu7RqzA
 Jc8Dbl5qePLF7QeQjiIdJ3ExdFr5428=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-122-p0e1vjC2NCS-n075ubB65w-1; Sat, 27 Aug 2022 04:39:12 -0400
X-MC-Unique: p0e1vjC2NCS-n075ubB65w-1
Received: by mail-wm1-f71.google.com with SMTP id
 r10-20020a1c440a000000b003a538a648a9so1985641wma.5
 for <qemu-devel@nongnu.org>; Sat, 27 Aug 2022 01:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=XwMMygxzGrV6AzpB2WmNasdxPTL95AfNWuldzf5j5M8=;
 b=ZYvDVRkJTRQ7lNpS3KteNikh6sEnd1OYzT9gg15YrOqG48bDY/7l7Z7yiYCnbBn18F
 BRlMOOoKNYOWvalG+6tUdtTEW4yTMuGRAYWlmeFEJd5nLZH2OcrACImR5tD40L58D3BJ
 ffU5reM7pGSHL+lBt+p26KTVE6xPea+4QGMx7KA7EgfsT3ySlOyfmJvzUKGTxgr4STN/
 apPSl1vkDbuWRGiFI7j4Qzuh65/ZcvK1/EXZQLUuEi77AjOid05LdmN3k8omI3YUxfc4
 /ujWaPj0gc8ZBJTmBIihvthxC7l6vtNELoaFv8LjSYunSzv3tyU+kwkmGpvF/F4eAR2N
 cfcQ==
X-Gm-Message-State: ACgBeo12K68o97xi35weQJngoXOnezA3Agoiem+nZhQotQN6ZaQlOuYj
 JBR5U9aoHZPSNSubrx2GV0YircCkHsgaGyODoP9OI/IqQgG04NuqawIZ0CLwavuL384xpbdXZ9D
 GsLLgDFIIShqRYXE=
X-Received: by 2002:a05:6000:cf:b0:21e:f6e2:e90e with SMTP id
 q15-20020a05600000cf00b0021ef6e2e90emr1726705wrx.404.1661589551647; 
 Sat, 27 Aug 2022 01:39:11 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5iFoVe6lXY0rsX+z9sa9+K8FUbZbJm7v3xabff49PAjCKYMDCyRVXIA8ipvBOfTyShsOPKQA==
X-Received: by 2002:a05:6000:cf:b0:21e:f6e2:e90e with SMTP id
 q15-20020a05600000cf00b0021ef6e2e90emr1726684wrx.404.1661589551411; 
 Sat, 27 Aug 2022 01:39:11 -0700 (PDT)
Received: from [192.168.8.101] (tmo-097-69.customers.d1-online.com.
 [80.187.97.69]) by smtp.gmail.com with ESMTPSA id
 ba26-20020a0560001c1a00b002252f57865asm1784612wrb.15.2022.08.27.01.39.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 27 Aug 2022 01:39:11 -0700 (PDT)
Message-ID: <538e6edc-6c21-5288-2b28-260ac47cce7d@redhat.com>
Date: Sat, 27 Aug 2022 10:39:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 20/20] disas/nanomips: Rename nanomips.cpp to nanomips.c
Content-Language: en-US
To: Milica Lazarevic <milica.lazarevic@syrmia.com>
Cc: qemu-devel@nongnu.org, cfontana@suse.de, berrange@redhat.com,
 pbonzini@redhat.com, vince.delvecchio@mediatek.com,
 richard.henderson@linaro.org, peter.maydell@linaro.org,
 djordje.todorovic@syrmia.com, mips32r2@gmail.com,
 dragan.mladjenovic@syrmia.com
References: <20220815072629.12865-1-milica.lazarevic@syrmia.com>
 <20220815072629.12865-21-milica.lazarevic@syrmia.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220815072629.12865-21-milica.lazarevic@syrmia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 15/08/2022 09.26, Milica Lazarevic wrote:
> Now that everything has been converted to C code the nanomips.cpp file
> has been renamed. Therefore, meson.build file is also changed.
> 
> Signed-off-by: Milica Lazarevic <milica.lazarevic@syrmia.com>
> ---
>   disas/meson.build                  | 2 +-
>   disas/{nanomips.cpp => nanomips.c} | 0
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename disas/{nanomips.cpp => nanomips.c} (100%)
> 
> diff --git a/disas/meson.build b/disas/meson.build
> index ba22f7cbcd..1977f5cd92 100644
> --- a/disas/meson.build
> +++ b/disas/meson.build
> @@ -5,7 +5,7 @@ common_ss.add(when: 'CONFIG_HPPA_DIS', if_true: files('hppa.c'))
>   common_ss.add(when: 'CONFIG_M68K_DIS', if_true: files('m68k.c'))
>   common_ss.add(when: 'CONFIG_MICROBLAZE_DIS', if_true: files('microblaze.c'))
>   common_ss.add(when: 'CONFIG_MIPS_DIS', if_true: files('mips.c'))
> -common_ss.add(when: 'CONFIG_NANOMIPS_DIS', if_true: files('nanomips.cpp'))
> +common_ss.add(when: 'CONFIG_NANOMIPS_DIS', if_true: files('nanomips.c'))
>   common_ss.add(when: 'CONFIG_NIOS2_DIS', if_true: files('nios2.c'))
>   common_ss.add(when: 'CONFIG_RISCV_DIS', if_true: files('riscv.c'))
>   common_ss.add(when: 'CONFIG_SH4_DIS', if_true: files('sh4.c'))
> diff --git a/disas/nanomips.cpp b/disas/nanomips.c
> similarity index 100%
> rename from disas/nanomips.cpp
> rename to disas/nanomips.c

Reviewed-by: Thomas Huth <thuth@redhat.com>


