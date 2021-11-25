Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3A5445D97F
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 12:45:41 +0100 (CET)
Received: from localhost ([::1]:37206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqDC8-0003i4-H9
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 06:45:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mqDAR-0002sm-Ft
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 06:43:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mqDAN-00042W-KS
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 06:43:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637840629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U/p46qaiRCL6v0vPqrEm9Ph6fS/l2rWJAIrDP2WBQQQ=;
 b=Ql3oL9YlhQ0BD+mK+wo/Kv0sFIrSjFMNBGASqn7FnvXqDLT72KCncHYmccWuHHXzkiqs7r
 +xbG5XoTbNry3Yt+MTIQvs3bjHw8oYaOm+gVmpBfvhfRHO6mRTaxzK5d4iSiC2wsTOiHUS
 PsXi1gG38OAU7sEymyz8cP4+DfRgKvY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-431-pO2RqRkWNGGM5-sg8TqLSA-1; Thu, 25 Nov 2021 06:43:46 -0500
X-MC-Unique: pO2RqRkWNGGM5-sg8TqLSA-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg20-20020a05600c3c9400b0033a9300b44bso3376103wmb.2
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 03:43:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=U/p46qaiRCL6v0vPqrEm9Ph6fS/l2rWJAIrDP2WBQQQ=;
 b=kYbvy5jz11Yqdmui9PGzO8rgmiuv+LoGvwBER7goUT61LMWekSlCo11jNk7WlDCHyK
 UQswLu1YZCAKm6Ae7hqT8nw0+RYG/1cF6pk8cStvJSQI1K8HDFDa4nsb23ONbrpW4Qt+
 aoBc6YYujs8MTD+mte24wCEqalu9r//ebckeeM2aA+hKM1cvFAsT/1F9aaOy5F/KCpQt
 L2bMDwHSY9au9EdudG6a/tNiBXsEO6AdPQCre1hUy+zxDmsFsXev0t5TZmTaQn0oDb7C
 ZgM0V+2xzdO2rAYlS1LlLyy6WeicEiqUhhkvhcoyRqbk7UXSMpJUc0AKwzw9iLuk3DQx
 6Ycw==
X-Gm-Message-State: AOAM532UyT3oWoSlCA0zeCg5rJ7oLwLDv7Mg7AR5Lv5vC+VPxNhn1MWg
 a2qXjmv8nSSLALhXimEYeXh5PbGQTTheKDMOEfHnsBk3ppdSV2Ap8tVZATZEfyKmXpcRsctkc+H
 l/GnzqSsGdpoxr14=
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr5739356wrs.537.1637840625128; 
 Thu, 25 Nov 2021 03:43:45 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwmTZDElejf4P62uF0uYeGkKa07tV/LSUT3VUeobMKeDiOqMSMsy6YEoScm61nm0ZMq3U2i0g==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr5739330wrs.537.1637840624953; 
 Thu, 25 Nov 2021 03:43:44 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id l4sm2554580wrv.94.2021.11.25.03.43.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 03:43:44 -0800 (PST)
Message-ID: <17d3593c-c800-d56a-9b6e-4752201f4b5d@redhat.com>
Date: Thu, 25 Nov 2021 12:43:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v4 1/3] hw/block/fdc: Extract blk_create_empty_drive()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211124161536.631563-1-philmd@redhat.com>
 <20211124161536.631563-2-philmd@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211124161536.631563-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.11.21 17:15, Philippe Mathieu-Daudé wrote:
> We are going to re-use this code in the next commit,
> so extract it as a new blk_create_empty_drive() function.
>
> Inspired-by: Hanna Reitz <hreitz@redhat.com>

:)

> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/block/fdc.c | 9 +++++++--
>   1 file changed, 7 insertions(+), 2 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


