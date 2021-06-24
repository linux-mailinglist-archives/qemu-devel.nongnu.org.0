Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C983B321B
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 16:59:02 +0200 (CEST)
Received: from localhost ([::1]:41254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwQon-0005yn-Vo
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 10:59:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39134)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwQnY-0004wm-00
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 10:57:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:26198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lwQnV-0008Gr-2k
 for qemu-devel@nongnu.org; Thu, 24 Jun 2021 10:57:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624546660;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FBYTYHNtx1tDEsCEL0j+r8rugqjSPZgafx6pSN3ga/4=;
 b=hGUNxlOvj89n1zqHpNJhc/LwLqUEolDYiHn6EmavRqAd0XoDmvBjOO8+ZOzvNkWNBRzYGz
 5TC061g5AZUvn1a88EE8msMQ3DBjUBC0ec4V+hdEKN1ctfom1GA3ESFcWWBl+LR2F1AOhe
 zioim1jrsyqQn2Yd9unuHGQkLj9LPUU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-517--fRh70ZuOKuHHhfxSA8LNw-1; Thu, 24 Jun 2021 10:57:39 -0400
X-MC-Unique: -fRh70ZuOKuHHhfxSA8LNw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 205DD802C94;
 Thu, 24 Jun 2021 14:57:37 +0000 (UTC)
Received: from work-vm (ovpn-114-255.ams2.redhat.com [10.36.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5938B5D6CF;
 Thu, 24 Jun 2021 14:57:15 +0000 (UTC)
Date: Thu, 24 Jun 2021 15:57:12 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v4 34/34] monitor/tcg: move tcg hmp commands to
 accel/tcg, register them dynamically
Message-ID: <YNSdSDAo1XKakpMK@work-vm>
References: <20210624103836.2382472-1-kraxel@redhat.com>
 <20210624103836.2382472-35-kraxel@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210624103836.2382472-35-kraxel@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.362,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Samuel Thibault <samuel.thibault@ens-lyon.org>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Peter Lieven <pl@kamp.de>,
 Greg Kurz <groug@kaod.org>, qemu-s390x@nongnu.org,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, Cleber Rosa <crosa@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Max Reitz <mreitz@redhat.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Gerd Hoffmann (kraxel@redhat.com) wrote:
> One more little step towards modular tcg ...
> 
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

> ---
>  accel/tcg/hmp.c       | 29 +++++++++++++++++++++++++++++
>  monitor/misc.c        | 18 ------------------
>  accel/tcg/meson.build |  1 +
>  hmp-commands-info.hx  |  2 --
>  4 files changed, 30 insertions(+), 20 deletions(-)
>  create mode 100644 accel/tcg/hmp.c
> 
> diff --git a/accel/tcg/hmp.c b/accel/tcg/hmp.c
> new file mode 100644
> index 000000000000..a6e72fdb3ed6
> --- /dev/null
> +++ b/accel/tcg/hmp.c
> @@ -0,0 +1,29 @@
> +#include "qemu/osdep.h"
> +#include "qemu/error-report.h"
> +#include "exec/exec-all.h"
> +#include "monitor/monitor.h"
> +#include "sysemu/tcg.h"
> +
> +static void hmp_info_jit(Monitor *mon, const QDict *qdict)
> +{
> +    if (!tcg_enabled()) {
> +        error_report("JIT information is only available with accel=tcg");
> +        return;
> +    }
> +
> +    dump_exec_info();
> +    dump_drift_info();
> +}
> +
> +static void hmp_info_opcount(Monitor *mon, const QDict *qdict)
> +{
> +    dump_opcount_info();
> +}
> +
> +static void hmp_tcg_register(void)
> +{
> +    monitor_register_hmp("jit", true, hmp_info_jit);
> +    monitor_register_hmp("opcount", true, hmp_info_opcount);
> +}
> +
> +type_init(hmp_tcg_register);
> diff --git a/monitor/misc.c b/monitor/misc.c
> index ad476c6e51ea..b28874d6dc59 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -320,24 +320,6 @@ static void hmp_info_registers(Monitor *mon, const QDict *qdict)
>      }
>  }
>  
> -#ifdef CONFIG_TCG
> -static void hmp_info_jit(Monitor *mon, const QDict *qdict)
> -{
> -    if (!tcg_enabled()) {
> -        error_report("JIT information is only available with accel=tcg");
> -        return;
> -    }
> -
> -    dump_exec_info();
> -    dump_drift_info();
> -}
> -
> -static void hmp_info_opcount(Monitor *mon, const QDict *qdict)
> -{
> -    dump_opcount_info();
> -}
> -#endif
> -
>  static void hmp_info_sync_profile(Monitor *mon, const QDict *qdict)
>  {
>      int64_t max = qdict_get_try_int(qdict, "max", 10);
> diff --git a/accel/tcg/meson.build b/accel/tcg/meson.build
> index 0ae9180282e3..137a1a44cc0a 100644
> --- a/accel/tcg/meson.build
> +++ b/accel/tcg/meson.build
> @@ -15,6 +15,7 @@ specific_ss.add_all(when: 'CONFIG_TCG', if_true: tcg_ss)
>  
>  specific_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
>    'cputlb.c',
> +  'hmp.c',
>  ))
>  
>  tcg_module_ss.add(when: ['CONFIG_SOFTMMU', 'CONFIG_TCG'], if_true: files(
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index ce42aef47acb..27206ac049df 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -274,7 +274,6 @@ ERST
>          .args_type  = "",
>          .params     = "",
>          .help       = "show dynamic compiler info",
> -        .cmd        = hmp_info_jit,
>      },
>  #endif
>  
> @@ -289,7 +288,6 @@ ERST
>          .args_type  = "",
>          .params     = "",
>          .help       = "show dynamic compiler opcode counters",
> -        .cmd        = hmp_info_opcount,
>      },
>  #endif
>  
> -- 
> 2.31.1
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


