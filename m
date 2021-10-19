Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17764433BC0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 18:09:52 +0200 (CEST)
Received: from localhost ([::1]:45064 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcrgV-0001yt-1S
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 12:09:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mcrLo-0000au-Lj
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:48:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:48942)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1mcrLl-0005Si-J1
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 11:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634658502;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CgmUBZm335RHtdW/Vv9Q4nd2PKHoZ3DC/K9+NHLFBW4=;
 b=f1UKNAs6qo0wlbMvjucsPIDl+hy1x8qTzeJFJnb55eCB6C21O7/0v/Npq/yLvhGJol/iQ0
 aJKUzKpE/TmBx4a6YDRqmWDr4TVM3n2DceKvmDS/fkImCqronLzmKDZ/ZiZsWSurlviDK8
 Vd9Apc5zy2v8WAroDCv93+qNfTEzZCs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-GrD-SGxRMTy7HykB3KOIxg-1; Tue, 19 Oct 2021 11:48:19 -0400
X-MC-Unique: GrD-SGxRMTy7HykB3KOIxg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9D27E362FE;
 Tue, 19 Oct 2021 15:48:18 +0000 (UTC)
Received: from localhost (unknown [10.22.17.166])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4886060657;
 Tue, 19 Oct 2021 15:48:18 +0000 (UTC)
Date: Tue, 19 Oct 2021 11:27:33 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Jean-Louis Dupond <jean-louis@dupond.be>
Subject: Re: [PATCH] hw/qdev-core: Add compatibility for (non)-transitional
 devs
Message-ID: <20211019152733.mjiucqhu2vyuofpb@habkost.net>
References: <20211012082428.16222-1-jean-louis@dupond.be>
MIME-Version: 1.0
In-Reply-To: <20211012082428.16222-1-jean-louis@dupond.be>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Oct 12, 2021 at 10:24:28AM +0200, Jean-Louis Dupond wrote:
> hw_compat modes only take into account their base name.

What do you mean by "base name"?

> But if a device is created with (non)-transitional, then the compat
> values are not used, causing migrating issues.
> 
> This commit adds their (non)-transitional entries with the same settings
> as the base entry.


Wouldn't it be easier to fix the incorrect compat_props arrays to
use "virtio-*-pci-base" instead?

If a piece of code is supposed to affect/support both
non-transitional and transitional subclasses, that's why
VirtioPCIDeviceTypeInfo.base_name exists.


> 
> Fixes https://bugzilla.redhat.com/show_bug.cgi?id=1999141
> 
> Signed-off-by: Jean-Louis Dupond <jean-louis@dupond.be>
> ---
>  include/hw/qdev-core.h | 34 ++++++++++++++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index 4ff19c714b..5726825c2d 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -293,6 +293,30 @@ typedef struct GlobalProperty {
>      bool optional;
>  } GlobalProperty;
>  
> +
> +/**
> + * Helper to add (non)transitional compat properties
> + */
> +static inline void
> +compat_props_add_transitional(GPtrArray *arr, GlobalProperty *prop)
> +{
> +    GlobalProperty *transitional = g_new0(typeof(*transitional), 1);
> +    transitional->driver = g_strdup_printf("%s-transitional", prop->driver);
> +    transitional->property = g_strdup(prop->property);
> +    transitional->value = g_strdup(prop->value);
> +    transitional->used = prop->used;
> +    transitional->optional = prop->optional;
> +    g_ptr_array_add(arr, (void *)transitional);
> +
> +    GlobalProperty *non_transitional = g_new0(typeof(*non_transitional), 1);
> +    non_transitional->driver = g_strdup_printf("%s-non-transitional", prop->driver);
> +    non_transitional->property = g_strdup(prop->property);
> +    non_transitional->value = g_strdup(prop->value);
> +    non_transitional->used = prop->used;
> +    non_transitional->optional = prop->optional;
> +    g_ptr_array_add(arr, (void *)non_transitional);
> +}
> +
>  static inline void
>  compat_props_add(GPtrArray *arr,
>                   GlobalProperty props[], size_t nelem)
> @@ -300,6 +324,16 @@ compat_props_add(GPtrArray *arr,
>      int i;
>      for (i = 0; i < nelem; i++) {
>          g_ptr_array_add(arr, (void *)&props[i]);
> +        if (g_str_equal(props[i].driver, "vhost-user-blk-pci") ||
> +            g_str_equal(props[i].driver, "virtio-scsi-pci") ||
> +            g_str_equal(props[i].driver, "virtio-blk-pci") ||
> +            g_str_equal(props[i].driver, "virtio-balloon-pci") ||
> +            g_str_equal(props[i].driver, "virtio-serial-pci") ||
> +            g_str_equal(props[i].driver, "virtio-9p-pci") ||
> +            g_str_equal(props[i].driver, "virtio-net-pci") ||
> +            g_str_equal(props[i].driver, "virtio-rng-pci")) {
> +            compat_props_add_transitional(arr, &props[i]);
> +        }
>      }
>  }
>  
> -- 
> 2.33.0
> 
> 

-- 
Eduardo


