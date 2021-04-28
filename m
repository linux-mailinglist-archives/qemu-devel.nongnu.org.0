Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C25536D57B
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 12:10:50 +0200 (CEST)
Received: from localhost ([::1]:43272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbh9c-0002vk-Nw
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 06:10:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbh6Y-000274-H8
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:07:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48344)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lbh6V-0006I8-DB
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 06:07:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619604453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O7dodyS6i7EwHDsK8Op0sVz3vyWfusD5tCXvXRiaMZE=;
 b=M2lILl4anBePBOg1/5a8bnuLgcAn1pWF/C0ISkI1WY41unlJKZPax6CiG2nsDljpHz4lee
 bjy7eVgWhdxJol7k+L2/K8l3dJVC7lZefSpaLTq6xXc1WOkgnPwGV90i8nVNMFJlioq5pl
 e2mI9GMkCojq+yW66lmP1xHsxO67xfg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-374-uCL8iazOON6uCtaR3pBitQ-1; Wed, 28 Apr 2021 06:07:32 -0400
X-MC-Unique: uCL8iazOON6uCtaR3pBitQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 o18-20020a1ca5120000b02901333a56d46eso4931013wme.8
 for <qemu-devel@nongnu.org>; Wed, 28 Apr 2021 03:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=O7dodyS6i7EwHDsK8Op0sVz3vyWfusD5tCXvXRiaMZE=;
 b=rKmf3AhLyzDk/UfHd+qRFXiOcWZdF6WYAyQ2IOjQkx96Xu1YH4TGxQKMyflu66Uywz
 La7J4c2Jf2sjO4fm3MekEaSf0+GS3jssj5x1TeKlc/a2R3ZOOq5rdnlDIzCx+OewTV8T
 J7PvxPSwkXPoLpq7e888+P3O0sSSZylDGttHELh4XrXZ3Zk+YG0RL+IK0z80D3z6s8np
 WOx5/D1NBQCYKFg/fSDaW3dOEkdgwBvSJTnn+t7SSBeIcTuDUZb7NdUVQdyuRM8nJLT4
 2izDFmhbcRsiRlCywamvPqhD22pfTbOXmqXfaYr4rJKozvsTZByKi2pSclqPMbrT6qWD
 qfdQ==
X-Gm-Message-State: AOAM531I261jB5FrcRjHIIoRHtasehbfsiWGXIWwYr/6FZfYdXtojW4I
 kdIv3cmCHjAyd57Yc51Ak55LVjyJdZvXp7Bq/+L6KN+0q6Ab7u2rswiIhXqg0q3rVEYjr8phBUp
 VInTHyxsndy3VcXg=
X-Received: by 2002:adf:f991:: with SMTP id f17mr16087885wrr.160.1619604450777; 
 Wed, 28 Apr 2021 03:07:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwo1XpJ5bfT7mG8Xg1klQHw2IwsvFWviH2FEbQ/c6PMlJcORE51keumpo9C/jUsTquSGQu01Q==
X-Received: by 2002:adf:f991:: with SMTP id f17mr16087855wrr.160.1619604450505; 
 Wed, 28 Apr 2021 03:07:30 -0700 (PDT)
Received: from ?IPv6:2003:d8:2f38:2400:62f4:c5fa:ba13:ac32?
 (p200300d82f38240062f4c5faba13ac32.dip0.t-ipconnect.de.
 [2003:d8:2f38:2400:62f4:c5fa:ba13:ac32])
 by smtp.gmail.com with ESMTPSA id x9sm7671781wrt.13.2021.04.28.03.07.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 28 Apr 2021 03:07:30 -0700 (PDT)
Subject: Re: [RFC v3 01/13] hw/s390x: rename tod-qemu.c to tod-tcg.c
To: Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210422115430.15078-1-cfontana@suse.de>
 <20210422115430.15078-2-cfontana@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <a8a18b6d-dc2d-3af1-7fd4-cf5acd811241@redhat.com>
Date: Wed, 28 Apr 2021 12:07:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210422115430.15078-2-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.04.21 13:54, Claudio Fontana wrote:
> we stop short of renaming the actual qom object though,
> so type remains TYPE_QEMU_S390_TOD, ie "s390-tod-qemu".
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> ---
>   hw/s390x/{tod-qemu.c => tod-tcg.c} | 0
>   hw/s390x/meson.build               | 2 +-
>   2 files changed, 1 insertion(+), 1 deletion(-)
>   rename hw/s390x/{tod-qemu.c => tod-tcg.c} (100%)
> 
> diff --git a/hw/s390x/tod-qemu.c b/hw/s390x/tod-tcg.c
> similarity index 100%
> rename from hw/s390x/tod-qemu.c
> rename to hw/s390x/tod-tcg.c
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index 327e9c93af..02e81a9467 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -16,7 +16,7 @@ s390x_ss.add(files(
>     'sclp.c',
>     'sclpcpu.c',
>     'sclpquiesce.c',
> -  'tod-qemu.c',
> +  'tod-tcg.c',
>     'tod.c',
>   ))
>   s390x_ss.add(when: 'CONFIG_KVM', if_true: files(
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


