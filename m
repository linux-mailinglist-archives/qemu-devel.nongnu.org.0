Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1683E23A4
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 09:00:11 +0200 (CEST)
Received: from localhost ([::1]:53222 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBtpz-0006Jq-1l
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 03:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41094)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBtkz-0002C9-Vf
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:55:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBtky-0000XQ-DP
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:55:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628232899;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EPYd7yVtNgJqIH5lsp7lo9jECNpPGj6lM3N5jYG6VcQ=;
 b=YjuWA4iYWY8deFf8bsUOmmY31nvwO8hGnGUWAOK9oxrcv6gLE6KN91Yjsf98S4s/B/fCtw
 PyzJa5AH28APhTy2+RMLHBovV4bdNBlceilL42MaPuRqw/PzzM8SB1ZSTP3BwwXVgTEk+x
 1xn+tLQm5URD40A+T+O7ylcMpkcPk6w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-396-R8QLmQhSOhaJvhT3P5RQGw-1; Fri, 06 Aug 2021 02:54:58 -0400
X-MC-Unique: R8QLmQhSOhaJvhT3P5RQGw-1
Received: by mail-wm1-f72.google.com with SMTP id
 y186-20020a1c32c30000b02902b5ac887cfcso2039630wmy.2
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 23:54:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=EPYd7yVtNgJqIH5lsp7lo9jECNpPGj6lM3N5jYG6VcQ=;
 b=dzXg71P1keyWKIWCZ+S/rG4/cXhCngugr0wd11vxHp42TUjqJJRHjXP1qov+g/FhRR
 dGVLwzf/N822lith7SafcP37d6fN8AYbvpfpUw/l5vIKs/EC4w/N/prKuHAIGNFFZUvo
 2L41zD5/qk1zrmYkZByj1Io5TltxwhGaSymZPnyzj2mIOx/j+Bhm3kZTvvMSXKwaOwVP
 1kGUXaGXxmZ58RVdJNbcEOUmOXHoBjK2L0AcB+5gDQxIAwLKpA6D5a6k6y9h/hy9Iy3y
 B3NHSzMh6nApqu06i7Z1L+58rPtOOWkVbOfU3IuwhHrudcv6I5h7BuSYptL+PwdAmUiX
 Cukg==
X-Gm-Message-State: AOAM531rYcbR0Wf9Ueu1Nnfh/W+om39qs42rMLCD2nUY/0Obv3upuvj8
 lbElkK8w8WBXlyL1/lj5iZKmmaGhYwqRhuPpleMB6URjLbONHFZd02dC/fQS+xtYnJy9vkHHXYp
 l/yvGCYsEB3M/yIo=
X-Received: by 2002:adf:ea52:: with SMTP id j18mr9081555wrn.294.1628232897632; 
 Thu, 05 Aug 2021 23:54:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQD46rqtXVpzexJ0a8uMduZqFqYY+YQgTScJlnUlY5Ac8ilY2aFdHnmr6PJMmOBp4niLeaVg==
X-Received: by 2002:adf:ea52:: with SMTP id j18mr9081543wrn.294.1628232897511; 
 Thu, 05 Aug 2021 23:54:57 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id w18sm9245349wrg.68.2021.08.05.23.54.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 23:54:57 -0700 (PDT)
Subject: Re: [PATCH for-6.2 3/6] s390-sclp-events-bus: Set instance_size
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20210805193431.307761-1-ehabkost@redhat.com>
 <20210805193431.307761-4-ehabkost@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <9f7149c9-eb0e-b486-f967-e07df477351e@redhat.com>
Date: Fri, 6 Aug 2021 08:54:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210805193431.307761-4-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
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

On 05.08.21 21:34, Eduardo Habkost wrote:
> We have a SCLPEventsBus struct defined, but the struct is not
> used at the TypeInfo definition.  This works today but will break
> silently if anybody adds a new field to SCLPEventsBus.
> 
> Set instance_size properly to avoid problems in the future.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Cc: Cornelia Huck <cohuck@redhat.com>
> Cc: Thomas Huth <thuth@redhat.com>
> Cc: Halil Pasic <pasic@linux.ibm.com>
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Cc: Richard Henderson <richard.henderson@linaro.org>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: qemu-s390x@nongnu.org
> Cc: qemu-devel@nongnu.org
> ---
>   hw/s390x/event-facility.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
> index ed92ce510d9..0a65e16cdd9 100644
> --- a/hw/s390x/event-facility.c
> +++ b/hw/s390x/event-facility.c
> @@ -332,6 +332,7 @@ static void write_event_mask(SCLPEventFacility *ef, SCCB *sccb)
>   static const TypeInfo sclp_events_bus_info = {
>       .name = TYPE_SCLP_EVENTS_BUS,
>       .parent = TYPE_BUS,
> +    .instance_size = sizeof(SCLPEventsBus),
>   };
>   
>   static void command_handler(SCLPEventFacility *ef, SCCB *sccb, uint64_t code)
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


