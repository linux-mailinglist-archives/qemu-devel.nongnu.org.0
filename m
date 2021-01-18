Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553AF2FA956
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 19:54:20 +0100 (CET)
Received: from localhost ([::1]:41694 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ZfO-0007az-Qe
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 13:54:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37506)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1ZdS-0006uN-7L
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 13:52:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1ZdM-00061g-RY
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 13:52:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610995931;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=LAJTIZnj5dQQPn4Wg/MTX5F1MZJwNOzJAoM0re0QCXk=;
 b=YIGeKwDRpuIiXTUff5e5kds7O23vp7hn73vhqVGY6GZjBLSh+dwKPwn0kTFpfJBt+3iOHi
 yEzZUC4QOpUqG5b7qBHxOxNz22iOXHWIdhrhoBvBjJICX1KXMcYU3PQi2eGIXfO8MqsKKn
 hJ69PMWA1zuwshbuW7ZHE1Rwx6L0RGI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-348-ulC6SpAzMAigJ8gPJdOyFw-1; Mon, 18 Jan 2021 13:52:07 -0500
X-MC-Unique: ulC6SpAzMAigJ8gPJdOyFw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 052378066FF;
 Mon, 18 Jan 2021 18:52:05 +0000 (UTC)
Received: from work-vm (ovpn-115-197.ams2.redhat.com [10.36.115.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1F6E871CB1;
 Mon, 18 Jan 2021 18:51:26 +0000 (UTC)
Date: Mon, 18 Jan 2021 18:51:24 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v7 02/13] confidential guest support: Introduce new
 confidential guest support class
Message-ID: <20210118185124.GG9899@work-vm>
References: <20210113235811.1909610-1-david@gibson.dropbear.id.au>
 <20210113235811.1909610-3-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210113235811.1909610-3-david@gibson.dropbear.id.au>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.175,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: pair@us.ibm.com, cohuck@redhat.com, brijesh.singh@amd.com,
 kvm@vger.kernel.org, David Hildenbrand <david@redhat.com>,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, pragyansri.pathi@intel.com,
 mst@redhat.com, mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, andi.kleen@intel.com, thuth@redhat.com,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com, berrange@redhat.com,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* David Gibson (david@gibson.dropbear.id.au) wrote:
> Several architectures have mechanisms which are designed to protect guest
> memory from interference or eavesdropping by a compromised hypervisor.  AMD
> SEV does this with in-chip memory encryption and Intel's MKTME can do
                                                           ^^^^^
(and below) My understanding is that it's Intel TDX that's the VM
equivalent.

Dave

> similar things.  POWER's Protected Execution Framework (PEF) accomplishes a
> similar goal using an ultravisor and new memory protection features,
> instead of encryption.
> 
> To (partially) unify handling for these, this introduces a new
> ConfidentialGuestSupport QOM base class.  "Confidential" is kind of vague,
> but "confidential computing" seems to be the buzzword about these schemes,
> and "secure" or "protected" are often used in connection to unrelated
> things (such as hypervisor-from-guest or guest-from-guest security).
> 
> The "support" in the name is significant because in at least some of the
> cases it requires the guest to take specific actions in order to protect
> itself from hypervisor eavesdropping.
> 
> Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
> ---
>  backends/confidential-guest-support.c     | 33 ++++++++++++++++++++
>  backends/meson.build                      |  1 +
>  include/exec/confidential-guest-support.h | 38 +++++++++++++++++++++++
>  include/qemu/typedefs.h                   |  1 +
>  target/i386/sev.c                         |  3 +-
>  5 files changed, 75 insertions(+), 1 deletion(-)
>  create mode 100644 backends/confidential-guest-support.c
>  create mode 100644 include/exec/confidential-guest-support.h
> 
> diff --git a/backends/confidential-guest-support.c b/backends/confidential-guest-support.c
> new file mode 100644
> index 0000000000..9b0ded0db4
> --- /dev/null
> +++ b/backends/confidential-guest-support.c
> @@ -0,0 +1,33 @@
> +/*
> + * QEMU Confidential Guest support
> + *
> + * Copyright: David Gibson, Red Hat Inc. 2020
> + *
> + * Authors:
> + *  David Gibson <david@gibson.dropbear.id.au>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +
> +#include "exec/confidential-guest-support.h"
> +
> +OBJECT_DEFINE_ABSTRACT_TYPE(ConfidentialGuestSupport,
> +                            confidential_guest_support,
> +                            CONFIDENTIAL_GUEST_SUPPORT,
> +                            OBJECT)
> +
> +static void confidential_guest_support_class_init(ObjectClass *oc, void *data)
> +{
> +}
> +
> +static void confidential_guest_support_init(Object *obj)
> +{
> +}
> +
> +static void confidential_guest_support_finalize(Object *obj)
> +{
> +}
> diff --git a/backends/meson.build b/backends/meson.build
> index 484456ece7..d4221831fc 100644
> --- a/backends/meson.build
> +++ b/backends/meson.build
> @@ -6,6 +6,7 @@ softmmu_ss.add([files(
>    'rng-builtin.c',
>    'rng-egd.c',
>    'rng.c',
> +  'confidential-guest-support.c',
>  ), numa])
>  
>  softmmu_ss.add(when: 'CONFIG_POSIX', if_true: files('rng-random.c'))
> diff --git a/include/exec/confidential-guest-support.h b/include/exec/confidential-guest-support.h
> new file mode 100644
> index 0000000000..5f131023ba
> --- /dev/null
> +++ b/include/exec/confidential-guest-support.h
> @@ -0,0 +1,38 @@
> +/*
> + * QEMU Confidential Guest support
> + *   This interface describes the common pieces between various
> + *   schemes for protecting guest memory or other state against a
> + *   compromised hypervisor.  This includes memory encryption (AMD's
> + *   SEV and Intel's MKTME) or special protection modes (PEF on POWER,
> + *   or PV on s390x).
> + *
> + * Copyright: David Gibson, Red Hat Inc. 2020
> + *
> + * Authors:
> + *  David Gibson <david@gibson.dropbear.id.au>
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or
> + * later.  See the COPYING file in the top-level directory.
> + *
> + */
> +#ifndef QEMU_CONFIDENTIAL_GUEST_SUPPORT_H
> +#define QEMU_CONFIDENTIAL_GUEST_SUPPORT_H
> +
> +#ifndef CONFIG_USER_ONLY
> +
> +#include "qom/object.h"
> +
> +#define TYPE_CONFIDENTIAL_GUEST_SUPPORT "confidential-guest-support"
> +OBJECT_DECLARE_SIMPLE_TYPE(ConfidentialGuestSupport, CONFIDENTIAL_GUEST_SUPPORT)
> +
> +struct ConfidentialGuestSupport {
> +    Object parent;
> +};
> +
> +typedef struct ConfidentialGuestSupportClass {
> +    ObjectClass parent;
> +} ConfidentialGuestSupportClass;
> +
> +#endif /* !CONFIG_USER_ONLY */
> +
> +#endif /* QEMU_CONFIDENTIAL_GUEST_SUPPORT_H */
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index 976b529dfb..33685c79ed 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -36,6 +36,7 @@ typedef struct BusState BusState;
>  typedef struct Chardev Chardev;
>  typedef struct CompatProperty CompatProperty;
>  typedef struct CoMutex CoMutex;
> +typedef struct ConfidentialGuestSupport ConfidentialGuestSupport;
>  typedef struct CPUAddressSpace CPUAddressSpace;
>  typedef struct CPUState CPUState;
>  typedef struct DeviceListener DeviceListener;
> diff --git a/target/i386/sev.c b/target/i386/sev.c
> index 1546606811..6b49925f51 100644
> --- a/target/i386/sev.c
> +++ b/target/i386/sev.c
> @@ -31,6 +31,7 @@
>  #include "qom/object.h"
>  #include "exec/address-spaces.h"
>  #include "monitor/monitor.h"
> +#include "exec/confidential-guest-support.h"
>  
>  #define TYPE_SEV_GUEST "sev-guest"
>  OBJECT_DECLARE_SIMPLE_TYPE(SevGuestState, SEV_GUEST)
> @@ -322,7 +323,7 @@ sev_guest_instance_init(Object *obj)
>  
>  /* sev guest info */
>  static const TypeInfo sev_guest_info = {
> -    .parent = TYPE_OBJECT,
> +    .parent = TYPE_CONFIDENTIAL_GUEST_SUPPORT,
>      .name = TYPE_SEV_GUEST,
>      .instance_size = sizeof(SevGuestState),
>      .instance_finalize = sev_guest_finalize,
> -- 
> 2.29.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


