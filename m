Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF14F222010
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jul 2020 11:58:06 +0200 (CEST)
Received: from localhost ([::1]:44366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jw0eT-0004nj-Ok
	for lists+qemu-devel@lfdr.de; Thu, 16 Jul 2020 05:58:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49424)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jw0dh-0004P0-Qx
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 05:57:17 -0400
Received: from zero.eik.bme.hu ([152.66.115.2]:57116)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1jw0df-0008HG-2L
 for qemu-devel@nongnu.org; Thu, 16 Jul 2020 05:57:16 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 608E1746335;
 Thu, 16 Jul 2020 11:57:12 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 4344F745712; Thu, 16 Jul 2020 11:57:12 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 420CA745702;
 Thu, 16 Jul 2020 11:57:12 +0200 (CEST)
Date: Thu, 16 Jul 2020 11:57:12 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PULL 2/2] usb: fix storage regression
In-Reply-To: <20200716093119.10740-3-kraxel@redhat.com>
Message-ID: <alpine.BSF.2.22.395.2007161156180.82447@zero.eik.bme.hu>
References: <20200716093119.10740-1-kraxel@redhat.com>
 <20200716093119.10740-3-kraxel@redhat.com>
User-Agent: Alpine 2.22 (BSF 395 2020-01-19)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
X-Spam-Probability: 8%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/16 05:57:12
X-ACL-Warn: Detected OS   = FreeBSD 9.x or newer [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Alex Williamson <alex.williamson@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 16 Jul 2020, Gerd Hoffmann wrote:
> Fix the contition to figure whenever we need to wait for more data or

Typo: contition -> condition

Regards,
BALATON Zoltan

> not.  Simply check the mode, if we are not in DATAIN state any more we
> are done already and don't need to go ASYNC.
>
> Fixes: 7ad3d51ebb8a ("usb: add short-packet handling to usb-storage driver")
> Reported-by: Sai Pavan Boddu <saipava@xilinx.com>
> Tested-by: Paul Zimmerman <pauldzim@gmail.com>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> Message-id: 20200713062712.1476-1-kraxel@redhat.com
> ---
> hw/usb/dev-storage.c | 3 +--
> 1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/hw/usb/dev-storage.c b/hw/usb/dev-storage.c
> index 2ed6a8df2413..405a4ccfe700 100644
> --- a/hw/usb/dev-storage.c
> +++ b/hw/usb/dev-storage.c
> @@ -546,8 +546,7 @@ static void usb_msd_handle_data(USBDevice *dev, USBPacket *p)
>                     }
>                 }
>             }
> -            if (p->actual_length < p->iov.size && (p->short_not_ok ||
> -                    s->scsi_len >= p->ep->max_packet_size)) {
> +            if (p->actual_length < p->iov.size && s->mode == USB_MSDM_DATAIN) {
>                 DPRINTF("Deferring packet %p [wait data-in]\n", p);
>                 s->packet = p;
>                 p->status = USB_RET_ASYNC;
>

