Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA70276E9E
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Sep 2020 12:24:01 +0200 (CEST)
Received: from localhost ([::1]:35188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kLOPw-0002zo-6x
	for lists+qemu-devel@lfdr.de; Thu, 24 Sep 2020 06:24:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kLNZj-0002RY-KW
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:30:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:46669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kLNZh-00070v-LB
 for qemu-devel@nongnu.org; Thu, 24 Sep 2020 05:30:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600939800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=li97aJVog3jEPGKhQHb+TFzLPraaKtwKqK96TVdANYU=;
 b=Ny5s01DUUUZVCJunFbw6+OcDHZtNznxZ1XeIPVnMWE7Z0gOuYH7Btfw8Of90sL4+8CjRm2
 8paat8VapEqfFw46s0juykM2lVrz9evzR8Gqyybjg2HrzJ4k66I3x8GiT84L9g2GvgWXw0
 +e6VRmQNyktl42+TkHziX/hrJBWAX5c=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-erQpARUzNl6UTTAo2mMA4Q-1; Thu, 24 Sep 2020 05:29:46 -0400
X-MC-Unique: erQpARUzNl6UTTAo2mMA4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 84B431007476;
 Thu, 24 Sep 2020 09:29:45 +0000 (UTC)
Received: from work-vm (ovpn-114-250.ams2.redhat.com [10.36.114.250])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BFDA55C1C7;
 Thu, 24 Sep 2020 09:29:37 +0000 (UTC)
Date: Thu, 24 Sep 2020 10:29:35 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH] virtiofsd: Used glib "shared" thread pool
Message-ID: <20200924092935.GC2792@work-vm>
References: <20200921213216.GE13362@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200921213216.GE13362@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/22 23:02:20
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.228,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs-list <virtio-fs@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Miklos Szeredi <miklos@szeredi.hu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> glib offers thread pools and it seems to support "exclusive" and "shared"
> thread pools.
> 
> https://developer.gnome.org/glib/stable/glib-Thread-Pools.html#g-thread-pool-new
> 
> Currently we use "exlusive" thread pools but its performance seems to be
> poor. I tried using "shared" thread pools and performance seems much
> better. I posted performance results here.
> 
> https://www.redhat.com/archives/virtio-fs/2020-September/msg00080.html
> 
> So lets switch to shared thread pools. We can think of making it optional
> once somebody can show in what cases exclusive thread pools offer better
> results. For now, my simple performance tests across the board see
> better results with shared thread pools.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Queued (with Miklos's seccomp fix); although my gut feeling is we'll be
coming back to this again to understand how the threading should work.

Dave

> ---
>  tools/virtiofsd/fuse_virtio.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Index: qemu/tools/virtiofsd/fuse_virtio.c
> ===================================================================
> --- qemu.orig/tools/virtiofsd/fuse_virtio.c	2020-09-21 17:28:27.444438015 -0400
> +++ qemu/tools/virtiofsd/fuse_virtio.c	2020-09-21 17:28:30.584568910 -0400
> @@ -695,7 +695,7 @@ static void *fv_queue_thread(void *opaqu
>      struct fuse_session *se = qi->virtio_dev->se;
>      GThreadPool *pool;
>  
> -    pool = g_thread_pool_new(fv_queue_worker, qi, se->thread_pool_size, TRUE,
> +    pool = g_thread_pool_new(fv_queue_worker, qi, se->thread_pool_size, FALSE,
>                               NULL);
>      if (!pool) {
>          fuse_log(FUSE_LOG_ERR, "%s: g_thread_pool_new failed\n", __func__);
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


