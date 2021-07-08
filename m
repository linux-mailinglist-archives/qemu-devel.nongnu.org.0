Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 862D23C183C
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:36:56 +0200 (CEST)
Received: from localhost ([::1]:58984 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XxH-00017t-Jh
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:36:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m1XUp-0001kN-HK
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:07:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m1XUn-0008Hd-CH
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 13:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625764048;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wDlUnz5DRFy9m+x2gCShnIlHOyMg0VhSptaR2VjxY6c=;
 b=EUp6ClXCmpOYM9eAfE6uANVzWQWK/En1wtGIba+lWHy2RrR3UHmogCxnBMfzHfpis9oN7f
 nw8hAkga134+WEuR471s0jlLgDgNVoTfvDzBRgbaX50eRoPLvBoclRGRedV2y4S6KvoJvM
 P3SlV0BwWukSHnT9SSb5HNf+yuI64DE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-152-fb7hnRB6PvWToF4QiBT26g-1; Thu, 08 Jul 2021 13:07:27 -0400
X-MC-Unique: fb7hnRB6PvWToF4QiBT26g-1
Received: by mail-wr1-f69.google.com with SMTP id
 r18-20020adfce920000b029013bbfb19640so675691wrn.17
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 10:07:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=wDlUnz5DRFy9m+x2gCShnIlHOyMg0VhSptaR2VjxY6c=;
 b=cuAdDUKjGykf+/uvo6Mxf09xtHgVlBVMNn1JWB4UReS3rRv3r7egjbTutrClyCtQLC
 ct8sEpo3KOPwrlxL0O1uTjmkC9b/Do/AnwrQmLvxynYr2LGSWmy9TktEz3njgK600gF5
 uYiPASQCjotJintryewv7kRK5fBpM5iTGUODDdL6xkKpTTCW4AAje3IjO6jau4+DgwHd
 JkdQJZIi8q5M0qdo+3mCnVfLFb8kmIOKz7yWnJD6G9shkg2r/xMQeFBAFmxYmsvX+a78
 SSE5x3IHDL5O05jXyjMcLK/aWo9xG1nQQcs5OwOgx0lJ5YTPCq9w8zED+p3rUOf0lWLo
 Ueng==
X-Gm-Message-State: AOAM533Mjcs1/s15Z371ZgPIqo2JnoYLV6fOJVKmAtw+M7GabnIJTz13
 3f1JoUv9hmNWCE1WTkO5OCH5XKb08XIgIbzhDvtxSmdO4tOJbOF9cgQ3VoZduTXztbYEiiDPzAQ
 df4y9cKoSlIrVNnc=
X-Received: by 2002:a05:600c:1911:: with SMTP id
 j17mr17861831wmq.172.1625764046024; 
 Thu, 08 Jul 2021 10:07:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxy0U38Mxo7Wo+dZ09buBJrgTrJYQfJH5NxFnZr8OG1JzUk5nO18tLToXqLWMuE82Lrhs+Svg==
X-Received: by 2002:a05:600c:1911:: with SMTP id
 j17mr17861815wmq.172.1625764045869; 
 Thu, 08 Jul 2021 10:07:25 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id i2sm9895463wmq.43.2021.07.08.10.07.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 10:07:25 -0700 (PDT)
Subject: Re: [PATCH v1] migration: fix typo in mig_throttle_guest_down comment
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Olaf Hering <olaf@aepfle.de>
References: <20210708162159.18045-1-olaf@aepfle.de> <YOcpogHz4GMigdwp@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <5496d76e-9ae6-7b8c-6656-43bd3e2da9bf@redhat.com>
Date: Thu, 8 Jul 2021 19:07:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YOcpogHz4GMigdwp@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 6:36 PM, Dr. David Alan Gilbert wrote:
> * Olaf Hering (olaf@aepfle.de) wrote:
>> Fixes commit 3d0684b2ad82a5dde68e3f08b0d7786dccaf619c ("ram: Update
>> all functions comments")
>>
>> Signed-off-by: Olaf Hering <olaf@aepfle.de>
>> ---
>>  migration/ram.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 723af67c2e..88ff34f574 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -600,7 +600,7 @@ static size_t save_page_header(RAMState *rs, QEMUFile *f,  RAMBlock *block,
>>  }
>>  
>>  /**
>> - * mig_throttle_guest_down: throotle down the guest
>> + * mig_throttle_guest_down: throttle down the guest
> 
> Ah yes, Juan frequently throotles.

=)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


