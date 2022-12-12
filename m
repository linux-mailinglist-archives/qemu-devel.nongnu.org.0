Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB10E64A4BB
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 17:25:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4lc5-0000XJ-0T; Mon, 12 Dec 2022 11:25:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4lc3-0000WK-B4
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:25:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1p4lc1-0002PB-39
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 11:25:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670862304;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=to3dl7lkdWLbe0UdUYHTCjZFW5i4SXlUXhsx7ktHL9E=;
 b=LMgYsRb9lhGN6y65GxN9xnOgDWBU5QrKUIcmK86YpIszD1TCi3EjTnFm6tCghoPhh8bySf
 IGFK/X6uA0cKpIzP+GTctpGOz0YmaXuSI+StKpfEsUinwB1a+CByHSY0fKE/9yiw9RUKEE
 ZIv7FleHTIFhTdgjf7PoRBre9V7FgOk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-315-6H8req-pP5ihZdQD-vRSdA-1; Mon, 12 Dec 2022 11:25:02 -0500
X-MC-Unique: 6H8req-pP5ihZdQD-vRSdA-1
Received: by mail-wr1-f69.google.com with SMTP id
 s1-20020adfa281000000b00241f7467851so2368743wra.17
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 08:25:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=to3dl7lkdWLbe0UdUYHTCjZFW5i4SXlUXhsx7ktHL9E=;
 b=V5TFdhdoOLFLVOLY1I34HDYnVumDvtUiKDWMxmSsRqr7T5xkJaRNbm4USfknQ3hs22
 hum6uM66U49J4O7u0UqJqn/bc/Dk419glUhWtWDLayIr/rDVuLzuU/9ZtljixSb249bo
 YvwtABHAxOyt9zd4J+OAlMv5UOLOIvq58eCwK3bNQi0fmy61vU/t+O7sF7dq3xAyF+f9
 80l8651VTx8ZpjP6tQfCJ4ZCHOWzidH42LHNIQE+LsjzNjr+UG31VT9pLI/DK8Q0OyGl
 nPCoKI5XQkVn2rdFJNErrjlusmWvVLKyzFu5A3ClTSw9AXIpZ2y12s8NQ33NgCiM+RDu
 4ggw==
X-Gm-Message-State: ANoB5pkv3b8QoqMBzyggTYU5y0+JxYJsS7yDcX7fTEfjCTyAgBVScRTm
 m+LwfSuNQbQ8letaELQBjCW3jVWCYd2lAWhbVQIwWYjDC6tcgsYTeNdvpMrusbQA5i23+nKy3fI
 N6FIQzRro1jY4hjE=
X-Received: by 2002:a05:600c:3ca5:b0:3cf:8957:a441 with SMTP id
 bg37-20020a05600c3ca500b003cf8957a441mr12915088wmb.12.1670862301586; 
 Mon, 12 Dec 2022 08:25:01 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7kBYN1Zx78yM0udmGSTwROt1XmUpf7Gw/OL8WNkwzjTxAz014XUfWtJLXu2O4EGl5kBv6PiA==
X-Received: by 2002:a05:600c:3ca5:b0:3cf:8957:a441 with SMTP id
 bg37-20020a05600c3ca500b003cf8957a441mr12915071wmb.12.1670862301431; 
 Mon, 12 Dec 2022 08:25:01 -0800 (PST)
Received: from [192.168.8.104] (tmo-066-56.customers.d1-online.com.
 [80.187.66.56]) by smtp.gmail.com with ESMTPSA id
 f11-20020a7bc8cb000000b003cf6a55d8e8sm9499723wml.7.2022.12.12.08.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 08:25:00 -0800 (PST)
Message-ID: <be612aeb-f8ca-3685-6f7f-533e679e6662@redhat.com>
Date: Mon, 12 Dec 2022 17:24:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH for-8.0 v2 2/2] pc: clean up compat machines
Content-Language: en-US
To: Cornelia Huck <cohuck@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 qemu-s390x@nongnu.org
References: <20221212152145.124317-1-cohuck@redhat.com>
 <20221212152145.124317-3-cohuck@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221212152145.124317-3-cohuck@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 12/12/2022 16.21, Cornelia Huck wrote:
> We can move setting default_cpu_version into the base machine options,
> and we need to unset alias and is_default only once.
> 
> Suggested-by: Thomas Huth <thuth@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>   hw/i386/pc_piix.c | 27 +--------------------------
>   hw/i386/pc_q35.c  | 16 +---------------
>   2 files changed, 2 insertions(+), 41 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>

Maybe best if both patches go through an x86 tree this time, I guess?


