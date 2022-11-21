Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E050E632742
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Nov 2022 16:04:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ox8JW-0008Tv-0V; Mon, 21 Nov 2022 10:02:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ox8JT-0008Ti-IQ
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:02:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1ox8JS-0001Ho-4c
 for qemu-devel@nongnu.org; Mon, 21 Nov 2022 10:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1669042941;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wsQa4JQMrhdc7tb/jorxamJ7AWYHXIvWpsOKtbNJ5Cc=;
 b=AIzrcDgS+LmyIHZFh1qaJHodsqpcje5v9S+uqVogHFZyiqekqcz96bFSIg8ce8MrVC9Dsd
 5R42yTbh0d3yZw+cLkB6X4u3vdXWfbrGGbNLtDsscZUOqhC0oiD4pYv8u4RbfBtPAeY6xv
 IVRLqbvGAtLpiqGMdmkFF3uV5MkTrq4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-8U2MxhQcNmucq7uRuQggkA-1; Mon, 21 Nov 2022 10:02:19 -0500
X-MC-Unique: 8U2MxhQcNmucq7uRuQggkA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v188-20020a1cacc5000000b003cf76c4ae66so9402044wme.7
 for <qemu-devel@nongnu.org>; Mon, 21 Nov 2022 07:02:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wsQa4JQMrhdc7tb/jorxamJ7AWYHXIvWpsOKtbNJ5Cc=;
 b=KYXtnXLa08pnM9JqkZO/fWDp2LUe+HdeO/OR+8C7QchRLSv4dmQrHyhpPOxEyHUTX7
 /p2JUZIMOZyXyBp28PVzi75dPN4gflza00/y/viIuDgaHyttRzA/UyHLUyYhwpzoe5Jh
 XhEz5IbUd9UrIKM/kzPChn2Xa3LqtRhYkkVu/GNxlMRiPatOQSpKd7fO5QCv8p5w8SgV
 pPauafG5GlkNLNOSydJcQjbgQZl5ayJOaL0/uvjW9DGW2Q4joJAWBYCNXFVyJ3iH8Xav
 hV9ODOS6k3jxCvwF/yhhOctgVxtIULVZB0dGYq+xOjCZ2MsEoXmffX2ACcoNFSsMzyqW
 NvsQ==
X-Gm-Message-State: ANoB5pmNqF2qHR7KRrWf2gb0jqKdjiC1YATqC3EnPUyuwmmc/aKlliVt
 f4s446EwpM3JDivkzqpm0KJBfIGJYxDG1zWYRtUarFHhrkr94RzDMwNFFSIpNwCD/avbjiABuSK
 s/wh0QXNiuf/cgRc=
X-Received: by 2002:a05:600c:1d12:b0:3cf:8441:4a7c with SMTP id
 l18-20020a05600c1d1200b003cf84414a7cmr16923551wms.0.1669042938298; 
 Mon, 21 Nov 2022 07:02:18 -0800 (PST)
X-Google-Smtp-Source: AA0mqf6r531d8SHkVgecE1Ol9wJQZpE++bx6UquvHz17NBENFg+OoC5/8NJSbnUqX3j9TKwE7fc/cg==
X-Received: by 2002:a05:600c:1d12:b0:3cf:8441:4a7c with SMTP id
 l18-20020a05600c1d1200b003cf84414a7cmr16923515wms.0.1669042938039; 
 Mon, 21 Nov 2022 07:02:18 -0800 (PST)
Received: from [192.168.149.123]
 (58.254.164.109.static.wline.lns.sme.cust.swisscom.ch. [109.164.254.58])
 by smtp.gmail.com with ESMTPSA id
 g17-20020a05600c4ed100b003c701c12a17sm21034623wmq.12.2022.11.21.07.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Nov 2022 07:02:17 -0800 (PST)
Message-ID: <ee28a1be-85b8-1d83-75ca-6038536976e5@redhat.com>
Date: Mon, 21 Nov 2022 16:02:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 0/6] Protect the block layer with a rwlock: part 2
Content-Language: en-US
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20221116135331.3052923-1-eesposit@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <20221116135331.3052923-1-eesposit@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Ok, as I expected simple changes in a previous based-on serie provoke a
cascade of changes that inevitably affect these patches too.

While I strongly suggest to have an initial look at these patches
because it gives an idea on what am I trying to accomplish, I would not
go looking at nitpicks and trivial errors that came up from the based-on
series (ie "just as in the previous serie, fix this").

The order of the series is:
1. Still more coroutine and various fixes in block layer
2. Protect the block layer with a rwlock: part 1
3. Protect the block layer with a rwlock: part 2
4. Protect the block layer with a rwlock: part 3

Thank you,
Emanuele

Am 16/11/2022 um 14:53 schrieb Emanuele Giuseppe Esposito:
> Please read "Protect the block layer with a rwlock: part 1" for an additional
> introduction and aim of this series.
> 
> This second part aims to add the graph rdlock to the BlockDriver functions
> that already run in coroutine context and are classified as IO.
> Such functions will recursively traverse the BlockDriverState graph, therefore
> they need to be protected with the rdlock.
> 
> Based-on: <20221116134850.3051419-1-eesposit@redhat.com>
> 
> Thank you,
> Emanuele
> 
> Emanuele Giuseppe Esposito (6):
>   block: assert that bdrv_co_create is always called with graph rdlock
>     taken
>   block: assert that BlockDriver->bdrv_co_{amend/create} are called with
>     graph rdlock taken
>   block: assert that BlockDriver->bdrv_co_copy_range_{from/to} is always
>     called with graph rdlock taken
>   block/dirty-bitmap: assert that BlockDriver->bdrv_co_*_dirty_bitmap
>     are always called with graph rdlock taken
>   block/io: assert that BlockDriver->bdrv_co_*_snapshot_* are always
>     called with graph rdlock taken
>   block: assert that BlockDriver->bdrv_co_delete_file is always called
>     with graph rdlock taken
> 
>  block.c                          |  2 ++
>  block/amend.c                    |  1 +
>  block/block-backend.c            |  2 ++
>  block/create.c                   |  1 +
>  block/dirty-bitmap.c             |  2 ++
>  block/io.c                       |  7 +++++++
>  include/block/block_int-common.h | 14 +++++++++++++-
>  qemu-img.c                       |  4 +++-
>  8 files changed, 31 insertions(+), 2 deletions(-)
> 


