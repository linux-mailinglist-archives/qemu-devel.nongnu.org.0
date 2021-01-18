Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 673B62F9EB2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 12:51:04 +0100 (CET)
Received: from localhost ([::1]:60374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1T3n-0003sU-GY
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 06:51:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1T1a-0003Is-0Q
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:48:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57325)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l1T1Y-0007nj-1L
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 06:48:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610970522;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VFMUsPlYLVMAWHd89rOzuMhGW52wriQcxIJYel05Sh8=;
 b=AfWxw2/0FV/GT+GlyPmLgBI4AGG9Ea4fGTBrkq5jLwduj5C6bizBKsMIKjoBfT7zbfSWvK
 rlCTbpxk+WTEZaF+8MnsnzNOVlwrotSNuDWfQmSjnN6wUDrqzGNVAgHMLCayZl77vjOcfW
 Fn6auzWSoilL4rx/8oyergnfeOYJUsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-509-xeNc-rJKMce10F1jbaM7CQ-1; Mon, 18 Jan 2021 06:48:41 -0500
X-MC-Unique: xeNc-rJKMce10F1jbaM7CQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E3EE918C8C0C;
 Mon, 18 Jan 2021 11:48:38 +0000 (UTC)
Received: from work-vm (ovpn-115-197.ams2.redhat.com [10.36.115.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A702260BFA;
 Mon, 18 Jan 2021 11:48:28 +0000 (UTC)
Date: Mon, 18 Jan 2021 11:48:25 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH v2 01/20] migration/vmstate: Restrict vmstate_dummy
 to user-mode
Message-ID: <20210118114825.GJ2998@work-vm>
References: <20210117192446.23753-1-f4bug@amsat.org>
 <20210117192446.23753-2-f4bug@amsat.org>
MIME-Version: 1.0
In-Reply-To: <20210117192446.23753-2-f4bug@amsat.org>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.189,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Laurent Vivier <laurent@vivier.eu>, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Philippe Mathieu-Daudé (f4bug@amsat.org) wrote:
> 'vmstate_dummy' is special and only used for user-mode. Rename
> it to something more specific.
> It was introduced restricted to user-mode in commit c71c3e99b8
> ("Add a vmstate_dummy struct for CONFIG_USER_ONLY") but this
> restriction was later removed in commit 6afc14e92ac ("migration:
> Fix warning caused by missing declaration of vmstate_dummy").
> Avoid the missing declaration warning by adding a stub for the
> symbol, and restore the #ifdef'ry.
> 
> Suggested-by: Daniel Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  include/hw/core/cpu.h       | 2 +-
>  include/migration/vmstate.h | 4 +++-
>  stubs/vmstate.c             | 4 +++-
>  3 files changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> index 140fa32a5e3..c79a58db9b9 100644
> --- a/include/hw/core/cpu.h
> +++ b/include/hw/core/cpu.h
> @@ -1132,7 +1132,7 @@ bool target_words_bigendian(void);
>  #ifdef CONFIG_SOFTMMU
>  extern const VMStateDescription vmstate_cpu_common;
>  #else
> -#define vmstate_cpu_common vmstate_dummy
> +#define vmstate_cpu_common vmstate_user_mode_cpu_dummy
>  #endif
>  
>  #define VMSTATE_CPU() {                                                     \
> diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
> index 075ee800960..dda65c9987d 100644
> --- a/include/migration/vmstate.h
> +++ b/include/migration/vmstate.h
> @@ -194,7 +194,9 @@ struct VMStateDescription {
>      const VMStateDescription **subsections;
>  };
>  
> -extern const VMStateDescription vmstate_dummy;
> +#if defined(CONFIG_USER_ONLY)
> +extern const VMStateDescription vmstate_user_mode_cpu_dummy;
> +#endif
>  
>  extern const VMStateInfo vmstate_info_bool;
>  
> diff --git a/stubs/vmstate.c b/stubs/vmstate.c
> index cc4fe41dfc2..8da777a1fb4 100644
> --- a/stubs/vmstate.c
> +++ b/stubs/vmstate.c
> @@ -1,7 +1,9 @@
>  #include "qemu/osdep.h"
>  #include "migration/vmstate.h"
>  
> -const VMStateDescription vmstate_dummy = {};
> +#if defined(CONFIG_USER_ONLY)
> +const VMStateDescription vmstate_user_mode_cpu_dummy = {};
> +#endif
>  
>  int vmstate_register_with_alias_id(VMStateIf *obj,
>                                     uint32_t instance_id,
> -- 
> 2.26.2
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


