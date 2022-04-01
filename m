Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66A344EF23B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:10:14 +0200 (CEST)
Received: from localhost ([::1]:34836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naIuj-0003fy-4J
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:10:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naItV-0001uK-7u
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:08:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46060)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1naItR-0006os-O8
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:08:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648825732;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zrT2ZNw37rK884eeYqyQZttCmbLJqBWPZ5QxoT3hPss=;
 b=BVhphP4WoZerIOf84X/5wvmvjjQPzxL9A4VYkrVXYEcPrWn7rGxaacIbm3+1Rcy0D+6ReB
 HfrBKHRtaAvbVPMMWpoWd+UuocSHcLPAB+r54S+e7OD12DFODDgn9XAyseJMbIbHsLJ/tR
 +4ZEOKeIuCsqflTpIauumS3aIQzY88A=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-md9phKzfOXK5A1E-wd5H3A-1; Fri, 01 Apr 2022 11:08:51 -0400
X-MC-Unique: md9phKzfOXK5A1E-wd5H3A-1
Received: by mail-ed1-f70.google.com with SMTP id
 z22-20020a50cd16000000b0041960ea8555so1716366edi.2
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 08:08:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zrT2ZNw37rK884eeYqyQZttCmbLJqBWPZ5QxoT3hPss=;
 b=Blz5e4xEqar1JU38Gttb9E0arrF86nzNiLEApNKH0b5vlfFeVRe4ksHgefB7WK36w/
 2yiqdkjTNKZktOtP3CFzntD9yuPCJq1OsN0wTOHTcPx76Cbz6rQ0gxOQyE6tSJqzy90+
 v6zUJQwRmN4tHsLEhRA1+1XPswsi7KAYwTu5PJ5zHANQq81RlIm30nIqE3diLAomz1uQ
 ZGOJVn6PEL2GJJArixAnQ7mZTnijOHxNGapWdddn1KxtvoDHIcaq77lhM8EiMQypktHj
 1jH/kVGyJje8LK4BJgGrZcjD9PBD4X98pkYa1UrmPYTf1fuH5UdVHEZ8EYnKEnRq5YYE
 BJzA==
X-Gm-Message-State: AOAM530mhyTe3WC2RmH+qpxOlSrbOwDQ4HgvAe2WWSXRg0z9xrQ6ArQd
 QbD0rGjQNMBIVtT1Rbob5wL5eR2ph/Cbsm3uk2qCT2px5/pQAlS+H6FPHV2cyhJcnssJR0bfEv2
 BFS8+xpCUrR761BQ=
X-Received: by 2002:a17:907:60cc:b0:6da:9616:ecec with SMTP id
 hv12-20020a17090760cc00b006da9616ececmr259370ejc.298.1648825730213; 
 Fri, 01 Apr 2022 08:08:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzsrRpjPY8HQ4uSqiFLmZj6FRIUru3fc0uEpHnFYzG4t/Rm4iLmn4dYjhL1A3ey9m8yx3j/Vg==
X-Received: by 2002:a17:907:60cc:b0:6da:9616:ecec with SMTP id
 hv12-20020a17090760cc00b006da9616ececmr259349ejc.298.1648825730023; 
 Fri, 01 Apr 2022 08:08:50 -0700 (PDT)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a170906161900b006d43be5b95fsm1122482ejd.118.2022.04.01.08.08.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Apr 2022 08:08:49 -0700 (PDT)
Message-ID: <6e61a952-ab34-b3e6-65a5-ab599a5a7559@redhat.com>
Date: Fri, 1 Apr 2022 17:08:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 0/3] block/dirty-bitmaps: fix and improve bitmap merge
To: Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
References: <20220401100804.315728-1-vsementsov@openvz.org>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20220401100804.315728-1-vsementsov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, v.sementsov-og@mail.ru, eblake@redhat.com,
 qemu-devel@nongnu.org, nikita.lapshin@virtuozzo.com, vsementsov@openvz.org,
 jsnow@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.04.22 12:08, Vladimir Sementsov-Ogievskiy wrote:
> v3: rebase on master, one patch is already merged.
>
> Vladimir Sementsov-Ogievskiy (3):
>    block: block_dirty_bitmap_merge(): fix error path
>    block: improve block_dirty_bitmap_merge(): don't allocate extra bitmap
>    block: simplify handling of try to merge different sized bitmaps
>
>   include/block/block_int-io.h    |  2 +-
>   include/qemu/hbitmap.h          | 15 ++-----------
>   block/backup.c                  |  6 ++----
>   block/dirty-bitmap.c            | 26 ++++++++++------------
>   block/monitor/bitmap-qmp-cmds.c | 38 +++++++++++++++++----------------
>   util/hbitmap.c                  | 25 ++++++----------------
>   6 files changed, 43 insertions(+), 69 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


