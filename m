Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A75F4394EB
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 13:37:10 +0200 (CEST)
Received: from localhost ([::1]:37046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1meyHt-0007kH-1c
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 07:37:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1meyEG-0005uU-JI
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:33:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1meyEC-0004sa-VQ
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 07:33:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635161598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=V+BcmChjrUKah74S12+44KBLNKKGzWTNIrS38mlUYW8=;
 b=MF/F3YM2N+p1vuulrNWZhqGSsKPWG4+99V+ayU/bQx9wl4L1+5JkPfqUt5n+70kTIdob1v
 mD9yv5tgBpy/Q3JsG1g4j6QWk5OZ6BD1v9VJ5A/Prp/lOUKrh9+JhgSLT3FOzq+dJ9T/hf
 cTLCXGVALMjXay3Hhi/b2nKvWB4MC2U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-Cbj7SjucMa2Z4tscyKrkGw-1; Mon, 25 Oct 2021 07:33:17 -0400
X-MC-Unique: Cbj7SjucMa2Z4tscyKrkGw-1
Received: by mail-wm1-f70.google.com with SMTP id
 u14-20020a05600c19ce00b0030d8549d49aso5727831wmq.0
 for <qemu-devel@nongnu.org>; Mon, 25 Oct 2021 04:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=V+BcmChjrUKah74S12+44KBLNKKGzWTNIrS38mlUYW8=;
 b=po0S5B1bBNTZZjCGv9QNNPiYBp4IJuagkYtkKB+54Ttmc3oXkAikkedpM9KrJtRk48
 n/lAuUygRzzSlSWGFbtClqITXn2gaI2BQJlCKpcJ6LgGF0cTtBFEmwjuMIfIPGAOodq5
 Rl6T7CL4i6msHOgs/Z2gBcgpyGtZB7rBrpj2QrR78rkJclpPGuG5JsBTsFT08BFfkZ43
 cCH1jdOdIOun95ImO5aEK53v5sSifk2upzNyCLQ8KxgxYiXFqW3QXQZbDPvhfSDn2Osi
 HzIFHZRVxxNmM4Zx6GYO9Wriiukge24zDgThgiLIgfA6UVWJjB0GJ4DLjUqnDgRLdxqL
 q0NA==
X-Gm-Message-State: AOAM533zNVAtcJ3kaxtpvBzwUDvRLFPGRZ6/wT5OV1HbGn2tRlBxfFWa
 nOhWC7Ak/7e7kxhb50ZMsmGvPY5tffcpmNTYPYmZb4+GEa/hnFS0OTDKKjILP7ke4r5pqRXO8yV
 et92RsiRyvLbn1/U=
X-Received: by 2002:a05:6000:144e:: with SMTP id
 v14mr17502470wrx.9.1635161596687; 
 Mon, 25 Oct 2021 04:33:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDmHYUpN1/lcFgLoIsT0CJf9gNr64FLfAXhj0zLdG4tysQRXgeboOhP85gGDW9rf4FQF6uSg==
X-Received: by 2002:a05:6000:144e:: with SMTP id
 v14mr17502439wrx.9.1635161596502; 
 Mon, 25 Oct 2021 04:33:16 -0700 (PDT)
Received: from [192.168.50.34] (static-180-27-86-188.ipcom.comunitel.net.
 [188.86.27.180])
 by smtp.gmail.com with ESMTPSA id l2sm2237436wms.40.2021.10.25.04.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 25 Oct 2021 04:33:16 -0700 (PDT)
Message-ID: <63480ba9-b09f-e6dc-e8d4-48a79f4146ed@redhat.com>
Date: Mon, 25 Oct 2021 13:33:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 01/25] main-loop.h: introduce qemu_in_main_thread()
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-2-eesposit@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211025101735.2060852-2-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -55
X-Spam_score: -5.6
X-Spam_bar: -----
X-Spam_report: (-5.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.846, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/25/21 12:17, Emanuele Giuseppe Esposito wrote:
> When invoked from the main loop, this function is the same
> as qemu_mutex_iothread_locked, and returns true if the BQL is held.
> When invoked from iothreads or tests, it returns true only
> if the current AioContext is the Main Loop.
> 
> This essentially just extends qemu_mutex_iothread_locked to work
> also in unit tests or other users like storage-daemon, that run
> in the Main Loop but end up using the implementation in
> stubs/iothread-lock.c.
> 
> Using qemu_mutex_iothread_locked in unit tests defaults to false
> because they use the implementation in stubs/iothread-lock,
> making all assertions added in next patches fail despite the

"in the following commits"?

> AioContext is still the main loop.
> 
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  include/qemu/main-loop.h | 13 +++++++++++++
>  softmmu/cpus.c           |  5 +++++
>  stubs/iothread-lock.c    |  5 +++++
>  3 files changed, 23 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


