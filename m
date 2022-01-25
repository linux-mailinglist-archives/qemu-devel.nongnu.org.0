Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73C6049B396
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 13:19:43 +0100 (CET)
Received: from localhost ([::1]:44930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCKnW-0001Q4-GZ
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 07:19:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nCKcj-0003HT-Mw
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:08:36 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nCKci-00011S-4U
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 07:08:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643112511;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E5A+m8ffqZdJPTvLFR47J52fbcBykUXBD8eoYzWyNJ4=;
 b=JM9y/BeBb9iW3cpQ3lEngncvOUMQ39CUF+heH9xMW2GTDQwi6Eww6unVelG0b/GV7Sb2TF
 bfG2h9+lU7YT9iRa4erHfDyg6/RvGaeiFLYg/gat8sVh0nWrFg4YOuEOh7yMDH8Tptzsm1
 TUxOc4EdX267N31x2UFxSqi43bT40Fo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-mBAQNA56Mmu81ENOcqq6kQ-1; Tue, 25 Jan 2022 07:08:30 -0500
X-MC-Unique: mBAQNA56Mmu81ENOcqq6kQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 t13-20020adfa2cd000000b001d09443ee4fso2961123wra.3
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 04:08:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=E5A+m8ffqZdJPTvLFR47J52fbcBykUXBD8eoYzWyNJ4=;
 b=dF2HQ6fCIR1ECJkNo6qwIqUojnilX2rFPKjbFuqwB7U9QI89bv95j8gHg7geIwIVKT
 F3vs06grTP2tJh7RsPE3Rj6Fu1pTo9AjtqXjHYZg9wxeCGiR2mS8nLu2I3mCWeebYuHl
 xF2ZKI7ATpnPJ1hzVHBpNzefJDLBR5uEIC1+d2N+0yy72886JsBkp8ErSnbcJ9iFGgOr
 CdL8zj8M6CCDVUwKEJ9m75MQL9AJzkCCie2voWVkjmRU1H7AGJQM+EVgLNOiPZwR4p5V
 6cSfrOsld7TxFsW+BTx6EGQ5TcbZWiEgHFK6m5h2ivCjlDgBSxHE0rJ2GtgKLtDiTdW8
 1Z9g==
X-Gm-Message-State: AOAM533Ed6RBjqrIbyRomu2QQcBMPmgmpAYatMjSgIXwi45vIE+eDUen
 UQZMpWbAA2EFb4eR7jUtrfYWivnUpEOYx4HU+JW1adT288aqcl5CoafU832GWQBiUAK8bqd2o54
 eZfKbr7BE1VS1QyQ=
X-Received: by 2002:adf:edc4:: with SMTP id v4mr7509848wro.12.1643112508688;
 Tue, 25 Jan 2022 04:08:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyluzCyqHR8140infgV7Sy80DOuxAT1s9FU9rOv03tvRH1qtlSXJHunN5qaMAYM5MbzjfOgTg==
X-Received: by 2002:adf:edc4:: with SMTP id v4mr7509831wro.12.1643112508419;
 Tue, 25 Jan 2022 04:08:28 -0800 (PST)
Received: from ?IPV6:2003:cb:c70f:8000:9797:8f:1ed9:7596?
 (p200300cbc70f80009797008f1ed97596.dip0.t-ipconnect.de.
 [2003:cb:c70f:8000:9797:8f:1ed9:7596])
 by smtp.gmail.com with ESMTPSA id x4sm17825652wrp.13.2022.01.25.04.08.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 04:08:27 -0800 (PST)
Message-ID: <2e2e4287-2063-ea47-c92b-0822b6910365@redhat.com>
Date: Tue, 25 Jan 2022 13:08:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH v1 1/2] virtio-mem: Warn if a memory backend with
 "prealloc=on" is used
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20220118150712.139953-1-david@redhat.com>
 <20220118150712.139953-2-david@redhat.com> <Ye/cwauVLyq3RSq7@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <Ye/cwauVLyq3RSq7@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Michal Privoznik <mprivozn@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25.01.22 12:19, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> "prealloc=on" for the memory backend does not work as expected, as
>> virtio-mem will simply discard all preallocated memory immediately again.
>> In the best case, it's an expensive NOP. In the worst case, it's an
>> unexpected allocation error.
>>
>> Instead, "prealloc=on" should be specified for the virtio-mem device only,
>> such that virtio-mem will try preallocating memory before plugging
>> memory dynamically to the guest.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> Why is this a warning rather than an error that stops creation of the
> device?

No strong opinion, an error might actually be better.

-- 
Thanks,

David / dhildenb


