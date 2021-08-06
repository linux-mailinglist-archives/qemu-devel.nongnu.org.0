Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA743E23A0
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Aug 2021 08:57:58 +0200 (CEST)
Received: from localhost ([::1]:51064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBtnp-0004ou-W3
	for lists+qemu-devel@lfdr.de; Fri, 06 Aug 2021 02:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBtki-000209-W4
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:54:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1mBtke-0000Ff-Gn
 for qemu-devel@nongnu.org; Fri, 06 Aug 2021 02:54:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628232880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MPjueZDVAioQhxg3A88shehx4oRS3WuQ3Tki8F1rDPg=;
 b=LRU3pT2b+SR7vVP7aZ/rLjGUC9a+O1NR2iOOYp7C+a3XxWQ31yklFEbWpSMtN5wR/Rj/rF
 s9cpJy0JMgxAdOU5QfLs2QfTYcXGizvEHIb3gbXN33EKSNmZzMzoPvlRJ2WSzTEwsZtmjU
 quTZCGw26Bw2XZERKNC94f36ZXafHeI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-Oi6yBnV1OHGHdi-1kMPj0g-1; Fri, 06 Aug 2021 02:54:38 -0400
X-MC-Unique: Oi6yBnV1OHGHdi-1kMPj0g-1
Received: by mail-wr1-f69.google.com with SMTP id
 q13-20020a05600000cdb02901545f1bdac1so2825102wrx.4
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 23:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=MPjueZDVAioQhxg3A88shehx4oRS3WuQ3Tki8F1rDPg=;
 b=Qsk2pVE0MtTCOPu38G72MGhK3rFKPtBLCqLayHYWQxyLjbhxxodfIaH6KItEzyOZei
 r7zCBUkRvzF+rR3hagdVGEXr0gABynP8XGC8HNJDFxCO2MspcfaClWK0aFPI6zZfuTyt
 1bSjPeL+cCRQwbwGilXOQD7/j3xGXATY5fRbfetJAn49tMKEEct5Pn8PJ0jhzp6DMdQe
 MRCMpNVs9GsvHkYqAaNKFS3YM5rimm3XeViOKiYItNXU2xmxKM7YkZwzCc2+WNklhQZX
 34pwVP976xVdGTLkkIbWgzaWKWcHituQAue8HUh/JTHSZBB5LvfKCHwuN0eYNMtik/oI
 wCQw==
X-Gm-Message-State: AOAM53046eGkOgNlBfj6PWIW6OPlqZDKlOVCnu9LCdKd9Uw2zMoED/S1
 fOzNhsI1HIt8ux5ImE498XE2YnXVAJbJ49TlYWzuOx3EDWR/fqzW2Lxaa6taNiFvqdzs3ffttT1
 z9c2/15jme0Posps=
X-Received: by 2002:a1c:f713:: with SMTP id v19mr1672068wmh.188.1628232877713; 
 Thu, 05 Aug 2021 23:54:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxNkfMYfYY/AaiPWz2Eksqweau+vnJTgzpyW+xm4+SC+398n7z6VNtOOr3gM0y/b5VbW8i+dQ==
X-Received: by 2002:a1c:f713:: with SMTP id v19mr1672058wmh.188.1628232877582; 
 Thu, 05 Aug 2021 23:54:37 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6104.dip0.t-ipconnect.de. [91.12.97.4])
 by smtp.gmail.com with ESMTPSA id s2sm7432154wmh.46.2021.08.05.23.54.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 23:54:37 -0700 (PDT)
Subject: Re: [PATCH for-6.2 5/6] s390x: event-facility: Use SCLP_EVENT_BUS
 macro
To: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org
References: <20210805193431.307761-1-ehabkost@redhat.com>
 <20210805193431.307761-6-ehabkost@redhat.com>
 <a6f20bc5-9639-0cfb-aa70-88e4a5e1d4af@redhat.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <8380a8b5-b790-ede6-6d04-61945e58c38d@redhat.com>
Date: Fri, 6 Aug 2021 08:54:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <a6f20bc5-9639-0cfb-aa70-88e4a5e1d4af@redhat.com>
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06.08.21 06:15, Thomas Huth wrote:
> On 05/08/2021 21.34, Eduardo Habkost wrote:
>> Use the SCLP_EVENT_BUS macro instead of manually calling
>> OBJECT_CHECK.
>>
>> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
>> ---
>> Cc: Cornelia Huck <cohuck@redhat.com>
>> Cc: Thomas Huth <thuth@redhat.com>
>> Cc: Halil Pasic <pasic@linux.ibm.com>
>> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
>> Cc: Richard Henderson <richard.henderson@linaro.org>
>> Cc: David Hildenbrand <david@redhat.com>
>> Cc: qemu-s390x@nongnu.org
>> Cc: qemu-devel@nongnu.org
>> ---
>>    hw/s390x/event-facility.c | 2 +-
>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
>> index 9f7883d6e20..bc706bd19b4 100644
>> --- a/hw/s390x/event-facility.c
>> +++ b/hw/s390x/event-facility.c
>> @@ -532,7 +532,7 @@ BusState *sclp_get_event_facility_bus(void)
>>        SCLPEventsBus *sbus;
>>    
>>        busobj = object_resolve_path_type("", TYPE_SCLP_EVENTS_BUS, NULL);
>> -    sbus = OBJECT_CHECK(SCLPEventsBus, busobj, TYPE_SCLP_EVENTS_BUS);
>> +    sbus = SCLP_EVENT_BUS(busobj);
>>        if (!sbus) {
>>            return NULL;
>>        }
>>
> 
> I think this could be merged with the previous patch. Anyway:
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

+1

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


