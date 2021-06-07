Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75C3D39D8B2
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 11:25:56 +0200 (CEST)
Received: from localhost ([::1]:58002 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqBW7-00053t-Gu
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 05:25:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqBU3-0003Ya-Sq
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 05:23:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lqBU2-00089g-7T
 for qemu-devel@nongnu.org; Mon, 07 Jun 2021 05:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623057825;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YLVBIvndC7BoyK21zUFz6kdqFiw1iYwXOAah5aC5ob0=;
 b=GULBoSXse/hUv4jXhQLq8lnfOIDWaI20vlL8uAKZ4dxl0tEoPOqHp70Rdr88ediGb7jkeU
 AFTw7BArpwaPuB3r0jJh7UzmeWGvOBpHB6XCdEyuBY5WBKO/2rWHhYXm9Lcd67od3CON+4
 UlNr1BBXetHrKidl8qlgP/vPOQWCS50=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-MQprBXg2MX-74WLRr_KVhA-1; Mon, 07 Jun 2021 05:23:44 -0400
X-MC-Unique: MQprBXg2MX-74WLRr_KVhA-1
Received: by mail-wm1-f72.google.com with SMTP id
 18-20020a05600c0252b029019a0ce35d36so6658643wmj.4
 for <qemu-devel@nongnu.org>; Mon, 07 Jun 2021 02:23:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YLVBIvndC7BoyK21zUFz6kdqFiw1iYwXOAah5aC5ob0=;
 b=aBM8Ilj12rhqtRUwQ8UPD8Jg4BYMmSUxJ5etYvTx1XEw2rDyV6cL6u/0ox2GkrBxM5
 hodlpUSulkQTPPp1ZoHVSpjv6EBLJBCfv4iz1WhLPV9MET2V7rXJnDwBKqQtCvo/oDEz
 N7Z79Zz7gmAzyR5C0NgY4tFkOWHkjox7T3a0aiHB6GXDYy6+iEBGUDCin7iwA1408XN3
 97QObvTv7TbtFdolmkWvymX2HvvY/I0KcsAfag/w39k537RJjwRyCj1gqEi6On7buC7C
 nwDrAxizbCmBXKS1jllJOtAjoIhG0YZuMScd5YoFalo4I3ssjhy52IFXHSUmp/jTh6ER
 aTBg==
X-Gm-Message-State: AOAM531hkg4/tD+8MOoElPK81620dfermjsiwd6cl3TgTTUx6NPnHRBu
 BFC1zJrqGk6tYd9T3kJYR6uhZRDEgC61JQ/+spLcbD0fF5UTuzBYfUAma1dqG8/Pe4eUgJZJvJj
 JK3QENGwhke2CniVP4O0lEGfznOMZSkYRhb3ahlJWlLR0b5xws3CUCi9gOgF0gQ/5WNQ=
X-Received: by 2002:a7b:c7c5:: with SMTP id z5mr15793482wmk.77.1623057822961; 
 Mon, 07 Jun 2021 02:23:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxtfhE7uWqvKxUXMOlza0Jo7n6J906MVFPXIV8F320xxjR9+j28t10MXNDITTvsqzUHMWeqAw==
X-Received: by 2002:a7b:c7c5:: with SMTP id z5mr15793453wmk.77.1623057822706; 
 Mon, 07 Jun 2021 02:23:42 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id r4sm7136580wmq.37.2021.06.07.02.23.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 02:23:42 -0700 (PDT)
Subject: Re: [PATCH v4 1/6] blkdebug: refactor removal of a suspended request
To: Eric Blake <eblake@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20210604100741.18966-1-eesposit@redhat.com>
 <20210604100741.18966-2-eesposit@redhat.com>
 <20210604161610.6we6yk2e77borfif@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b804f4ce-ff75-ba06-d3f4-fb288e38515d@redhat.com>
Date: Mon, 7 Jun 2021 11:23:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210604161610.6we6yk2e77borfif@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 04/06/21 18:16, Eric Blake wrote:
> On Fri, Jun 04, 2021 at 12:07:36PM +0200, Emanuele Giuseppe Esposito wrote:
>> Extract to a separate function.  Do not rely on FOREACH_SAFE, which is
>> only "safe" if the *current* node is removed---not if another node is
>> removed.  Instead, just walk the entire list from the beginning when
>> asked to resume all suspended requests with a given tag.
>>   
>> -    QLIST_FOREACH_SAFE(r, &s->suspended_reqs, next, next) {
>> +retry:
>> +    QLIST_FOREACH(r, &s->suspended_reqs, next) {
>>           if (!strcmp(r->tag, tag)) {
>> +            QLIST_REMOVE(r, next);
> 
> Isn't the whole point of using QLIST_FOREACH_SAFE the ability to call
> QLIST_REMOVE on an element in that list while still iterating?
> 
>>               qemu_coroutine_enter(r->co);
>> +            if (all) {
>> +                goto retry;
>> +            }
>>               return 0;
> 
> Oh, I see - you abandon the iteration in all control flow paths, so
> the simpler loop is still okay.  Still, this confused me enough on
> first read that it may be worth a comment, maybe:
> 
> /* No need for _SAFE, because iteration stops on first hit */

This is a bit confusing too because it sounds like not using _SAFE is an 
optimization, but it's actually wrong (see commit message).

Paolo


