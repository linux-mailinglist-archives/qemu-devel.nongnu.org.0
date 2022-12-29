Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2E3658AD3
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 10:18:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAp2Q-0007Ut-1i; Thu, 29 Dec 2022 04:17:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pAp2O-0007Uk-8z
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:17:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pAp2M-0006DC-TA
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 04:17:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672305438;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KwGXLBT2rVXOmDYDjj2CltQWF6rjs34JKlgK30hYKuQ=;
 b=SHxcCBP3VHYYpBJNvtebkai2wQlxz1gZPlLBTA+6bRgb16FC4etUh9dpix0g2stJm+BAyH
 Gtlgwph82E8yYEcXpNFZBHbw/HZMhZfFIoMSF9E97ytlvCzSejAkdWubHqJzMmQ9W3MNE3
 d+Du8HmnKu/Cliq43dZDGFM+r4hdVHk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-474-7qAmb8TjOqaEHCenazubMw-1; Thu, 29 Dec 2022 04:17:16 -0500
X-MC-Unique: 7qAmb8TjOqaEHCenazubMw-1
Received: by mail-wm1-f71.google.com with SMTP id
 m7-20020a05600c4f4700b003d971a5e770so7408102wmq.3
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 01:17:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KwGXLBT2rVXOmDYDjj2CltQWF6rjs34JKlgK30hYKuQ=;
 b=B5jczvm+mrvxLZnoYMNV7jVQ2liyTFeyb98zLzHT/S6Xgxxpi7dDcYRoGhRtPHosg2
 vCyLM6P8WfquDj1dDq2NIFXvRUcluJVpddA+xzevcxeDmFuAKE5ciAuAq91ABGwN6O8X
 7KVSgzHG5fG2yxWTIjaZ6lQx0VpR/KiEhMg9EPlaNQxDE50vKvaZnv+CWOMpC8EqaraM
 4MMvrdsW7lot4yU+3wh4Og6JWQXOcPiRm4GszGYtN+lEjWwIFxKj6qYYBuKtbz+kdiBQ
 uQmcKtVcxI1BNtn9sbTGvW2iu9tx+Czqg2LnyCjTVbmoXjGVkP2v23m0WHlZn+Mume8M
 0osg==
X-Gm-Message-State: AFqh2kpm5GRlXTm0HqGvLVTT8GjAox3FIoQyboC6l9AGALbwppHYHmOm
 iq4yCWtnP353vjmnWbvkgmfhakMWIsfhXXDsZMXNBF0hyR4ppk1xX5uEQd4eiEyKrr4w+9w5uoP
 jl6bt8ushsBaziDM=
X-Received: by 2002:a05:600c:4fcf:b0:3cf:360e:f37d with SMTP id
 o15-20020a05600c4fcf00b003cf360ef37dmr19317099wmq.22.1672305434878; 
 Thu, 29 Dec 2022 01:17:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvTBIA/wR6bjRoWFATTu0ZwA2mImkupCgP7FReyB6P0jhYyXoQGOlXhml1OQVoRQsKwCoF93w==
X-Received: by 2002:a05:600c:4fcf:b0:3cf:360e:f37d with SMTP id
 o15-20020a05600c4fcf00b003cf360ef37dmr19317070wmq.22.1672305434513; 
 Thu, 29 Dec 2022 01:17:14 -0800 (PST)
Received: from [192.168.0.5] (ip-109-42-113-203.web.vodafone.de.
 [109.42.113.203]) by smtp.gmail.com with ESMTPSA id
 f6-20020a05600c154600b003d98a7aa12csm10490725wmg.16.2022.12.29.01.17.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Dec 2022 01:17:13 -0800 (PST)
Message-ID: <c95d4c84-3b91-2d11-313b-a1733fd16a61@redhat.com>
Date: Thu, 29 Dec 2022 10:17:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v2 1/5] exec/memory: Expose memory_region_access_valid()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Xu <peterx@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, Halil Pasic <pasic@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>
References: <20221217152454.96388-1-philmd@linaro.org>
 <20221217152454.96388-2-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20221217152454.96388-2-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.147, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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

On 17/12/2022 16.24, Philippe Mathieu-Daudé wrote:
> Instead of having hardware device poking into memory
> internal API, expose memory_region_access_valid().
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/s390x/s390-pci-inst.c       | 2 +-
>   include/exec/memory-internal.h | 4 ----
>   include/exec/memory.h          | 4 ++++
>   3 files changed, 5 insertions(+), 5 deletions(-)

Reviewed-by: Thomas Huth <thuth@redhat.com>


