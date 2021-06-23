Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012CF3B1D42
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:09:16 +0200 (CEST)
Received: from localhost ([::1]:44500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4V9-0000yp-1U
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:09:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56734)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4Qq-00031x-1Y
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:04:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22086)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4Qo-0006I1-Ae
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:04:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624460685;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qDu7UI8bR3Cr8y9kdqdKRoHijGC1++e9hcHR9vlbSX4=;
 b=hXr4120rRgw6t2z4Ad2PQuowSEAj8SQ1bPwoIspf3gNKdKv9Gp2vdttRMBErlQd4SSyytO
 NxBneFMu7D9ge6RkH1P59747B6n9J7uEygsrCi675ukASY1D4a+Ge+fDUwChWNjmideMlB
 +k8oE0cGMo4V1jFvKaD+REnMBS6xgiA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-82-_icwp5-lOd2LW9pZ_drdPQ-1; Wed, 23 Jun 2021 11:04:39 -0400
X-MC-Unique: _icwp5-lOd2LW9pZ_drdPQ-1
Received: by mail-ed1-f70.google.com with SMTP id
 c9-20020a05640227c9b0290394ac48c2e4so1475108ede.11
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 08:04:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qDu7UI8bR3Cr8y9kdqdKRoHijGC1++e9hcHR9vlbSX4=;
 b=mpLa4ClSfBRbfHhPWULJq8q8diJHtjJnORqQVe7ocj8ScjEGuYG01Gl6RyRKgeuAxp
 zPGr96N/kecw29wKRri4UqXrFBV/IKCw9cAk2msiFis/7D1pCR6E121DRZ5rQ5XeWmNh
 erMeYyin4Vgux3T/HA4jrVSJPi4BgQ7NsIERkW9ZwU72OU2MPU/A/gY0gvK3kv80yEiH
 zbL8QoCEX5WAT+5InD7eDhSObJFRm0peifD0oJD87I0lxQBf0vae9V908OGwQqVSAq4n
 cQ6givHqxoethO77JLD/DnstodFwFKGyyd+r1CnZ3VL3xfPJ+wOJ6UADbzjFqUSV1MpB
 +ecw==
X-Gm-Message-State: AOAM532gNOUh6sQU9AazucPIax9cr68QFyDpzOQtyipIY7ww8dGmmAAr
 xeHWCloIHj9Hpflk+Kl2h3ebjoaI1SodBKNhD6kEqEdfr30V67GSnLbaP8qMEkCzFc5JEyJ+Sef
 WQVlyZu7ACMQRRfY=
X-Received: by 2002:aa7:d818:: with SMTP id v24mr219648edq.22.1624460678210;
 Wed, 23 Jun 2021 08:04:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1b7hWamLh4bxeNcjRfSEQbH0psfGpUtyo0XAw65EHed926/OK+/NGNLidevsqTtiGMg/XYQ==
X-Received: by 2002:aa7:d818:: with SMTP id v24mr219620edq.22.1624460678081;
 Wed, 23 Jun 2021 08:04:38 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id j24sm172775edv.48.2021.06.23.08.04.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 08:04:37 -0700 (PDT)
Date: Wed, 23 Jun 2021 17:04:35 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 08/18] vhost-vdpa: fix the wrong assertion in
 vhost_vdpa_init()
Message-ID: <20210623150435.7pxk2oz6xc2idcsl@steredhat>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-9-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210621041650.5826-9-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.373,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: lulu@redhat.com, mst@redhat.com, qemu-devel@nongnu.org, eperezma@redhat.com,
 elic@nvidia.com, lingshan.zhu@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 21, 2021 at 12:16:40PM +0800, Jason Wang wrote:
>Vhost_vdpa_add() can fail for various reasons, so the assertion of the
>succeed is wrong. Instead, we should free the NetClientState and
>propagate the error to the caller
>
>Signed-off-by: Jason Wang <jasowang@redhat.com>
>---
> net/vhost-vdpa.c | 5 ++++-
> 1 file changed, 4 insertions(+), 1 deletion(-)
>
>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>index 0da7bc347a..87b181a74e 100644
>--- a/net/vhost-vdpa.c
>+++ b/net/vhost-vdpa.c
>@@ -174,7 +174,10 @@ static int net_vhost_vdpa_init(NetClientState *peer, const char *device,
>     }
>     s->vhost_vdpa.device_fd = vdpa_device_fd;
>     ret = vhost_vdpa_add(nc, (void *)&s->vhost_vdpa);
>-    assert(s->vhost_net);
>+    if (ret) {
>+        qemu_close(vdpa_device_fd);
>+        qemu_del_net_client(nc);
>+    }

Okay, I see now :-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>     return ret;
> }
>
>-- 
>2.25.1
>
>


