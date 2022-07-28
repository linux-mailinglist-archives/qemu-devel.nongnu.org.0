Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D111E583881
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 08:13:37 +0200 (CEST)
Received: from localhost ([::1]:32938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGwm8-00065w-Tw
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 02:13:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGwgJ-0001ss-U0
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:07:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oGwgH-0008QW-Lr
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 02:07:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658988453;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+XLEojc6v5wo/bcInvLpU+CVcAi5JjASWa3hOrGZfZE=;
 b=ht/p/A+g+e4ZkN5zcESwmanz+G2AR5cPEsQ3lUK0ya7o+YzVUEbYuU5lO+ZJc5fZuTa+xG
 jPQd6M2L1BHwrv0VsU/CoWpDdW1SuH1SIESAjJbWZgrDUvgtHo/9/symQjxJ+7g55DJ7xZ
 AQSR/zzeAfcdvX0ZyseV6Mk4PAreOZs=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-22-7UcTu6l9Nd6Yq4mYdcq8lQ-1; Thu, 28 Jul 2022 02:07:24 -0400
X-MC-Unique: 7UcTu6l9Nd6Yq4mYdcq8lQ-1
Received: by mail-pj1-f70.google.com with SMTP id
 r13-20020a17090a454d00b001f04dfc6195so680480pjm.2
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 23:07:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+XLEojc6v5wo/bcInvLpU+CVcAi5JjASWa3hOrGZfZE=;
 b=fdpvwuEC3m7OWOB5LPcOdFefogLwQcX7tH9eL0omiIFtiCnYDbxPz/OMcS4WWkI3xc
 9TXuLOrT5KuTrwU4VBgJlM/WUCDTlNfy70TT9iqP+JAV6R4ZolPOndcsVqW1dHSlMH7P
 M1kmumccC4has6R4FaT9Vz42PgE/Xx3opkulexg6o1xMKfLLEsl5H0KMUHCrKlj/2oCa
 bymZN1ODnjqbXeDG6C6AFZgceYgk7PPn/CCH9g4M4vV5joeDxNTwcU8C5SsuHEJnqZkQ
 KzuNFcfnohX64XlVKo5lis/TCbJRyfIqYnIevc2mL4RxMKKEa3w97bD2ETluV2QsoTbI
 FnlQ==
X-Gm-Message-State: AJIora813yBdwdDAbt8eL0484OrwyD514Kxluth9a6Fzg/9Y+9IhMgPc
 Tgngs6lxvaoqN+uYkIkid1NHCvv3ha+WHRIxA68NzzuHKi04qVxUSNqbC35ScXqkFKqD8IzqMFa
 ztsJSx71Bw3HnPJc=
X-Received: by 2002:a17:90b:1b45:b0:1f3:1974:eb8 with SMTP id
 nv5-20020a17090b1b4500b001f319740eb8mr3203467pjb.200.1658988442973; 
 Wed, 27 Jul 2022 23:07:22 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sgq6x5k/QtpmOw2UBqe/6LJsFRurpeJMgNb1bUXbt3xQkdyLnSwhvfyzz7joGlzzKO0q7jLg==
X-Received: by 2002:a17:90b:1b45:b0:1f3:1974:eb8 with SMTP id
 nv5-20020a17090b1b4500b001f319740eb8mr3203446pjb.200.1658988442754; 
 Wed, 27 Jul 2022 23:07:22 -0700 (PDT)
Received: from [10.72.12.154] ([209.132.188.80])
 by smtp.gmail.com with ESMTPSA id
 k27-20020aa79d1b000000b00528c22038f5sm15519127pfp.14.2022.07.27.23.07.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Jul 2022 23:07:22 -0700 (PDT)
Message-ID: <52eca613-cf6e-2039-c3cc-a66a812d4038@redhat.com>
Date: Thu, 28 Jul 2022 14:07:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v3 03/21] hw/virtio: fix some coding style issues
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: slp@redhat.com, mst@redhat.com, marcandre.lureau@redhat.com,
 stefanha@redhat.com, mathieu.poirier@linaro.org, viresh.kumar@linaro.org,
 mark.cave-ayland@ilande.co.uk
References: <20220726192150.2435175-1-alex.bennee@linaro.org>
 <20220726192150.2435175-4-alex.bennee@linaro.org>
From: Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220726192150.2435175-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


在 2022/7/27 03:21, Alex Bennée 写道:
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>


Acked-by: Jason Wang <jasowang@redhat.com>


> ---
>   hw/virtio/vhost-user.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
> index 75b8df21a4..55fce18480 100644
> --- a/hw/virtio/vhost-user.c
> +++ b/hw/virtio/vhost-user.c
> @@ -200,7 +200,7 @@ typedef struct {
>       VhostUserRequest request;
>   
>   #define VHOST_USER_VERSION_MASK     (0x3)
> -#define VHOST_USER_REPLY_MASK       (0x1<<2)
> +#define VHOST_USER_REPLY_MASK       (0x1 << 2)
>   #define VHOST_USER_NEED_REPLY_MASK  (0x1 << 3)
>       uint32_t flags;
>       uint32_t size; /* the following payload size */
> @@ -208,7 +208,7 @@ typedef struct {
>   
>   typedef union {
>   #define VHOST_USER_VRING_IDX_MASK   (0xff)
> -#define VHOST_USER_VRING_NOFD_MASK  (0x1<<8)
> +#define VHOST_USER_VRING_NOFD_MASK  (0x1 << 8)
>           uint64_t u64;
>           struct vhost_vring_state state;
>           struct vhost_vring_addr addr;
> @@ -248,7 +248,8 @@ struct vhost_user {
>       size_t             region_rb_len;
>       /* RAMBlock associated with a given region */
>       RAMBlock         **region_rb;
> -    /* The offset from the start of the RAMBlock to the start of the
> +    /*
> +     * The offset from the start of the RAMBlock to the start of the
>        * vhost region.
>        */
>       ram_addr_t        *region_rb_offset;


