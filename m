Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFD842AF973
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 21:05:34 +0100 (CET)
Received: from localhost ([::1]:42114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcwN3-000550-4s
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 15:05:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcwGw-0002ou-C0
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 14:59:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcwGu-0008OF-M7
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 14:59:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605124751;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PDMNnCOqCd2jmGnI31jxtGoVcODhJlNr04fs4O3B9Wg=;
 b=a5Ci+LyqNRjPziosrAgRPylMyJG0uTCGu7wqZ+p3ddjhowF2k360MhRd223H1V/SINpc4T
 r9fUoTjAXfI2QFhfY2brwGIMY9+TaIM3oW5+OZnbGQdYVs++gliMP3oyKue2ZgRtU5V6ab
 g5rH7x62s0d5jQxmBJI8pVC8VMJRbEA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-375-MGPqi6PDMYCLmjatzyRAxA-1; Wed, 11 Nov 2020 14:59:09 -0500
X-MC-Unique: MGPqi6PDMYCLmjatzyRAxA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4CFA1009456;
 Wed, 11 Nov 2020 19:59:08 +0000 (UTC)
Received: from work-vm (ovpn-113-88.ams2.redhat.com [10.36.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1720C27BD8;
 Wed, 11 Nov 2020 19:59:03 +0000 (UTC)
Date: Wed, 11 Nov 2020 19:59:01 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Haotian Li <lihaotian9@huawei.com>
Subject: Re: [Virtio-fs] [PATCH 1/3] tools/virtiofsd/buffer.c: check whether
 buf is NULL in fuse_bufvec_advance func
Message-ID: <20201111195901.GQ3232@work-vm>
References: <3477d902-ace9-1aa1-531a-9d20d6e93a05@huawei.com>
 <29fc87c2-b87c-4c34-40d4-75381f228849@huawei.com>
MIME-Version: 1.0
In-Reply-To: <29fc87c2-b87c-4c34-40d4-75381f228849@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:49:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, linfeilong@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Haotian Li (lihaotian9@huawei.com) wrote:
> In fuse_bufvec_advance func, calling fuse_bufvec_current func
> may return NULL, so we should check whether buf is NULL before
> using it.
> 
> Signed-off-by: Haotian Li <lihaotian9@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>
> ---
>  tools/virtiofsd/buffer.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/virtiofsd/buffer.c b/tools/virtiofsd/buffer.c
> index 27c1377f22..bdc608c221 100644
> --- a/tools/virtiofsd/buffer.c
> +++ b/tools/virtiofsd/buffer.c
> @@ -246,6 +246,10 @@ static int fuse_bufvec_advance(struct fuse_bufvec *bufv, size_t len)
>  {
>      const struct fuse_buf *buf = fuse_bufvec_current(bufv);
> 
> +    if (!buf) {
> +        return 0;
> +    }
> +

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

>      bufv->off += len;
>      assert(bufv->off <= buf->size);
>      if (bufv->off == buf->size) {
> -- 
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://www.redhat.com/mailman/listinfo/virtio-fs
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


