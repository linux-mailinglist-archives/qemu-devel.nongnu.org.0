Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EC844EAD1
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Nov 2021 16:47:41 +0100 (CET)
Received: from localhost ([::1]:37150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlYmC-0002op-5v
	for lists+qemu-devel@lfdr.de; Fri, 12 Nov 2021 10:47:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlYky-0001y5-Mm
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 10:46:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mlYkx-0003og-1F
 for qemu-devel@nongnu.org; Fri, 12 Nov 2021 10:46:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636731982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=M8sLP8hE3TPBWWVrdTsz7rOMIHbNCU6sRVBYqo9yzvw=;
 b=KvceB6t2kwgqYtAdxiGb3Z0MxD919KwrC7W4ZGGIPWCnIfIfmo+ekmSO2qY76hILbyOkgW
 7WlgM6CMRt+R5hWtUNDK/gGnZ6KUbZGdQpQCplgIMUrUBJ0ORLyMLaOV5UxszUxcfiekip
 WoMBw0qHK4v8zGaFFlJMwEqCRkVYlyQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-437-8wzNudeRMzqISHwv8FXhfg-1; Fri, 12 Nov 2021 10:46:19 -0500
X-MC-Unique: 8wzNudeRMzqISHwv8FXhfg-1
Received: by mail-wm1-f72.google.com with SMTP id
 k25-20020a05600c1c9900b00332f798ba1dso6467114wms.4
 for <qemu-devel@nongnu.org>; Fri, 12 Nov 2021 07:46:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=M8sLP8hE3TPBWWVrdTsz7rOMIHbNCU6sRVBYqo9yzvw=;
 b=Ng44iw3iC5tdsL7FExs3ZuM8l8ZzzGdywOofHfZXaT2KJv6OYcuM5OCmLZZxgXntKT
 yqjEMJg0zFlmfrD6oBVyB0QCXt6sf7mI1LxJQ+lXvK4rdTfkw8vjWd0lROe+/EWnaaXc
 /sBmnB3Y8n0Dk2JUsh7EWBeFAtHcoSFlr081Cu5BtW9kHwHsXgtOcHAy6E2u7GuhiE5J
 JHh46Ke0HHFmuUNRHaETT35r7hPfoERiQERTpVyrX64SmBaWwdOFuHkctOMg09ysyjhL
 3MRu8BhHI2KgVOaEM8eJXjV+niG83RnfCP293IWT4g7fUNJNnqqvwrn+pY3BdqNvYAQ5
 xOTw==
X-Gm-Message-State: AOAM530l8Uprrenkayx7bTQsce21h0H7R75dFZsLiUeCw/b0ei8YLf0X
 o822K/18GkEKwa9lZdIVzZYtHmnR8INKBSAYPIpDYczEi/4GSC7tlLR8tZU19nHMhW4UvkAbnA8
 yeEui/nklEwt5IOA=
X-Received: by 2002:adf:efc6:: with SMTP id i6mr20029576wrp.428.1636731978084; 
 Fri, 12 Nov 2021 07:46:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzL3sQPgaOy1r2lC8NvOwfdxOle91NNtr43vVUwDVvsRMQkKBNEK41lVHe6JPnYveD2sG+4dA==
X-Received: by 2002:adf:efc6:: with SMTP id i6mr20029549wrp.428.1636731977881; 
 Fri, 12 Nov 2021 07:46:17 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id m125sm11872168wmm.39.2021.11.12.07.46.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Nov 2021 07:46:17 -0800 (PST)
Message-ID: <58bc9ed4-d8b5-4ec6-dbca-8ed12e576e99@redhat.com>
Date: Fri, 12 Nov 2021 16:46:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 14/25] include/systemu/blockdev.h: global state API
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-block@nongnu.org
References: <20211025101735.2060852-1-eesposit@redhat.com>
 <20211025101735.2060852-15-eesposit@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211025101735.2060852-15-eesposit@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.449, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 qemu-devel@nongnu.org, John Snow <jsnow@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Subject: s/systemu/sysemu/

On 25.10.21 12:17, Emanuele Giuseppe Esposito wrote:
> blockdev functions run always under the BQL lock.
>
> Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> ---
>   include/sysemu/blockdev.h | 18 ++++++++++++++----
>   1 file changed, 14 insertions(+), 4 deletions(-)
>
> diff --git a/include/sysemu/blockdev.h b/include/sysemu/blockdev.h
> index 960b54d320..b07f15df09 100644
> --- a/include/sysemu/blockdev.h
> +++ b/include/sysemu/blockdev.h
> @@ -13,9 +13,6 @@
>   #include "block/block.h"
>   #include "qemu/queue.h"
>   
> -void blockdev_mark_auto_del(BlockBackend *blk);
> -void blockdev_auto_del(BlockBackend *blk);
> -
>   typedef enum {
>       IF_DEFAULT = -1,            /* for use with drive_add() only */
>       /*
> @@ -40,6 +37,16 @@ struct DriveInfo {
>       QTAILQ_ENTRY(DriveInfo) next;
>   };
>   
> +/*
> + * Global state (GS) API. These functions run under the BQL lock.
> + *
> + * See include/block/block-global-state.h for more information about
> + * the GS API.
> + */
> +
> +void blockdev_mark_auto_del(BlockBackend *blk);
> +void blockdev_auto_del(BlockBackend *blk);
> +
>   DriveInfo *blk_legacy_dinfo(BlockBackend *blk);
>   DriveInfo *blk_set_legacy_dinfo(BlockBackend *blk, DriveInfo *dinfo);
>   BlockBackend *blk_by_legacy_dinfo(DriveInfo *dinfo);
> @@ -50,10 +57,13 @@ DriveInfo *drive_get(BlockInterfaceType type, int bus, int unit);
>   void drive_check_orphaned(void);
>   DriveInfo *drive_get_by_index(BlockInterfaceType type, int index);
>   int drive_get_max_bus(BlockInterfaceType type);
> -int drive_get_max_devs(BlockInterfaceType type);
>   DriveInfo *drive_get_next(BlockInterfaceType type);
>   
>   DriveInfo *drive_new(QemuOpts *arg, BlockInterfaceType block_default_type,
>                        Error **errp);
>   
> +/* Common functions that are neither I/O nor Global State */
> +
> +int drive_get_max_devs(BlockInterfaceType type);
> +

It seems to me like this function is never used and could just be 
dropped.  In any case, if it were used, it looks to me like it’d be used 
in a GS context.  (Not that I know anything about it, but I don’t see 
what makes it different from the other functions here.)

Hanna


