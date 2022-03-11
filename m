Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E3574D5CAC
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Mar 2022 08:47:51 +0100 (CET)
Received: from localhost ([::1]:55412 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nSa05-0006Hi-Va
	for lists+qemu-devel@lfdr.de; Fri, 11 Mar 2022 02:47:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSZyI-0004Tv-Oy
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 02:45:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nSZyF-0007Bo-MH
 for qemu-devel@nongnu.org; Fri, 11 Mar 2022 02:45:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646984755;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1LfugmMv1J/ikLPTmN0jdXwiX116vvTH0HVg/6lRdNM=;
 b=JQ+p6gm9nW1kUTk1oyp5yun0Fd8kGaV7Ox9ykuVEmX5XIZIx2AHt5bxcZlaQac4QNT7YOf
 LB6o9hOTPu9KF+8aZGm+pmIHBNZ6UCTquzcecTGJ/OAmVgh2gq9HlpKxXnhw4JCk069Dce
 cieoPRDtimR00GO3ya/E74T4jbit6II=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-653-cvgqdMHzPKeg8WTuompnkA-1; Fri, 11 Mar 2022 02:45:54 -0500
X-MC-Unique: cvgqdMHzPKeg8WTuompnkA-1
Received: by mail-wm1-f70.google.com with SMTP id
 h206-20020a1c21d7000000b003552c13626cso5184220wmh.3
 for <qemu-devel@nongnu.org>; Thu, 10 Mar 2022 23:45:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1LfugmMv1J/ikLPTmN0jdXwiX116vvTH0HVg/6lRdNM=;
 b=1kz4LAyIHVl1D978Q0T7CP8EaS3B0+tY3pfKJJJW33hYU2nZTkceYMv3c/hO1YV7hp
 52tW4L1L8T9Wort8Q0r5YzisG/NBgOIVjoMkRho3694Izqmh3SG+vGIJWXS+4fD4RRpR
 qIGjYUTrZpkhEARmn28P+HnbE1G0UCEunmkcspio/nffn2ByPdEQLddpDYm7WU8kkM7U
 56MFJ3YaleGV9G6qaCQ4iVvNwipJRTrsNb6RwR/s20CQ19cvIp69LYT3dAuHr2uNC9JI
 wuUeuEm64hR92W6plU54f/J9m5mJ7VIGjqR3K14f72iPJUg7udl3R6+/1KaOupcJHczZ
 zKfA==
X-Gm-Message-State: AOAM533AQSHyzFB/HovI/hTvbZdQ5lhu85ybfO3iiPGJ6S+K9qE7ScPy
 dmQpDMcLeGrGRJTRQAVyqc7SHjD1YI+Nvw1SBSuufXLLg3s4oZ9r3pDwiFe7euYoaOS9EtHiEkr
 jaV1/wQclQnQ0p88=
X-Received: by 2002:a05:600c:600d:b0:389:9afb:757 with SMTP id
 az13-20020a05600c600d00b003899afb0757mr14416823wmb.113.1646984747739; 
 Thu, 10 Mar 2022 23:45:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYD7BA7Yynipesqm6rpweO+8d0VsmvZEOqGd+LhmAFW4c4l85fSnMseXxhxYPtjzhEo9ZUwA==
X-Received: by 2002:a05:600c:600d:b0:389:9afb:757 with SMTP id
 az13-20020a05600c600d00b003899afb0757mr14416809wmb.113.1646984747483; 
 Thu, 10 Mar 2022 23:45:47 -0800 (PST)
Received: from [192.168.8.104] (tmo-098-218.customers.d1-online.com.
 [80.187.98.218]) by smtp.gmail.com with ESMTPSA id
 w9-20020a5d6089000000b001f0256761b9sm8670124wrt.45.2022.03.10.23.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Mar 2022 23:45:40 -0800 (PST)
Message-ID: <d2d88ebe-d145-5e6f-2133-08901eb4e718@redhat.com>
Date: Fri, 11 Mar 2022 08:45:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [PATCH] ppc/xive2: Make type Xive2EndSource not user creatable
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
References: <20220311074352.171536-1-clg@kaod.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220311074352.171536-1-clg@kaod.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 11/03/2022 08.43, Cédric Le Goater wrote:
> Xive2EndSource objects can only be instantiated through a Xive2Router
> (PnvXive2).
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cédric Le Goater <clg@kaod.org>
> ---
>   hw/intc/xive2.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/intc/xive2.c b/hw/intc/xive2.c
> index b6452f14784b..3aff42a69ef5 100644
> --- a/hw/intc/xive2.c
> +++ b/hw/intc/xive2.c
> @@ -1000,6 +1000,7 @@ static void xive2_end_source_class_init(ObjectClass *klass, void *data)
>       dc->desc    = "XIVE END Source";
>       device_class_set_props(dc, xive2_end_source_properties);
>       dc->realize = xive2_end_source_realize;
> +    dc->user_creatable = false;
>   }

Reviewed-by: Thomas Huth <thuth@redhat.com>


