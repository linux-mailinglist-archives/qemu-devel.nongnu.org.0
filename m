Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 47FF33A6131
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 12:43:55 +0200 (CEST)
Received: from localhost ([::1]:35254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsk4Q-0003mW-AJ
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 06:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsk3W-0002xO-Ko
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:42:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28848)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lsk3V-0008QC-1T
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 06:42:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623667376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7nIZOpAgHCdv8UGBx6UPNaaYHlJBRIiArE9tBOF+o9E=;
 b=VrYRchuGr1fdCFnHICGAsiIsgYdqbzCeGeroa2vkCix4P8/zOKj4Pl9tlra6VtypW05w5F
 b4WPR/egBNzw+Sunm25jzqlUg3deRZrSmu2rgTDnJwklg2iqh/fSiV2iNFwW1vHbyjNhh/
 BX5cyBlyMvPO7g26G2Uc996NQnLbqfs=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-2GVxrEmmPJeBLfWumwomEw-1; Mon, 14 Jun 2021 06:42:55 -0400
X-MC-Unique: 2GVxrEmmPJeBLfWumwomEw-1
Received: by mail-wr1-f69.google.com with SMTP id
 g14-20020a5d698e0000b0290117735bd4d3so6797869wru.13
 for <qemu-devel@nongnu.org>; Mon, 14 Jun 2021 03:42:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7nIZOpAgHCdv8UGBx6UPNaaYHlJBRIiArE9tBOF+o9E=;
 b=cNG9DKsUnU/c5BXQftXwaQJ7yG7LdZVJn4i8H6++Po/y4ESTX5ZkMMS5vMnCecF/sX
 uhFkZJIENWKhBJ5u2p4h9gcYVWPon4OR9a38xUmOoKz4r8nop70pyX4TLX4KWPEcu/0B
 rMR2DX8Xsfr7qgmQhSWfLDEzeaLZA0Wc/DKNrxYld+xhsDTJ83pf2wVuSNcND1Lre27D
 OTDX3MWqlA3tYXbSF4v9l7Gul/ZqH/OmH69RsxZ0XkY7oHT3IXcEj4OvmQv7eDn1bdTM
 BIyxr88xWY2V60QymbgN6Bhy0QVvw3Z2od0U3iUSRilC2IOIb4PWdFlaeYl8M4RGhntX
 v4Mg==
X-Gm-Message-State: AOAM533f8+CuOrqbvU+5GYYeszLDk0FZVg9gDbBYvzBtqVPzqXztOz4M
 wvPTeJkUCxMx1p6uS/tOP6bAvaQQ3ug18HsTtARh/5PNCnrYAkIYZb1apWE3RGZBsC9yMiD5EqU
 jPZL6gcAclfATCZNeacPkC5iKaoylu3sR8n/FFEnGQsv9pMDkPQcfR+a8imU5R9+i
X-Received: by 2002:a05:600c:3594:: with SMTP id
 p20mr29609214wmq.52.1623667373981; 
 Mon, 14 Jun 2021 03:42:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZ0rkED85ZM7UuH7brxRZaQZNkxVB4qkBnoe5Pvv5GmKzdFlmzOc5hL61oKlQ7Jn44JO0nnA==
X-Received: by 2002:a05:600c:3594:: with SMTP id
 p20mr29609183wmq.52.1623667373666; 
 Mon, 14 Jun 2021 03:42:53 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id p6sm16394542wrf.51.2021.06.14.03.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 03:42:53 -0700 (PDT)
Subject: Re: [PATCH v2] hw/virtio: Document *_should_notify() are called
 within rcu_read_lock()
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20210523094040.3516968-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0f261583-ba8f-5fdd-dae3-2a0174d95992@redhat.com>
Date: Mon, 14 Jun 2021 12:42:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210523094040.3516968-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.144, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

On 5/23/21 11:40 AM, Philippe Mathieu-Daudé wrote:
> Such comments make reviewing this file somehow easier.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: only one space before end of comment (mst)

Are you OK if this patch is queued via trivial@?

> ---
>  hw/virtio/virtio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index e02544b2df7..130e3568409 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2449,6 +2449,7 @@ static void virtio_set_isr(VirtIODevice *vdev, int value)
>      }
>  }
>  
> +/* Called within rcu_read_lock(). */
>  static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      uint16_t old, new;
> @@ -2485,6 +2486,7 @@ static bool vring_packed_need_event(VirtQueue *vq, bool wrap,
>      return vring_need_event(off, new, old);
>  }
>  
> +/* Called within rcu_read_lock(). */
>  static bool virtio_packed_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      VRingPackedDescEvent e;
> 


