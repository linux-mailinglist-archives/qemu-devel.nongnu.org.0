Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CB73CB5B3
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 12:09:02 +0200 (CEST)
Received: from localhost ([::1]:43000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4KmC-0005zW-Hd
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 06:09:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4Kkm-0004XR-GS
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 06:07:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1m4Kki-00044q-Jr
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 06:07:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626430047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xZ8FhvPx8TlVcgUp4hHGrATU/tDDQkZ+KzY7B3m843Q=;
 b=VmkrZdqTy2ibss9aTKKU75aDoDvF5EXSDb7vw2ocDJa2dAEPJNYb4zWjBhf19nIEqlUo7L
 Ghexct42+QsFL0P4/piv2m9BqzhbnvfuI+/Gdrildo2KlB0XcB+5MFGk2bPOBwSdR/3xJK
 iOVLiWobM98M5oLfi2HU028wprHqFNk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-247-KM5-RaBAPO-U01ScwHlVvw-1; Fri, 16 Jul 2021 06:07:24 -0400
X-MC-Unique: KM5-RaBAPO-U01ScwHlVvw-1
Received: by mail-wm1-f71.google.com with SMTP id
 j141-20020a1c23930000b0290212502cb19aso2984682wmj.0
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 03:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=xZ8FhvPx8TlVcgUp4hHGrATU/tDDQkZ+KzY7B3m843Q=;
 b=Zj4UraPiE97cW+Dv/hv2DjvFomdKii2kOuM3tF7+1ooU0EKyhON1waa2ddvAPHosbn
 sGgnptb+B3i1Cg0CDZhEN7TauFB2UtbbH+KoBcCHDJeN3srLXDKgHVdvq8NbvvavgS9I
 hFxUr8nl54qT/oGOwtkpShhilrk4Bepj4xdVbplMLfDNUE/WVRgpib168POVKVSUUIbJ
 G4jeYgOQVyOOA5KGeAXorGrUDmzk/eNM9OXmgeVdRRMnyOYZYgqQXVCgOAukC8+12JOZ
 gv0BHqvY+Md0PJdH3RXg3ZE6I2lDNmNuYCUFdROiXQg+U8iJD7nZzwvc3GcE2PsQak8N
 2+wA==
X-Gm-Message-State: AOAM533fD312SRLfPpGedx5bcNLyTxlMohG0lr4dT0NWyjdjkMLPMWrz
 fBKZbAUAJ6mm4ifrhmIOL1RzzjVj99OZKyFktkbGIeRSj++zNDxBck5CDhE2fnkL1SCs/PCDxmU
 T+2KbXHfbqUD9xtk=
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr3235610wrs.301.1626430043116; 
 Fri, 16 Jul 2021 03:07:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4JAbH4HSY0Cde0CWoO7Or+tc0xSllCACItFdHH60VUa936cnZccFM2/X1cFbLDbYV+WAkiw==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr3235599wrs.301.1626430042993; 
 Fri, 16 Jul 2021 03:07:22 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 o15sm2379749wmh.40.2021.07.16.03.07.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Jul 2021 03:07:22 -0700 (PDT)
From: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH 01/14] iotests.py: img_info_log(): rename imgopts argument
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210705091549.178335-1-vsementsov@virtuozzo.com>
 <20210705091549.178335-2-vsementsov@virtuozzo.com>
Message-ID: <bc3441db-ca17-9d03-5545-c13a630211bf@redhat.com>
Date: Fri, 16 Jul 2021 12:07:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210705091549.178335-2-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
> We are going to support IMGOPTS environment variable like in bash
> tests. Corresponding global variable in iotests.py should be called
> imgopts. So to not interfere with function argument, rename it in
> advance.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy<vsementsov@virtuozzo.com>
> ---
>   tests/qemu-iotests/210        | 8 ++++----
>   tests/qemu-iotests/iotests.py | 5 +++--
>   2 files changed, 7 insertions(+), 6 deletions(-)

Reviewed-by: Max Reitz <mreitz@redhat.com>

Reminds me how I sent a huge series for having Python tests support 
$IMGOPTS two years ago 
(https://lists.nongnu.org/archive/html/qemu-block/2019-10/msg00071.html). 
I guess the reason it was so big and this series is comparatively small 
is because I mostly concerned myself with `-o data_file` (and so all the 
operations that currently assume that every image is a single file need 
to be amended).

Max


