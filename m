Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0184FBBEB
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Apr 2022 14:20:12 +0200 (CEST)
Received: from localhost ([::1]:33592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ndt1e-0001rK-Lq
	for lists+qemu-devel@lfdr.de; Mon, 11 Apr 2022 08:20:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ndt0J-0001AP-3O
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:18:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:58983)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1ndt0G-0002rt-9Y
 for qemu-devel@nongnu.org; Mon, 11 Apr 2022 08:18:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649679523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=02JRn31hAxq99+wMZWaOrQkyLeBTVUJnZXhWKomVrqE=;
 b=Q08vkajcNNCqnqD9d04Xc34XXqSiAaqflJuqCf844O0cJnr9+QuOtBqPaiElQu4wt3agRg
 74uqSMaZD4IVEA0hAQ9TnQPM5ZIIXKIxpVTy5eiRIn7SJLqyBBF1X+NBdEJVCrfyGtJDlQ
 zYvlPOVtwvfbo/ObJlRInRvj+Jw0JE0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-25-nom7Sk3WN2irBYURXw1HjA-1; Mon, 11 Apr 2022 08:18:40 -0400
X-MC-Unique: nom7Sk3WN2irBYURXw1HjA-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg8-20020a05600c3c8800b0038e6a989925so4551929wmb.3
 for <qemu-devel@nongnu.org>; Mon, 11 Apr 2022 05:18:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=02JRn31hAxq99+wMZWaOrQkyLeBTVUJnZXhWKomVrqE=;
 b=esELD+VaDdBt9Ns9tT5284IyNREzRACKCzNvuSBpdjdhRcf33nPBwYLHp/yeX3fRLD
 GpJzKtXp66AXvnyppix35MjSWLoTKLiY5KY1vKAyUNLrSNygCpIJRHfD3CHrJcq0apWR
 bZhg+/1iNjreqc8uJmHneE7/ZsR8dHAFFw7gobmkKRlyg0xV1TM3bKLkrhNN0VaD0vzy
 72vtmoTD4QJaE1jntIb0MSrinPD4nDDmnMLUlIzb+gbwoA8zXyH97A6Z+hrPEz87xJiL
 uNXVfVT5SuSrBdaAL7Xvg4F7X6q6iEXQ4+XCKILX98NgnkbjyAzDnf4TOPx4kxKh+e1q
 iymQ==
X-Gm-Message-State: AOAM531yq6e9zmeM5dzv/FIDqlBkZVb7wURShSuY1gn047bzXnLZjiE6
 DtGQIZuZSnOKt/bkVepiRX2N6AfbVKxb9aVOGpnl+lir4DocANAy+LuAJ8B3yRnOo0xguLhnu5j
 4G9HTyy6Xad7jAQU=
X-Received: by 2002:a05:600c:3b93:b0:38e:b82a:9abe with SMTP id
 n19-20020a05600c3b9300b0038eb82a9abemr6443955wms.108.1649679519209; 
 Mon, 11 Apr 2022 05:18:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJygzEJ6C3cSUXS/gJPeCAHpeTEelbpRHJ1mzPZU/vwl/5y9vu65keLxJICtOvCZhOxiNuyCjg==
X-Received: by 2002:a05:600c:3b93:b0:38e:b82a:9abe with SMTP id
 n19-20020a05600c3b9300b0038eb82a9abemr6443928wms.108.1649679518983; 
 Mon, 11 Apr 2022 05:18:38 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 g6-20020a5d5406000000b001f049726044sm25868449wrv.79.2022.04.11.05.18.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Apr 2022 05:18:37 -0700 (PDT)
Date: Mon, 11 Apr 2022 13:18:33 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Maxime Coquelin <maxime.coquelin@redhat.com>
Subject: Re: [PATCH 4/5] docs: introduce RSS support in Vhost-user
 specification
Message-ID: <YlQcmekPCoaZ5Yri@work-vm>
References: <20220408122813.1357045-1-maxime.coquelin@redhat.com>
 <20220408122813.1357045-5-maxime.coquelin@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20220408122813.1357045-5-maxime.coquelin@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: chenbo.xia@intel.com, andrew@daynix.com, quintela@redhat.com,
 jasowang@redhat.com, mst@redhat.com, qemu-devel@nongnu.org,
 ktraynor@redhat.com, yuri.benditovich@daynix.com, dmarchan@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Maxime Coquelin (maxime.coquelin@redhat.com) wrote:
