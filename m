Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59D2B2AF954
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Nov 2020 20:56:00 +0100 (CET)
Received: from localhost ([::1]:58666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcwDn-0007vc-AV
	for lists+qemu-devel@lfdr.de; Wed, 11 Nov 2020 14:55:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcwAr-0006RA-2R
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 14:52:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56482)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kcwAn-0007XC-N3
 for qemu-devel@nongnu.org; Wed, 11 Nov 2020 14:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605124371;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vF1Q4PyR/c1+5qxStJIkqV6tuLFUjDoyUj16sXmKXps=;
 b=i3S6m+qpcao2g5AsiUAsxJq/YZf6rhTLoh/7rJAwuwGC1oNSK6EfMAn12xHNhpZ+6FjjLK
 R+3n+99QglQ7DK/T0SlZNmjHc1U1L1Ylq6G2zxnQ0kImVTgcG7OB1stBp9vzS+JohzoFfX
 FICESbtB2TcYV8Q1LCPiKjt/2VYGUj4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-AaTjKbXWMSmj2G46WtvprQ-1; Wed, 11 Nov 2020 14:52:49 -0500
X-MC-Unique: AaTjKbXWMSmj2G46WtvprQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC42180B70D;
 Wed, 11 Nov 2020 19:52:48 +0000 (UTC)
Received: from work-vm (ovpn-113-88.ams2.redhat.com [10.36.113.88])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AA86E7366A;
 Wed, 11 Nov 2020 19:52:44 +0000 (UTC)
Date: Wed, 11 Nov 2020 19:52:41 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Haotian Li <lihaotian9@huawei.com>
Subject: Re: [Virtio-fs] [PATCH 2/3] virtiofsd: check whether lo_map_reserve
 returns NULL in, main func
Message-ID: <20201111195241.GO3232@work-vm>
References: <3477d902-ace9-1aa1-531a-9d20d6e93a05@huawei.com>
 <48887813-1c95-048c-6d10-48e3dd2bac71@huawei.com>
MIME-Version: 1.0
In-Reply-To: <48887813-1c95-048c-6d10-48e3dd2bac71@huawei.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/11 01:42:46
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, linfeilong@huawei.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Haotian Li (lihaotian9@huawei.com) wrote:
> In main func, func lo_map_reserve is called without NULL check.
> If reallocing new_elems fails in func lo_map_grow, the func
> lo_map_reserve may return NULL. We should check whether
> lo_map_reserve returns NULL before using it.
> 
> Signed-off-by: Haotian Li <lihaotian9@huawei.com>
> Signed-off-by: Zhiqiang Liu <liuzhiqiang26@huawei.com>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

(I think the fuse_log will always fall through the default_log_func
becuase it's very early)

> ---
>  tools/virtiofsd/passthrough_ll.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index ec1008bceb..3e9bbc7a04 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -3433,6 +3433,7 @@ int main(int argc, char *argv[])
>          .proc_self_fd = -1,
>      };
>      struct lo_map_elem *root_elem;
> +    struct lo_map_elem *reserve_elem;
>      int ret = -1;
> 
>      /* Don't mask creation mode, kernel already did that */
> @@ -3452,8 +3453,17 @@ int main(int argc, char *argv[])
>       * [1] Root inode
>       */
>      lo_map_init(&lo.ino_map);
> -    lo_map_reserve(&lo.ino_map, 0)->in_use = false;
> +    reserve_elem = lo_map_reserve(&lo.ino_map, 0);
> +    if (!reserve_elem) {
> +        fuse_log(FUSE_LOG_ERR, "failed to alloc reserve_elem.\n");
> +        goto err_out1;
> +    }
> +    reserve_elem->in_use = false;
>      root_elem = lo_map_reserve(&lo.ino_map, lo.root.fuse_ino);
> +    if (!root_elem) {
> +        fuse_log(FUSE_LOG_ERR, "failed to alloc root_elem.\n");
> +        goto err_out1;
> +    }
>      root_elem->inode = &lo.root;
> 
>      lo_map_init(&lo.dirp_map);
> -- 
> 
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://www.redhat.com/mailman/listinfo/virtio-fs
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


