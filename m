Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45BB13AAA9E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 07:06:36 +0200 (CEST)
Received: from localhost ([::1]:40702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltkEc-0002m9-Km
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 01:06:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltkDN-0001w1-VS
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 01:05:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1ltkDK-0002YQ-J2
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 01:05:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623906312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8bfXcpm72Xg13Bs9amDTX2Tlz2n/bv4a6nJMWR9eKA=;
 b=AxMUoZUHaJcYo3301OJ3ct1MAbZB7S/RFeYTsqGd7hgGxjzhidW5QcNCigkKaO9RZ8nQmy
 qdKx6jfiWNZX9dMdUixYN//tRqw3fdShzzUPtbApkZbtJ4F0gC2J5xs7gn220NVYavcsR1
 LPxKGpotepieyiIs9Hsmsz94PRD4TYk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-104-S9M-TnsMOyOv8HfC-xiaRA-1; Thu, 17 Jun 2021 01:05:09 -0400
X-MC-Unique: S9M-TnsMOyOv8HfC-xiaRA-1
Received: by mail-ed1-f71.google.com with SMTP id
 z16-20020aa7d4100000b029038feb83da57so864439edq.4
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 22:05:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=K8bfXcpm72Xg13Bs9amDTX2Tlz2n/bv4a6nJMWR9eKA=;
 b=na/k00z7XefGvHfeWptxckxytYc1wyv1c05kvgJABAGqJZPM5tfviiab4vim00Vb6r
 F1xqCgnUf9hssfcM3QcSXIFqORXqJIdox+NyTwg7s6GsN+LXTOfGsC42pteWywXF1jdt
 qCqY7zZGHH7Ug9KrHwBhd8/0dAWJdm914LPkeYFvVkrKeSuz5RZ4IEj3+yk2Z++PphXf
 R6OcX5FLXsP3IsaECt3S/QxH76tLgaxZRHglLMJmlh18qPRgi3K4vZmzE5GpS9ej8d+p
 hWi+0qUvACMfgh9pje/dEKFUC3QSVwtEuzVcdoOu0PGinXWQ5ClqeRgS+6WcTejZh1CK
 Q05Q==
X-Gm-Message-State: AOAM533irWGTrUYwnWkpB9uzoo2ai4uX8mQJazP2GF+Mg6cBESehRiPe
 9hoK9xiNqdh+Q5/HGX9RLgA96Ipetj7rnuxzQZYnL1228admWZM2EHk8Vk5ESd28CB2sYdH7+US
 CfCUhTTCzTX2Q5Mk=
X-Received: by 2002:a50:ce0b:: with SMTP id y11mr4107780edi.356.1623906308599; 
 Wed, 16 Jun 2021 22:05:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz/mTXDg+rMbDuosv6bM2kqsYefnN+HB62wF9sh1PdPPw/QRbdW1IAlY6ivAx7OoKC73ttVvw==
X-Received: by 2002:a50:ce0b:: with SMTP id y11mr4107757edi.356.1623906308377; 
 Wed, 16 Jun 2021 22:05:08 -0700 (PDT)
Received: from thuth.remote.csb (pd9575d16.dip0.t-ipconnect.de. [217.87.93.22])
 by smtp.gmail.com with ESMTPSA id i12sm3358380edx.13.2021.06.16.22.05.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Jun 2021 22:05:07 -0700 (PDT)
Subject: Re: [PATCH v3 2/4] s390x/css: Split out the IRB sense data
To: Eric Farman <farman@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org
References: <20210616014749.2460133-1-farman@linux.ibm.com>
 <20210616014749.2460133-3-farman@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <215aab5d-d9e1-9c7e-d7c9-21a5ce611aad@redhat.com>
Date: Thu, 17 Jun 2021 07:05:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210616014749.2460133-3-farman@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.17, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Matthew Rosato <mjrosato@linux.ibm.com>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/06/2021 03.47, Eric Farman wrote:
> Let's move this logic into its own routine,
> so it can be reused later.
> 
> Signed-off-by: Eric Farman <farman@linux.ibm.com>
> ---
>   hw/s390x/css.c | 19 ++++++++++++-------
>   1 file changed, 12 insertions(+), 7 deletions(-)
> 
> diff --git a/hw/s390x/css.c b/hw/s390x/css.c
> index 8be21efb13..554c9083fd 100644
> --- a/hw/s390x/css.c
> +++ b/hw/s390x/css.c
> @@ -1639,6 +1639,17 @@ static void copy_irb_to_guest(IRB *dest, const IRB *src, const PMCW *pmcw,
>       *irb_len = sizeof(*dest);
>   }
>   
> +static void build_irb_sense_data(SubchDev *sch, IRB *irb)
> +{
> +    int i;
> +
> +    /* Attention: sense_data is already BE! */
> +    memcpy(irb->ecw, sch->sense_data, sizeof(sch->sense_data));
> +    for (i = 0; i < ARRAY_SIZE(irb->ecw); i++) {
> +        irb->ecw[i] = be32_to_cpu(irb->ecw[i]);
> +    }
> +}
> +
>   int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
>   {
>       SCHIB *schib = &sch->curr_status;
> @@ -1669,14 +1680,8 @@ int css_do_tsch_get_irb(SubchDev *sch, IRB *target_irb, int *irb_len)
>           /* If a unit check is pending, copy sense data. */
>           if ((schib->scsw.dstat & SCSW_DSTAT_UNIT_CHECK) &&
>               (schib->pmcw.chars & PMCW_CHARS_MASK_CSENSE)) {
> -            int i;
> -
>               irb.scsw.flags |= SCSW_FLAGS_MASK_ESWF | SCSW_FLAGS_MASK_ECTL;
> -            /* Attention: sense_data is already BE! */
> -            memcpy(irb.ecw, sch->sense_data, sizeof(sch->sense_data));
> -            for (i = 0; i < ARRAY_SIZE(irb.ecw); i++) {
> -                irb.ecw[i] = be32_to_cpu(irb.ecw[i]);
> -            }
> +            build_irb_sense_data(sch, &irb);
>               irb.esw.erw = ESW_ERW_SENSE | (sizeof(sch->sense_data) << 8);
>           }
>       }
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


