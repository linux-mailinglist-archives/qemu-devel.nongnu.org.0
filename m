Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA0138D027
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 11:59:19 +0200 (CEST)
Received: from localhost ([::1]:58802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxq3q-0003i7-KS
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 05:59:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53069)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dgilbert@redhat.com>) id 1hxq2y-00038p-Iy
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 05:58:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dgilbert@redhat.com>) id 1hxq2x-00022i-4f
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 05:58:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:37308)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <dgilbert@redhat.com>) id 1hxq2w-00022M-Vj
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 05:58:23 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DD83983F3C
 for <qemu-devel@nongnu.org>; Wed, 14 Aug 2019 09:58:21 +0000 (UTC)
Received: from work-vm (ovpn-117-212.ams2.redhat.com [10.36.117.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C035E18243;
 Wed, 14 Aug 2019 09:58:16 +0000 (UTC)
Date: Wed, 14 Aug 2019 10:58:13 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Message-ID: <20190814095813.GA2921@work-vm>
References: <20190813133042.11683-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813133042.11683-1-stefanha@redhat.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 14 Aug 2019 09:58:21 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] usb: reword -usb command-line option and
 mention xHCI
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
Cc: qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> The -usb section of the man page is not very clear on what exactly -usb
> does and fails to mention xHCI as a modern alternative (-device
> nec-usb-xhci).

Isn't 'qemu-xhci' the current favoured device?

Dave

> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  qemu-options.hx | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 9621e934c0..7d11c016d1 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -1436,12 +1436,15 @@ STEXI
>  ETEXI
>  
>  DEF("usb", 0, QEMU_OPTION_usb,
> -    "-usb            enable the USB driver (if it is not used by default yet)\n",
> +    "-usb            enable on-board USB host controller (if not enabled by default)\n",
>      QEMU_ARCH_ALL)
>  STEXI
>  @item -usb
>  @findex -usb
> -Enable the USB driver (if it is not used by default yet).
> +Enable USB emulation on machine types with an on-board USB host controller (if
> +not enabled by default).  Note that on-board USB host controllers may not
> +support USB 3.0.  In this case -device nec-usb-xhci can be used instead on
> +machines with PCI.
>  ETEXI
>  
>  DEF("usbdevice", HAS_ARG, QEMU_OPTION_usbdevice,
> -- 
> 2.21.0
> 
> 
--
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

