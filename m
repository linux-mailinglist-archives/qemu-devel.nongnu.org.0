Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 357EE40AA2B
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 11:04:31 +0200 (CEST)
Received: from localhost ([::1]:48740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ4Mg-0006Ah-8E
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 05:04:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33444)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ4KY-0004VG-4v
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:02:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43589)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQ4KV-0007LC-Qr
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 05:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631610135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DYpwI6kZ5ZwQnsm1TJlzGTuQ7HYQRaXqO81Z1sBcVWo=;
 b=bAOSd+TBCYvpCkaSa18hcrfHDf3SvgEhCuCoiun2KYI3DxLg4FfquoPb3+4Jb4Ax6hwRuG
 JOw/zC3mI9f8EQuxatqFAIzqkKuKoIsll5CAgMwh80PVn8DV4boHCnB45Hu0wMjztHrpbu
 tju5JlyfpNWOOUdhCk8z6IZbslMQFmw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-76-Z32pf6BlPi6GFrVTZR_tAA-1; Tue, 14 Sep 2021 05:02:13 -0400
X-MC-Unique: Z32pf6BlPi6GFrVTZR_tAA-1
Received: by mail-wr1-f69.google.com with SMTP id
 g1-20020a5d64e1000000b0015e0b21ef04so1783534wri.17
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 02:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=DYpwI6kZ5ZwQnsm1TJlzGTuQ7HYQRaXqO81Z1sBcVWo=;
 b=NrD613kk5n373dbmcqYgujxwahoslLz/mmvXKWZzFyy79jtU9rAZoBCCaHoTJeLekR
 bXh+56SAJdlyWHGBuc0b0yO5j4tmuQCb6sdgqXcCGnariuqM3Ze5GbG0UIXggMqt9ITt
 zLvswqsoBil84OuKdciIo4VYo2l1yBV47mGm2fFghLihw5zpOhmWnTniULZdNnodw5cq
 IxvRK78J756dG9ya4O60Z8fO5sEKLAQyIpcvRdxEuUOVNlBJGKPYhm0wSpeJGQ1j0ZSY
 V2Jnp7t9Xp2GA5cgJ7m/4x3ptyTLeVjGMogP5L9COM9PwSK1R4VUAKcTt1jiRt8KSqnk
 j1vg==
X-Gm-Message-State: AOAM531P/yvcjC9Ix+jOhivjNWPZ/EFINqlc5dJpQX5gaSqrvzGsk7F7
 CzZf5I3CglzdxeZqOnXwB1x1XrooSQbDmwHH6YBao9oUm/QVMCfMyTorlLoVNRHpbNpsYVKEnpj
 HzPyxKuyGt3w08co=
X-Received: by 2002:a1c:7d0f:: with SMTP id y15mr953676wmc.41.1631610130755;
 Tue, 14 Sep 2021 02:02:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyPsi5ogy5D046meNZ06WO8x4zaqwo/RSELUs3ST9KxplYEfGOuVp5COXmdyYobi3CRbqTDw==
X-Received: by 2002:a1c:7d0f:: with SMTP id y15mr953650wmc.41.1631610130593;
 Tue, 14 Sep 2021 02:02:10 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id k17sm1261300wmj.0.2021.09.14.02.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 02:02:10 -0700 (PDT)
Subject: Re: [PATCH v3 07/10] qcow2-refcount: check_refcounts_l2(): check
 reserved bits
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <20210524142031.142109-8-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <cb49d11b-d579-67df-57a8-c9020a7a9a88@redhat.com>
Date: Tue, 14 Sep 2021 11:02:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210524142031.142109-8-vsementsov@virtuozzo.com>
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
Cc: kwolf@redhat.com, berto@igalia.com, qemu-devel@nongnu.org,
 mreitz@redhat.com, ktkhai@virtuozzo.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24.05.21 16:20, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> ---
>   block/qcow2.h          |  1 +
>   block/qcow2-refcount.c | 12 +++++++++++-
>   2 files changed, 12 insertions(+), 1 deletion(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


