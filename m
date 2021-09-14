Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B554C40AA7B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 11:14:51 +0200 (CEST)
Received: from localhost ([::1]:57448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ4Wg-00042m-Ro
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 05:14:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ4UW-00023c-GD
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:12:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ4UP-0007Jd-Ut
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:12:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631610720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5onnzyDeYo/N+VUtzbW6s9H0LwXzboYIpNK5CNx+HU=;
 b=jSlpJV129hl4lszZYuRdcOnJyt+GnAu1eqRuCl1V6a4kNeWapIzurGZOdRhbeFCwckSUIt
 66OqrzjS5V4r9pGua2VbFBi7T11qGbInCbE0ISbZr3GCRpfIw+iyNc0H5c5b0SuPtavxER
 nBZhJ6nWWZfWlaKx99ML/ktbQIAFRdI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-zYynw2NgPYCqGFifmRHCzQ-1; Tue, 14 Sep 2021 05:11:59 -0400
X-MC-Unique: zYynw2NgPYCqGFifmRHCzQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 v2-20020a7bcb420000b02902e6b108fcf1so452029wmj.8
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 02:11:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=C5onnzyDeYo/N+VUtzbW6s9H0LwXzboYIpNK5CNx+HU=;
 b=ARw2oueCX+mmDkXPmkkx5wiBfZ7Jm59rnhSt3M7waebbMR5S+u3U+zE++SrUdYE4l1
 5w7fqrpAfwxIp+D7SMA0YBormQ7r/wMXvPgRr2H+o8P1B0oD/ymvTha1P7/Wp2MICd0B
 KtQXThKSzgNZGS/vLUYzPoWuK7driihU/cP5nuEagf/jtDZ+jkkcaqr3tmCCRBGkR5WG
 fFhs64reJbrzcujIPgGp8xJNVeVOOShH3oVWa7kuP8b3szAvjAlGDJRcHHfVyKCStmwG
 PT596wAEKhBKpYNQcrqip7HpvzitW26CKPt+HN8Fp+EC20PNFFNZOIfxqO32uXhBnxDK
 lpcw==
X-Gm-Message-State: AOAM533NigdpvIAfca0P7WDGis/MYisPS79p1HbLy8X9G0hvMgEuz6I1
 GkcH3Bm4QPy2UuuRe3/uuiOsxt7z+ymCpMK5tszEroWXRBIeGGDNKN782Sh6NUSMF4VfIDDE8FH
 0HFk0LaxlDmAF0Ng=
X-Received: by 2002:a1c:a713:: with SMTP id q19mr1003864wme.42.1631610718158; 
 Tue, 14 Sep 2021 02:11:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyicfpsllL3+4JYElZuq3tl0BN4G1zfspTYbVwXueV78JjAYrluBCwU9nkCLgN8hAPVbfCmxQ==
X-Received: by 2002:a1c:a713:: with SMTP id q19mr1003850wme.42.1631610718044; 
 Tue, 14 Sep 2021 02:11:58 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id x21sm518283wmi.15.2021.09.14.02.11.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 02:11:57 -0700 (PDT)
Subject: Re: [PATCH v3 10/10] qcow2-refcount: check_refblocks(): add separate
 message for reserved
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <20210524142031.142109-11-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <adbe7dc0-4a79-b760-d1ef-9953e2864a73@redhat.com>
Date: Tue, 14 Sep 2021 11:11:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210524142031.142109-11-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.398,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.969, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, ktkhai@virtuozzo.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.05.21 16:20, Vladimir Sementsov-Ogievskiy wrote:
> Split checking for reserved bits out of aligned offset check.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> ---
>   block/qcow2.h          |  1 +
>   block/qcow2-refcount.c | 10 +++++++++-
>   2 files changed, 10 insertions(+), 1 deletion(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


