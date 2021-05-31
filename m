Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE4E395FEE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 May 2021 16:20:48 +0200 (CEST)
Received: from localhost ([::1]:48804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lnimb-0003Xh-CH
	for lists+qemu-devel@lfdr.de; Mon, 31 May 2021 10:20:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnikf-0002dA-O7
 for qemu-devel@nongnu.org; Mon, 31 May 2021 10:18:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lnikc-0002qD-SH
 for qemu-devel@nongnu.org; Mon, 31 May 2021 10:18:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622470719;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eQw/+27h2ErrxCthjG23/o/pD9ySaGuoDFHRq7iYMVE=;
 b=FPeGjsyDV+hHvUm38tv0+52Ar08tLegdv9EomZxeDHt2pUEfKALPu8OBs827KJJl2lWWfz
 pNQgOMXHHP8bxXUOTUBL5wxFoL/RZKMIrbPSGLrs/OWX+q8F7WQOA/jFy2n0nrv/jQimxM
 tbs7XkreW8Cc0ubzH990AP1BuuRT/Tw=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-516-t-OAUICWP72dd2IbWKvYCw-1; Mon, 31 May 2021 10:18:37 -0400
X-MC-Unique: t-OAUICWP72dd2IbWKvYCw-1
Received: by mail-ed1-f69.google.com with SMTP id
 y7-20020aa7ce870000b029038fd7cdcf3bso2780783edv.15
 for <qemu-devel@nongnu.org>; Mon, 31 May 2021 07:18:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=eQw/+27h2ErrxCthjG23/o/pD9ySaGuoDFHRq7iYMVE=;
 b=Ru5tFwGdTviVWGBqNE6iGPJw32aqc/RwWj8Z6t1IU9N55xQU4p2Ec56AWJr9xomssD
 jdkX+EpYWnX1CIhAOiE2TutMhjDo5ZcOd61xc0ts+q9jNE876r2RQq2dK4HqTZRO05dO
 G7KJTd+jQ1KOagsJw3uLRGege0pDCl3RgCL0jXVLzwVJ//d8F4SLRDJHD1720ORQkfGZ
 Ue7saUOdXmKPtkTcvYQhW/7A0niFEgqMEfm8QBW0nM7VIhUeSuKaC8hoTQ0tHHCWerbX
 u4Zo6P8BWeft61tq9Xoq68HFBL5zy0bf9v2frnyOggUTgfGZbDZVgoj/a6AVluX/JNBN
 SNfQ==
X-Gm-Message-State: AOAM531tiSGGq6MsvbZB1r3Uy8K4u/vSrbOmiE+ZelyK21sq6nSNy/oT
 VvQ7l7i/8R4zS0ad0qOd9XOnB9nuk6ctCsVRi6MvWDNttq/o8HAdjldMJgcf2lMT2YlLhGx1OLB
 A0JbjssEWQ5Gaom8=
X-Received: by 2002:a17:906:3c44:: with SMTP id
 i4mr5626349ejg.135.1622470716225; 
 Mon, 31 May 2021 07:18:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzOsa7LbqNI9FlM/e+F4uBZGZBZqNXUqEvY7MsRoUxWk/SQWId84Ov72zqA5cS/HnzV0dbctQ==
X-Received: by 2002:a17:906:3c44:: with SMTP id
 i4mr5626328ejg.135.1622470716057; 
 Mon, 31 May 2021 07:18:36 -0700 (PDT)
Received: from dresden.str.redhat.com ([2a02:908:1e46:160:b272:8083:d5:bc7d])
 by smtp.gmail.com with ESMTPSA id
 k4sm2755720edr.64.2021.05.31.07.18.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 May 2021 07:18:35 -0700 (PDT)
Subject: Re: [PATCH v2 03/33] block: introduce bdrv_replace_child_bs()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210520142205.607501-1-vsementsov@virtuozzo.com>
 <20210520142205.607501-4-vsementsov@virtuozzo.com>
From: Max Reitz <mreitz@redhat.com>
Message-ID: <05dbf5ff-676a-72fb-060d-fb184d5f6bb0@redhat.com>
Date: Mon, 31 May 2021 16:18:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210520142205.607501-4-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.372,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.591, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: kwolf@redhat.com, berrange@redhat.com, ehabkost@redhat.com, den@openvz.org,
 jsnow@redhat.com, qemu-devel@nongnu.org, armbru@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.05.21 16:21, Vladimir Sementsov-Ogievskiy wrote:
> Add function to transactionally replace bs inside BdrvChild.
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/block.h |  2 ++
>   block.c               | 31 +++++++++++++++++++++++++++++++
>   2 files changed, 33 insertions(+)

Reviewed-by: Max Reitz <mreitz@redhat.com>


