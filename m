Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AA423CB682
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 13:04:18 +0200 (CEST)
Received: from localhost ([::1]:56696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Ldh-0003uy-F8
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 07:04:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57790)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4Laz-0002EV-Mn
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:01:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35811)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4Las-0006lr-V7
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 07:01:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626433282;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5k/AnNnv8UPKPMW5sTX3vwYckbppgt9sTyT0kzmAnbI=;
 b=JCgCbUQDsNcwqxIUfjJAPDSi8g/dPymqQQCa0oYHoOJhCqOUbBZLxPWQLKF9oGJ836KAGr
 ktVJXJxhcHRS1t2b4uTyELQdpZgUY1tX1LhAvlKRe3FV8YftihfZX6K67LX3Uv3KgLrNJy
 SDhATfZagsDNsFYsqmDJoHu40VFNRG0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-bEHDh8H7OgWAh6xonG5y4A-1; Fri, 16 Jul 2021 07:01:19 -0400
X-MC-Unique: bEHDh8H7OgWAh6xonG5y4A-1
Received: by mail-wm1-f72.google.com with SMTP id
 k16-20020a7bc3100000b02901d849b41038so2268276wmj.7
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 04:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=5k/AnNnv8UPKPMW5sTX3vwYckbppgt9sTyT0kzmAnbI=;
 b=WHiQfZYIsvRGeyhaJFInljBoEcRFbPhNEcImSZAWG22t19VRtf4PxUTv0bNIfxbEsg
 0zKpeBoPLicvDzWfYC/UfumrlHHpND9NSTm3d/m9XFMecoxqPbRvLpAypJ49Enq/gqKM
 HmBImPGa5asydq8tLAnhcI9DoCcqJWTvtZGOYXMongpZY/BOsNVWYtPYzasTTEWrPDH2
 APKVwRkcWJW8Hh6PkF1bTW0u9MjyawxJQfcqA1iqmrKLmVfxBqOksEFSEQBIXEnITJA6
 p1odNEiz9ZrlXOCLtir3w+nwuefci7e7xy3SObQFHFzUaxX/fay0tsNQp0978z1p0pxt
 6JmA==
X-Gm-Message-State: AOAM531ksgt1OLSA/5gqxZZpjyMIvNuZkP1zZaBjS5xOtBmVzNd5/muF
 I+ZaLZWesk81cgY4Neh8/AA9/Hd9Q5pIz99puIahC92qgU7sznEvzVnmriL3W+M5KX5RyKeoXyP
 j/KblippPO6zUHZU=
X-Received: by 2002:a7b:c34d:: with SMTP id l13mr15667303wmj.99.1626433278752; 
 Fri, 16 Jul 2021 04:01:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy+EL/eQa+76oiKI7/RQfrW2bdNtPIUPwJLvAwl8ZLefBbFq1w2IJuZKvzP7CVd5j3uzHfLUg==
X-Received: by 2002:a7b:c34d:: with SMTP id l13mr15667270wmj.99.1626433278447; 
 Fri, 16 Jul 2021 04:01:18 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 e15sm9378459wrp.29.2021.07.16.04.01.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 04:01:18 -0700 (PDT)
Subject: Re: [PATCH 04/14] iotest 065: explicit compression type
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-5-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <65c8eef2-5e2d-deca-f9a1-b454b709ecdc@redhat.com>
Date: Fri, 16 Jul 2021 13:01:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705091549.178335-5-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
Cc: kwolf@redhat.com, den@openvz.org, jsnow@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05.07.21 11:15, Vladimir Sementsov-Ogievskiy wrote:
> The test checks different options. It of course fails if set
> IMGOPTS='compression_type=zstd'. So, let's be explicit in what
> compression type we want and independent of IMGOPTS. Test both existing
> compression types.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/065 | 14 +++++++-------
>   1 file changed, 7 insertions(+), 7 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


