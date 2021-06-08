Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BF539FDD2
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 19:36:11 +0200 (CEST)
Received: from localhost ([::1]:42730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqfe6-0007JO-Md
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 13:36:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqfce-0005vk-Gi
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:34:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lqfcb-00072g-Up
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 13:34:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623173676;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1K3Mt1COvbU6Z7SeutUI2IrnkeVJy75H3B8MyB0CgA4=;
 b=fNOHe8/3Z9QQkcGuIzpSNRriQi6K5wMaenlkFp/eXQ/WBPp2uHO/JJD8QcYQ0S7lfpRJWQ
 XIVhfEZKmXR+mq1IExyJwkyMcshVuoGI8EKvlun3ekGQ7S71K1lzGYuLV0nCD+ZBYwydiD
 1dmW+xsQgksbEAdB7OXwSA4vvTl/3BA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-126-8RVBd4cuOUmw-aym8N0C4Q-1; Tue, 08 Jun 2021 13:34:32 -0400
X-MC-Unique: 8RVBd4cuOUmw-aym8N0C4Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 58EF7805740;
 Tue,  8 Jun 2021 17:34:14 +0000 (UTC)
Received: from redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B19B25D6A8;
 Tue,  8 Jun 2021 17:34:13 +0000 (UTC)
Date: Tue, 8 Jun 2021 12:34:12 -0500
From: Eric Blake <eblake@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v4 1/7] file-posix: fix max_iov for /dev/sg devices
Message-ID: <20210608173412.mmkelvozgl6uxmya@redhat.com>
References: <20210608131634.423904-1-pbonzini@redhat.com>
 <20210608131634.423904-2-pbonzini@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210608131634.423904-2-pbonzini@redhat.com>
User-Agent: NeoMutt/20210205
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jun 08, 2021 at 03:16:28PM +0200, Paolo Bonzini wrote:
> Even though it was only called for devices that have bs->sg set (which
> must be character devices), sg_get_max_segments looked at /sys/dev/block
> which only works for block devices.
> 
> On Linux the sg driver has its own way to provide the maximum number of
> iovecs in a scatter/gather list, so add support for it.  The block device
> path is kept because it will be reinstated in the next patches.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>  block/file-posix.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/block/file-posix.c b/block/file-posix.c
> index f37dfc10b3..536998a1d6 100644
> --- a/block/file-posix.c
> +++ b/block/file-posix.c
> @@ -1180,6 +1180,17 @@ static int sg_get_max_segments(int fd)
>          goto out;
>      }
>  
> +    if (S_ISCHR(st.st_mode)) {
> +        if (ioctl(fd, SG_GET_SG_TABLESIZE, &ret) == 0) {

Do we need to do any conditional compilation based on whether
SG_GET_SG_TABLESIZE is a known ioctl, or is it old enough to be
assumed present on all platforms we care about?

> +            return ret;
> +        }
> +        return -ENOTSUP;
> +    }
> +
> +    if (!S_ISBLK(st.st_mode)) {
> +        return -ENOTSUP;
> +    }
> +
>      sysfspath = g_strdup_printf("/sys/dev/block/%u:%u/queue/max_segments",
>                                  major(st.st_rdev), minor(st.st_rdev));
>      sysfd = open(sysfspath, O_RDONLY);

Otherwise looks good to me.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


