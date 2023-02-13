Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6DD5694CC8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 17:30:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRbig-0000eC-Rz; Mon, 13 Feb 2023 11:30:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pRbiW-0000dZ-6G
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:30:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1pRbiU-0001Dq-Ko
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 11:30:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676305809;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sVLBHbrpXo0m9vJga87dodkJsh7A80CQNRlkXo7DKsI=;
 b=Q08DvQL3m6WtIS2OCoyaQLZetcphSBkTn3x1RcIYsHnccMBfqYbs5MtVJMb031XwDeAMeA
 TEXAsgVkIGVbofZErf4e760+yUAKKvHwXLeTvR6F0u6u2+ztaJFZD3I9onfkptxHtI7vbS
 fWP+g33MpLgmg93HQhVW0HQ9y1EdXQw=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-629-KOQfo-hgMpOH4L8pj1aJZQ-1; Mon, 13 Feb 2023 11:30:08 -0500
X-MC-Unique: KOQfo-hgMpOH4L8pj1aJZQ-1
Received: by mail-qk1-f197.google.com with SMTP id
 w17-20020a05620a425100b00706bf3b459eso7824652qko.11
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 08:30:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sVLBHbrpXo0m9vJga87dodkJsh7A80CQNRlkXo7DKsI=;
 b=Ia/dGwSYB5JfxpzSH1WPez7oHdRMqVVA9fVeZ5nqhkE6j8q14B6eRHU+1cD1g9lz2v
 V21tlFlXpkt/cNH+V5/V8WihSWfsZebuh1OTaQWl8SmwPYBoh7RrLiF0jyLmaI8sHhQh
 v/t2loPBZcyUDax/ykKobr+6DFUY0+2LppbpMTokwXm3eBUl7FYT128XYtfhJviBLmMh
 ASIhdp7/PB2Y+qsbGZXZh4eLpuef9QEOpBd7HMo5jSSS9CtJBjBwbSgevuRelLytlPn+
 KaVt+i08pePPQsPUw8x+79Yg/sFLJYARDEPZ1wASWdmEQEQ84ce8lWotD1gPseODAKJh
 O9sg==
X-Gm-Message-State: AO0yUKVVnoVrWUlZEf1rIMFVK4+/fOYptZaggjKCFJ9s1dzz/QA1pQEJ
 FXlkAiFuyKKn1B1VPlvXk0sZXGLpfLMFH55TMwdlp6R1Rfpx23Efb4Mk4grYGY89f71jkLgjZ3A
 HD+HTKAgErSn8o4vsxRmB
X-Received: by 2002:a05:622a:11d3:b0:3b8:67c4:b11d with SMTP id
 n19-20020a05622a11d300b003b867c4b11dmr40912090qtk.49.1676305806811; 
 Mon, 13 Feb 2023 08:30:06 -0800 (PST)
X-Google-Smtp-Source: AK7set9YDCapomdHiG5Sfh9+tCkLohCWERIfRj9iwhdPn/mMki/jkKMTLFFqmRflaK+B8uuiD7Hjhw==
X-Received: by 2002:a05:622a:11d3:b0:3b8:67c4:b11d with SMTP id
 n19-20020a05622a11d300b003b867c4b11dmr40912051qtk.49.1676305806492; 
 Mon, 13 Feb 2023 08:30:06 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 t71-20020a37aa4a000000b006fc2f74ad12sm10124541qke.92.2023.02.13.08.30.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Feb 2023 08:30:05 -0800 (PST)
Message-ID: <1964d20f-e18b-5875-914b-16f2f3acee37@redhat.com>
Date: Mon, 13 Feb 2023 17:30:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH 2/2] hw/arm/smmu-common: Fix TTB1 handling
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 ola.hugosson@arm.com
References: <20230210163731.970130-1-jean-philippe@linaro.org>
 <20230210163731.970130-3-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20230210163731.970130-3-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.345, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Jean,

On 2/10/23 17:37, Jean-Philippe Brucker wrote:
> Addresses targeting the second translation table (TTB1) in the SMMU have
> all upper bits set (except for the top byte when TBI is enabled). Fix
> the TTB1 check.
>
> Reported-by: Ola Hugosson <ola.hugosson@arm.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>  hw/arm/smmu-common.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/smmu-common.c b/hw/arm/smmu-common.c
> index 2b8c67b9a1..0a5a60ca1e 100644
> --- a/hw/arm/smmu-common.c
> +++ b/hw/arm/smmu-common.c
> @@ -249,7 +249,7 @@ SMMUTransTableInfo *select_tt(SMMUTransCfg *cfg, dma_addr_t iova)
>          /* there is a ttbr0 region and we are in it (high bits all zero) */
>          return &cfg->tt[0];
>      } else if (cfg->tt[1].tsz &&
> -           !extract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte)) {
> +        sextract64(iova, 64 - cfg->tt[1].tsz, cfg->tt[1].tsz - tbi_byte) == -1) {
>          /* there is a ttbr1 region and we are in it (high bits all one) */
>          return &cfg->tt[1];
>      } else if (!cfg->tt[0].tsz) {

Reviewed-by: Eric Auger <eric.auger@redhat.com>

While reading the spec again, I noticed we do not support VAX. Is it
something that we would need to support?

Thanks!

Eric



