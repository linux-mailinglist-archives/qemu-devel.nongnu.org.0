Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51C9D36D4A4
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Apr 2021 11:18:58 +0200 (CEST)
Received: from localhost ([::1]:41132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbgLR-0004yE-Ej
	for lists+qemu-devel@lfdr.de; Wed, 28 Apr 2021 05:18:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38766)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbgJY-0004J6-FI
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:17:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36690)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lbgJW-0001v3-0S
 for qemu-devel@nongnu.org; Wed, 28 Apr 2021 05:17:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619601417;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/iziFNmgPQWkVSKQbr0TWNM5TsDTbACjVNJlMW05LYY=;
 b=LTe5pjHJKzp5+IM3H+zImxUXqOavRDvxig0GghbcDxHs2sDe9ycejb2BogwcI8q/0WDi8P
 cRmGB0b3M9ELVcjjFUXytXYEeUSM5FohRPRlgjN5XGFiS5+6eBJL5Mr89DoZGGPdmYRz06
 ntBOyQw+hzzPLIXGqp0G0j7FgRTcytE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-9OYarjzlMduhjZaBDusdrg-1; Wed, 28 Apr 2021 05:16:53 -0400
X-MC-Unique: 9OYarjzlMduhjZaBDusdrg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A8AA7801DDF;
 Wed, 28 Apr 2021 09:16:45 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 620E119C59;
 Wed, 28 Apr 2021 09:16:45 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9B19218009CE; Wed, 28 Apr 2021 11:16:43 +0200 (CEST)
Date: Wed, 28 Apr 2021 11:16:43 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: Re: [PATCH v2 07/12] virtio-gpu: Add virtio_gpu_resource_create_blob
Message-ID: <20210428091643.rkqmgwptjbhyvpim@sirius.home.kraxel.org>
References: <20210420065347.2685768-1-vivek.kasireddy@intel.com>
 <20210420065347.2685768-8-vivek.kasireddy@intel.com>
MIME-Version: 1.0
In-Reply-To: <20210420065347.2685768-8-vivek.kasireddy@intel.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
> index 2c0e7b2455..8bbce08550 100644
> --- a/hw/display/virtio-gpu-udmabuf.c
> +++ b/hw/display/virtio-gpu-udmabuf.c
> @@ -72,7 +72,10 @@ static void virtio_gpu_create_udmabuf(struct virtio_gpu_simple_resource *res)
>  
>  static void virtio_gpu_remap_udmabuf(struct virtio_gpu_simple_resource *res)
>  {
> -    res->remapsz = res->width * res->height * 4;
> +    if (res->blob_size) {
> +        res->remapsz = res->blob_size;
> +    }
> +
>      res->remapsz = QEMU_ALIGN_UP(res->remapsz, qemu_real_host_page_size);
>  
>      res->remapped = mmap(NULL, res->remapsz, PROT_READ,
> @@ -152,7 +155,9 @@ void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res)
>          pdata = res->remapped;
>      }
>  
> -    (void) pdata;
> +    if (pdata) {
> +        res->blob = pdata;
> +    }
>  }

That is confusing.  Patch #2 introduces code which is removed here
(probably leftovers from udmabuf prototype which didn't use blob
resources).  I think it would be useful to merge patch #2 with this one.

Also we might cleanup things a bit.  Do we need separate remapsz +
blob_size fields in the first place?  Probably not ...

take care,
  Gerd

PS: Can you explicitly cc me on the next version of the patch series?
    Some patches (this one for example) are on the list only and not in
    my inbox.  Thanks.


