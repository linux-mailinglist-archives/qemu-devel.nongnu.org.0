Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C10F663D55
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:54:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFBJo-0002CB-8u; Tue, 10 Jan 2023 04:53:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFBJY-00027b-70
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:53:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFBJW-0002X3-0v
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:53:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673344381;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=00eEdVq2MGiAF8ed/7IF2ZdKfw4b5zGIt0scrQewNsA=;
 b=W7q7qD6YvUseCISqNfIURFbXM1fSAUOsnWZq1rwx1yDT4cY1P6f7PQIeYH8HCrBjXFl6vD
 3rrb+tN63+gA/kuGnhKnkGiTKKLfg/I0VNywSQgxKUkzGLceDYsdRz14qFh2XrDGZ5D9k9
 rxxZDJnh29/zKjIfxNHQJvbwecW6UB0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-tY5CI6uJO5G0WqQhHNkZYw-1; Tue, 10 Jan 2023 04:53:00 -0500
X-MC-Unique: tY5CI6uJO5G0WqQhHNkZYw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AEBDA1C08787;
 Tue, 10 Jan 2023 09:52:59 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 410102166B26;
 Tue, 10 Jan 2023 09:52:58 +0000 (UTC)
Date: Tue, 10 Jan 2023 09:52:56 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC PATCH 1/4] qom: Introduce object_class_property_deprecate()
Message-ID: <Y701eB0wUmyzd1RI@redhat.com>
References: <20230109225419.22621-1-philmd@linaro.org>
 <20230109225419.22621-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109225419.22621-2-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Mon, Jan 09, 2023 at 11:54:16PM +0100, Philippe Mathieu-Daudé wrote:
> Introduce object_class_property_deprecate() to register
> a QOM property as deprecated. When this property's getter /
> setter is called, a deprecation warning is displayed on the
> monitor.
> 
> Inspired-by: Daniel P. Berrange <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  include/qom/object.h | 17 +++++++++++++++++
>  qom/object.c         | 23 +++++++++++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/include/qom/object.h b/include/qom/object.h
> index ef7258a5e1..b76724292c 100644
> --- a/include/qom/object.h
> +++ b/include/qom/object.h
> @@ -97,6 +97,7 @@ struct ObjectProperty
>      ObjectPropertyInit *init;
>      void *opaque;
>      QObject *defval;
> +    const char *deprecation_reason;
>  };
>  
>  /**
> @@ -1075,6 +1076,22 @@ ObjectProperty *object_class_property_add(ObjectClass *klass, const char *name,
>                                            ObjectPropertyRelease *release,
>                                            void *opaque);
>  
> +/**
> + * object_class_property_deprecate:
> + * @klass: the class to add a property to
> + * @name: the name of the property.  This can contain any character except for
> + *  a forward slash.  In general, you should use hyphens '-' instead of
> + *  underscores '_' when naming properties.
> + * @reason: the deprecation reason.
> + * @version_major: the major version since this property is deprecated.
> + * @version_minor: the minor version since this property is deprecated.
> + *
> + * Deprecate a class property.
> + */
> +void object_class_property_deprecate(ObjectClass *klass,
> +                                     const char *name, const char *reason,
> +                                     int version_major, int version_minor);
> +
>  /**
>   * object_property_set_default_bool:
>   * @prop: the property to set
> diff --git a/qom/object.c b/qom/object.c
> index e25f1e96db..05b97cd424 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -1293,6 +1293,16 @@ object_class_property_add(ObjectClass *klass,
>      return prop;
>  }
>  
> +void object_class_property_deprecate(ObjectClass *klass,
> +                                     const char *name, const char *reason,
> +                                     int version_major, int version_minor)
> +{
> +    ObjectProperty *prop = object_class_property_find(klass, name);
> +
> +    assert(prop);
> +    prop->deprecation_reason = reason;
> +}

Nothing is using the 'version_major' / 'version_minor' parameters so
they look redundant.

> @@ -1392,6 +1413,7 @@ bool object_property_get(Object *obj, const char *name, Visitor *v,
>          return false;
>      }
>  
> +    object_property_check_deprecation(obj, name, prop);
>      if (!prop->get) {
>          error_setg(errp, "Property '%s.%s' is not readable",
>                     object_get_typename(obj), name);
> @@ -1412,6 +1434,7 @@ bool object_property_set(Object *obj, const char *name, Visitor *v,
>          return false;
>      }
>  
> +    object_property_check_deprecation(obj, name, prop);
>      if (!prop->set) {
>          error_setg(errp, "Property '%s.%s' is not writable",
>                     object_get_typename(obj), name);
> -- 
> 2.38.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


