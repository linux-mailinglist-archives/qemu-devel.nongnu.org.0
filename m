Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF19D45D646
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 09:35:57 +0100 (CET)
Received: from localhost ([::1]:35768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqAEX-0006Zx-3n
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 03:35:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mqADK-0005p9-Cx
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 03:34:42 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mqADH-0008Rg-PM
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 03:34:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637829276;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gwXQrQcEh/iiPWzIFVZVqimNOIGvdUCvI3r6Fjw3YBI=;
 b=W+rjrg59g+A3YxzaFVZVx5ImpsSfKxz2UMQEv1/q0GUy10XCxkauHzmWvjBKhkTVas10qG
 W8RUr1irbWOSsUM8+8za6FcEhhirQlXhLU04i9aTcho9OfYbJRVgZ6gS98vQNBhMs0h4fI
 /73/NSHOHC487sCHE00kwqqJrRqa3Dw=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-370-xr6RVOdNOee1zbqXNkPVqw-1; Thu, 25 Nov 2021 03:34:35 -0500
X-MC-Unique: xr6RVOdNOee1zbqXNkPVqw-1
Received: by mail-wm1-f71.google.com with SMTP id
 a85-20020a1c7f58000000b0033ddc0eacc8so2664690wmd.9
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 00:34:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gwXQrQcEh/iiPWzIFVZVqimNOIGvdUCvI3r6Fjw3YBI=;
 b=Thyxqfv0LvepQfYdiU98+v50xacpzeziWdL7LlM7AGQk3+8Rgyh3FBvzmiwRUE39Hb
 PJu+erNcRmS/615fDyDwGqrZklq034UfhzpLDhT9l2U9gWqhH1J6enjO7o6x3s7nsx/o
 cv4LkXPrJECNZCompmCHwvhZqZgPvxkRB2WoxdpPRfWIpqNQtQBr2+x4unBby8Y13LJL
 PKfz3TZt98cb3+S0J0xDmZpYibmcosMp7Rn0kSc/PhRgyqkTfkzr0kaMyhSjMuXmGl7/
 ujnEt6/blFOafbiiCLgILFAxl4U/uXZD0FuvRULk5ZReV+1EIPmhRJu3l2NNnUDnd0Nh
 IRVA==
X-Gm-Message-State: AOAM531dMhtz5RY+PacDLqRiZVAlFMGC7cSuEELFgi0gWPr8aLmBewnr
 cWHz6UhZqsFe+MObUWVom2oBgGQsvNIIfCDeVRjqSHQAmmCNOjnEew1NhDWWhkO7SFcJ2qlYDYt
 Kr47X7wRIqTc/vcQ=
X-Received: by 2002:a5d:4b06:: with SMTP id v6mr4574913wrq.194.1637829273821; 
 Thu, 25 Nov 2021 00:34:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwx3/5aBsBC5pNrPtTiT2uuK2yTZZml2QbiygaYcJHKHZk5hv7yRRgF1z3VqwhY7rMdfc5xGA==
X-Received: by 2002:a5d:4b06:: with SMTP id v6mr4574892wrq.194.1637829273646; 
 Thu, 25 Nov 2021 00:34:33 -0800 (PST)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id r8sm2812040wrz.43.2021.11.25.00.34.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Nov 2021 00:34:33 -0800 (PST)
Message-ID: <2250f7d7-09ca-3bfb-4d95-d0c20da7f47f@redhat.com>
Date: Thu, 25 Nov 2021 09:34:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH 1/2] virito-balloon: process all in sgs for free_page_vq
To: Jason Wang <jasowang@redhat.com>, mst@redhat.com, david@redhat.com
References: <20211125022046.10433-1-jasowang@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211125022046.10433-1-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-4.1, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: mpe@ellerman.id.au, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/25/21 03:20, Jason Wang wrote:
> We only process the first in sg which may lead to the bitmap of the
> pages belongs to following sgs were not cleared. This may result more
> pages to be migrated. Fixing this by process all in sgs for
> free_page_vq.
> 
> Signed-off-by: Jason Wang <jasowang@redhat.com>
> ---
>  hw/virtio/virtio-balloon.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Typo "virtio" in subject.


