Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 382773E226F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 06:18:41 +0200 (CEST)
Received: from localhost ([::1]:48054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBrJg-0006Bv-AL
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 00:18:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBrHK-0003aq-S1
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 00:16:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBrHJ-0006jy-G5
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 00:16:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628223371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Z2q0O73Rnjo0nRLlL1uLTDlYj8us30TN+xoXGMIxOxo=;
 b=GXef7pA0uSmonsV6rFaH+BPDVyLXk65LorhhNc5zspDAP0Y/C951Dw1Pr3bkDU7cDBMx/H
 wZOf77ALbZfT2JXvnrqQ/K/VeFncLLYv526S7zKRXg7mV0Vkrzhm50AsJg9VK/6CLjNm4Z
 kCPTN2ASC5I6F+8VI2dVpYBLF8PhFNw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-386-006cQX1gMT2CsGijkgys9Q-1; Fri, 06 Aug 2021 00:16:09 -0400
X-MC-Unique: 006cQX1gMT2CsGijkgys9Q-1
Received: by mail-wm1-f69.google.com with SMTP id
 a18-20020a05600c2252b02902531dcdc68fso3466227wmm.6
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 21:16:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Z2q0O73Rnjo0nRLlL1uLTDlYj8us30TN+xoXGMIxOxo=;
 b=JagnFEGaBiRlwAF9T+deg+vhcsleRFrbLVwwg9aCGR8nufXHihQoHUzhw+yhcgO3r2
 MPKFRoYd/mTSk8RLEWGP535NVpCsTaYVNH4afyTlCRydSeMuNPEZSuiBFCishrL2bzMe
 xe635hRAD7MOxvxlNlXgqKuZUdJ8jYokOsqQRIjKyDyxB3TdtbWJIgVaHflSqjY0B/QH
 k1etdVY5ebzf5w/axJg0JOV7q1pH5+d4wb2qsu5O2bADbyBlJA8Ng3hugvwXTF514gzz
 5guU0IrM6MywyAh7SueBw4x5HrACy6fQzm930xn0pT7SmKVzWHv19re9t5s8frdiJCAs
 pf5w==
X-Gm-Message-State: AOAM532rB3BwM9iRzri8lx4LfqTqxNVTYBzpK28u+EQ2vZLGfhlDGXBC
 VRU8qYuzeeNFLr7OqDucOfyTjobRGxhl+B038NGSRI8+aFUUun19HxkMG+nJeurtxh3APl4kEOk
 hkffUXjqQuSnlGCA=
X-Received: by 2002:a7b:cf2e:: with SMTP id m14mr18091031wmg.95.1628223368713; 
 Thu, 05 Aug 2021 21:16:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyCMMtm6tOavSFJ49d23Qocw7YTW/brdFGAt9FY65N0iosWtlQNiekOiMPpoLbEwk+fpCH6RQ==
X-Received: by 2002:a7b:cf2e:: with SMTP id m14mr18091016wmg.95.1628223368541; 
 Thu, 05 Aug 2021 21:16:08 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id f2sm8061297wrq.69.2021.08.05.21.16.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 21:16:08 -0700 (PDT)
Subject: Re: [PATCH for-6.2 3/6] s390-sclp-events-bus: Set instance_size
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20210805193431.307761-1-ehabkost@redhat.com>
 <20210805193431.307761-4-ehabkost@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <c9381bd4-2930-7127-571e-710fa00802a0@redhat.com>
Date: Fri, 6 Aug 2021 06:16:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210805193431.307761-4-ehabkost@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
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
Cc: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/08/2021 21.34, Eduardo Habkost wrote:
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

Reviewed-by: Thomas Huth <thuth@redhat.com>


