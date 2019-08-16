Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75B5E8FA98
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 08:07:50 +0200 (CEST)
Received: from localhost ([::1]:49558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hyVOv-00014n-BC
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 02:07:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55186)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1hyVNs-0000Y0-BE
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 02:06:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hyVNq-0006WG-FN
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 02:06:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:30277)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hyVNq-0006V6-7f
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 02:06:42 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A9539308FEC1;
 Fri, 16 Aug 2019 06:06:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-142.ams2.redhat.com
 [10.36.117.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A65991001947;
 Fri, 16 Aug 2019 06:06:37 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 19B021136444; Fri, 16 Aug 2019 08:06:36 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
References: <20190815183803.13346-1-ehabkost@redhat.com>
 <20190815183803.13346-2-ehabkost@redhat.com>
Date: Fri, 16 Aug 2019 08:06:36 +0200
In-Reply-To: <20190815183803.13346-2-ehabkost@redhat.com> (Eduardo Habkost's
 message of "Thu, 15 Aug 2019 15:38:01 -0300")
Message-ID: <87tvahskyb.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.49]); Fri, 16 Aug 2019 06:06:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/3] pc: Fix error message on die-id
 validation
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
Cc: Peter Krempa <pkrempa@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Eduardo Habkost <ehabkost@redhat.com> writes:

> The error message for die-id range validation is incorrect.  Example:
>
>   $ qemu-system-x86_64 -smp 1,sockets=6,maxcpus=6 \
>     -device qemu64-x86_64-cpu,socket-id=1,die-id=1,core-id=0,thread-id=0
>   qemu-system-x86_64: -device qemu64-x86_64-cpu,socket-id=1,die-id=1,core-id=0,thread-id=0: \
>     Invalid CPU die-id: 1 must be in range 0:5

The error message makes me wonder whether the upper bound is inclusive.

> The actual range for die-id in this example is 0:0.

Aha.  I guess it is.

Hmm...

$ git-grep 'must be between' \*.c
block/qcow.c:        error_setg(errp, "Cluster size must be between 512 and 64k");
block/qcow.c:        error_setg(errp, "L2 table size must be between 512 and 64k");
hw/arm/armsse.c:        error_setg(errp, "SRAM_ADDR_WIDTH must be between 1 and %d",
hw/block/block.c:            error_setg(errp, "cyls must be between 1 and %u", cyls_max);
hw/block/block.c:            error_setg(errp, "heads must be between 1 and %u", heads_max);
hw/block/block.c:            error_setg(errp, "secs must be between 1 and %u", secs_max);
hw/block/virtio-blk.c:                   ", must be between 1 and %d",
hw/block/virtio-blk.c:                   "), must be between 1 and %d",
hw/net/rocker/rocker_of_dpa.c:            DPRINTF("New vlan_id (%d) must be between 1 and 4095\n",
hw/net/virtio-net.c:        error_setg(errp, "'speed' must be between 0 and INT_MAX");
hw/nvram/spapr_nvram.c:                   "spapr-nvram must be between %" PRId64
hw/timer/a9gtimer.c:        error_setg(errp, "%s: num-cpu must be between 1 and %d",
hw/timer/arm_mptimer.c:        error_setg(errp, "num-cpu must be between 1 and %d",
hw/usb/hcd-ehci.c:        error_setg(errp, "firstport must be between 0 and %u",
net/slirp.c:                   "(IPv6 prefix length must be between 0 and 126)");
tests/test-throttle.c:        /* burst_length must be between 1 and THROTTLE_VALUE_MAX */
util/keyval.c: * The length of any key-fragment must be between 1 and 127.

> Fix the error message to use smp_dies and print the correct range.
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
>  hw/i386/pc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index 549c437050..24b03bb49c 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -2412,7 +2412,7 @@ static void pc_cpu_pre_plug(HotplugHandler *hotplug_dev,
>              return;
>          } else if (cpu->die_id > pcms->smp_dies - 1) {
>              error_setg(errp, "Invalid CPU die-id: %u must be in range 0:%u",
> -                       cpu->die_id, max_socket);
> +                       cpu->die_id, pcms->smp_dies - 1);
>              return;
>          }
>          if (cpu->core_id < 0) {

