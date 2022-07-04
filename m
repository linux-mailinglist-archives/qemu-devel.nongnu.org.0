Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06ED55659E0
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 17:31:53 +0200 (CEST)
Received: from localhost ([::1]:54916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8O3B-0003K5-Qv
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 11:31:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48972)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8Nwf-0000kv-Gx
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:25:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:28613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8Nwd-0002Wa-T2
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 11:25:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656948302;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K9AoF3v+6AtKBQcgpvQ62TU9UKaEvjUpeTufGjGISaU=;
 b=cktF7LGvYpfoelVGBBayyOH3Onzt8eKPigi9935cwI70eVICYgCcEKML2ML2wdKsidSgLe
 w0w6baF/+ez+oekQnvbvHeMS87brQXWq5KtklCMW9s8uFkUu9kDNnLewVoJEuTeTGt/1HO
 /qX4oXES2IaCeQOeHm39POv7Ix9VWr8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-515-7V6qQa-lPuuKT8BYyAQ7Gg-1; Mon, 04 Jul 2022 11:25:01 -0400
X-MC-Unique: 7V6qQa-lPuuKT8BYyAQ7Gg-1
Received: by mail-ed1-f69.google.com with SMTP id
 n8-20020a05640205c800b00434fb0c150cso7299266edx.19
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 08:25:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=K9AoF3v+6AtKBQcgpvQ62TU9UKaEvjUpeTufGjGISaU=;
 b=KHIV0zJLd2iuOnQcWsGhchDNkwqff9ubbefdS/0z4d3Pfp/eZzro2ph5MxWnfb5KS5
 B6Sxb+QQnq/52TPZrmMcufUCOyg7W5DUR/qzStBAjag50UG3HfKN1n7qrkicq4VkxP1f
 GH4i0FrI28Xmx9OWDLLaHlSN5l6XU59COH1/k3f07M3Bvhd/Z0CkOXxVsfqmBvhdOXJ3
 uQ+DQG+dXvUQZ8U7Xc1dmHI/YAvhw6PNmLmp8rQ9Up986S+hUHrJ0+QAsC8ijEAGQTPL
 MC6y4mTG/wiQK065qzq9RFshzC/RxjCg9wJ5fS6sGOS/vPwIcBEp8r/kHatfO67M2u1d
 eIPg==
X-Gm-Message-State: AJIora/XFG6VCn/2cF7d75HCeVi6a5O95EQVWNXD9M2lIHoi3Njyojyr
 m1TVwJEskrNR3YZfD/bh0lMbGWrS3v2dz/eX16bCntHnLADEWuKDYvJV6YlFRUFHvsPqWXM+qIK
 zconD4Y7Hjjpf+WM=
X-Received: by 2002:a05:6402:2b8d:b0:43a:5410:a9fc with SMTP id
 fj13-20020a0564022b8d00b0043a5410a9fcmr7850502edb.99.1656948299983; 
 Mon, 04 Jul 2022 08:24:59 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vJ4IA/26a3RMK+rnVSWkfyiE2Nxc29rRj7YVdwqI2tYb1xj+kIuUefcXcDKOUoerRC4uAsgg==
X-Received: by 2002:a05:6402:2b8d:b0:43a:5410:a9fc with SMTP id
 fj13-20020a0564022b8d00b0043a5410a9fcmr7850490edb.99.1656948299856; 
 Mon, 04 Jul 2022 08:24:59 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 en20-20020a056402529400b0043a6a7048absm1486670edb.95.2022.07.04.08.24.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 08:24:59 -0700 (PDT)
Message-ID: <a62f5777-4adc-948b-690b-860a0665793c@redhat.com>
Date: Mon, 4 Jul 2022 17:24:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 04/18] block: Make 'bytes' param of blk_{pread,pwrite}()
 an int64_t
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>
References: <20220517113524.197910-1-afaria@redhat.com>
 <20220517113812.199312-1-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220517113812.199312-1-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

On 17.05.22 13:37, Alberto Faria wrote:
> For consistency with other I/O functions, and in preparation to
> implement them using generated_co_wrapper.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> ---
>   block/block-backend.c             | 6 +++---
>   include/sysemu/block-backend-io.h | 6 +++---
>   2 files changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


