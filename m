Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB94F64DBCA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 13:58:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5nnD-0004GY-ML; Thu, 15 Dec 2022 07:56:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p5nn7-0004ER-E7
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:56:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@redhat.com>) id 1p5nmw-0006r3-0G
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 07:56:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671108997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hxHvr1WF3DPwGOYO1Tcgy+Jx9cmKpDjOSpM0BxlujO8=;
 b=LqQKDEA8kEYCCNdV31T4ZpAGqW9QeirXrS+5bAuWzPJ5uQWPS/vNk8tvjT1tRGnlxuuw8d
 SMS7as0ib2V5qL1FmWcVtCuyWNml4RJOt5LIlUPKkmkSQA9/vEwXwwMW+un4OFMxvP+Keo
 fbZ55bHQBsywUrUnHOyQa9XUJpkyjrg=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-319-4QDeZ0ydMr2205a4LqWwZg-1; Thu, 15 Dec 2022 07:56:33 -0500
X-MC-Unique: 4QDeZ0ydMr2205a4LqWwZg-1
Received: by mail-wm1-f72.google.com with SMTP id
 q21-20020a7bce95000000b003d236c91639so734043wmj.8
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 04:56:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hxHvr1WF3DPwGOYO1Tcgy+Jx9cmKpDjOSpM0BxlujO8=;
 b=jUG1nj+3mf5c7y263ZkebGdqt4vBRCs3EzTgeN9a9z2Bl/b6ctfP3mqeaLmfeuI1r0
 U9JqM/T37EkSBq8v0B6Ux7i8ItmMis1zEu0P/VU0CHoj5nCypyWFCRTU4nM8Zyg31aPy
 EHq7IZAnORlTFl6z4RPy9td8VB/n3stc3SXdFXHhuf2uGAEdovmracTlQzpX1UXbK1Ht
 M2DynmzsJ1ouZPFVZPPZJiX8C0RN4BpijYGua+VU0Qi/HvkjfDjn+3H4Cx5T38p7pDP6
 jGDV8UAihi86c0C8/H+nyYhL5DDU5uLwjOEv6moyio2obT0eXL+A0N1ecZbDKyLyJ2/h
 f5iQ==
X-Gm-Message-State: ANoB5pnWcl2ZUqbn27LFo9F/aYf7WjndD4Au/j5Zu+GmRQOV7HAg+ebB
 UcAzbDZxNrFeQBIIIbTjTThCWQgT0DS254ZR34RUC9ruizPKvPQlEciT1NUR51viZsg8GTO3qsr
 GQke6jkof7CQ9eic=
X-Received: by 2002:a05:600c:1c16:b0:3d1:e583:51a0 with SMTP id
 j22-20020a05600c1c1600b003d1e58351a0mr22152534wms.25.1671108992601; 
 Thu, 15 Dec 2022 04:56:32 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Mt1jycQIFlRc65KczCIe1B4C6fzAYKZLas18xM3PfoHF6lrJCDzfmYstxuJCHHZXgZJcHzw==
X-Received: by 2002:a05:600c:1c16:b0:3d1:e583:51a0 with SMTP id
 j22-20020a05600c1c1600b003d1e58351a0mr22152517wms.25.1671108992200; 
 Thu, 15 Dec 2022 04:56:32 -0800 (PST)
Received: from ?IPV6:2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0?
 ([2a01:e0a:280:24f0:7cc2:9bb4:28db:3a0])
 by smtp.gmail.com with ESMTPSA id
 l5-20020a1c7905000000b003d1e4120700sm6800724wme.41.2022.12.15.04.56.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Dec 2022 04:56:31 -0800 (PST)
Message-ID: <bfa00c52-8e1d-0abd-ff4c-72724620900a@redhat.com>
Date: Thu, 15 Dec 2022 13:56:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v1 22/24] vfio-user: add 'x-msg-timeout' option that
 specifies msg wait times
Content-Language: en-US
To: John Johnson <john.g.johnson@oracle.com>, qemu-devel@nongnu.org
References: <cover.1667542066.git.john.g.johnson@oracle.com>
 <c7fc9005cc61d7ca53156ee5ece4c17980a78b15.1667542066.git.john.g.johnson@oracle.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@redhat.com>
