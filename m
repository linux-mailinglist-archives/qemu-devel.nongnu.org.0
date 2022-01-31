Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A10D64A3F22
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 10:19:52 +0100 (CET)
Received: from localhost ([::1]:58532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nESql-0000Oi-09
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 04:19:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nESly-0006lO-3T
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:14:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50661)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1nESlw-0005EA-Iz
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 04:14:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643620491;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LR79ckLOxETLC8OdSBgnu18N2jfunnroi2RC25CAQiU=;
 b=BqhnxZf3eV/lwfA/ZX9Dld8Vm4a260CgB1NshnzQdKWRst7Z69RvqIU27/TEg1sYirCxtj
 zKFiA7RDU5WQKe2MSkjF7J7w/J/mSZdZKjAlEXF+UgWVrVqUTSCvnmRMJibdaB+wu1Emt/
 swJ/wqJ5FJZib4quGj/Hc83PpVupesQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-533-uTGXf1duOv2e6qyCM-mDGw-1; Mon, 31 Jan 2022 04:14:50 -0500
X-MC-Unique: uTGXf1duOv2e6qyCM-mDGw-1
Received: by mail-wm1-f71.google.com with SMTP id
 o140-20020a1ca592000000b00350aef3949aso2715444wme.5
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 01:14:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:reply-to:subject:to:cc:references:from
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-transfer-encoding:content-language;
 bh=LR79ckLOxETLC8OdSBgnu18N2jfunnroi2RC25CAQiU=;
 b=v5ebYVQkz8+uiJfC2SRthFySwbvXKR8Ruv+QHFxalFubzRB2trkuXeY4qEYO3+IkJU
 sIx6sRukalTIZ2pNZGkCIh0cR+CUVYC5mLqSYLmJbyQdUm5nJvZj2HBNsNRyBe2LDG3b
 n1JtAAT4LAs6xm/tGff3gaKltAK9WSK8970XzkoiUwuIlGiPVz0LNW5biQedfdRgY0tq
 ejxOY3NzwO90Ine838Ld9N27aOOz954DaZ0gG3YcwT5GL3XkCSBYny4apbgrY94Iu6DL
 mND+qhmVjYC1SRJ15Ni/0wdT26GQqNjpCs8rZKIzjf4WrfNidOgjNm8EmfiajOAeYH38
 LHNA==
X-Gm-Message-State: AOAM5323eoLC66RvSrgF2sSb98P77aUJbLpE3oQD0dut/zO25JnRdjWX
 k+1mVzIDl+URl0YcVF0aDBhsrlxB51Lowa9WD7Mh3Y17kirgtQmobTfgyvoJp6vfRew6grLmsN7
 5hQKjTEjvsDaf/wI=
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr16919354wrs.275.1643620489109; 
 Mon, 31 Jan 2022 01:14:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxNwnMxwnqlI30Pjjp1C/z8kgp6mKBTdAUtvIJQRKqe2bB5CeE8JC7ZXjpNR/ECmLO5hyQGhw==
X-Received: by 2002:a5d:6da1:: with SMTP id u1mr16919337wrs.275.1643620488885; 
 Mon, 31 Jan 2022 01:14:48 -0800 (PST)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id y14sm12661861wrd.91.2022.01.31.01.14.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 01:14:48 -0800 (PST)
Subject: Re: [PATCH v2 4/4] tests/qtest/virtio-iommu-test: Check bypass config
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
References: <20220127142940.671333-1-jean-philippe@linaro.org>
 <20220127142940.671333-5-jean-philippe@linaro.org>
From: Eric Auger <eric.auger@redhat.com>
Message-ID: <6ae147de-999b-6e9e-258c-f55f97afb851@redhat.com>
Date: Mon, 31 Jan 2022 10:14:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220127142940.671333-5-jean-philippe@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Reply-To: eric.auger@redhat.com
Cc: lvivier@redhat.com, thuth@redhat.com, mst@redhat.com, cohuck@redhat.com,
 qemu-devel@nongnu.org, pasic@linux.ibm.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 1/27/22 3:29 PM, Jean-Philippe Brucker wrote:
> The bypass config field should be initialized to 1 by default.
>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric
> ---
>  tests/qtest/virtio-iommu-test.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/tests/qtest/virtio-iommu-test.c b/tests/qtest/virtio-iommu-test.c
> index 47e68388a0..068e7a9e6c 100644
> --- a/tests/qtest/virtio-iommu-test.c
> +++ b/tests/qtest/virtio-iommu-test.c
> @@ -31,11 +31,13 @@ static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
>      uint64_t input_range_end = qvirtio_config_readq(dev, 16);
>      uint32_t domain_range_start = qvirtio_config_readl(dev, 24);
>      uint32_t domain_range_end = qvirtio_config_readl(dev, 28);
> +    uint8_t bypass = qvirtio_config_readb(dev, 36);
>  
>      g_assert_cmpint(input_range_start, ==, 0);
>      g_assert_cmphex(input_range_end, ==, UINT64_MAX);
>      g_assert_cmpint(domain_range_start, ==, 0);
>      g_assert_cmpint(domain_range_end, ==, UINT32_MAX);
> +    g_assert_cmpint(bypass, ==, 1);
>  }
>  
>  static int read_tail_status(struct virtio_iommu_req_tail *buffer)


