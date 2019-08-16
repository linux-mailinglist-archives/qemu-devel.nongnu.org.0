Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC56A903A9
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Aug 2019 16:08:59 +0200 (CEST)
Received: from localhost ([::1]:56704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hycuY-0002c6-K9
	for lists+qemu-devel@lfdr.de; Fri, 16 Aug 2019 10:08:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42510)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1hycq9-0006jt-N8
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 10:04:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hycq8-0007bb-6t
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 10:04:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47312)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hycq7-0007aZ-UN
 for qemu-devel@nongnu.org; Fri, 16 Aug 2019 10:04:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 958E2C08E2BD;
 Fri, 16 Aug 2019 14:04:22 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C91938F6D7;
 Fri, 16 Aug 2019 14:04:18 +0000 (UTC)
Date: Fri, 16 Aug 2019 16:04:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20190816160417.0d77f168@redhat.com>
In-Reply-To: <20190815183803.13346-2-ehabkost@redhat.com>
References: <20190815183803.13346-1-ehabkost@redhat.com>
 <20190815183803.13346-2-ehabkost@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Fri, 16 Aug 2019 14:04:22 +0000 (UTC)
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
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 15 Aug 2019 15:38:01 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> The error message for die-id range validation is incorrect.  Example:
> 
>   $ qemu-system-x86_64 -smp 1,sockets=6,maxcpus=6 \
>     -device qemu64-x86_64-cpu,socket-id=1,die-id=1,core-id=0,thread-id=0
>   qemu-system-x86_64: -device qemu64-x86_64-cpu,socket-id=1,die-id=1,core-id=0,thread-id=0: \
>     Invalid CPU die-id: 1 must be in range 0:5
> 
> The actual range for die-id in this example is 0:0.
> 
> Fix the error message to use smp_dies and print the correct range.
> 
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

PS:
there is another unrelated bug, QEMU crashes if run like this:
   qemu-system-x86_64 -smp 1,sockets=6,dies=0,maxcpus=6

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


