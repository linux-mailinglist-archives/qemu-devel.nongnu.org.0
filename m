Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7F9F3B1D4D
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:12:10 +0200 (CEST)
Received: from localhost ([::1]:54122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4Xx-0007Tn-SQ
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:12:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4S1-0004nt-J6
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:06:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4Rz-00071D-Tx
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:06:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624460758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m0cxXSM2k4o+V1WShFhHX93GrJA16aAvxZV0Nwe9W88=;
 b=bhXbtAe6Xh3DnysSFfdZA16miqisxYkYOgxHwT2qwNnMLvZ+LO2gCncavG+YA2NTz/sKvP
 h0eLzDOobFyywQ09sc/jmIgiDe1ciZ8DWBymZlpx3pFWqzCw83rpW8QukNA9jrQT3N2sEJ
 HEuyRyh6sl2nddp2M5dkX+Ga4916h78=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-324-qj5F-jpNNH2TiNTJvWSX9A-1; Wed, 23 Jun 2021 11:05:57 -0400
X-MC-Unique: qj5F-jpNNH2TiNTJvWSX9A-1
Received: by mail-ed1-f71.google.com with SMTP id
 l9-20020a0564022549b0290394bafbfbcaso1488623edb.3
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 08:05:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=m0cxXSM2k4o+V1WShFhHX93GrJA16aAvxZV0Nwe9W88=;
 b=kVI1/LOlDX9NVmcU/HdkwHuAAUoc//REGDtokU7vtmoRMGQywZn1tUkG/969P9o8hF
 t0HYxtp3f/ZBYahLATEmN/IRBqiTYi1j6J32cU0PC5QU22vlwtQs0VIU6LAhjyOulvGY
 14MDsBnjVCpmy5YN66VjALpVRVgX+TgxJoAbWAz/TZlBOLXgkYmevJIAQ5rrWCF6xvgN
 MZiDgkEMvW3ljHBjhJsaw1B8nOKihIgkMAqUGMr/Wt00WErtJ+HBnrGx8QrL5dDzQyF3
 27wt7t6Lgs9ndRLGN0ppg7omWUBe+LSKYn33Lv2/EkvuQ8DRU8+LmJGs+1BmgfxJryb1
 /J4Q==
X-Gm-Message-State: AOAM531xt8Nt5L6uFlqHviZeNleiN9/fRHw/zhljXiR3/OYWTVA0XYBv
 T8ov6q1rTrzUZt6vIsLkeTmTisi9b2yZE1LlyYYuNL23mvttqH+aJMfNBr5h6DeP0XyRmJgAUo6
 +Mg8vV98rzfR7LNo=
X-Received: by 2002:a17:906:1299:: with SMTP id
 k25mr457402ejb.139.1624460756015; 
 Wed, 23 Jun 2021 08:05:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxal8+dH6C10ZmwjWUm02SlapciFSoS8UXwMIn1mjGGCA/urghIXhVNjOhai3x8uXifTDDiQw==
X-Received: by 2002:a17:906:1299:: with SMTP id
 k25mr457368ejb.139.1624460755758; 
 Wed, 23 Jun 2021 08:05:55 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id ch17sm179575edb.54.2021.06.23.08.05.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 08:05:55 -0700 (PDT)
Date: Wed, 23 Jun 2021 17:05:53 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 09/18] vhost-vdpa: remove the unncessary queue_index
 assignment
Message-ID: <20210623150553.7dcwrasx54miumjx@steredhat>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-10-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210621041650.5826-10-jasowang@redhat.com>
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

On Mon, Jun 21, 2021 at 12:16:41PM +0800, Jason Wang wrote:
>The queue_index of NetClientState should be assigned in set_netdev()
>afterwards, so trying to net_vhost_vdpa_init() is meaningless. This
>patch removes this.
>
>Signed-off-by: Jason Wang <jasowang@redhat.com>
>---
> net/vhost-vdpa.c | 1 -
> 1 file changed, 1 deletion(-)
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>index 87b181a74e..572aed4ca2 100644
>--- a/net/vhost-vdpa.c
>+++ b/net/vhost-vdpa.c
>@@ -166,7 +166,6 @@ static int net_vhost_vdpa_init(NetClientState 
>*peer, const char *device,
>     assert(name);
>     nc = qemu_new_net_client(&net_vhost_vdpa_info, peer, device, 
>     name);
>     snprintf(nc->info_str, sizeof(nc->info_str), TYPE_VHOST_VDPA);
>-    nc->queue_index = 0;
>     s = DO_UPCAST(VhostVDPAState, nc, nc);
>     vdpa_device_fd = qemu_open_old(vhostdev, O_RDWR);
>     if (vdpa_device_fd == -1) {
>-- 2.25.1
>
>


