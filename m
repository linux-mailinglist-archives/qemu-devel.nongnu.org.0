Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2110A995E2
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 16:07:26 +0200 (CEST)
Received: from localhost ([::1]:43568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0nkK-0007D6-Tg
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 10:07:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49967)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1i0ngk-0005RO-C6
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 10:03:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1i0ngf-0006Q8-I6
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 10:03:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41096)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1i0ngf-0006Pl-CZ; Thu, 22 Aug 2019 10:03:37 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8D99B8980F2;
 Thu, 22 Aug 2019 14:03:36 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E336160FA2;
 Thu, 22 Aug 2019 14:03:35 +0000 (UTC)
Date: Thu, 22 Aug 2019 16:03:33 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190822160333.2f00e8a6.cohuck@redhat.com>
In-Reply-To: <20190822135839.32340-2-cohuck@redhat.com>
References: <20190822135839.32340-1-cohuck@redhat.com>
 <20190822135839.32340-2-cohuck@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Thu, 22 Aug 2019 14:03:36 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH for-4.1?] compat: disable edid on
 virtio-gpu base device
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
Cc: qemu-s390x@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 22 Aug 2019 15:58:32 +0200
Cornelia Huck <cohuck@redhat.com> wrote:

> 'edid' is a property of the virtio-gpu base device, so turning
> it off on virtio-gpu-pci is not enough (it misses -ccw). Turn
> it off on the base device instead.
> 
> Fixes: 0a71966253c8 ("edid: flip the default to enabled")
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
> 
> Only just noticed this... should we still shove this into 4.1?
> Or do we need a compat 4.1.1 dance for this?
> 
> ---
>  hw/core/machine.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 28a475ad97a3..32d1ca9abc5a 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -32,7 +32,7 @@ GlobalProperty hw_compat_4_0[] = {
>      { "secondary-vga",  "edid", "false" },
>      { "bochs-display",  "edid", "false" },
>      { "virtio-vga",     "edid", "false" },
> -    { "virtio-gpu-pci", "edid", "false" },
> +    { "virtio-gpu",     "edid", "false" },
>      { "virtio-device", "use-started", "false" },
>      { "virtio-balloon-device", "qemu-4-0-config-size", "true" },
>      { "pl031", "migrate-tick-offset", "false" },

Eh... rm fail. Please ignore that patch :)

