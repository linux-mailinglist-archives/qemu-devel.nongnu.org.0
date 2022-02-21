Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 337124BD874
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 10:17:33 +0100 (CET)
Received: from localhost ([::1]:34134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM4p2-0003va-19
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 04:17:32 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM4j3-0001Qm-FV
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:11:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22347)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nM4j0-0006Q8-8n
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 04:11:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645434676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PR1460gPX3U0eH0aOwHwGx7E+LjZTFaXfmoknotHHOQ=;
 b=iZNHqT1MxorU1vfNGWROoSSdjwQzbAirv+B9Q6qPe1cx2YO6UDCvAr4WpYG6WaKgaQxD82
 EB1o9XVJI7k9zxxiZytJ4N9jKdrNHozQa5ee7fFDDO0v4LHpUCn8S7DeUDHU5HOeNjG9pY
 frD63j+SuZ7wXwH1xomdpDWkZubu4NY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-J9-E6NhcPXKH8xKtHa1j9g-1; Mon, 21 Feb 2022 04:11:15 -0500
X-MC-Unique: J9-E6NhcPXKH8xKtHa1j9g-1
Received: by mail-wr1-f69.google.com with SMTP id
 v17-20020adfc5d1000000b001e6405c2b56so7167456wrg.7
 for <qemu-devel@nongnu.org>; Mon, 21 Feb 2022 01:11:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=PR1460gPX3U0eH0aOwHwGx7E+LjZTFaXfmoknotHHOQ=;
 b=pU43MN2CxOrNhNt5XqaQG75sZ7OlvZ9RJ0Sg0U0CYcqnNH9me9PtvLEY05iADgIm0m
 AFSlsTwlFKcVqasP93niXRR0NwA7WjgNf1E43hMLsfHBTeF4bPUYjuW/IyV6azKzGwls
 AQ/CHObmtBOFrNWWSNtTt94GD5dexzdQw5GtN1KhZm5jla5XvDdh9zySRTJZjRro+1aC
 SxeD1g6Jen/fuUNp12W/lMtTW2DK7aoVoRRSt0qzV+u2MDSoPh9cpUgF3IcFjNoYsZMH
 Vm/it8K4ItgLNgW3NxzHarC2y5xan2ifgYjqi8MHL5KxJDo1ny4smgDkjZpIsjWQv5H/
 7OCg==
X-Gm-Message-State: AOAM531aXiWwEPdZvokrhELsnZogZpWvvZgO31mTcnd0xvvErhrrZwOQ
 1mhthWdMBVEb/uCQOomlo34SssfC+sDxR8c/KRk9hQ5AEfaRDfA4ejXPAUYKJVSJdliQCTItzcx
 fBNaICvmgPZemziQ=
X-Received: by 2002:a7b:c94e:0:b0:37b:ea2f:788c with SMTP id
 i14-20020a7bc94e000000b0037bea2f788cmr16996781wml.14.1645434674372; 
 Mon, 21 Feb 2022 01:11:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVTGRz4QTM1P8DV5su8Jemc9vWx3B4YaRR7TRgZyopLrauEVhwkIYUqtocLmGd9erfCut6FA==
X-Received: by 2002:a7b:c94e:0:b0:37b:ea2f:788c with SMTP id
 i14-20020a7bc94e000000b0037bea2f788cmr16996760wml.14.1645434674132; 
 Mon, 21 Feb 2022 01:11:14 -0800 (PST)
Received: from [10.33.192.232] (nat-pool-str-t.redhat.com. [149.14.88.106])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a05600c358600b00354d399ef32sm7223771wmq.39.2022.02.21.01.11.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 01:11:13 -0800 (PST)
Message-ID: <b3b8c372-e0c8-1814-fab4-a6f6f19ff10a@redhat.com>
Date: Mon, 21 Feb 2022 10:11:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 4/4] tests/qtest/virtio-iommu-test: Check bypass config
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, eric.auger@redhat.com
References: <20220214124356.872985-1-jean-philippe@linaro.org>
 <20220214124356.872985-5-jean-philippe@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20220214124356.872985-5-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: lvivier@redhat.com, mst@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, dgilbert@redhat.com, pasic@linux.ibm.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14/02/2022 13.43, Jean-Philippe Brucker wrote:
> The bypass config field should be initialized to 1 by default.
> 
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
>   tests/qtest/virtio-iommu-test.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/tests/qtest/virtio-iommu-test.c b/tests/qtest/virtio-iommu-test.c
> index 47e68388a0..068e7a9e6c 100644
> --- a/tests/qtest/virtio-iommu-test.c
> +++ b/tests/qtest/virtio-iommu-test.c
> @@ -31,11 +31,13 @@ static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
>       uint64_t input_range_end = qvirtio_config_readq(dev, 16);
>       uint32_t domain_range_start = qvirtio_config_readl(dev, 24);
>       uint32_t domain_range_end = qvirtio_config_readl(dev, 28);
> +    uint8_t bypass = qvirtio_config_readb(dev, 36);
>   
>       g_assert_cmpint(input_range_start, ==, 0);
>       g_assert_cmphex(input_range_end, ==, UINT64_MAX);
>       g_assert_cmpint(domain_range_start, ==, 0);
>       g_assert_cmpint(domain_range_end, ==, UINT32_MAX);
> +    g_assert_cmpint(bypass, ==, 1);
>   }
>   
>   static int read_tail_status(struct virtio_iommu_req_tail *buffer)

Acked-by: Thomas Huth <thuth@redhat.com>