In-Reply-To: <c7fc9005cc61d7ca53156ee5ece4c17980a78b15.1667542066.git.john.g.johnson@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=clg@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 11/9/22 00:13, John Johnson wrote:
> Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> ---
>   hw/vfio/pci.c  | 4 ++++
>   hw/vfio/pci.h  | 1 +
>   hw/vfio/user.c | 7 +++++--
>   hw/vfio/user.h | 1 +
>   4 files changed, 11 insertions(+), 2 deletions(-)>
> diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
> index 005fcf8..3ae3a13 100644
> --- a/hw/vfio/pci.c
> +++ b/hw/vfio/pci.c
> @@ -3729,6 +3729,9 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
>       if (udev->no_post) {
>           proxy->flags |= VFIO_PROXY_NO_POST;
>       }
> +    if (udev->wait_time) {
> +        proxy->wait_time = udev->wait_time;
> +    }
>   
>       vfio_user_validate_version(proxy, &err);
>       if (err != NULL) {
> @@ -3848,6 +3851,7 @@ static Property vfio_user_pci_dev_properties[] = {
>       DEFINE_PROP_BOOL("secure-dma", VFIOUserPCIDevice, secure_dma, false),
>       DEFINE_PROP_BOOL("x-send-queued", VFIOUserPCIDevice, send_queued, false),
>       DEFINE_PROP_BOOL("x-no-posted-writes", VFIOUserPCIDevice, no_post, false),
> +    DEFINE_PROP_UINT32("x-msg-timeout", VFIOUserPCIDevice, wait_time, 0),

I see that patch 9 introduced :

+static int wait_time = 5000;   /* wait up to 5 sec for busy servers */

May be use a define instead and assign  "x-msg-timeout" to this default
value.

how do you plan to use the "x-msg-timeout" property ?

Thanks,

C.

>       DEFINE_PROP_END_OF_LIST(),
>   };
>   
> diff --git a/hw/vfio/pci.h b/hw/vfio/pci.h
> index c4b8e5c..48b19ee 100644
> --- a/hw/vfio/pci.h
> +++ b/hw/vfio/pci.h
> @@ -199,6 +199,7 @@ struct VFIOUserPCIDevice {
>       bool secure_dma;    /* disable shared mem for DMA */
>       bool send_queued;   /* all sends are queued */
>       bool no_post;       /* all regions write are sync */
> +    uint32_t wait_time; /* timeout for message replies */
>   };
>   
>   /* Use uin32_t for vendor & device so PCI_ANY_ID expands and cannot match hw */
> diff --git a/hw/vfio/user.c b/hw/vfio/user.c
> index ddf9e13..a9e6cf5 100644
> --- a/hw/vfio/user.c
> +++ b/hw/vfio/user.c
> @@ -717,7 +717,8 @@ static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
>   
>       if (ret == 0) {
>           while (!msg->complete) {
> -            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
> +            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock,
> +                                     proxy->wait_time)) {
>                   VFIOUserMsgQ *list;
>   
>                   list = msg->pending ? &proxy->pending : &proxy->outgoing;
> @@ -759,7 +760,8 @@ static void vfio_user_wait_reqs(VFIOProxy *proxy)
>           msg = proxy->last_nowait;
>           msg->type = VFIO_MSG_WAIT;
>           while (!msg->complete) {
> -            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
> +            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock,
> +                                     proxy->wait_time)) {
>                   VFIOUserMsgQ *list;
>   
>                   list = msg->pending ? &proxy->pending : &proxy->outgoing;
> @@ -881,6 +883,7 @@ VFIOProxy *vfio_user_connect_dev(SocketAddress *addr, Error **errp)
>   
>       proxy->flags = VFIO_PROXY_CLIENT;
>       proxy->state = VFIO_PROXY_CONNECTED;
> +    proxy->wait_time = wait_time;
>   
>       qemu_mutex_init(&proxy->lock);
>       qemu_cond_init(&proxy->close_cv);
> diff --git a/hw/vfio/user.h b/hw/vfio/user.h
> index d88ffe5..f711861 100644
> --- a/hw/vfio/user.h
> +++ b/hw/vfio/user.h
> @@ -62,6 +62,7 @@ typedef struct VFIOProxy {
>       uint64_t max_bitmap;
>       uint64_t migr_pgsize;
>       int flags;
> +    uint32_t wait_time;
>       QemuCond close_cv;
>       AioContext *ctx;
>       QEMUBH *req_bh;


