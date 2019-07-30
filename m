Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B917E7A432
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Jul 2019 11:31:41 +0200 (CEST)
Received: from localhost ([::1]:59152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsOTs-0000Py-N4
	for lists+qemu-devel@lfdr.de; Tue, 30 Jul 2019 05:31:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33673)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hsOSp-00089Z-Lt
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 05:30:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hsOSo-00037o-If
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 05:30:35 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45346)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hsOSo-00037W-Dh
 for qemu-devel@nongnu.org; Tue, 30 Jul 2019 05:30:34 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 72F485D66B;
 Tue, 30 Jul 2019 09:30:33 +0000 (UTC)
Received: from Igors-MacBook-Pro (ovpn-204-67.brq.redhat.com [10.40.204.67])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 940C560BF7;
 Tue, 30 Jul 2019 09:30:27 +0000 (UTC)
Date: Tue, 30 Jul 2019 11:30:25 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Wei Yang <richardw.yang@linux.intel.com>
Message-ID: <20190730113025.7e82bdee@Igors-MacBook-Pro>
In-Reply-To: <20190730003740.20694-3-richardw.yang@linux.intel.com>
References: <20190730003740.20694-1-richardw.yang@linux.intel.com>
 <20190730003740.20694-3-richardw.yang@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.39]); Tue, 30 Jul 2019 09:30:33 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/2] memory-device: break the loop if
 tmp exceed the hinted range
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
Cc: mst@redhat.com, qemu-devel@nongnu.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Jul 2019 08:37:40 +0800
Wei Yang <richardw.yang@linux.intel.com> wrote:

> The memory-device list built by memory_device_build_list is ordered by
> its address, this means if the tmp range exceed the hinted range, all
> the following range will not overlap with it.
> 
> And this won't change default pc-dimm mapping and address assignment stay
> the same as before this change.
> 
> Signed-off-by: Wei Yang <richardw.yang@linux.intel.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  hw/mem/memory-device.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/mem/memory-device.c b/hw/mem/memory-device.c
> index df3261b32a..df4e338b83 100644
> --- a/hw/mem/memory-device.c
> +++ b/hw/mem/memory-device.c
> @@ -180,6 +180,8 @@ static uint64_t memory_device_get_free_addr(MachineState *ms,
>                  range_make_empty(&new);
>                  break;
>              }
> +        } else if (range_lob(&tmp) > range_upb(&new)) {
> +            break;
>          }
>      }
>  


