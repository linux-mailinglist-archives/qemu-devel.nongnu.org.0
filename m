Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A4623B1D04
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 17:01:58 +0200 (CEST)
Received: from localhost ([::1]:52186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4O3-0003y3-OP
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 11:01:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4Ma-00036s-Vj
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:00:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44083)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4MY-0003fM-Qh
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 11:00:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624460421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f8gi7O/x5Bacy0i+rX6B4oRRkl2zqsj7NzU0GbIybp8=;
 b=cRnL9MifcnxEzt2jIDKKjF1I8Iq0fSS52l0LVEm94pmjCLHu4035zgw7r1YTvJfESmDceZ
 v1QOXWC2q+GB6Z3lXrJa+4+/DAszsnJLe3Zvi4pdAyIKVZZ5k5JvLR4y89r4kH+x/UFsPk
 7d2M7me2KsTNhMYYrDsDR7gohuWL8g4=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-334-4cIikzTjMzO9HL5_RimeuA-1; Wed, 23 Jun 2021 11:00:19 -0400
X-MC-Unique: 4cIikzTjMzO9HL5_RimeuA-1
Received: by mail-ed1-f69.google.com with SMTP id
 ee28-20020a056402291cb0290394a9a0bfaeso1468248edb.6
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 08:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f8gi7O/x5Bacy0i+rX6B4oRRkl2zqsj7NzU0GbIybp8=;
 b=V3WRNJRZyFcwKTyKDV0QjorO1IdzS3UW3JftqYr6si6SOJMFhxJGcCWZFkGo0iMD+R
 XsaCUnXIQtTtXfOpk0grfevcpy9hswsJ6gUeBVp8hWE3qVzsizJYnYlI2SmyDhjuwUJx
 hey81AWaq+CDvjtYHdYIa/IftMznAJ+hKr2ixEE2fOTO7Pz4askI8KDR7CLNesaisO2j
 CB119bS72+vvWZxISeVqR6ru9K2aALxn6BVWLmeA02wnqW1l4gRlBlTtBi6UgJ+2Uy4i
 XnEJ+wvbE10+1f3kFVntEl8tbqGkXzhuhWWr8JUY0gz8E2nnoGB5pvvpBD8AXd+5MqMH
 FVgw==
X-Gm-Message-State: AOAM532mZsjl06/Q2sSg8v5Uk6P4jSyVIXy3/NCYaljCop1hmPsCORf9
 9vQ8Wza3SMD/hVRSrDraqs0jHCrLkpaLysULpoLqNbvwAKET4f/5u9nV03uAGTH1zFz4YJRGgUC
 sBip7YHSgkeJkcXw=
X-Received: by 2002:aa7:c043:: with SMTP id k3mr167213edo.160.1624460418685;
 Wed, 23 Jun 2021 08:00:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuFQK5RxJI8sZnsm3mvRjnqFRnG89FGc7gOQZAxRay5uU3DT3prVlBGo9M5XgOUQdzGj6jHg==
X-Received: by 2002:aa7:c043:: with SMTP id k3mr167196edo.160.1624460418545;
 Wed, 23 Jun 2021 08:00:18 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id j5sm32095ejn.19.2021.06.23.08.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 08:00:18 -0700 (PDT)
Date: Wed, 23 Jun 2021 17:00:16 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 06/18] vhost-vdpa: fix leaking of vhost_net in
 vhost_vdpa_add()
Message-ID: <20210623150016.mdrk35bkxfr3ww43@steredhat>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-7-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210621041650.5826-7-jasowang@redhat.com>
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

On Mon, Jun 21, 2021 at 12:16:38PM +0800, Jason Wang wrote:
>Fixes: 1e0a84ea49b68 ("vhost-vdpa: introduce vhost-vdpa net client")
>Signed-off-by: Jason Wang <jasowang@redhat.com>
>---
> net/vhost-vdpa.c | 1 +
> 1 file changed, 1 insertion(+)
>
>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>index f5689a7c32..21f09c546f 100644
>--- a/net/vhost-vdpa.c
>+++ b/net/vhost-vdpa.c
>@@ -111,6 +111,7 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
> err:
>     if (net) {
>         vhost_net_cleanup(net);
>+        g_free(net);
>     }
>     return -1;
> }
>-- 
>2.25.1
>
>

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


