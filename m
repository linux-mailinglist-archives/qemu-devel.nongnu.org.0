Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C4740B5C6
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 19:18:16 +0200 (CEST)
Received: from localhost ([::1]:47314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQC4V-0002Ib-Vz
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 13:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQC1m-0007up-Vd
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:15:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:23669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mQC1k-0000KI-JA
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 13:15:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631639723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q5ITpsX44rItoAT8pzyIK6fqDFUsM7UngBBaWX6hI9k=;
 b=UnS4L92P91xBRnBz4Lcr7WnTgjhxrEBf8iIdP6Sr72I0kPuyuzKP5QWZFW/s4IrkBnsqaS
 xDU5TurbkUNgCQnJ0f+0vuApDHZCc+3+X+/qCFE5Rsnnejmm2DMn/QpODDv3DLrUgo1sqh
 NWL9JfLbBw8HYtnTZfzi0xWpnEYb5eM=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-NcjS9VnbMTGMeBCSAq0Lsg-1; Tue, 14 Sep 2021 13:15:22 -0400
X-MC-Unique: NcjS9VnbMTGMeBCSAq0Lsg-1
Received: by mail-wm1-f71.google.com with SMTP id
 n17-20020a7bc5d1000000b002f8ca8bacdeso30329wmk.3
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 10:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=q5ITpsX44rItoAT8pzyIK6fqDFUsM7UngBBaWX6hI9k=;
 b=dCc0kH2FkqVUUzSbKnnojhwA6ZwRPuvb9VTyMC/tCiydH0SBKhvYjxlSI/RZlis8EJ
 D32PzrxMxRfUDugIDLpmOADNeGKIrR+knTjw/3+py0ZUTnE+pi76yh5DR9NKRAKZuCeU
 KkpEJrOYP9P39SjeJHx3SdhsQ5RvH9aA8Z6WtsJrUsGFcWomlZjz3HDixW4rwXs66eSg
 qGI4BEcz9x5tigiMeotcFRPpchGzRLaEnzOwR0XNYcDc6IO12Gb3vc/EQmTWdC3BkUox
 XGl63hS8u015t7a02TBCdXp5WP+Cd5UZACYq9fvTEepH/dZB/YB33+LLhTj7039I7bdW
 OOgQ==
X-Gm-Message-State: AOAM530ZjnjHL2P6lROk9MdlxLjxpDt1/hTs4w5tthoraYAs2MHHbXDc
 91dPcXdAn1oxE6jlyeMxRV3RbAn1vXkRiiMMDmdH+wt0l5vxtWRNypoMXRG2jlaQ3aOpQtXdN7P
 wifVccVKif/a1tPg=
X-Received: by 2002:a5d:6288:: with SMTP id k8mr249792wru.137.1631639721446;
 Tue, 14 Sep 2021 10:15:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1iyTZdIT39A7rPiAVN1AywkvahYdLQgGgWTmMZzY9+miEzXnkJFUG4r8WqJiAUoJEHCiz7w==
X-Received: by 2002:a5d:6288:: with SMTP id k8mr249761wru.137.1631639721168;
 Tue, 14 Sep 2021 10:15:21 -0700 (PDT)
Received: from dresden.str.redhat.com
 ([2a02:908:1e42:9e20:fd73:7ee2:9975:24d9])
 by smtp.gmail.com with ESMTPSA id o7sm1538636wmq.36.2021.09.14.10.15.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 14 Sep 2021 10:15:20 -0700 (PDT)
Subject: Re: [PATCH v4 07/10] qcow2-refcount: check_refcounts_l2(): check
 reserved bits
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20210914122454.141075-1-vsementsov@virtuozzo.com>
 <20210914122454.141075-8-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
Message-ID: <34618a0a-db34-9d84-a7fa-57f6ab6f88b5@redhat.com>
Date: Tue, 14 Sep 2021 19:15:20 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914122454.141075-8-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
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
 ktkhai@virtuozzo.com, den@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 14.09.21 14:24, Vladimir Sementsov-Ogievskiy wrote:
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> Reviewed-by: Eric Blake <eblake@redhat.com>
> Tested-by: Kirill Tkhai <ktkhai@virtuozzo.com>
> Reviewed-by: Hanna Reitz <hreitz@redhat.com>
> ---
>   block/qcow2.h          |  1 +
>   block/qcow2-refcount.c | 12 +++++++++++-
>   2 files changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/block/qcow2.h b/block/qcow2.h
> index c0e1e83796..b8b1093b61 100644
> --- a/block/qcow2.h
> +++ b/block/qcow2.h
> @@ -587,6 +587,7 @@ typedef enum QCow2MetadataOverlap {
>   
>   #define L1E_OFFSET_MASK 0x00fffffffffffe00ULL
>   #define L2E_OFFSET_MASK 0x00fffffffffffe00ULL
> +#define L2E_STD_RESERVED_MASK 0x3f000000000001feULL
>   
>   #define REFT_OFFSET_MASK 0xfffffffffffffe00ULL
>   
> diff --git a/block/qcow2-refcount.c b/block/qcow2-refcount.c
> index 9a5ae3cac4..5d57e677bc 100644
> --- a/block/qcow2-refcount.c
> +++ b/block/qcow2-refcount.c
> @@ -1682,8 +1682,18 @@ static int check_refcounts_l2(BlockDriverState *bs, BdrvCheckResult *res,
>           int csize;
>           l2_entry = get_l2_entry(s, l2_table, i);
>           l2_bitmap = get_l2_bitmap(s, l2_table, i);
> +        QCow2ClusterType type = qcow2_get_cluster_type(bs, l2_entry);

Hm, with l2_bitmap being declared next to l2_entry, this is now the 
patch that adds a declaration after a statement here.

(The possible resolutions seem to be the same, either move the 
declaration up to the function’s root block, or move l2_entry and 
l2_bitmap’s declarations here...)

(I don’t think we need a v5 for this, it should be fine if you tell me 
which way you prefer.)

Hanna


