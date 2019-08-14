Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0291A8CD8F
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 10:05:26 +0200 (CEST)
Received: from localhost ([::1]:58048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxoHc-0004MR-Kj
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 04:05:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37127)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <cohuck@redhat.com>) id 1hxoGd-0003lv-15
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 04:04:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <cohuck@redhat.com>) id 1hxoGb-0006At-Ll
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 04:04:22 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34034)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <cohuck@redhat.com>)
 id 1hxoGb-0006Ad-GS; Wed, 14 Aug 2019 04:04:21 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4E40FC06511B;
 Wed, 14 Aug 2019 08:04:20 +0000 (UTC)
Received: from gondolin (dhcp-192-232.str.redhat.com [10.33.192.232])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3B83818243;
 Wed, 14 Aug 2019 08:04:19 +0000 (UTC)
Date: Wed, 14 Aug 2019 10:04:17 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: <luoyifan@cmss.chinamobile.com>
Message-ID: <20190814100417.350a443b.cohuck@redhat.com>
In-Reply-To: <02cf01d55267$86cf2850$946d78f0$@cmss.chinamobile.com>
References: <02cf01d55267$86cf2850$946d78f0$@cmss.chinamobile.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Wed, 14 Aug 2019 08:04:20 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] pc-bios/s390-ccw/net: fix a possible
 memory leak in get_uuid()
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
Cc: qemu-s390x@nongnu.org, borntraeger@de.ibm.com, thuth@redhat.com,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Aug 2019 14:14:26 +0800
<luoyifan@cmss.chinamobile.com> wrote:

> There is a possible memory leak in get_uuid(). Should free allocated mem
> before 
> return NULL.
> 
> Signed-off-by: Yifan Luo <luoyifan@cmss.chinamobile.com>
> ---
>  pc-bios/s390-ccw/netmain.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/pc-bios/s390-ccw/netmain.c b/pc-bios/s390-ccw/netmain.c
> index f3542cb2cf1..f2dcc01e272 100644
> --- a/pc-bios/s390-ccw/netmain.c
> +++ b/pc-bios/s390-ccw/netmain.c
> @@ -269,6 +269,7 @@ static const char *get_uuid(void)
>                   : "d" (r0), "d" (r1), [addr] "a" (buf)
>                   : "cc", "memory");
>      if (cc) {
> +        free(mem);
>          return NULL;
>      }
>  

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

