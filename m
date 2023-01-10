Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 72638663EF7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 12:08:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFBMJ-00033o-Cy; Tue, 10 Jan 2023 04:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFBME-00033B-4V
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:55:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pFBMC-0004Ap-Kp
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 04:55:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673344548;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XrDSmQdtsoAYmuUNJC88VweJMRV5D3MOJkZObb8jJnM=;
 b=gOU/2Nig23QhRo1cm7g2KsZA7DQVLgyHHPt/IQEkZ9CgnQPeAVKo6WsPEp2waOb/VTTWlF
 4SYpXaVy4JUV6smIKy6rn8GG2cPkwi2Ck4cjBHC6eyU8RfHACGSgaySFlueLq4eAHNdfS1
 K40EHM/Z2OWo/Esv7/s4KKlRD9Z2wLM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-494-If2_0bMFP_msgi6_j42IXg-1; Tue, 10 Jan 2023 04:55:42 -0500
X-MC-Unique: If2_0bMFP_msgi6_j42IXg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8490B38035A4;
 Tue, 10 Jan 2023 09:55:42 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B23A8492C14;
 Tue, 10 Jan 2023 09:55:37 +0000 (UTC)
Date: Tue, 10 Jan 2023 09:55:32 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: Re: [RFC PATCH 1/4] qom: Introduce object_class_property_deprecate()
Message-ID: <Y702FDGkpEjzeO0k@redhat.com>
References: <20230109225419.22621-1-philmd@linaro.org>
 <20230109225419.22621-2-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230109225419.22621-2-philmd@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.9
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

qapi/qom.list should change ObjectPropertyInfo type to
include a 'deprecated': 'bool'  field, as we've done
for machine types and CPU models. Then qmp_qom_list
should set this flag  "deprecated = !!deprecation_reason"


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


