Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E130452EE0
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 11:18:44 +0100 (CET)
Received: from localhost ([::1]:43174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mmvY3-0006G8-H7
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 05:18:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:50184)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mmvWA-0004L6-Tl
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:16:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47764)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mmvW9-0007fF-2E
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 05:16:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637057804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HAxk7nCPfOFTyy0amnympGQPQg9tBbw/sDQXjmGfQZo=;
 b=HhZgMCtJlXL/51qupV0KkdADvYYHfVyNzGZ1DSIZmd+uD1vRUyHt7wa9uE+MMENqYVzwpy
 nJSOvemZZGAHp2Q86Ub/JLdJ9t4h//7c71sqTlGY6qP1DXEphzIgbP2u4dPdFL//3y+Rc0
 WHRT699h3fheYxTdlUlwOQLttP17RHU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-AZafrNObOFSIQezSQaJNOQ-1; Tue, 16 Nov 2021 05:16:41 -0500
X-MC-Unique: AZafrNObOFSIQezSQaJNOQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 y9-20020a1c7d09000000b003316e18949bso7144522wmc.5
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 02:16:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HAxk7nCPfOFTyy0amnympGQPQg9tBbw/sDQXjmGfQZo=;
 b=ZNvRsj7WZI6M7oltWD3PQBFAh7uJRaq6Sk/wdTgYlwzPAZHwQFTvtWeNYy/Eg8Q+WE
 8DIL123kTVSWqI3dxmZ6F3Ivw4rx//5SHJjqQFSHRTjbgkrBYdF1IUABSvsJEnTgA9up
 etmee+ctoiEpkjNNHu8o+4k2uKL5I40m6E7kewDBSp8kfMlWNfsVlV4tBY2/bsbX+TOa
 KNE6LHC76iHhzl1+2zug9nLkE/psiT+MTDm2VvO/p8nqUHJLMyN7sairpsfjmReMoB+E
 KaT1ABsO2CW1j8XWQHR/uQFrxgNpmGWREXEdbvqjyp2I+ltVbQxx6jPFMC41XGESLEii
 ZJnA==
X-Gm-Message-State: AOAM532VaU2b27OLdb30MKsFdTHiB2OjW6Wo5Cp/Y3cgfox/Yi8SBIxU
 DtYztYj0VT14R6w+yWuWhJDLa8xEdD6nLixgeE7D0HUITyf0PuI9bUuT7WZqKlgnwDdm34hHk9M
 vh4BB/2cdBy8KE6U=
X-Received: by 2002:adf:a489:: with SMTP id g9mr7932059wrb.235.1637057799994; 
 Tue, 16 Nov 2021 02:16:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxsy9O1bgBU77iYciMZqbN6UYbW39RtdAmBQNDqz3OnQzwHI/gy451rIUk8S1fRdo8IbrVmtA==
X-Received: by 2002:adf:a489:: with SMTP id g9mr7932048wrb.235.1637057799863; 
 Tue, 16 Nov 2021 02:16:39 -0800 (PST)
Received: from [192.168.149.186]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id g18sm2359564wmq.4.2021.11.16.02.16.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Nov 2021 02:16:39 -0800 (PST)
Message-ID: <68cea91c-1906-ab44-9e41-ef5a9394b0d0@redhat.com>
Date: Tue, 16 Nov 2021 11:16:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 04/25] include/sysemu/block-backend: split header into
 I/O and global state (GS) API
To: Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-5-eesposit@redhat.com>
 <4fad8327-ab56-970b-7aed-9565285904c2@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <4fad8327-ab56-970b-7aed-9565285904c2@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -48
X-Spam_score: -4.9
X-Spam_bar: ----
X-Spam_report: (-4.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.446, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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


>> +int blk_make_zero(BlockBackend *blk, BdrvRequestFlags flags);
>> +int64_t blk_nb_sectors(BlockBackend *blk);
> 
> I’d have considered this an I/O function, and blk_getlength() is 
> classified as such.  Why not this?

This one by itself is only invoked under BQL. I believe in facts that in 
migration/block.c is always wrapped by qemu_mutex_{lock/unlock}_iothread()
pairs.

But on the other side, as you said, semantically maybe it makes more 
sense to put it as I/O. Also its bdrv_ counterpart, bdrv_nb_sectors, is 
an I/O so you are right.

>> +int blk_probe_geometry(BlockBackend *blk, HDGeometry *geo);
>> +BlockAIOCB *blk_abort_aio_request(BlockBackend *blk,
>> +                                  BlockCompletionFunc *cb,
>> +                                  void *opaque, int ret);
> 
> This sounds more like an I/O function to me.
> 

Semantically might make sense as an I/O. Functionally I don't see any 
iothread using it.

I agree with the rest of the comments.

Thank you,
Emanuele


