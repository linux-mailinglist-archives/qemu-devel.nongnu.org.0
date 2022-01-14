Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65B3648EEE6
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 18:02:00 +0100 (CET)
Received: from localhost ([::1]:50318 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8Pxf-0003jL-Ez
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 12:01:59 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8Pr0-0008WF-Kt
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 11:55:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:38972)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1n8Pqw-0005jO-TE
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 11:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642179301;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KHaRNEq7pnJDEkvDvofIq6SNOvBily4/yBDg3x7rV1k=;
 b=OHNqmrnhViiYmSmBcdqdS9tZ0y42jD3TLJ9Iphz5bVCFlsGb07OZFXqVjljst5+6nmfMe2
 Bw7vmAIQX4eaUzbd7wv3BF5n6i/mjEfdH3MuSMdq45+Jv+SRzStua7ORk/0VyaP8GK10FD
 KPk8sQAPUsGvAzEoNLQDUJfFnd/Rv9c=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-yAjOAAMmMeyFGhYz7IwDIA-1; Fri, 14 Jan 2022 11:55:00 -0500
X-MC-Unique: yAjOAAMmMeyFGhYz7IwDIA-1
Received: by mail-wm1-f71.google.com with SMTP id
 n25-20020a05600c3b9900b00348b83fbd0dso5889583wms.0
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 08:55:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KHaRNEq7pnJDEkvDvofIq6SNOvBily4/yBDg3x7rV1k=;
 b=sHldhjSY8EqrUPs3q0IhG6vRtxDx+XnSYoU5sKT7Ki3U8mac56QwRmOz0wFahMxxEY
 6ziNmOQ4jlEQyrte3Xo1L3Lm0e+Q1y1gYSLi6pEJMv/r1bH8cE07nwNc1KI0kUdh+LJu
 UTBlCMy+g5FYPnOG6W3JK5DBPgcRXBKkh8MEwPPTbPLLizr3ErWCvrx5kOBJEbUE3+oZ
 Z988xzGrWWuc01vxSJrjMPhJ2uO8mTk2Hw63Y4amcwqYQ+yntAkIUI9UllWId4O8F24L
 wPn8ti+ysWzUZuP3QwUWISvaIgdjo8R1hnb6oggtIAbNvgkdQe5pqmJjqWy/0fhnSSHm
 y+gA==
X-Gm-Message-State: AOAM531kvQ6yXPzsFXBAayHv3zEyKniJULqtViXS8ORxfKjHbHt5fvi0
 VZ8PY9TdVoVYVc6vaBgLZobyuMYbNRNMbnZ4ApHPRgHHq8iVLwoM9StS3XVwKuBc4VJd5XvS0ew
 CiD1IJqZk+hpKZVs=
X-Received: by 2002:a05:600c:4991:: with SMTP id
 h17mr9119138wmp.14.1642179299349; 
 Fri, 14 Jan 2022 08:54:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxoSunruHz/msR8aOQjWTIMV+dl4IMenR6YmdMXsild8DWAfrv3ZWH6Vu3Qjux5x1xZHufBgg==
X-Received: by 2002:a05:600c:4991:: with SMTP id
 h17mr9119114wmp.14.1642179299078; 
 Fri, 14 Jan 2022 08:54:59 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id l31sm6005062wms.1.2022.01.14.08.54.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 08:54:58 -0800 (PST)
Message-ID: <f271307a-3d05-92a5-59fe-1e94a7c53577@redhat.com>
Date: Fri, 14 Jan 2022 17:54:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 01/19] block/block-copy: move copy_bitmap
 initialization to block_copy_state_new()
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20211222174018.257550-1-vsementsov@virtuozzo.com>
 <20211222174018.257550-2-vsementsov@virtuozzo.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211222174018.257550-2-vsementsov@virtuozzo.com>
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
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
> We are going to complicate bitmap initialization in the further
> commit. And in future, backup job will be able to work without filter
> (when source is immutable), so we'll need same bitmap initialization in
> copy-before-write filter and in backup job. So, it's reasonable to do
> it in block-copy.
>
> Note that for now cbw_open() is the only caller of
> block_copy_state_new().
>
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>   block/block-copy.c        | 1 +
>   block/copy-before-write.c | 4 ----
>   2 files changed, 1 insertion(+), 4 deletions(-)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>


