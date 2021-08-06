Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6963E2265
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 06:16:23 +0200 (CEST)
Received: from localhost ([::1]:43544 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBrHS-0003BH-32
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 00:16:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBrG9-0002Lm-5a
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 00:15:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59005)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mBrG5-0005V9-St
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 00:15:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628223295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TsptsZIv8WVM+btR5gLxBqNmBuOZpH22zYrEm6c+WLg=;
 b=aKne5zQ3TQXs8ep6ShpnakJgMnMQNl5y+cebVU8MUkTQIqxkEC33puK/afpZC3cqXe1In9
 kW2HmR6sJcULZPKppQIJFsdVMP1BC5w58POYD1CGH/UOsKaa4hVBxml4UaTXyZLiNm4DSW
 B9xY+OiFChBqevo24Db83CKBsQZ6ruA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-8_6YNN6bMLi36cBnFbIS4w-1; Fri, 06 Aug 2021 00:14:53 -0400
X-MC-Unique: 8_6YNN6bMLi36cBnFbIS4w-1
Received: by mail-wm1-f69.google.com with SMTP id
 f25-20020a1c6a190000b029024fa863f6b0so3472833wmc.1
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 21:14:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TsptsZIv8WVM+btR5gLxBqNmBuOZpH22zYrEm6c+WLg=;
 b=Z98vB+wyyFjMMo+Iqz7TPEi6tRjzfz02KMU0YfN7epFFKQupS2KuZW2xOSzE1yfw05
 B3u3D+24HbT9wQoZV27EF3dJaFY3U5SVN3CxV+lTcoD76CHlkO2BReguiEi1KlA8Kypu
 IBzVWoyl4V1iCCWlmiqti8DdO/yTxV7WI/UaMXcihdYdzqpiCb0+nj7UILP3DVLABQam
 BI5k0plimVStrKO11nh5Pg/41adZWA5dNmawav9fM41vcK6iLxvBwmA0Hy01zUqk8oxy
 YHzC+yqvoeFu7wUnefgOJrgPHiKoPaNDxRQxjz/bpormXqdh54JcmJDKni+R6OBexwe0
 //DA==
X-Gm-Message-State: AOAM533mhQpP98vBX7NI3uMJpYEefsGyLNwmij1vlhe7T6MaiLWuzqyq
 NTkhlLQKXJJ/5yDdfXlrmwRWBe6qajm0Fc1GIME44ldyD0iLlzCbvcbUWQj9C51Ni0WHWwI5c6W
 pC/cRSUVnAGlSTK4=
X-Received: by 2002:adf:fe89:: with SMTP id l9mr8742985wrr.396.1628223292598; 
 Thu, 05 Aug 2021 21:14:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTEY6Zg8uGTDRYB8RJF9ISMBecFVYOLZiAGXr+mmvIB7iG9GVDI6DpYg5d+++19f1Qcfl1sw==
X-Received: by 2002:adf:fe89:: with SMTP id l9mr8742969wrr.396.1628223292426; 
 Thu, 05 Aug 2021 21:14:52 -0700 (PDT)
Received: from thuth.remote.csb
 (dynamic-046-114-147-107.46.114.pool.telefonica.de. [46.114.147.107])
 by smtp.gmail.com with ESMTPSA id m64sm8678704wmm.41.2021.08.05.21.14.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 21:14:51 -0700 (PDT)
Subject: Re: [PATCH for-6.2 v2] s390-sclp-events-bus: Use
 OBJECT_DECLARE_SIMPLE_TYPE
To: Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
References: <20210805193431.307761-5-ehabkost@redhat.com>
 <20210806024636.446074-1-ehabkost@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <e0a067ef-18db-f0fd-bba8-9cd7f19c4aee@redhat.com>
Date: Fri, 6 Aug 2021 06:14:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210806024636.446074-1-ehabkost@redhat.com>
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

On 06/08/2021 04.46, Eduardo Habkost wrote:
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

Reviewed-by: Thomas Huth <thuth@redhat.com>


