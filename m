Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE94425198
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 12:59:18 +0200 (CEST)
Received: from localhost ([::1]:41788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYR7N-0000WM-Ii
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 06:59:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYR5G-0006ND-G5
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:57:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYR59-0007Zv-PR
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 06:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633604219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cGwhCZyxDesgr/j48GlHIIzggGA7HC0wIddp39vv9vI=;
 b=Ed8dL/B/UA+KiTjffopmTr2cLjiRr4wOXwayf+V2gwapcezLy2jOWB2+DrcaFkEsXW9Ew2
 tfNE2JiBAotpWcvPiJLObAdoBEFzLv21Qx7W+2hfLJyV18E9dac39ZUczyskoIfno3hUHL
 53DaAfMqV6IT/lxFcZySR9Ace+FXFOk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-5z89jQg7OJaqfIYNbMtmpw-1; Thu, 07 Oct 2021 06:56:49 -0400
X-MC-Unique: 5z89jQg7OJaqfIYNbMtmpw-1
Received: by mail-wr1-f69.google.com with SMTP id
 f11-20020adfc98b000000b0015fedc2a8d4so4384709wrh.0
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 03:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cGwhCZyxDesgr/j48GlHIIzggGA7HC0wIddp39vv9vI=;
 b=je20kTW5DMTKquk/i5mObC58tb5FbdrjqarCX36Zftwr9sCn8ziYC2HBTgO9891tMM
 Q8Wz33McIiSDBSsNI1t4VfJzOxofjVA4eqofqUkgByyO+iQCdTqZrFLOIRD0dNEpHU8d
 xTYcYL5vR0zEh/ayXiC7rzZphiUGXJP6thMV8DRhKGka0UoKvqEsZmJGt4+jRuTm/bSN
 g3+e09b7MXeBbbGHVIdPa9thum2hCGoBcdC7gfPPrq8folDmjBYWijs5K9lAgVe++ox4
 8bz4CYsuY7Tuy2uZbFK3GbXjwzfLH1Jl1j+M4RbEr0cUNyJGmKynku3l0iKXoTfdnQA6
 v9Cg==
X-Gm-Message-State: AOAM531CzpC2TYGViEAT1PG7wldiYDi93I68otM6awEvb/vE/uo063Tn
 oxg7GweNz49nKx8nJLg45QwP9f1yz8ISascwou6oVv18cbVTm/Ygccs38PUWF28Cvzo1AVONssd
 wko/76PoGWU9VExs=
X-Received: by 2002:adf:97cd:: with SMTP id t13mr4512223wrb.312.1633604208086; 
 Thu, 07 Oct 2021 03:56:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzNMfD9lZPMBkMdVHYMM4ue/LgGusE1IwGuYiLZI4DdbGJcp6sXNXIYFCT/0EGZLQpTn0qZIA==
X-Received: by 2002:adf:97cd:: with SMTP id t13mr4512207wrb.312.1633604207938; 
 Thu, 07 Oct 2021 03:56:47 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z133sm9092929wmc.45.2021.10.07.03.56.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 03:56:47 -0700 (PDT)
Message-ID: <d3d54856-060b-03de-a1ff-8beb1df568b2@redhat.com>
Date: Thu, 7 Oct 2021 12:56:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH] tests: qtest: Add virtio-iommu test
To: Eric Auger <eric.auger@redhat.com>, eric.auger.pro@gmail.com,
 thuth@redhat.com, pbonzini@redhat.com, lvivier@redhat.com,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jean-philippe@linaro.org
References: <20211007093438.657198-1-eric.auger@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211007093438.657198-1-eric.auger@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/7/21 11:34, Eric Auger wrote:
> Add the framework to test the virtio-iommu-pci device
> and tests exercising the attach/detach, map/unmap API.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> 
> ---

> +static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
> +{
> +    QVirtioIOMMU *v_iommu = obj;
> +    QVirtioDevice *dev = v_iommu->vdev;
> +    uint64_t input_range_start = qvirtio_config_readq(dev, 8);
> +    uint64_t input_range_end = qvirtio_config_readq(dev, 16);
> +    uint32_t domain_range_start = qvirtio_config_readl(dev, 24);
> +    uint32_t domain_range_end = qvirtio_config_readl(dev, 28);
> +
> +    g_assert_cmpint(input_range_start, ==, 0);
> +    g_assert_cmphex(input_range_end, ==, 0xFFFFFFFFFFFFFFFF);

Maybe explicit ull suffix for for 32-bit hosts?

> +    g_assert_cmpint(domain_range_start, ==, 0);
> +    g_assert_cmpint(domain_range_end, ==, 32);
> +}


