Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D52331E651
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 07:28:04 +0100 (CET)
Received: from localhost ([::1]:55786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCcnD-0008PP-JT
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 01:28:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lCcm9-0007MC-W4
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 01:26:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lCcm0-0003ND-Nd
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 01:26:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613629606;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3w4bXVMdxr0yASrmorCAMnt+boUyNGrfxoD3NTD2OOk=;
 b=dMvjR182HLXTYqlFpVm81DvFrxaMD7rjBOHSR2w0norQD6VpUoTULZhCsuqUxosnBEB39H
 Of47U5MoJRMawPkCHmQf1fg1+waf5C16ek6xdouwSXoR9m6tI+eapfqrw4N6zYzt10bsnq
 a9ycTRwGUlkFRs1OojgmRAOJBAgQbF8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-593-r2xt-GQuOQ6nmnB3cQ38-w-1; Thu, 18 Feb 2021 01:26:43 -0500
X-MC-Unique: r2xt-GQuOQ6nmnB3cQ38-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0FF781020C53;
 Thu, 18 Feb 2021 06:26:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 849DA69322;
 Thu, 18 Feb 2021 06:26:36 +0000 (UTC)
Subject: Re: [PATCH 1/1] hw/s390x: fix build for virtio-9p-ccw
To: Halil Pasic <pasic@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20210218034059.1096078-1-pasic@linux.ibm.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <77f18abc-3b23-a31f-beb7-fd3e87bbc26b@redhat.com>
Date: Thu, 18 Feb 2021 07:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210218034059.1096078-1-pasic@linux.ibm.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jakob Naucke <jakob.naucke@ibm.com>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/02/2021 04.40, Halil Pasic wrote:
> Commit  2c44220d05 ("meson: convert hw/arch*"), which migrated the old
> Makefile.objs to meson.build  accidentally excluded virtio-ccw-9p.c and
> thus the virtio-9p-ccw device from the build (and potentially also
> included the file virtio-ccw-blk.c twice in the source set). And since
> CONFIG_VIRTFS can't be used the way it was used here (see commit
> 2c9dce0196 ("meson: do not use CONFIG_VIRTFS")), the preconditions have
> to be written differently.
> 
> Let's fix this!
> 
> Signed-off-by: Halil Pasic <pasic@linux.ibm.com>
> Fixes: 2c44220d05 ("meson: convert hw/arch*")
> Reported-by: Jakob Naucke <jakob.naucke@ibm.com>
> Cc: qemu-stable@nongnu.org
> ---
>   hw/s390x/meson.build | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/s390x/meson.build b/hw/s390x/meson.build
> index 2a7818d94b..91495b5631 100644
> --- a/hw/s390x/meson.build
> +++ b/hw/s390x/meson.build
> @@ -40,7 +40,9 @@ virtio_ss.add(when: 'CONFIG_VIRTIO_NET', if_true: files('virtio-ccw-net.c'))
>   virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-ccw-rng.c'))
>   virtio_ss.add(when: 'CONFIG_VIRTIO_SCSI', if_true: files('virtio-ccw-scsi.c'))
>   virtio_ss.add(when: 'CONFIG_VIRTIO_SERIAL', if_true: files('virtio-ccw-serial.c'))
> -virtio_ss.add(when: ['CONFIG_VIRTIO_9P', 'CONFIG_VIRTFS'], if_true: files('virtio-ccw-blk.c'))
> +if have_virtfs
> +  virtio_ss.add(when: 'CONFIG_VIRTIO_9P', if_true: files('virtio-ccw-9p.c'))
> +endif
>   virtio_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-ccw.c'))
>   virtio_ss.add(when: 'CONFIG_VHOST_USER_FS', if_true: files('vhost-user-fs-ccw.c'))
>   s390x_ss.add_all(when: 'CONFIG_VIRTIO_CCW', if_true: virtio_ss)
> 
> base-commit: 1af5629673bb5c1592d993f9fb6119a62845f576
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


