Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB0DB2F2D3B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 11:54:21 +0100 (CET)
Received: from localhost ([::1]:42674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzHJd-0004ip-0A
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 05:54:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kzGGG-0000pb-6W
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:46:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kzGGB-0000tB-Cs
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 04:46:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610444800;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=ODVNYzSBgz4KYGkr1woEtTAcLg1nh9e/gD9NLL+j6AQ=;
 b=jFEj4E3fmcNQlBrtENfZxwGjxT6IfyOyh8n80tPReYu4TTSat+SIUQ2ywsxcbtavjvx1tB
 8pJzgVw1d6S3zh0v2hL4v3vAg/lUDa+Q3J6OQTANOsrdv5dfR7iyByTdsf6TkMFE4zllXm
 F7IXtigdEX4sfbyDlyI2Qwmt2xyxHnc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-106-Ethh6Yo1OkqBB43Yo1xOzA-1; Tue, 12 Jan 2021 04:46:36 -0500
X-MC-Unique: Ethh6Yo1OkqBB43Yo1xOzA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C072215720;
 Tue, 12 Jan 2021 09:46:33 +0000 (UTC)
Received: from redhat.com (ovpn-115-107.ams2.redhat.com [10.36.115.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3BE076A8FD;
 Tue, 12 Jan 2021 09:46:19 +0000 (UTC)
Date: Tue, 12 Jan 2021 09:46:17 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH v6 02/13] confidential guest support: Introduce new
 confidential guest support class
Message-ID: <20210112094617.GB1360503@redhat.com>
References: <20210112044508.427338-1-david@gibson.dropbear.id.au>
 <20210112044508.427338-3-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210112044508.427338-3-david@gibson.dropbear.id.au>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: pair@us.ibm.com, Marcelo Tosatti <mtosatti@redhat.com>,
 brijesh.singh@amd.com, kvm@vger.kernel.org, david@redhat.com,
 qemu-devel@nongnu.org, frankja@linux.ibm.com, pragyansri.pathi@intel.com,
 mst@redhat.com, mdroth@linux.vnet.ibm.com, pasic@linux.ibm.com,
 Christian Borntraeger <borntraeger@de.ibm.com>, andi.kleen@intel.com,
 thuth@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 richard.henderson@linaro.org, dgilbert@redhat.com, Greg Kurz <groug@kaod.org>,
 qemu-s390x@nongnu.org, jun.nakajima@intel.com,
 Cornelia Huck <cohuck@redhat.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 03:44:57PM +1100, David Gibson wrote:
> Several architectures have mechanisms which are designed to protect guest
> memory from interference or eavesdropping by a compromised hypervisor.  AMD
> SEV does this with in-chip memory encryption and Intel's MKTME can do
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
>  backends/confidential-guest-support.c     | 30 +++++++++++++++
>  backends/meson.build                      |  1 +
>  include/exec/confidential-guest-support.h | 46 +++++++++++++++++++++++
>  include/qemu/typedefs.h                   |  1 +
>  target/i386/sev.c                         |  3 +-
>  5 files changed, 80 insertions(+), 1 deletion(-)
>  create mode 100644 backends/confidential-guest-support.c
>  create mode 100644 include/exec/confidential-guest-support.h
> 
> diff --git a/backends/confidential-guest-support.c b/backends/confidential-guest-support.c
> new file mode 100644
> index 0000000000..2c7793c74f
> --- /dev/null
> +++ b/backends/confidential-guest-support.c
> @@ -0,0 +1,30 @@
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
> +static const TypeInfo confidential_guest_support_info = {
> +    .parent = TYPE_OBJECT,
> +    .name = TYPE_CONFIDENTIAL_GUEST_SUPPORT,
> +    .class_size = sizeof(ConfidentialGuestSupportClass),
> +    .instance_size = sizeof(ConfidentialGuestSupport),
> +};
> +
> +static void confidential_guest_support_register_types(void)
> +{
> +    type_register_static(&confidential_guest_support_info);
> +}
> +
> +type_init(confidential_guest_support_register_types)

This should all be replaced by OBJECT_DEFINE_TYPE

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
> index 0000000000..f9cf170802
> --- /dev/null
> +++ b/include/exec/confidential-guest-support.h
> @@ -0,0 +1,46 @@
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
> +#define CONFIDENTIAL_GUEST_SUPPORT(obj)                                    \
> +    OBJECT_CHECK(ConfidentialGuestSupport, (obj),                          \
> +                 TYPE_CONFIDENTIAL_GUEST_SUPPORT)
> +#define CONFIDENTIAL_GUEST_SUPPORT_CLASS(klass)                            \
> +    OBJECT_CLASS_CHECK(ConfidentialGuestSupportClass, (klass),             \
> +                       TYPE_CONFIDENTIAL_GUEST_SUPPORT)
> +#define CONFIDENTIAL_GUEST_SUPPORT_GET_CLASS(obj)                          \
> +    OBJECT_GET_CLASS(ConfidentialGuestSupportClass, (obj),                 \
> +                     TYPE_CONFIDENTIAL_GUEST_SUPPORT)
> +

This should all be replaced by  OBJECT_DECLARE_TYPE


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

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


