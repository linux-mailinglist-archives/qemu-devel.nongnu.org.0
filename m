Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A624948EEE5
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 18:01:55 +0100 (CET)
Received: from localhost ([::1]:50074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Pxa-0003Yh-9H
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 12:01:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8PrS-00008U-1s
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 11:55:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8PrK-0005vd-B3
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 11:55:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642179320;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RtsW+DGvHLsuRhDdjoabNptkQVemwqbUV+w2fLKeUrk=;
 b=E8QUYnnB/iAIlBupZG0Jg3O7mzM2E6XGAVOtZUa4LUmWYVdG1DC+lBPrGbRbl1V4ALmnen
 WQD7HBTjl7zzYf0fZp3D4Fa3KXfPWC8zVIamN2OH9pwSxvxgVCJwpYjXc8ihoMteoYQUj4
 P1p9AAVSQNq7QsSGAlpoUWuALzhd4y4=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-629-ZpJgNqR7MqSGaM5IG8QgoQ-1; Fri, 14 Jan 2022 11:55:19 -0500
X-MC-Unique: ZpJgNqR7MqSGaM5IG8QgoQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j18-20020a05600c1c1200b0034aeea95dacso2993485wms.8
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 08:55:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RtsW+DGvHLsuRhDdjoabNptkQVemwqbUV+w2fLKeUrk=;
 b=S466SrcVNI0NvVavs5tBn7JBONjp1ajg4mjruZ7UUyfek1L/blRNnWcIJBif6jo6gI
 ZJ9D2EQg6eq5adY1OqpJbjTHDPYvW0zpyH0eorPemVcIWiKDHZCXtyQbZ2NieM92gJcO
 OZU+u36boXC8jQyNCMHsvqG1Y0W9Ph/Mqm9HdXs46nGOXahM5EkSLwNINnWaJ3fyheW0
 wdpIbxaK/xiWcY5m0TsjWjoDnCYSdn6UH/klhSJKdW4wsLzvaOJoLtbgaTXvpO29SYbN
 tnqFfsiG4FuEsQMmBzWNhCDFXRKuNnEG93yJs9o+KWaYlF0Fk7iPq35MRnohKoi3gLmq
 Mr9w==
X-Gm-Message-State: AOAM53283nmh1UCNsGP1gdfKzV3Z2ZdkHN532Hb/TrhmnpaHC4t8d/lx
 FM+YtoQvLK66nwrGEkg7bsgvG+WDztRP8yPu9/4bEbqMiXEiYFZV4T2qSsQvDsd8jt+GzPoMhQ6
 hX3k1EpXHyyunNjg=
X-Received: by 2002:adf:da4a:: with SMTP id r10mr8829354wrl.553.1642179317440; 
 Fri, 14 Jan 2022 08:55:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzTXHb1JJ89ip1xyo2TvghvWfoZ+nThsVjPOMV00Xe5K7PnZBOn6dhPUE83B08961WJHVr01A==
X-Received: by 2002:adf:da4a:: with SMTP id r10mr8829334wrl.553.1642179317265; 
 Fri, 14 Jan 2022 08:55:17 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id j13sm12637284wmq.11.2022.01.14.08.55.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 08:55:16 -0800 (PST)
Message-ID: <d6315f74-7389-f1db-ba54-82c4993cd9a6@redhat.com>
Date: Fri, 14 Jan 2022 17:55:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 02/19] block/dirty-bitmap: bdrv_merge_dirty_bitmap():
 add return value
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-3-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211222174018.257550-3-vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: kwolf@redhat.com, wencongyang2@huawei.com, xiechanglong.d@gmail.com,
 qemu-devel@nongnu.org, armbru@redhat.com, jsnow@redhat.com,
 nikita.lapshin@virtuozzo.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.12.21 18:40, Vladimir Sementsov-Ogievskiy wrote:
> That simplifies handling failure in existing code and in further new
> usage of bdrv_merge_dirty_bitmap().
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   include/block/dirty-bitmap.h    | 2 +-
>   block/dirty-bitmap.c            | 9 +++++++--
>   block/monitor/bitmap-qmp-cmds.c | 5 +----
>   3 files changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


