Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989553B1CF4
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:58:01 +0200 (CEST)
Received: from localhost ([::1]:47174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4KG-0000Sr-MZ
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:58:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4In-0007Uv-9x
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:56:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4Il-00017d-J7
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624460186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vI6CaYw+C8peFWUx/KpnzYmgRuLMv3nz0bNJyhFbdY8=;
 b=WkJVdIt+LDcIZHoFkUTJFUBt0/RjhUibKT/CYAaM4Zb+Glp90gag1rAQK6Fgy23Ctd2Bcz
 2+w495pRNySubvF1yrJMBAhs1e7+cRFh7O+r/Nq5ZPfi9UGT/+/jRKUKA2prjRlBaGFUvC
 L4fOWB9+y70ZmsMRwZ6fdAlCIxBuqEM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-v8A4BwZcMvumtFEVlWkbwQ-1; Wed, 23 Jun 2021 10:56:23 -0400
X-MC-Unique: v8A4BwZcMvumtFEVlWkbwQ-1
Received: by mail-ed1-f72.google.com with SMTP id
 c9-20020a05640227c9b0290394ac48c2e4so1459414ede.11
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 07:56:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vI6CaYw+C8peFWUx/KpnzYmgRuLMv3nz0bNJyhFbdY8=;
 b=HaJ/2B4pth9sG1kC2kBk/TMsJFS1exnsPeV2AypmLdr0DSTmBbmrzBNWQQUOZ+b4TB
 klEb7ha7st8PzQ3newQfngOphPzJ26YVKW1YTmCe+3/2di6HB/H/IsgbVV6vxKrg8k6b
 bc3Q3xZsJ6NikRZ3Bp+WYmsTsycbMmT/Hkv9f9eKWFy1FQ6/qU5nScAvgX0klpsalkjT
 S18QLMrqEoTlTz7uPkBJRcYJ4H92PMTpg7dGnWkNv6NjFBkGae/p9MZB5lQi2bXqk9dZ
 3cKwcS4nKRwV9pK1lYg9NAVSeVDq1koPgUVKPjrWXhYdDhLhnMdbBBlUHUgLX0yVAkWc
 6vSg==
X-Gm-Message-State: AOAM532pClFpyYIPBebne4yf5Wd6z0m7LMY3dDfoEcv8y49KRutykj08
 86gKoZ2azVNdgrI6ouhujkffm/gJMgtxXTt36dqunEeisxBGEOiukMDw6biJgqRc3gvTo6VXBlx
 sJDjulTrVgmGCbM0=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr402954ejy.407.1624460182435; 
 Wed, 23 Jun 2021 07:56:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyHMCRrUzqsqHHLAOMA9kJa5LhZ0EBStUw+YMMhNJYNERu5eRxPhD6rwFQjLAGj4enRx9/CTg==
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr402944ejy.407.1624460182260; 
 Wed, 23 Jun 2021 07:56:22 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id f14sm155448edd.69.2021.06.23.07.56.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 07:56:22 -0700 (PDT)
Date: Wed, 23 Jun 2021 16:56:20 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 05/18] vhost-vdpa: don't cleanup twice in vhost_vdpa_add()
Message-ID: <20210623145620.njqaz7lgp3frliva@steredhat>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-6-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210621041650.5826-6-jasowang@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
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

On Mon, Jun 21, 2021 at 12:16:37PM +0800, Jason Wang wrote:
>The previous vhost_net_cleanup is sufficient for freeing, calling
>vhost_vdpa_del() in this case will lead an extra round of free. Note
>that this kind of "double free" is safe since vhost_dev_cleanup() zero
>the whole structure.
>
>Signed-off-by: Jason Wang <jasowang@redhat.com>
>---
> net/vhost-vdpa.c | 11 -----------
> 1 file changed, 11 deletions(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>index 728e63ff54..f5689a7c32 100644
>--- a/net/vhost-vdpa.c
>+++ b/net/vhost-vdpa.c
>@@ -82,16 +82,6 @@ static int vhost_vdpa_net_check_device_id(struct vhost_net *net)
>     return ret;
> }
>
>-static void vhost_vdpa_del(NetClientState *ncs)
>-{
>-    VhostVDPAState *s;
>-    assert(ncs->info->type == NET_CLIENT_DRIVER_VHOST_VDPA);
>-    s = DO_UPCAST(VhostVDPAState, nc, ncs);
>-    if (s->vhost_net) {
>-        vhost_net_cleanup(s->vhost_net);
>-    }
>-}
>-
> static int vhost_vdpa_add(NetClientState *ncs, void *be)
> {
>     VhostNetOptions options;
>@@ -122,7 +112,6 @@ err:
>     if (net) {
>         vhost_net_cleanup(net);
>     }
>-    vhost_vdpa_del(ncs);
>     return -1;
> }
>
>-- 
>2.25.1
>
>


