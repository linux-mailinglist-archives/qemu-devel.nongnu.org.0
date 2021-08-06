Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C9123E239E
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 08:56:21 +0200 (CEST)
Received: from localhost ([::1]:48928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBtmG-0003Jd-7f
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 02:56:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBtkM-0001WX-CN
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:54:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57093)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBtkI-0008On-2T
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:54:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628232857;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EQGZaSCpBEbpVQfgbaqb11Ew0BtO+qQdm7zihcDp5L0=;
 b=WM/N8Ybltayh8wmrioLcLe2fVQEtDXYEG4qLy80i9iUapuw9E+3e2ghejSmogfTsuc3Hbg
 zmCtyZ8mhmPKmBClLCYWiFDcxaXP0lfhDQWxFiXZpzyFmF9B8p9+e1C2+TC9o0M6hFTQry
 Ut/fwmjiUXDxD8sc+74S9hZdZBHg95Y=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-eeYuSpMQPSmP5Px7wIx_-g-1; Fri, 06 Aug 2021 02:54:16 -0400
X-MC-Unique: eeYuSpMQPSmP5Px7wIx_-g-1
Received: by mail-wm1-f72.google.com with SMTP id
 21-20020a05600c0255b02902571fa93802so2702790wmj.1
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 23:54:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EQGZaSCpBEbpVQfgbaqb11Ew0BtO+qQdm7zihcDp5L0=;
 b=qIpQf+0HIHPoOgVvXnBEO5FyGMwRGdsDRfEr6nYH3O3jkIko53K0vn2kcSiQNvYZyJ
 bY45kU5JW3TpwING15ZFjHWUFlNGLQgYBK70y0kGCF8VC8AFy07TuRwJyY05AxyV/mct
 cl2llgvbpf3xgV3ogQfacfDkVS6VfLfL/2mvIPHCFqGVYSf2XQ0ZPYHms0GcH8qzLInC
 f6NK21tKRsY8CQS23rGNR0SA471MxuJdlUCJteLqW7RTtmh1Oq93dLvZhQanY28Upama
 6tYDONanfl4wo2nHqcQxWbdPLHb0sk6f9C/cmDgrjU4hnD2vJhfsib5CjkZPTKpqsYjJ
 no2A==
X-Gm-Message-State: AOAM5339jr1U9G1jpQOnoJoGf8gci/H1r9GVzDujkXJvhg3C/V8+KHxn
 d+2I1nuUwHqn0/BogWGbLeY3dfdKCxZnfDqfyXFgpeKXC1V9b3VRIUMyskfJzdeIffRO36Zcsgh
 3vDfA8r6tGtg0Wrs=
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr9025057wry.241.1628232855142; 
 Thu, 05 Aug 2021 23:54:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHC6teEBxwZdfqn0I3pi3GL+UhiHHhq4nTpXi+lUNVNAF9LyQ+uSK6fb7ngUTkyPDkksHI9Q==
X-Received: by 2002:a05:6000:2c6:: with SMTP id
 o6mr9025039wry.241.1628232854968; 
 Thu, 05 Aug 2021 23:54:14 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id p2sm8754195wrr.21.2021.08.05.23.54.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 23:54:14 -0700 (PDT)
Subject: Re: [PATCH for-6.2 v2] s390-sclp-events-bus: Use
 OBJECT_DECLARE_SIMPLE_TYPE
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20210805193431.307761-5-ehabkost@redhat.com>
 <20210806024636.446074-1-ehabkost@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <68e88226-c4d7-f4b6-ce6a-065fefe1871b@redhat.com>
Date: Fri, 6 Aug 2021 08:54:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806024636.446074-1-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.132, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 04:46, Eduardo Habkost wrote:
> We have a SCLPEventsBus struct type defined, but no QOM type
> checkers are declared for the type.
> 
> Use OBJECT_DECLARE_SIMPLE_TYPE to declare the struct type and
> have a SCLP_EVENT_BUS typecast wrapper defined.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v1 -> v2:
> * v1 was previously submitted as part of series:
>    [PATCH for-6.2 0/6] qom: Fix broken OBJECT_CHECK usage
>    at https://lore.kernel.org/qemu-devel/20210805193431.307761-5-ehabkost@redhat.com
> * Fix typo (s/SCLP_EVENT_BUS/SCLP_EVENTS_BUS/)
> 
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>   hw/s390x/event-facility.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
> index ed92ce510d9..4bfd0b194b4 100644
> --- a/hw/s390x/event-facility.c
> +++ b/hw/s390x/event-facility.c
> @@ -328,6 +328,7 @@ static void write_event_mask(SCLPEventFacility *ef, SCCB *sccb)
>   /* qemu object creation and initialization functions */
>   
>   #define TYPE_SCLP_EVENTS_BUS "s390-sclp-events-bus"
> +OBJECT_DECLARE_SIMPLE_TYPE(SCLPEventsBus, SCLP_EVENTS_BUS)
>   
>   static const TypeInfo sclp_events_bus_info = {
>       .name = TYPE_SCLP_EVENTS_BUS,
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


