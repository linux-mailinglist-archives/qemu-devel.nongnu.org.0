Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673DF37B660
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 08:55:40 +0200 (CEST)
Received: from localhost ([::1]:41824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgimR-0002j1-0k
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 02:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47128)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgil9-00022A-RF
 for qemu-devel@nongnu.org; Wed, 12 May 2021 02:54:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53775)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lgil5-00039y-Ii
 for qemu-devel@nongnu.org; Wed, 12 May 2021 02:54:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620802453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ib/++Otl6+sOKZWhbTXV3H+pvlEb5S908j9jOfBHqas=;
 b=CDTd8ClpeD3zYzDRGDbV9BwaWQi5tkfrh20WbWAWzHAx9X2UfwHThQYMtxpDVEmt94NOz7
 9CE/t5SHhTdLUxqD9AN/ybGooGwbs8pdH4JfCtn8p326FiMCBSiFoMeTF9NcrO6u7RjEvw
 y5cuoPgSqM1XFsrPuMqa+NVt0OYpFvU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-429-Acjo1IWjOXmLHbeu7-X2Ow-1; Wed, 12 May 2021 02:54:10 -0400
X-MC-Unique: Acjo1IWjOXmLHbeu7-X2Ow-1
Received: by mail-ej1-f70.google.com with SMTP id
 h9-20020a1709063c09b0290393e97fec0fso6782825ejg.13
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 23:54:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ib/++Otl6+sOKZWhbTXV3H+pvlEb5S908j9jOfBHqas=;
 b=VoHbdQ3npEYYVFTEKN7OZViAT7JYDlShZCPTJa4+98Cm1pAmWUTRaXvn2LaRJZF17Q
 Ut8JLRqVssvc5FIoUqEPeSUz4goEdztaWdj2vJ1w/GtcHKVHjEe6Ixkc1u5iaqXAjif1
 zU20BLXZITbxgk2GL5h9C5rXpTUDDqbsJc0BlOwNMDzhcaMhNt8onKSl+HoEtBXte2MK
 JfS1k/AnKKuHnpBmamV4PqRuhdVd1H0ZKg1wyiQVeNac70pgz8ttDh0ROiSqQB7O0/TN
 k3CedB3I5ttGx/cdrrmqIGk3dRU8znZywZj62fA4+Ts+FykruKyM11YKvCdTeD6D3HpL
 7BLw==
X-Gm-Message-State: AOAM532emdmmySTddc3QJxNX27pNiO50pFVQkIqn7hWVy5MWCbXkgxPG
 cYNj/+0KiQcnbxZBfYsuwdpcjINNnO5DCnrfjxAhq4pugeh73FikmZj+sLYwyk+S47brz96nA5G
 a/YWHEBd34LELakg=
X-Received: by 2002:a17:906:a18e:: with SMTP id
 s14mr33833255ejy.311.1620802448823; 
 Tue, 11 May 2021 23:54:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhOxIA9OI7mN1IxVL7NeAMR+iRyCcOmChpa0VzVYTDcRrMSI3zIo0pDL5GU4f+sZCjuwv4Hg==
X-Received: by 2002:a17:906:a18e:: with SMTP id
 s14mr33833226ejy.311.1620802448563; 
 Tue, 11 May 2021 23:54:08 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:63a7:c72e:ea0e:6045?
 ([2001:b07:6468:f312:63a7:c72e:ea0e:6045])
 by smtp.gmail.com with ESMTPSA id eb9sm13379676ejc.96.2021.05.11.23.54.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 23:54:08 -0700 (PDT)
Subject: Re: [PATCH v3 00/33] block/nbd: rework client connection
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210416080911.83197-1-vsementsov@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e5031203-5cb2-5f85-e7d0-da59155ea9f8@redhat.com>
Date: Wed, 12 May 2021 08:54:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210416080911.83197-1-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org, mreitz@redhat.com,
 rvkagan@yandex-team.ru, den@openvz.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 16/04/21 10:08, Vladimir Sementsov-Ogievskiy wrote:
