Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C354097A7
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 17:42:28 +0200 (CEST)
Received: from localhost ([::1]:45850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPo6F-000788-67
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 11:42:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPo5G-0006P6-1E
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:41:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60526)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mPo59-00031p-KO
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 11:41:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631547678;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hjU7A5nWLRpGFCEW5mF3SqyoR6H3dTxtoa9OrT/r6O0=;
 b=K4STdLhYo3iirBMzFS+OYGUyaxFhtEgHd/xoCtaT8weU80n23AHd3lx4gCgfYp8t1BVzly
 dDwItrgznldFfy1O6U5c5AfiI87KMeggtom7DpNyquHXJ27UMMAHTtkikyWUmYoezwpGhm
 0tbpCeZmD6BMu6oTMhxsfkKIQXqd9Ig=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-254-L7rh4a-ZOD6ZwItpex5Otw-1; Mon, 13 Sep 2021 11:41:17 -0400
X-MC-Unique: L7rh4a-ZOD6ZwItpex5Otw-1
Received: by mail-wm1-f71.google.com with SMTP id
 17-20020a05600c029100b00305eac9f29aso128327wmk.1
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 08:41:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=hjU7A5nWLRpGFCEW5mF3SqyoR6H3dTxtoa9OrT/r6O0=;
 b=7Xrpbi3PWFXtQeL2jQ/wa/6oSUonCxTyE3vpAQ+TDTt0dDXpnoCkT0LzT5aiUmntpM
 2ITbuVRVdQ6woi3lhBSp8AOPYZpTJWPmH+E8hLj8r6fFIF+wYwSmSoU1aVlNYMAJuEeD
 m1oqmnFFdveAZdxqEM0a3Aoxwinnu58TTUuFRp/UFlFBkXsIURNav7XGur0NUPo+jF+J
 goQuTKiJHZ7HwGZJGphWRn4qO4c1LDQ4IaXw8LMyyS5ovWAoAmGGL0U6LzH5gLmTmpkd
 7l6KwOsR/KjYVhraL7rXhGl8btQIWWvehAEXzCs9Y5TtrBxXqprNApnkHLUiV+dhXzWP
 mUEA==
X-Gm-Message-State: AOAM5329gqmuIDwKBDtDqGaIzp72K9AYZOnrP++sPpb1Gmk2uusuIexk
 z+gt8IeA9IsT6aNSV7UXGTSqUcce/03gA4nDsSO6ynprPikeIt0wwY8ziB1lKbh1foEmnjScNRX
 PBeXEu1y6RDGmguY=
X-Received: by 2002:a05:600c:19ca:: with SMTP id
 u10mr11765241wmq.178.1631547676443; 
 Mon, 13 Sep 2021 08:41:16 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyxFxC4tSz5mSoTOXMkVM9PP9MId7WsAor1zY7oICSbuFditH3VCRJhvdWq57+5uTYqzujjlw==
X-Received: by 2002:a05:600c:19ca:: with SMTP id
 u10mr11765213wmq.178.1631547676256; 
 Mon, 13 Sep 2021 08:41:16 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id y6sm331910wrp.46.2021.09.13.08.41.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Sep 2021 08:41:15 -0700 (PDT)
Subject: Re: [PATCH v3 03/10] qcow2: introduce
 qcow2_parse_compressed_l2_entry() helper
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210524142031.142109-1-vsementsov@virtuozzo.com>
 <20210524142031.142109-4-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <f8d7dc2c-44d5-46ca-34e0-3908c628ea7c@redhat.com>
Date: Mon, 13 Sep 2021 17:41:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210524142031.142109-4-vsementsov@virtuozzo.com>
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
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
> Add helper to parse compressed l2_entry and use it everywhere instead
> of open-coding.
>
> Note, that in most places we move to precise coffset/csize instead of
> sector-aligned. Still it should work good enough for updating
> refcounts.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> ---
>   block/qcow2.h          |  3 ++-
>   block/qcow2-cluster.c  | 15 +++++++++++++++
>   block/qcow2-refcount.c | 36 +++++++++++++++++-------------------
>   block/qcow2.c          |  9 ++-------
>   4 files changed, 36 insertions(+), 27 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