> This patch documents RSS feature in Vhost-user specification.
> Two new requests are introduced backed by a dedicated
> protocol feature.
> 
> First one is to query the Vhost-user slave RSS capabilities
> such as supported hash types, maximum key length and
> indirection table size.
> 
> The second one is to provide the slave with driver's RSS
> configuration.
> 
> Signed-off-by: Maxime Coquelin <maxime.coquelin@redhat.com>

Perhaps it would be worth adding a link to devel/ebpf_rss.rst somewhere
in there; I didn't know what RSS so had to dig.
Also, perhaps it's useful to update that file to point back to the
vhost-user or dpdk implementations.

Dave

> ---
>  docs/interop/vhost-user.rst | 57 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 57 insertions(+)
> 
> diff --git a/docs/interop/vhost-user.rst b/docs/interop/vhost-user.rst
> index 4dbc84fd00..9de6297568 100644
> --- a/docs/interop/vhost-user.rst
> +++ b/docs/interop/vhost-user.rst
> @@ -258,6 +258,42 @@ Inflight description
>  
>  :queue size: a 16-bit size of virtqueues
>  
> +RSS capabilities description
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> ++----------------------+-------------+---------------+
> +| supported hash types | max key len | max indir len |
> ++----------------------+-------------+---------------+
> +
> +:supported hash types: a 32-bit bitfield of supported hash types as defined
> +                       in the Virtio specification
> +
> +:max key len: a 8-bit maximum size of the RSS key
> +
> +:max indir len: a 16-bits maximum size of the RSS indirection table
> +
> +RSS data description
> +^^^^^^^^^^^^^^^^^^^^
> +
> ++------------+---------+-----+-----------+-------------+---------------+
> +| hash types | key len | key | indir len | indir table | default queue |
> ++------------+---------+-----+-----------+-------------+---------------+
> +
> +:hash types: a 32-bit bitfield of supported hash types as defined in the
> +             Virtio specification
> +
> +:key len: 8-bit size of the RSS key
> +
> +:key: a 8-bit array of 52 elements containing the RSS key
> +
> +:indir len: a 16-bit size of the RSS indirection table
> +
> +:indir table: a 16-bit array of 512 elements containing the hash indirection
> +              table
> +
> +:default queue: the default queue index for flows not matching requested hash
> +                types
> +
>  C structure
>  -----------
>  
> @@ -858,6 +894,7 @@ Protocol features
>    #define VHOST_USER_PROTOCOL_F_INBAND_NOTIFICATIONS 14
>    #define VHOST_USER_PROTOCOL_F_CONFIGURE_MEM_SLOTS  15
>    #define VHOST_USER_PROTOCOL_F_STATUS               16
> +  #define VHOST_USER_PROTOCOL_F_NET_RSS              17
>  
>  Master message types
>  --------------------
> @@ -1371,6 +1408,26 @@ Master message types
>    query the backend for its device status as defined in the Virtio
>    specification.
>  
> +``VHOST_USER_NET_GET_RSS``
> +  :id: 41
> +  :equivalent ioctl: N/A
> +  :slave payload: RSS capabilities description
> +  :master payload: N/A
> +
> +  When the ``VHOST_USER_PROTOCOL_F_NET_RSS`` protocol has been successfully
> +  negotiated, this message is submitted by the master to get the RSS
> +  capabilities of the slave.
> +
> +``VHOST_USER_NET_SET_RSS``
> +  :id: 42
> +  :equivalent ioctl: N/A
> +  :slave payload: N/A
> +  :master payload: RSS data description
> +
> +  When the ``VHOST_USER_PROTOCOL_F_NET_RSS`` protocol has been successfully
> +  negotiated, this message is submitted by the master to set the RSS
> +  configuration defined by the Virtio driver.
> +
>  
>  Slave message types
>  -------------------
> -- 
> 2.35.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


