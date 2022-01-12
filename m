Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72A5748C20D
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 11:14:40 +0100 (CET)
Received: from localhost ([::1]:42830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7aeN-00075V-9o
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 05:14:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7abb-0006MG-9G
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:11:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1n7abY-0000kf-SK
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 05:11:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641982303;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Qm8LVxan5hON1mn+XSV7qjl9Nt9pI7KIQL/1uD9VLdM=;
 b=U7of2WXaZVFeRRwGWSh4EYggJulmPseJyoeY5FhdlPzYLwFwPCqJKOxd346mfFDe1QWrzf
 612d86AzZtnAvgTBwUUA5HjRl5053gQKfymSkeuip8Jtf92INRvNYrotUO0c6AbRclF14Z
 mlaoyY2OUkAJeMCwqRygLDrwsP2uiNg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-437-YMSEoGKfNzeTsy_zqjPJBg-1; Wed, 12 Jan 2022 05:11:40 -0500
X-MC-Unique: YMSEoGKfNzeTsy_zqjPJBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 73A3D10151E1;
 Wed, 12 Jan 2022 10:11:39 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4AE6D752CD;
 Wed, 12 Jan 2022 10:11:37 +0000 (UTC)
Date: Wed, 12 Jan 2022 10:11:35 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Yang Zhong <yang.zhong@intel.com>
Subject: Re: [PATCH] sgx: Move sgx object from /machine/unattached to /machine
Message-ID: <Yd6pV+6kdfLNQRnA@redhat.com>
References: <20220112165517.4140482-1-yang.zhong@intel.com>
MIME-Version: 1.0
In-Reply-To: <20220112165517.4140482-1-yang.zhong@intel.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: eduardo@habkost.net, pbonzini@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jan 12, 2022 at 11:55:17AM -0500, Yang Zhong wrote:
> When Libvirt start, it get the vcpu's unavailable-features from
> /machine/unattached/device[0] path by qom-get command, but in SGX
> guest, since the sgx-epc virtual device is initialized before VCPU
> creation(virtual sgx need set the virtual EPC info in the cpuid). This
> /machine/unattached/device[0] is occupied by sgx-epc device, which
> fail to get the unvailable-features from /machine/unattached/device[0].

If libvirt decides to enable SGX in a VM, then surely it knows
that it should just query /machine/unattached/device[1] to get
the CPU features instead. Why do we need to do anything in QEMU ?

> 
> This patch make one new /machine/sgx object to avoid this issue.
> (qemu) qom-list /machine/unattached/
> device[0] (child<host-x86_64-cpu>)
> 
> (qemu) qom-list /machine/sgx
> device[0] (child<sgx-epc>)
> 
> Signed-off-by: Yang Zhong <yang.zhong@intel.com>
> ---
>  hw/core/qdev.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index 84f3019440..4154eef0d8 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -497,7 +497,7 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
>      NamedClockList *ncl;
>      Error *local_err = NULL;
>      bool unattached_parent = false;
> -    static int unattached_count;
> +    static int unattached_count, sgx_count;
>  
>      if (dev->hotplugged && !dc->hotpluggable) {
>          error_setg(errp, QERR_DEVICE_NO_HOTPLUG, object_get_typename(obj));
> @@ -509,7 +509,15 @@ static void device_set_realized(Object *obj, bool value, Error **errp)
>              goto fail;
>          }
>  
> -        if (!obj->parent) {
> +        if (!obj->parent && !strcmp(object_get_typename(obj), "sgx-epc")) {
> +            gchar *name = g_strdup_printf("device[%d]", sgx_count++);
> +
> +            object_property_add_child(container_get(qdev_get_machine(),
> +                                                    "/sgx"),
> +                                      name, obj);
> +            unattached_parent = true;
> +            g_free(name);

The qdev.c file is part of our generic object code. It should not
contain any code that is tied to very specific object types like
this.

> +        } else if (!obj->parent) {
>              gchar *name = g_strdup_printf("device[%d]", unattached_count++);
>  
>              object_property_add_child(container_get(qdev_get_machine(),

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


