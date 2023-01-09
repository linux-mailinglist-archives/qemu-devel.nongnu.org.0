Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB5A6626E9
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 14:24:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pErRq-0000Zf-R9; Mon, 09 Jan 2023 07:40:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pErRm-0000WG-HB
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:40:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pErRk-0003HK-HF
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 07:40:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673268011;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=obiLjmcB0AVLrCE+8++0/lwpInjjV7Cl8fgdRIUjeDM=;
 b=NdzWOIvyxelgDhHs/6JGuN6UKwItasnetEKzZuSLmJXlK3FWz9zIaye1oVLqIq/Lh2gN/j
 EauX19qUFkzG7w+S5R/OkCFnwfz2wWnAGMgqwAekL0syvWH5RNB9Wc0nBXzrqsiaSRMT20
 gRxgTlQJce7u5KLgXPPnYBQBL8xaOhA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-114-_XQNNdCSNd-I2l-_GX2dmA-1; Mon, 09 Jan 2023 07:40:07 -0500
X-MC-Unique: _XQNNdCSNd-I2l-_GX2dmA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7D3EB3C0F669;
 Mon,  9 Jan 2023 12:40:07 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.5])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A19672166B26;
 Mon,  9 Jan 2023 12:40:03 +0000 (UTC)
Date: Mon, 9 Jan 2023 12:39:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Claudio Fontana <cfontana@suse.de>, Eduardo Habkost <eduardo@habkost.net>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC PATCH] qom: Extract object_try_new() from qdev_new()
Message-ID: <Y7wLH3wg5YnlYx+n@redhat.com>
References: <20230109112056.94385-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109112056.94385-1-philmd@linaro.org>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Jan 09, 2023 at 12:20:56PM +0100, Philippe Mathieu-Daudé wrote:
> The module resolving in qdev_new() is specific to QOM, not to
> QDev. Extract the code as a new QOM object_try_new() helper so
> it can be reused by non-QDev code.

qdev_new() unconditionally tries loading the module, regardless
of whether that particular device type can be built as a module.
Not an issue, as we should only hit the error code of missing
object type for devices which can be loadable, or in case of
programmer error in typename. The latter shouldn't ever happen.

If we want to push this logic down into QOM, this suggests
not introducing a new object_try_new() helper at all. Instead
modify  'object_new' to unconditionally try to load modules.

Or even take it one step further, make 'object_class_by_name'
try to load the module in its error path.

Can anyone think of other scenarios where object_class_by_name
would be expected to fail, that aren't a case of the typename
being a loadable module, or a programmer error ? If not, then
modifying object_class_by_name should be ok.

> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
> RFC because I'm wonder if we can't find a better name...
> 
> Also, should we refactor object_initialize() similarly,
> having object_try_initialize(..., Error *)?
> ---
>  hw/core/qdev.c       | 23 ++---------------------
>  include/qom/object.h | 12 ++++++++++++
>  qom/object.c         | 23 +++++++++++++++++++++++
>  3 files changed, 37 insertions(+), 21 deletions(-)
> 
> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index d759c4602c..3a076dcc7f 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -147,31 +147,12 @@ bool qdev_set_parent_bus(DeviceState *dev, BusState *bus, Error **errp)
>  
>  DeviceState *qdev_new(const char *name)
>  {
> -    ObjectClass *oc = object_class_by_name(name);
> -#ifdef CONFIG_MODULES
> -    if (!oc) {
> -        int rv = module_load_qom(name, &error_fatal);
> -        if (rv > 0) {
> -            oc = object_class_by_name(name);
> -        } else {
> -            error_report("could not find a module for type '%s'", name);
> -            exit(1);
> -        }
> -    }
> -#endif
> -    if (!oc) {
> -        error_report("unknown type '%s'", name);
> -        abort();
> -    }
> -    return DEVICE(object_new(name));
> +    return DEVICE(object_try_new(name, &error_fatal));
>  }
>  
>  DeviceState *qdev_try_new(const char *name)
>  {
> -    if (!module_object_class_by_name(name)) {
> -        return NULL;
> -    }
> -    return DEVICE(object_new(name));
> +    return DEVICE(object_try_new(name, NULL));
>  }
>  
>  static QTAILQ_HEAD(, DeviceListener) device_listeners
> diff --git a/include/qom/object.h b/include/qom/object.h
> index ef7258a5e1..9cc5bf30ec 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -565,6 +565,18 @@ Object *object_new_with_class(ObjectClass *klass);
>   */
>  Object *object_new(const char *typename);
>  
> +/**
> + * object_try_new: Try to create an object on the heap
> + * @name: The name of the type of the object to instantiate.
> + * @errp: pointer to Error object.
> + *
> + * This is like object_new(), except it returns %NULL when type @name
> + * does not exist, rather than asserting.
> + *
> + * Returns: The newly allocated and instantiated object, or %NULL.
> + */
> +Object *object_try_new(const char *name, Error **errp);
> +
>  /**
>   * object_new_with_props:
>   * @typename:  The name of the type of the object to instantiate.
> diff --git a/qom/object.c b/qom/object.c
> index e25f1e96db..6d3faaeb6e 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -755,6 +755,29 @@ Object *object_new(const char *typename)
>  }
>  
>  
> +Object *object_try_new(const char *name, Error **errp)
> +{
> +    TypeImpl *ti = type_get_by_name(name);
> +
> +    if (!ti) {
> +#ifdef CONFIG_MODULES
> +        int rv = module_load_qom(name, errp);
> +        if (rv <= 0) {
> +            error_report("could not find a module for type '%s'", name);
> +            exit(1);
> +        }
> +        ti = type_get_by_name(name);
> +#endif
> +    }
> +    if (!ti) {
> +        error_setg(errp, "unknown type '%s'", name);
> +        return NULL;
> +    }
> +
> +    return object_new_with_type(ti);
> +}
> +
> +
>  Object *object_new_with_props(const char *typename,
>                                Object *parent,
>                                const char *id,
> -- 
> 2.38.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


