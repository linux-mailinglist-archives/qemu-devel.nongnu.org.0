Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C48A663F32
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 12:20:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFBGu-00015t-VW; Tue, 10 Jan 2023 04:50:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFBGq-00014f-Er
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:50:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFBGn-0001nu-P7
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:50:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673344189;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tChjj+9ceOV9kyId2SYXb/VhBp4rPAe5Gzxce0LTVGI=;
 b=KNZbHARkXLZNXiybZxW68s7p95NzoYdpZisxKDQLF7okBiuKskinWiMeYCpQgqkjzhCoWE
 YNwE8fJFKRslfPS1RnBpiOXD6Y/Gu+mxK6W6FJyQktPxYCgJywzaYTpj51JTS4Et85sRr9
 AIkuC3TtDT51cbxOyTYwAOnSRxJ7jYc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-314-KpPnF7X0NGecWiRpJwG1sw-1; Tue, 10 Jan 2023 04:49:46 -0500
X-MC-Unique: KpPnF7X0NGecWiRpJwG1sw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 11A12101A521;
 Tue, 10 Jan 2023 09:49:46 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 85CB840C2064;
 Tue, 10 Jan 2023 09:49:42 +0000 (UTC)
Date: Tue, 10 Jan 2023 09:49:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC PATCH 4/4] qom: Warn when deprecated class property can be
 removed
Message-ID: <Y700snNkw5lvwbDw@redhat.com>
References: <20230109225419.22621-1-philmd@linaro.org>
 <20230109225419.22621-5-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109225419.22621-5-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Mon, Jan 09, 2023 at 11:54:19PM +0100, Philippe Mathieu-Daudé wrote:
> Per docs/system/deprecated.rst, a deprecated feature can be
> removed after 2 releases. Since we commit when a class property
> is deprecated, we can warn when the deprecation period is over.
> 
> See also commit ef1f5b0a96 ("docs: clarify deprecation schedule").
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>  qom/object.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/qom/object.c b/qom/object.c
> index 05b97cd424..cb829f1e44 100644
> --- a/qom/object.c
> +++ b/qom/object.c
> @@ -17,6 +17,7 @@
>  #include "qom/object_interfaces.h"
>  #include "qemu/cutils.h"
>  #include "qemu/memalign.h"
> +#include "qemu/qemu-version.h"
>  #include "qapi/visitor.h"
>  #include "qapi/string-input-visitor.h"
>  #include "qapi/string-output-visitor.h"
> @@ -1300,6 +1301,12 @@ void object_class_property_deprecate(ObjectClass *klass,
>      ObjectProperty *prop = object_class_property_find(klass, name);
>  
>      assert(prop);
> +    if (qemu_version_delta_current(version_major, version_minor) <= 2) {
> +        warn_report_once("Property '%s.%s' has been deprecated in release"
> +                         " v%u.%u and can be removed.",
> +                         object_class_get_name(klass), name,
> +                         version_major, version_minor);
> +    }

IMHO this is not really appropriate. Removal of deprecated features
is a job for maintainers, but this is printing a message at users.

Maintainers have a record of deprecations in the docs that they can
periodically review to identify stuff that can now be deleted.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


