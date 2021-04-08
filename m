Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DC4B357D9F
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 09:51:27 +0200 (CEST)
Received: from localhost ([::1]:34436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUPRl-0002po-Ml
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 03:51:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lUPQJ-00022m-W0
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 03:49:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lUPQG-0000b2-UC
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 03:49:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617868192;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JQN7p/mvgr92DHYNIoKpLKG4omPiwLER183pTHq1OWg=;
 b=QNJWgBE/bbzVZL6i27qV52Vy5P5aPqJmY1+0D9+I+ckasgARnk2uc7eB3miArBSnr1TgGx
 3p1kY8C8b5n9C3ynhc/s8d8+cBnyNZ9G9R8vdvL1Sek5kcZP2Nat3WJmrngnHoAQ3Km+E3
 YL6eZIQ/WXc4XAMg8yMHBQfjirfnKcQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-411-vI8ipS59Naaua-rYQKRqjg-1; Thu, 08 Apr 2021 03:49:50 -0400
X-MC-Unique: vI8ipS59Naaua-rYQKRqjg-1
Received: by mail-ej1-f72.google.com with SMTP id bg7so467876ejb.12
 for <qemu-devel@nongnu.org>; Thu, 08 Apr 2021 00:49:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=JQN7p/mvgr92DHYNIoKpLKG4omPiwLER183pTHq1OWg=;
 b=gyGC4j0jH/qLLwYwtLKwpRu7CzUWf3SO6Frak5LveK9MAdtCPgEy+2j4G5tgYjt22b
 dQsyN9r+sml4E212a9F9+XLvdYjuO9bAMQ4RWB+t2Mds4ZX63Vx3Ioz+8jS4zTZ2aPg9
 TTjietKvBzWS4q1Q1lwjoS7kox/6k0eldNBrERbj6OKVZE43CA4/yzXwzkiOASafeMyD
 DldVcasruWoiQ9Dzu2gSieJ5P/ABglENtzkDK5W1V/r4zJatRxImeUk74gFoIp8vXBjJ
 zvAoObHOrDgEWW/BVpPAE9IuaGY2Dw8Vy9KNx7v/wD7bZRF/2LgULsRgdA3CVl045eg4
 o8AA==
X-Gm-Message-State: AOAM530Xql8YwYRVjfXU+wpmMs1zv5g8gEtUSGidZIjn86rKudQwXJbo
 yzV5tUxk6tH5o/EaCxpZc3y3FJFI4s09oVFrFBUQLUotEDPI+j8cdCQhRcXZl7pJREpSFY6S99f
 wtXojTOezTPX4tic=
X-Received: by 2002:aa7:df81:: with SMTP id b1mr9680981edy.1.1617868189611;
 Thu, 08 Apr 2021 00:49:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwMdqM9HXHJbmdiLZXPBdXascSOwn8hc/APtS8GqVkxv53UuEbP9TG7ZzJDaBvU8AemFoXOtQ==
X-Received: by 2002:aa7:df81:: with SMTP id b1mr9680964edy.1.1617868189433;
 Thu, 08 Apr 2021 00:49:49 -0700 (PDT)
Received: from steredhat (host-79-34-249-199.business.telecomitalia.it.
 [79.34.249.199])
 by smtp.gmail.com with ESMTPSA id q16sm17239397edv.61.2021.04.08.00.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Apr 2021 00:49:49 -0700 (PDT)
Date: Thu, 8 Apr 2021 09:49:46 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/2] block/rbd: fix memory leak in qemu_rbd_connect()
Message-ID: <20210408074946.kllbenurvccvy67z@steredhat>
References: <20210329150129.121182-1-sgarzare@redhat.com>
 <20210329150129.121182-2-sgarzare@redhat.com>
 <87im4zddq1.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87im4zddq1.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Peter Lieven <pl@kamp.de>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Florian Florensa <fflorensa@online.net>,
 Jason Dillaman <dillaman@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 06, 2021 at 10:22:30AM +0200, Markus Armbruster wrote:
>Stefano Garzarella <sgarzare@redhat.com> writes:
>
>> In qemu_rbd_connect(), 'mon_host' is allocated by qemu_rbd_mon_host()
>> using g_strjoinv(), but it's only freed in the error path, leaking
>> memory in the success path as reported by valgrind:
>>
>>   80 bytes in 4 blocks are definitely lost in loss record 5,028 of 6,516
>>      at 0x4839809: malloc (vg_replace_malloc.c:307)
>>      by 0x5315BB8: g_malloc (in /usr/lib64/libglib-2.0.so.0.6600.8)
>>      by 0x532B6FF: g_strjoinv (in /usr/lib64/libglib-2.0.so.0.6600.8)
>>      by 0x87D07E: qemu_rbd_mon_host (rbd.c:538)
>>      by 0x87D07E: qemu_rbd_connect (rbd.c:562)
>>      by 0x87E1CE: qemu_rbd_open (rbd.c:740)
>>      by 0x840EB1: bdrv_open_driver (block.c:1528)
>>      by 0x8453A9: bdrv_open_common (block.c:1802)
>>      by 0x8453A9: bdrv_open_inherit (block.c:3444)
>>      by 0x8464C2: bdrv_open (block.c:3537)
>>      by 0x8108CD: qmp_blockdev_add (blockdev.c:3569)
>>      by 0x8EA61B: qmp_marshal_blockdev_add (qapi-commands-block-core.c:1086)
>>      by 0x90B528: do_qmp_dispatch_bh (qmp-dispatch.c:131)
>>      by 0x907EA4: aio_bh_poll (async.c:164)
>>
>> Fix freeing 'mon_host' also when qemu_rbd_connect() ends correctly.
>>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>
>I believe this
>Fixes: 0a55679b4a5061f4d74bdb1a0e81611ba3390b00

Yep :-)

>
>Reviewed-by: Markus Armbruster <armbru@redhat.com>
>

Thanks,
Stefano


