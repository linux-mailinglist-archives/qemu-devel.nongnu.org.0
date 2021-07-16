Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E285F3CB636
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 12:40:49 +0200 (CEST)
Received: from localhost ([::1]:42340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4LGz-0000hI-09
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 06:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4LFF-00077Q-VF
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 06:39:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4LFC-0008Fm-5Z
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 06:39:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626431936;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xqs9QyIhrYWjFnboDYB1WXOlMG/bShF2XQ8e2fMtkAk=;
 b=c/4+0s3LPNiEjY+GqgPy66gnpke2fdBiSwNso5Nmvv/S1c2voCtwUOOnmuDEKVd4KYk6Vd
 EhnUR+xFWHtYcVGpq3p9678CCUpqgmovmcEJ6gbmXo9i0OBbGEb2X1WtWKtrKgiJpZm+ok
 PHB2Ie40LIJFMN7DHEzkDd3FV+8eMRk=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-394-KALcRTFEP8CY3hXl5LoOow-1; Fri, 16 Jul 2021 06:38:55 -0400
X-MC-Unique: KALcRTFEP8CY3hXl5LoOow-1
Received: by mail-wr1-f71.google.com with SMTP id
 z6-20020a5d4c860000b029013a10564614so4664096wrs.15
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 03:38:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=Xqs9QyIhrYWjFnboDYB1WXOlMG/bShF2XQ8e2fMtkAk=;
 b=PFLa+ZdkJjDbsTm9yfpOepUfFg2iqRMNVIMFfkfAInuwEMrulqrRiOIqGlPgaO72kX
 oCOykPlkEdNTY6KS5VENePk2QDXd4Ank1+9LUaGiiLlE7l9xepJ8sTKxUF7s55LWAp5t
 GJWYnxhj/gg27TjjJEMnpY0OTfcXscs9nijCxC4kJvjzPl6xEeD/fnNI8bk4hF2hs+lJ
 Edf7WS3PIJpXUYMHb3tVZkNfPObWeNVZrep826EZeSurPISBhYe7m1kdWSVTvGxs1Mux
 weCfKV6G/jhsa4mTTxhXk7nZwgJ6h1lSNA8g3Ybm6MTrpY8Rzu+OkDKrvVRTXpdrI+7Z
 c7qA==
X-Gm-Message-State: AOAM533iMCq9p7d17EJlYo1tCZ6x4B1V9EJvy11u+ESLkyL0xMt3xeZA
 HqZeNGVm+XrNHi0s0xGebPTuYjXj+KBA4z1oO54aX7F6C6njR9aEusscdD5tenczbeLnD9ByJV8
 NY7EeMgBFbHx3Ano=
X-Received: by 2002:a7b:cc15:: with SMTP id f21mr15933458wmh.5.1626431934583; 
 Fri, 16 Jul 2021 03:38:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyoyj3H/Rbu1FpVFJnUSkxvyfq6Z6kVE0JAG+9YpRhxyKz11w1LRbhoXYehGllt2pdUdOtC4w==
X-Received: by 2002:a7b:cc15:: with SMTP id f21mr15933440wmh.5.1626431934411; 
 Fri, 16 Jul 2021 03:38:54 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 s17sm9648337wrv.2.2021.07.16.03.38.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 03:38:54 -0700 (PDT)
Subject: Re: [PATCH 03/14] iotest 303: explicit compression type
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-4-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <a4a46854-a568-af07-1045-aa42a5ebc54a@redhat.com>
Date: Fri, 16 Jul 2021 12:38:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705091549.178335-4-vsementsov@virtuozzo.com>
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
> The test prints qcow2 header fields which depends on chosen compression
> type. So, let's be explicit in what compression type we want and
> independent of IMGOPTS. Test both existing compression types.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/303     | 25 ++++++++++++++++---------
>   tests/qemu-iotests/303.out | 30 +++++++++++++++++++++++++++++-
>   2 files changed, 45 insertions(+), 10 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>


