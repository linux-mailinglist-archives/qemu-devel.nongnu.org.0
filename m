Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 493D72D6460
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 19:05:01 +0100 (CET)
Received: from localhost ([::1]:50434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knQJI-0003IP-8o
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 13:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1knQFH-0001iQ-1e
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 13:00:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20485)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1knQFA-0000Ug-94
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 13:00:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607623243;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eEv02TkJ3ZxJp4sNOjbr3fw7o9eG8eOgMJNISH+HE7A=;
 b=O+20qrDB3kseIXBLLaaUisT6cZUO23dPmDfQI74jFXIwuZc778IP1QvlO86DwzkLEAmfIp
 zeppSifyN6m76Ai5V1EoXS7mxiPKuSfVycCmFyDwou3ITR70qHlhiLXPLiP45IktTueNGZ
 2gfK8c6HVCicnv+YQjlS9qRRXW92XKA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-557-dIxifL-nO2ueqh8tL92yAg-1; Thu, 10 Dec 2020 13:00:41 -0500
X-MC-Unique: dIxifL-nO2ueqh8tL92yAg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2B8C8835DE4;
 Thu, 10 Dec 2020 18:00:40 +0000 (UTC)
Received: from work-vm (ovpn-113-66.ams2.redhat.com [10.36.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE65E60BFA;
 Thu, 10 Dec 2020 18:00:13 +0000 (UTC)
Date: Thu, 10 Dec 2020 18:00:10 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Alex Chen <alex.chen@huawei.com>
Subject: Re: [PATCH] virtiofsd: Fix potential NULL pointer dereference in
 virtio_send_msg()
Message-ID: <20201210180010.GG3629@work-vm>
References: <20201210151426.89244-1-alex.chen@huawei.com>
MIME-Version: 1.0
In-Reply-To: <20201210151426.89244-1-alex.chen@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org, stefanha@redhat.com,
 zhang.zhanghailiang@huawei.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Alex Chen (alex.chen@huawei.com) wrote:
> The 'ch' will be NULL in the following stack:
> send_notify_iov()->fuse_send_msg()->virtio_send_msg(),
> so we should check 'ch' is valid before dereferencing it
> 
> Reported-by: Euler Robot <euler.robot@huawei.com>
> Signed-off-by: Alex Chen <alex.chen@huawei.com>

Please check, but I don't think we can currently hit this because
we never call send_notify_iov - it's currently called by
fuse_lowlevel_notify_inval_entry, inval_inode, and
fuse_lowlevel_notify_poll -
but I don't think those are called anywhere.

In that case, probably the best fix is to remove those until we
put notify back in.

Dave

> ---
>  tools/virtiofsd/fuse_virtio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/tools/virtiofsd/fuse_virtio.c b/tools/virtiofsd/fuse_virtio.c
> index 623812c432..31b2187a15 100644
> --- a/tools/virtiofsd/fuse_virtio.c
> +++ b/tools/virtiofsd/fuse_virtio.c
> @@ -205,6 +205,8 @@ static void copy_iov(struct iovec *src_iov, int src_count,
>  int virtio_send_msg(struct fuse_session *se, struct fuse_chan *ch,
>                      struct iovec *iov, int count)
>  {
> +    assert(ch);
> +
>      FVRequest *req = container_of(ch, FVRequest, ch);
>      struct fv_QueueInfo *qi = ch->qi;
>      VuDev *dev = &se->virtio_dev->dev;
> -- 
> 2.19.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


