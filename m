Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9CD13FDFC4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 18:22:57 +0200 (CEST)
Received: from localhost ([::1]:40400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLT0q-00058z-QB
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 12:22:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mLSb6-0007Cv-Qt
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:56:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mLSb4-0001Tc-5g
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 11:56:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630511777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=z0aFnPPH6NOYwCPfU3HMSb3IusAfOepcKxZtm4vuGXg=;
 b=Q8jetjEol6xZ10AKco1kE8yKjRhYswZVlOi2RYuNuAHdgijkhxLruyYyc921/FG2BzAPws
 h1Verez8QNxRFAPqlSK5iEIc4BfhrtaAlKh9TCvrDIr7auTrbnY2YznWf7+RSjM8Z1ytXZ
 TotaMvm2JEKsQMQmallcv0t9lVQ3G24=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-350-tUUYn3d-MlGIDedCmEr6_g-1; Wed, 01 Sep 2021 11:56:16 -0400
X-MC-Unique: tUUYn3d-MlGIDedCmEr6_g-1
Received: by mail-ed1-f70.google.com with SMTP id
 x4-20020a50d9c4000000b003bed5199871so1505018edj.14
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 08:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=z0aFnPPH6NOYwCPfU3HMSb3IusAfOepcKxZtm4vuGXg=;
 b=ZbWtR9cuREGW9WYQcecHKPXBn1cwE+eegnBph/p2eoOhPQIsBbYAlO2g6+ZFM4BwXz
 U0PdnlL5cyu7NK/1jv4NDeq+lUlkM3hgMRjs582NZet3BG2334oIKcglCbq0LPWXjePK
 6B6+sjUdStQ00J2Da4BqfGLAoS81RgJ6fYUvPpGqJG0CL7SXYE0/YjByDWbJh4jk52Ay
 Brc8bTXvqGjmFYM4YyvBEZRf1TNydZUusVAG97gMX8hVLFEs8wZISneR0qagVsKEgHf8
 FiZV1AZAfkH4OXPmSiHi49rg4dr9U1yFxMnfK5rvPVkPw7Y4cgmlM5IdFajpcyloAA4h
 BqTw==
X-Gm-Message-State: AOAM533ud+8/FYFnMSzlTkYPWu9ZI/A9309+zs00ZOzqOvHK5uNF8TF2
 yblQAnTX+7u6EpaGrVgofhzSyOhDPQ/MqGf8bLoGx0/E3wn9CZX4cqNCtqfKCnHWT9LbcnCubJv
 vR7FxpUN8bjSYavU=
X-Received: by 2002:a17:906:4e11:: with SMTP id
 z17mr90179eju.483.1630511775415; 
 Wed, 01 Sep 2021 08:56:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwm3Qp3jS2tM+3WVJxSe4bwJ4n+bEI/BNVmohBse/EtNv+HyNjxKZWPrG1aFCSwrMYu8TxtCg==
X-Received: by 2002:a17:906:4e11:: with SMTP id
 z17mr90167eju.483.1630511775285; 
 Wed, 01 Sep 2021 08:56:15 -0700 (PDT)
Received: from steredhat (host-79-51-2-59.retail.telecomitalia.it.
 [79.51.2.59])
 by smtp.gmail.com with ESMTPSA id q11sm37001edv.73.2021.09.01.08.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 08:56:14 -0700 (PDT)
Date: Wed, 1 Sep 2021 17:56:12 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH 1/3] hw/virtio: Document virtio_queue_packed_empty_rcu is
 called within RCU
Message-ID: <20210901155612.gfgma6zeqcclamtj@steredhat>
References: <20210826172658.2116840-1-philmd@redhat.com>
 <20210826172658.2116840-2-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210826172658.2116840-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Aug 26, 2021 at 07:26:56PM +0200, Philippe Mathieu-Daudé wrote:
>While virtio_queue_packed_empty_rcu() uses the '_rcu' suffix,
>it is not obvious it is called within rcu_read_lock(). All other
>functions from this file called with the RCU locked have a comment
>describing it. Document this one similarly for consistency.
>
>Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>---
> hw/virtio/virtio.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>index 874377f37a7..a5214bca612 100644
>--- a/hw/virtio/virtio.c
>+++ b/hw/virtio/virtio.c
>@@ -634,6 +634,7 @@ static int virtio_queue_split_empty(VirtQueue *vq)
>     return empty;
> }
>
>+/* Called within rcu_read_lock().  */
> static int virtio_queue_packed_empty_rcu(VirtQueue *vq)
> {
>     struct VRingPackedDesc desc;
>-- 
>2.31.1
>
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


