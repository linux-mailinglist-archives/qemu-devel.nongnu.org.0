Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59163B1CEA
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 16:54:53 +0200 (CEST)
Received: from localhost ([::1]:43200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lw4HE-00065K-N6
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 10:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4GU-0005QK-67
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:54:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1lw4GS-0007sG-Im
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 10:54:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624460044;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HQYrdifJlKxKnHJ1dTZgcd4sArXUJcuR+UgBxU+fxmM=;
 b=OgB0XBV2OFchbtfniYO7IlQV3Fl9ayb9xnLFE2J9GrZ19wZZwYlWwprl2GzgSgEHMWfe24
 BEnACvcSmnvPYGCelmxOrcmfbNdjCPGpa0IMM2W51/YUDxMAVC7F4HXC/WwnjZEZ2Fo6wD
 C0B4dWQfWUGB0Xf4YgAnXqhnO7twGmE=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-562-zfsfcZCGNqiA2CPGqBViLA-1; Wed, 23 Jun 2021 10:54:02 -0400
X-MC-Unique: zfsfcZCGNqiA2CPGqBViLA-1
Received: by mail-ed1-f70.google.com with SMTP id
 h11-20020a50ed8b0000b02903947b9ca1f3so1466877edr.7
 for <qemu-devel@nongnu.org>; Wed, 23 Jun 2021 07:54:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=HQYrdifJlKxKnHJ1dTZgcd4sArXUJcuR+UgBxU+fxmM=;
 b=EszeKJTrbY04oGFISAawLTjgreEw5bIJJqp3HJn7VLl+o7vJW3KiEkjjgRfGsolGuH
 bFfVp6gbOukPFskyOd9KC96k1roQS7xbY6FhozrDmYVJnAGEoRieNMmjb2+5uG+IOdau
 7B3Y8MnRhVbYZYKw7WbMr8u5/F18fo1DxB6QLHQoYnGPC4hDygd+V8YyAokzvwsxsAgh
 r1zrkQRVMNNthetnPcK9x6acV9XsM2wjm2oePIgoVImUEjKyLWRaumdRMROgnzYEYHpC
 U0E1KIIAA8lLJ/zH8ZK7urZIXwWGDTqbGSjzg3WEpKT37t9mtQ3lw9H1LWR117rSk9Xr
 Jqeg==
X-Gm-Message-State: AOAM530YP5965AHmB2M1NiE34mtesfw1RFC4BaFDKzwOS7ycl/vEjzTn
 x208JVByoD+Re1BBlIZDGFaQID4K4fgvJgym/VyDofiPDad8FZzcWeDKLxWr0SL6dM8I/llXKyd
 6JNlsBnkNfkhSBSc=
X-Received: by 2002:a17:906:8a55:: with SMTP id
 gx21mr420911ejc.179.1624460041742; 
 Wed, 23 Jun 2021 07:54:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4PSkmVAwSbiceeV+STKDEQOIOxWoen0ljaJf2j0mVUqu84M8aOEFl0lw2PwNMrOu/hL2G5w==
X-Received: by 2002:a17:906:8a55:: with SMTP id
 gx21mr420897ejc.179.1624460041617; 
 Wed, 23 Jun 2021 07:54:01 -0700 (PDT)
Received: from steredhat (host-79-18-148-79.retail.telecomitalia.it.
 [79.18.148.79])
 by smtp.gmail.com with ESMTPSA id gz12sm22693ejc.36.2021.06.23.07.54.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jun 2021 07:54:01 -0700 (PDT)
Date: Wed, 23 Jun 2021 16:53:59 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH 04/18] vhost-vdpa: remove the unnecessary check in
 vhost_vdpa_add()
Message-ID: <20210623145359.bi4vrsg63la3l3id@steredhat>
References: <20210621041650.5826-1-jasowang@redhat.com>
 <20210621041650.5826-5-jasowang@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210621041650.5826-5-jasowang@redhat.com>
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

On Mon, Jun 21, 2021 at 12:16:36PM +0800, Jason Wang wrote:
>The VhostVDPAState is just allocated by qemu_new_net_client() via
>g_malloc0() in net_vhost_vdpa_init(). So s->vhost_net is NULL for
>sure, let's remove this unnecessary check in vhost_vdpa_add().
>
>Signed-off-by: Jason Wang <jasowang@redhat.com>
>---
> net/vhost-vdpa.c | 4 ----
> 1 file changed, 4 deletions(-)
>
>diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
>index 18b45ad777..728e63ff54 100644
>--- a/net/vhost-vdpa.c
>+++ b/net/vhost-vdpa.c
>@@ -112,10 +112,6 @@ static int vhost_vdpa_add(NetClientState *ncs, void *be)
>         error_report("failed to init vhost_net for queue");
>         goto err;
>     }
>-    if (s->vhost_net) {
>-        vhost_net_cleanup(s->vhost_net);
>-        g_free(s->vhost_net);
>-    }

Maybe we can add an assert() to discover future issues, but I don't have 
a strong opinion.

It is fine:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>     s->vhost_net = net;
>     ret = vhost_vdpa_net_check_device_id(net);
>     if (ret) {
>-- 2.25.1
>2.25.1
>
>


