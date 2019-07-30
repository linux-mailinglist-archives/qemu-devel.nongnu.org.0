Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 891097A79F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 14:05:59 +0200 (CEST)
Received: from localhost ([::1]:60444 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsQtC-00058h-QD
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 08:05:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59347)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hsQsa-0004b2-QV
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:05:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hsQsZ-000108-2Q
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:05:20 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12956)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hsQsY-0000z4-T6
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 08:05:19 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 588C920260
 for <qemu-devel@nongnu.org>; Tue, 30 Jul 2019 12:05:17 +0000 (UTC)
Received: from Igors-MacBook-Pro (ovpn-204-67.brq.redhat.com [10.40.204.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7DD98600CC;
 Tue, 30 Jul 2019 12:05:13 +0000 (UTC)
Date: Tue, 30 Jul 2019 14:05:11 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Message-ID: <20190730140511.31decaac@Igors-MacBook-Pro>
In-Reply-To: <20190730093719.12958-3-dgilbert@redhat.com>
References: <20190730093719.12958-1-dgilbert@redhat.com>
 <20190730093719.12958-3-dgilbert@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Tue, 30 Jul 2019 12:05:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/2] pcie_root_port: Disable ACS on older
 machines
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
Cc: quintela@redhat.com, qemu-devel@nongnu.org, ehabkost@redhat.com,
 mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Jul 2019 10:37:19 +0100
"Dr. David Alan Gilbert (git)" <dgilbert@redhat.com> wrote:

> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> 
> ACS got added in 4.0 unconditionally,  that broke older<->4.0 migration
> where there was a PCIe root port.
> Fix this by turning it off for 3.1 and older machines; note this
> fixes compatibility for older QEMUs but breaks compatibility with 4.0
> for older machine types.
> 
>     machine type    source qemu   dest qemu
>        3.1             3.1           4.0        broken
>        3.1             3.1           4.1rc2     broken
>        3.1             3.1           4.1+this   OK ++
>        3.1             4.0           4.1rc2     OK
>        3.1             4.0           4.1+this   broken --
>        4.0             4.0           4.1rc2     OK
>        4.0             4.0           4.1+this   OK
> 
> So we gain and lose; the consensus seems to be treat this as a
> fix for older machine types.
> 
> Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/core/machine.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index c58a8e594e..26a5f30e6d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -52,6 +52,7 @@ GlobalProperty hw_compat_3_1[] = {
>      { "virtio-blk-device", "discard", "false" },
>      { "virtio-blk-device", "write-zeroes", "false" },
>      { "virtio-balloon-device", "qemu-4-0-config-size", "false" },
> +    { "pcie-root-port-base", "disable-acs", "true" }, /* Added in 4.1 */
>  };
>  const size_t hw_compat_3_1_len = G_N_ELEMENTS(hw_compat_3_1);
>  


