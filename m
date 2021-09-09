Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8534048EC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 13:08:09 +0200 (CEST)
Received: from localhost ([::1]:55398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOHua-0001Ok-KQ
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 07:08:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOHqo-0004Fj-RU
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 07:04:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:48579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOHqm-0003Jd-TQ
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 07:04:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631185452;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Faiv6H45qsLcLF+E3eChwe664ABfD2GKqV97YcVlGIQ=;
 b=Ig21VWQcNMBGxIfj/UaFYXpZ5nApm1svzuGjr0TUDbf0TBp/Ndnmitre8xUulX83wNxqc9
 /Bx51XnXNKj+qIQUVaGxcjiFCw5jWmQokGJMHJ4axmfZKd1KCyu+GWlq05Tf+WkBbkVoty
 BIcTnsDGqXS0Bupr6p1S6AkO42wb4Vk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-4VNc8KnCO7GnYm0cbZ0gqg-1; Thu, 09 Sep 2021 07:04:08 -0400
X-MC-Unique: 4VNc8KnCO7GnYm0cbZ0gqg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 643CD801B3D;
 Thu,  9 Sep 2021 11:04:07 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 20E2760C04;
 Thu,  9 Sep 2021 11:03:50 +0000 (UTC)
Date: Thu, 9 Sep 2021 12:03:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH 06/10] qdev: Use qemu_security_policy_taint() API
Message-ID: <YTnqFHnolMLeY9c8@redhat.com>
References: <20210908232024.2399215-1-philmd@redhat.com>
 <20210908232024.2399215-7-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210908232024.2399215-7-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.393,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Prasad J Pandit <pjp@fedoraproject.org>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 xen-devel@lists.xenproject.org, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 01:20:20AM +0200, Philippe Mathieu-Daudé wrote:
> Add DeviceClass::taints_security_policy field to allow an
> unsafe device to eventually taint the global security policy
> in DeviceRealize().
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/hw/qdev-core.h |  6 ++++++
>  hw/core/qdev.c         | 11 +++++++++++
>  2 files changed, 17 insertions(+)
> 
> diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
> index bafc311bfa1..ff9ce6671be 100644
> --- a/include/hw/qdev-core.h
> +++ b/include/hw/qdev-core.h
> @@ -122,6 +122,12 @@ struct DeviceClass {
>       */
>      bool user_creatable;
>      bool hotpluggable;
> +    /*
> +     * %false if the device is within the QEMU security policy boundary,
> +     * %true if there is no guarantee this device can be used safely.
> +     * See: https://www.qemu.org/contribute/security-process/
> +     */
> +    bool taints_security_policy;
>  
>      /* callbacks */
>      /*

Although your use case is for devices, it probably makes more sense
to push this up into the Object base class.

I think it will need to be a tri-state value too, not a simple
bool. It isn't feasible to mark all devices with this property,
so initially we'll have no information about whether most
devices are secure or insecure. This patch gives the implication
that all devices are secure, except for the few that have been
marked otherwise, which is not a good default IMHO.

We want to be able to make it clear when introspecting, that we
have no information on security available for most devices ie

 - unset  => no information on security (the current default)
 - true => considered secure against malicious guest
 - false => considered insecure against malicious guest

Then we can also extend 'ObjectTypeInfo' to have a

   '*secure': 'bool'

to make 'qom-list-types' be able to introspect this upfront.



> diff --git a/hw/core/qdev.c b/hw/core/qdev.c
> index cefc5eaa0a9..a5a00f3564c 100644
> --- a/hw/core/qdev.c
> +++ b/hw/core/qdev.c
> @@ -31,6 +31,7 @@
>  #include "qapi/qmp/qerror.h"
>  #include "qapi/visitor.h"
>  #include "qemu/error-report.h"
> +#include "qemu-common.h"
>  #include "qemu/option.h"
>  #include "hw/hotplug.h"
>  #include "hw/irq.h"
> @@ -257,6 +258,13 @@ bool qdev_hotplug_allowed(DeviceState *dev, Error **errp)
>      MachineClass *mc;
>      Object *m_obj = qdev_get_machine();
>  
> +    if (qemu_security_policy_is_strict()
> +            && DEVICE_GET_CLASS(dev)->taints_security_policy) {
> +        error_setg(errp, "Device '%s' can not be hotplugged when"
> +                         " 'strict' security policy is in place",
> +                   object_get_typename(OBJECT(dev)));

Do you need a 'return' here to stop execution after reportig
the error ?

> +    }
> +
>      if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {
>          machine = MACHINE(m_obj);
>          mc = MACHINE_GET_CLASS(machine);
> @@ -385,6 +393,9 @@ bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp)
>      } else {
>          assert(!DEVICE_GET_CLASS(dev)->bus_type);
>      }
> +    qemu_security_policy_taint(DEVICE_GET_CLASS(dev)->taints_security_policy,
> +                               "device type %s",
> +                               object_get_typename(OBJECT(dev)));
>  
>      return object_property_set_bool(OBJECT(dev), "realized", true, errp);
>  }
> -- 
> 2.31.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


