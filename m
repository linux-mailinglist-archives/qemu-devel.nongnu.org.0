Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A73663F1AA4
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 15:40:02 +0200 (CEST)
Received: from localhost ([::1]:48672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGiH3-00047X-GK
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 09:40:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGiFC-0001sj-3r
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:38:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mGiF8-0002iY-Vv
 for qemu-devel@nongnu.org; Thu, 19 Aug 2021 09:38:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629380281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=v/dszuUgOj5jt7VGTEyIWgtbC2C68KXARWi/Izqn1JY=;
 b=cd+JgBTl78pLuL5s2UIvV/9Kl2DahBX7qhIb1WB0TM5+AbTSOMenvmC3BGEb7B5fZs58yl
 q+6QrrAP8FEMuMyirD1SSlmWO+/AGrqiS2qMIa9kO+VXpD0l8jFG3npYvjBKuJBlGdcXdD
 kbPx+Y5k3lkrFx5AhGahvFvAAQCr/Qs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-182-jD76m9ECN6iytR4mxJAB8g-1; Thu, 19 Aug 2021 09:37:59 -0400
X-MC-Unique: jD76m9ECN6iytR4mxJAB8g-1
Received: by mail-wr1-f70.google.com with SMTP id
 n18-20020adfe792000000b00156ae576abdso1689667wrm.9
 for <qemu-devel@nongnu.org>; Thu, 19 Aug 2021 06:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=v/dszuUgOj5jt7VGTEyIWgtbC2C68KXARWi/Izqn1JY=;
 b=nu3YvMRay922XTo8YOGwctGJ/4dMoaOR5uEJ9dgl3/06B1RallM71dFj6r+il2pq+L
 wPc8JMaS9SWGqCH7kh/rzeiCsV0nn5FRDqYpy4ROflDX9Q9MOrmL/A4ETldQr4S1le2E
 lFstrWukLy+UIhO3dcWGwu9rADwo1PAbkNsRozMAR6A19e7w/Fli0F7iUcPqEWXBF7EI
 g3rO1QDDZcLBmQP41UnAzLld7i5ukydbd5xG+jTtGdfFf/uZvPOUWFTvxriSF+xYBhF8
 CHJqt0+XvP9the6U4P9Ku4/06Rq0EGi6aRVcGr2ehuHM8M3uDCP31Kr86QPGfyGGbdAk
 7pKg==
X-Gm-Message-State: AOAM532KX88xn+JiNgA+uO2O3ZA8DJkrUnud63ti2vVJo4oPXjjvU4P/
 9nF1ckuk/+ORjVJs7nld+Vh5cHmi9zQk9qkJbt3QmqqnsYldCSIA8IGui0tQTi0mWwJKvl96d8Y
 VKTkIsMLteIBF8C8=
X-Received: by 2002:adf:90b1:: with SMTP id i46mr4071910wri.159.1629380277954; 
 Thu, 19 Aug 2021 06:37:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEW7DE1ko6GEaegjju86DjFZRrK85/A9aOk18+J83F7Ws/UsaCPPgWzRbcnF3HaqQOuNaoVw==
X-Received: by 2002:adf:90b1:: with SMTP id i46mr4071875wri.159.1629380277735; 
 Thu, 19 Aug 2021 06:37:57 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 f17sm2499238wmq.17.2021.08.19.06.37.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 19 Aug 2021 06:37:57 -0700 (PDT)
Subject: Re: [PATCH] raw-format: drop WRITE and RESIZE child perms when
 possible
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210726122839.822900-1-stefanha@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <c4ad5127-1c4c-7c92-3098-c36002d99f6f@redhat.com>
Date: Thu, 19 Aug 2021 15:37:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210726122839.822900-1-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, afrosi@redhat.com,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26.07.21 14:28, Stefan Hajnoczi wrote:
> The following command-line fails due to a permissions conflict:
>
>    $ qemu-storage-daemon \
>        --blockdev driver=nvme,node-name=nvme0,device=0000:08:00.0,namespace=1 \
>        --blockdev driver=raw,node-name=l1-1,file=nvme0,offset=0,size=1073741824 \
>        --blockdev driver=raw,node-name=l1-2,file=nvme0,offset=1073741824,size=1073741824 \
>        --nbd-server addr.type=unix,addr.path=/tmp/nbd.sock,max-connections=2 \
>        --export type=nbd,id=nbd-l1-1,node-name=l1-1,name=l1-1,writable=on \
>        --export type=nbd,id=nbd-l1-2,node-name=l1-2,name=l1-2,writable=on
>
>    qemu-storage-daemon: --export type=nbd,id=nbd-l1-1,node-name=l1-1,name=l1-1,writable=on: Permission conflict on node 'nvme0': permissions 'resize' are both required by node 'l1-1' (uses node 'nvme0' as 'file' child) and unshared by node 'l1-2' (uses node 'nvme0' as 'file' child).
>
> The problem is that block/raw-format.c relies on bdrv_default_perms() to
> set permissions on the nvme node. The default permissions add RESIZE in
> anticipation of a format driver like qcow2 that needs to grow the image
> file. This fails because RESIZE is unshared, so we cannot get the RESIZE
> permission.
>
> Max Reitz pointed out that block/crypto.c already handles this case by
> implementing a custom ->bdrv_child_perm() function that adjusts the
> result of bdrv_default_perms().
>
> This patch takes the same approach in block/raw-format.c so that RESIZE
> is only required if it's actually necessary (e.g. the parent is qcow2).
>
> Cc: Max Reitz <mreitz@redhat.com>
> Cc: Kevin Wolf <kwolf@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
> This is not a bug fix, so I didn't mark it for QEMU 6.1. It's new
> behavior that hasn't been supported before. I want to split an NVMe
> drive using the raw format's offset=/size= feature.
> ---
>   block/raw-format.c | 21 ++++++++++++++++++++-
>   1 file changed, 20 insertions(+), 1 deletion(-)

Thanks, applied to my block-next branch:

https://github.com/XanClic/qemu/commits/block-next

Hanna