> The series substitutes "[PATCH v2 00/10] block/nbd: move connection code to separate file"
> Supersedes: <20210408140827.332915-1-vsementsov@virtuozzo.com>
> so it's called v3
> 
> block/nbd.c is overcomplicated. These series is a big refactoring, which
> finally drops all the complications around drained sections and context
> switching, including abuse of bs->in_flight counter.
> 
> Also, at the end of the series we don't cancel reconnect on drained
> sections (and don't cancel requests waiting for reconnect on drained
> section begin), which fixes a problem reported by Roman.
> 
> The series is also available at tag up-nbd-client-connection-v3 in
> git https://src.openvz.org/scm/~vsementsov/qemu.git

I have independently done some rework of the connection state machine, 
mostly in order to use the QemuCoSleep API instead of aio_co_wake.  In 
general it seems to be independent of this work.  I'll review this series.

Paolo

> v3:
> Changes in first part of the series (main thing is not using refcnt, but instead (modified) Roman's patch):
> 
> 01-04: new
> 05: add Roman's r-b
> 06: new
> 07: now, new aio_co_schedule(NULL, thr->wait_co) is used
> 08: reworked, we now need also bool detached, as we don't have refcnt
> 09,10: add Roman's r-b
> 11: rebased, don't modify nbd_free_connect_thread() name at this point
> 12: add Roman's r-b
> 13: new
> 14: rebased
> 
> Other patches are new.
> 
> Roman Kagan (2):
>    block/nbd: fix channel object leak
>    block/nbd: ensure ->connection_thread is always valid
> 
> Vladimir Sementsov-Ogievskiy (31):
>    block/nbd: fix how state is cleared on nbd_open() failure paths
>    block/nbd: nbd_client_handshake(): fix leak of s->ioc
>    block/nbd: BDRVNBDState: drop unused connect_err and connect_status
>    util/async: aio_co_schedule(): support reschedule in same ctx
>    block/nbd: simplify waking of nbd_co_establish_connection()
>    block/nbd: drop thr->state
>    block/nbd: bs-independent interface for nbd_co_establish_connection()
>    block/nbd: make nbd_co_establish_connection_cancel() bs-independent
>    block/nbd: rename NBDConnectThread to NBDClientConnection
>    block/nbd: introduce nbd_client_connection_new()
>    block/nbd: introduce nbd_client_connection_release()
>    nbd: move connection code from block/nbd to nbd/client-connection
>    nbd/client-connection: use QEMU_LOCK_GUARD
>    nbd/client-connection: add possibility of negotiation
>    nbd/client-connection: implement connection retry
>    nbd/client-connection: shutdown connection on release
>    block/nbd: split nbd_handle_updated_info out of nbd_client_handshake()
>    block/nbd: use negotiation of NBDClientConnection
>    qemu-socket: pass monitor link to socket_get_fd directly
>    block/nbd: pass monitor directly to connection thread
>    block/nbd: nbd_teardown_connection() don't touch s->sioc
>    block/nbd: drop BDRVNBDState::sioc
>    nbd/client-connection: return only one io channel
>    block-coroutine-wrapper: allow non bdrv_ prefix
>    block/nbd: split nbd_co_do_establish_connection out of
>      nbd_reconnect_attempt
>    nbd/client-connection: do qio_channel_set_delay(false)
>    nbd/client-connection: add option for non-blocking connection attempt
>    block/nbd: reuse nbd_co_do_establish_connection() in nbd_open()
>    block/nbd: add nbd_clinent_connected() helper
>    block/nbd: safer transition to receiving request
>    block/nbd: drop connection_co
> 
>   block/coroutines.h                 |   6 +
>   include/block/aio.h                |   2 +-
>   include/block/nbd.h                |  19 +
>   include/io/channel-socket.h        |  20 +
>   include/qemu/sockets.h             |   2 +-
>   block/nbd.c                        | 908 +++++++----------------------
>   io/channel-socket.c                |  17 +-
>   nbd/client-connection.c            | 364 ++++++++++++
>   nbd/client.c                       |   2 -
>   tests/unit/test-util-sockets.c     |  16 +-
>   util/async.c                       |   8 +
>   util/qemu-sockets.c                |  10 +-
>   nbd/meson.build                    |   1 +
>   scripts/block-coroutine-wrapper.py |   7 +-
>   14 files changed, 666 insertions(+), 716 deletions(-)
>   create mode 100644 nbd/client-connection.c
> 


