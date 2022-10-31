Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62727613827
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 14:36:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUxk-00085v-Ey; Mon, 31 Oct 2022 09:36:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1opUxZ-0007zU-46
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:36:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rjones@redhat.com>) id 1opUxX-00034l-Aq
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 09:36:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667223370;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HUdSVNd6TYfeYrs3yCMt4qnumuBKYOypFBU9tSR1PSI=;
 b=OPYYvjiqP/TR8428FOEp9ltoUOpHuQ1BM5ikbSk1ZVbNqgxoEv+Z1hYudWJqi+QeKqaf5y
 Xy8xNbuyC9kZZPqisFhxbt6EFHyqSTW4cvXvATeviXGrfUPvMRWr7Ygwi6ukn6R87aTfMT
 7r6fJObHdQQpy3VJTByMA/WtSM5Rs1s=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-567-VGCasrxvNO6SGWjOaFI2PA-1; Mon, 31 Oct 2022 09:36:06 -0400
X-MC-Unique: VGCasrxvNO6SGWjOaFI2PA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 31A0129AB416;
 Mon, 31 Oct 2022 13:36:06 +0000 (UTC)
Received: from localhost (unknown [10.39.193.198])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E118B1415119;
 Mon, 31 Oct 2022 13:36:05 +0000 (UTC)
Date: Mon, 31 Oct 2022 13:36:05 +0000
From: "Richard W.M. Jones" <rjones@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Ani Sinha <ani@anisinha.ca>, Igor Mammedov <imammedo@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH 2/4] hw/isa: add trace events for ICH9 LPC chip config
 access
Message-ID: <20221031133605.GH7636@redhat.com>
References: <20221031131934.425448-1-berrange@redhat.com>
 <20221031131934.425448-3-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031131934.425448-3-berrange@redhat.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=rjones@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

On Mon, Oct 31, 2022 at 01:19:32PM +0000, Daniel P. Berrangé wrote:
> These tracepoints aid in understanding and debugging the guest drivers
> for the TCO watchdog.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/isa/lpc_ich9.c   | 3 +++
>  hw/isa/trace-events | 4 ++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/hw/isa/lpc_ich9.c b/hw/isa/lpc_ich9.c
> index 4553b5925b..66062a344c 100644
> --- a/hw/isa/lpc_ich9.c
> +++ b/hw/isa/lpc_ich9.c
> @@ -51,6 +51,7 @@
>  #include "hw/nvram/fw_cfg.h"
>  #include "qemu/cutils.h"
>  #include "hw/acpi/acpi_aml_interface.h"
> +#include "trace.h"
>  
>  /*****************************************************************************/
>  /* ICH9 LPC PCI to ISA bridge */
> @@ -161,6 +162,7 @@ static void ich9_cc_write(void *opaque, hwaddr addr,
>  {
>      ICH9LPCState *lpc = (ICH9LPCState *)opaque;
>  
> +    trace_ich9_cc_write(addr, val, len);
>      ich9_cc_addr_len(&addr, &len);
>      memcpy(lpc->chip_config + addr, &val, len);
>      pci_bus_fire_intx_routing_notifier(pci_get_bus(&lpc->d));
> @@ -176,6 +178,7 @@ static uint64_t ich9_cc_read(void *opaque, hwaddr addr,
>      uint32_t val = 0;
>      ich9_cc_addr_len(&addr, &len);
>      memcpy(&val, lpc->chip_config + addr, len);
> +    trace_ich9_cc_read(addr, val, len);
>      return val;
>  }
>  
> diff --git a/hw/isa/trace-events b/hw/isa/trace-events
> index b8f877e1ed..c4567a9b47 100644
> --- a/hw/isa/trace-events
> +++ b/hw/isa/trace-events
> @@ -21,3 +21,7 @@ via_pm_io_read(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%
>  via_pm_io_write(uint32_t addr, uint32_t val, int len) "addr 0x%x val 0x%x len 0x%x"
>  via_superio_read(uint8_t addr, uint8_t val) "addr 0x%x val 0x%x"
>  via_superio_write(uint8_t addr, uint32_t val) "addr 0x%x val 0x%x"
> +
> +# lpc_ich9.c
> +ich9_cc_write(uint64_t addr, uint64_t val, unsigned len) "addr=0x%"PRIx64 " val=0x%"PRIx64 " len=%u"
> +ich9_cc_read(uint64_t addr, uint64_t val, unsigned len) "addr=0x%"PRIx64 " val=0x%"PRIx64 " len=%u"

Reviewed-by: Richard W.M. Jones <rjones@redhat.com>

I can't help thinking that the trace-events file ought to be generated
from the source code ...

Rich.

-- 
Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
Read my programming and virtualization blog: http://rwmj.wordpress.com
virt-top is 'top' for virtual machines.  Tiny program with many
powerful monitoring features, net stats, disk stats, logging, etc.
http://people.redhat.com/~rjones/virt-top


