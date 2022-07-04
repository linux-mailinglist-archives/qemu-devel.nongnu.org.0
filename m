Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 95E4C565424
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 13:53:15 +0200 (CEST)
Received: from localhost ([::1]:50934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8Kde-0002LU-5a
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 07:53:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KZB-0006lX-1D
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1o8KZ9-0002hG-Gl
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 07:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656935315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E3IpwqYIkPg/1EiElyWg3NoI/e7peoz7+5/cOa9g5dk=;
 b=CaFSSKtaIEBWRbND5X9siaM1dJKmGe2c6ubu8JwVHLut1JrQi6xpmkePm/eg3bFGL6voD9
 Dno1G/5/A5f1af3F+467uve5yZOSqW472YZ9mBzHvHttMW8ik7or3pJ3upWGvU5nr8P2nz
 YWjt9vzFIH9DvWSC1rrzz1QvHTs1M90=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-C0q1UF8qPjGxPpAfjoYbdg-1; Mon, 04 Jul 2022 07:48:34 -0400
X-MC-Unique: C0q1UF8qPjGxPpAfjoYbdg-1
Received: by mail-ed1-f70.google.com with SMTP id
 m20-20020a056402431400b0043a699cdd6eso1234733edc.9
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 04:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=E3IpwqYIkPg/1EiElyWg3NoI/e7peoz7+5/cOa9g5dk=;
 b=fbxNAQQ8qTIZCozT0nP1kw0M7cQ8dKRTw71ltl2epP1udzc6nMTFeK0I7h3wD3/GAV
 sAKThCIi+BAkJ08T87QVFWITUoWBuzVvtAlYD/Y6wqGPsyhTasyC+b16XX72fJ+GzOYz
 gM/5/BzyNwOGtO6f9ul04YjXljBt4CzkrVJI7wXXFE1Q0sHYYAHmjD2d3XlbspmOaehU
 STtY7g67BXG6L6iciISHC4AgTbN5keXEMQagI5yS8tI1t5Wq5miFzsVLSzTL3SytauPG
 vMmKvUIwWDEZ6HgjgxmCtrxH2fU56zw+isQ8XJm3wwvsazn7CP1nzhb2aP2K1rHSzK/G
 X39w==
X-Gm-Message-State: AJIora/oOTcx2w0AoY5n/N6lHK+uHjBr24+Hysp4KWkPwZ8Bp1SkAS+w
 eYfXPsZF9A0UBU+nAqsfvFdLL8Qvi9djtO/xw8lDAFve0qF2DwanzSpRYW40uAjxGzl+dg9QIkG
 ui+Z3NNchDyWl0OM=
X-Received: by 2002:a17:906:478e:b0:722:fc33:5c65 with SMTP id
 cw14-20020a170906478e00b00722fc335c65mr29132734ejc.22.1656935312965; 
 Mon, 04 Jul 2022 04:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s8AUBmB4P/iesrVzqiOXWHEJKQ/OSoBMAWeQ0c9v278UOs9JiZkZ3DVUZNlTmsIi7fmGMrkQ==
X-Received: by 2002:a17:906:478e:b0:722:fc33:5c65 with SMTP id
 cw14-20020a170906478e00b00722fc335c65mr29132712ejc.22.1656935312810; 
 Mon, 04 Jul 2022 04:48:32 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5056:d40:63e3:25a7:c1a1:4455?
 ([2a02:8071:5056:d40:63e3:25a7:c1a1:4455])
 by smtp.gmail.com with ESMTPSA id
 ia10-20020a170907a06a00b0070b7875aa6asm13972193ejc.166.2022.07.04.04.48.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 04:48:32 -0700 (PDT)
Message-ID: <13375734-8eb5-d645-a462-4d028debcb8f@redhat.com>
Date: Mon, 4 Jul 2022 13:48:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v5 02/10] block: Change bdrv_{pread, pwrite, pwrite_sync}()
 param order
Content-Language: en-US
To: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org
Cc: John Snow <jsnow@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Ari Sundholm <ari@tuxera.com>, =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?=
 <berrange@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Fam Zheng <fam@euphon.net>, Jeff Cody <codyprime@gmail.com>,
 qemu-block@nongnu.org, Vladimir Sementsov-Ogievskiy
 <v.sementsov-og@mail.ru>, Stefan Weil <sw@weilnetz.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
References: <20220609152744.3891847-1-afaria@redhat.com>
 <20220609152744.3891847-3-afaria@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220609152744.3891847-3-afaria@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 09.06.22 17:27, Alberto Faria wrote:
> Swap 'buf' and 'bytes' around for consistency with
> bdrv_co_{pread,pwrite}(), and in preparation to implement these
> functions using generated_co_wrapper.
>
> Callers were updated using this Coccinelle script:
>
>      @@ expression child, offset, buf, bytes, flags; @@
>      - bdrv_pread(child, offset, buf, bytes, flags)
>      + bdrv_pread(child, offset, bytes, buf, flags)
>
>      @@ expression child, offset, buf, bytes, flags; @@
>      - bdrv_pwrite(child, offset, buf, bytes, flags)
>      + bdrv_pwrite(child, offset, bytes, buf, flags)
>
>      @@ expression child, offset, buf, bytes, flags; @@
>      - bdrv_pwrite_sync(child, offset, buf, bytes, flags)
>      + bdrv_pwrite_sync(child, offset, bytes, buf, flags)
>
> Resulting overly-long lines were then fixed by hand.
>
> Signed-off-by: Alberto Faria <afaria@redhat.com>
> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   block/blklogwrites.c             |  6 ++--
>   block/bochs.c                    | 10 +++---
>   block/cloop.c                    | 10 +++---
>   block/crypto.c                   |  4 +--
>   block/dmg.c                      | 26 +++++++--------
>   block/io.c                       | 12 +++----
>   block/parallels-ext.c            |  6 ++--
>   block/parallels.c                | 10 +++---
>   block/qcow.c                     | 34 +++++++++----------
>   block/qcow2-bitmap.c             | 14 ++++----
>   block/qcow2-cache.c              |  8 ++---
>   block/qcow2-cluster.c            | 22 ++++++-------
>   block/qcow2-refcount.c           | 56 +++++++++++++++++---------------
>   block/qcow2-snapshot.c           | 48 +++++++++++++--------------
>   block/qcow2.c                    | 47 ++++++++++++++-------------
>   block/qed.c                      |  8 ++---
>   block/vdi.c                      | 14 ++++----
>   block/vhdx-log.c                 | 18 +++++-----
>   block/vhdx.c                     | 28 ++++++++--------
>   block/vmdk.c                     | 50 ++++++++++++++--------------
>   block/vpc.c                      | 22 ++++++-------
>   block/vvfat.c                    | 10 +++---
>   include/block/block-io.h         | 10 +++---
>   tests/unit/test-block-iothread.c |  8 ++---
>   24 files changed, 242 insertions(+), 239 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


