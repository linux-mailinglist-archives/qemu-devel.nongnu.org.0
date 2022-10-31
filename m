Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A541613828
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:37:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUyA-0008Ny-4S; Mon, 31 Oct 2022 09:36:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1opUy0-0008HJ-SN
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:36:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1opUxy-0003El-Qh
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:36:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667223398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rvQ9Dnd5OKBnAFiI/6VpPPmq8nkwXR982QpCKvPYNQQ=;
 b=Eu1blAURHkHOWrB5enpiL0qq9/2/dE5ZeSRg09AcKb/d8AC2JO7s93Y7ZX/v2y+fCTqwXm
 ADIP+Nvh9Nwk/A8BSLxHdCAv527InK5ZVUtr+ZriHatXK8i4/AQZzikuUpRkfK6+j5XMzV
 kzPkir9y7RCm/irDikd0MiBEveBJX1k=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-qgBNJ3pZPu2lBjVJ6MBLGg-1; Mon, 31 Oct 2022 09:36:34 -0400
X-MC-Unique: qgBNJ3pZPu2lBjVJ6MBLGg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 49CEC8027EB;
 Mon, 31 Oct 2022 13:36:34 +0000 (UTC)
Received: from localhost (unknown [10.39.193.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03D9E40C2066;
 Mon, 31 Oct 2022 13:36:33 +0000 (UTC)
Date: Mon, 31 Oct 2022 13:36:33 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 3/4] hw/watchdog: add trace events for watchdog action
 handling
Message-ID: <20221031133633.GI7636@redhat.com>
References: <20221031131934.425448-1-berrange@redhat.com>
 <20221031131934.425448-4-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031131934.425448-4-berrange@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 31, 2022 at 01:19:33PM +0000, Daniel P. Berrangé wrote:
> The tracepoints aid in debugging the triggering of watchdog devices.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/watchdog/trace-events | 4 ++++
>  hw/watchdog/watchdog.c   | 4 ++++
>  2 files changed, 8 insertions(+)
> 
> diff --git a/hw/watchdog/trace-events b/hw/watchdog/trace-events
> index 89ccbcfdfd..fc1d048702 100644
> --- a/hw/watchdog/trace-events
> +++ b/hw/watchdog/trace-events
> @@ -16,3 +16,7 @@ spapr_watchdog_stop(uint64_t num, uint64_t ret) "num=%" PRIu64 " ret=%" PRId64
>  spapr_watchdog_query(uint64_t caps) "caps=0x%" PRIx64
>  spapr_watchdog_query_lpm(uint64_t caps) "caps=0x%" PRIx64
>  spapr_watchdog_expired(uint64_t num, unsigned action) "num=%" PRIu64 " action=%u"
> +
> +# watchdog.c
> +watchdog_perform_action(unsigned int action) "action=%d"
> +watchdog_set_action(unsigned int action) "action=%d"
> diff --git a/hw/watchdog/watchdog.c b/hw/watchdog/watchdog.c
> index 6c082a3263..955046161b 100644
> --- a/hw/watchdog/watchdog.c
> +++ b/hw/watchdog/watchdog.c
> @@ -30,6 +30,7 @@
>  #include "sysemu/watchdog.h"
>  #include "hw/nmi.h"
>  #include "qemu/help_option.h"
> +#include "trace.h"
>  
>  static WatchdogAction watchdog_action = WATCHDOG_ACTION_RESET;
>  
> @@ -43,6 +44,8 @@ WatchdogAction get_watchdog_action(void)
>   */
>  void watchdog_perform_action(void)
>  {
> +    trace_watchdog_perform_action(watchdog_action);
> +
>      switch (watchdog_action) {
>      case WATCHDOG_ACTION_RESET:     /* same as 'system_reset' in monitor */
>          qapi_event_send_watchdog(WATCHDOG_ACTION_RESET);
> @@ -89,4 +92,5 @@ void watchdog_perform_action(void)
>  void qmp_watchdog_set_action(WatchdogAction action, Error **errp)
>  {
>      watchdog_action = action;
> +    trace_watchdog_set_action(watchdog_action);
>  }

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-builder quickly builds VMs from scratch
http://libguestfs.org/virt-builder.1.html


