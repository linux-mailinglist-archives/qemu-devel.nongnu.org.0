Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B18450424
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Nov 2021 13:10:35 +0100 (CET)
Received: from localhost ([::1]:54068 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmaok-0000If-2U
	for lists+qemu-devel@lfdr.de; Mon, 15 Nov 2021 07:10:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mmanJ-0007a2-Vv
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:09:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28829)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mmanH-0006df-LJ
 for qemu-devel@nongnu.org; Mon, 15 Nov 2021 07:09:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636978141;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kl9lkZye9JWcEHvyaZT7gPsl+YesQWWkCyoCPI6Hn5k=;
 b=WChX8C5aQbgnm+R0vG+4ccLpRNLKdJSAZIhiFXqPcuwQ6pqDEdyui2to7bLT6wTliROCDc
 unof/khX/rizsQ40ucAlxEm7jAJvmzOY7bLA5mqP3suJnSD9eGxz5joi9rLyZa+0G659rg
 rfwSH6/j1XOO4ZoEstxkQRr3X4SR+9I=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-zwAC1Pz-OsK9hUs9O1eewg-1; Mon, 15 Nov 2021 07:09:00 -0500
X-MC-Unique: zwAC1Pz-OsK9hUs9O1eewg-1
Received: by mail-ed1-f72.google.com with SMTP id
 d11-20020a50cd4b000000b003da63711a8aso13728285edj.20
 for <qemu-devel@nongnu.org>; Mon, 15 Nov 2021 04:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=kl9lkZye9JWcEHvyaZT7gPsl+YesQWWkCyoCPI6Hn5k=;
 b=pR0XHbyf1NZE7E2ktsgo2MSy3gI1tbAN0y7HoNQlrbKFlEkMVaFeMgBiK+PZOSawOb
 cY+1b7aV+Y8o8c5WCLhXt5GO3TNo4JxrwW6pz7M9JSLRhqMmyh4LS604b6OnDHEvQE5g
 IvWYmpBTAMye+xt4Pbh/d6XQgGHSn87hO0kpLcogbY6CZ5SpGWtFqqqFb9nxkeBfUzqc
 C8mDG0RHmWL4F0nMP1NwTv1TWyIUk7n0Y4d9X8GM0bxJxbxdY6i4SvLsBPxJBYqoqOab
 LPwv+ba16nBgH3ZxiwpzoZwx8WnnM027adKMgTztvMmoGyGjLKuUGQODqRe4A6no0YBr
 lHXw==
X-Gm-Message-State: AOAM533WNxFlsfnxv0RSj0R4ey4yIpKFWb2t/ZLfmMDkUUmWr7dVJ39Z
 D2sb9wupGtMk/RkbUvc8cpsPLSJLPSdZ6E8ljtzGPNt0Xf03oe5eh5wWRVYTZSATP7skObVNVVK
 Yoe2kxRakrDNrpj0=
X-Received: by 2002:a05:6402:268d:: with SMTP id
 w13mr5381853edd.257.1636978138890; 
 Mon, 15 Nov 2021 04:08:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxZYXZ9DhazMsGZGWG+6V1I4Q7LPPOx3M0hpysbtYv8GOL28yNqSrj53/4R+59pnGoobAlySg==
X-Received: by 2002:a05:6402:268d:: with SMTP id
 w13mr5381786edd.257.1636978138625; 
 Mon, 15 Nov 2021 04:08:58 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id m11sm7585362edd.58.2021.11.15.04.08.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Nov 2021 04:08:58 -0800 (PST)
Message-ID: <3d5e9341-d4b5-9e89-83f7-09932163bf05@redhat.com>
Date: Mon, 15 Nov 2021 13:08:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 02/25] include/block/block: split header into I/O and
 global state API
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-3-eesposit@redhat.com>
 <7cf8a28a-5765-cff8-192e-0fe92fc1ac45@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <7cf8a28a-5765-cff8-192e-0fe92fc1ac45@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -57
X-Spam_score: -5.8
X-Spam_bar: -----
X-Spam_report: (-5.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.278, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> +/*
>> + * I/O API functions. These functions are thread-safe, and therefore
>> + * can run in any thread as long as the thread has called
>> + * aio_context_acquire/release().
>> + */
>> +
>> +int bdrv_replace_child_bs(BdrvChild *child, BlockDriverState *new_bs,
>> +                          Error **errp);
> 
> Why is this function here?  Naïvely, I would’ve assumed as a 
> graph-modifying function it should be in block-global-state.h.
> 
> I mean, perhaps it’s thread-safe and then it can fit here, too. Still, 
> it surprises me a bit to find this here.
> 
> Hanna
> 

Agree, I also tested this, it can go in global state. Will fix that.

Thank you,
Emanuele


