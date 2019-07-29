Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8DE793A4
	for <lists+qemu-devel@lfdr.de>; Mon, 29 Jul 2019 21:17:18 +0200 (CEST)
Received: from localhost ([::1]:55888 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hsB93-0005bI-Rp
	for lists+qemu-devel@lfdr.de; Mon, 29 Jul 2019 15:17:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34284)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hsB7z-00051V-NW
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 15:16:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hsB7y-0002Rv-GY
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 15:16:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47120)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hsB7y-0002RL-AL
 for qemu-devel@nongnu.org; Mon, 29 Jul 2019 15:16:10 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 74A13316290C
 for <qemu-devel@nongnu.org>; Mon, 29 Jul 2019 19:16:09 +0000 (UTC)
Received: from localhost (ovpn-116-75.gru2.redhat.com [10.97.116.75])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C914110016E8;
 Mon, 29 Jul 2019 19:16:08 +0000 (UTC)
Date: Mon, 29 Jul 2019 16:16:05 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Message-ID: <20190729191605.GF4313@habkost.net>
References: <20190726120542.9894-1-armbru@redhat.com>
 <20190726120542.9894-22-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190726120542.9894-22-armbru@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Mon, 29 Jul 2019 19:16:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 21/28] Include hw/qdev-properties.h less
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 26, 2019 at 02:05:35PM +0200, Markus Armbruster wrote:
> In my "build everything" tree, changing hw/qdev-properties.h triggers
> a recompile of some 2700 out of 6600 objects (not counting tests and
> objects that don't depend on qemu/osdep.h).
> 
> Many places including hw/qdev-properties.h (directly or via hw/qdev.h)
> actually need only hw/qdev-core.h.  Include hw/qdev-core.h there
> instead.
> 
> hw/qdev.h is actually pointless: all it does is include hw/qdev-core.h
> and hw/qdev-properties.h, which in turn includes hw/qdev-core.h.
> Replace the remaining uses of hw/qdev.h by hw/qdev-properties.h.
> 
> While there, delete a few superfluous inclusions of hw/qdev-core.h.
> 
> Touching hw/qdev-properties.h now recompiles some 1200 objects.

Impressive, thanks for doing this.

I only see superfluous whitespace changes at
hw/sd/sdhci-internal.h and hw/qdev-dma.h, below.
They are harmless, though, so:

Reviewed-by: Eduardo Habkost <ehabkost@redhat.com>


[...]
> diff --git a/hw/sd/sdhci-internal.h b/hw/sd/sdhci-internal.h
> index 34141400f8..1d9053c183 100644
> --- a/hw/sd/sdhci-internal.h
> +++ b/hw/sd/sdhci-internal.h
> @@ -21,6 +21,7 @@
>   * You should have received a copy of the GNU General Public License along
>   * with this program; if not, see <http://www.gnu.org/licenses/>.
>   */
> +
>  #ifndef SDHCI_INTERNAL_H
>  #define SDHCI_INTERNAL_H
>  
[...]
> diff --git a/include/hw/qdev-dma.h b/include/hw/qdev-dma.h
> index b00391aa0c..002705c57d 100644
> --- a/include/hw/qdev-dma.h
> +++ b/include/hw/qdev-dma.h
> @@ -10,6 +10,7 @@
>  #ifndef HW_QDEV_DMA_H
>  #define HW_QDEV_DMA_H
>  
> +
>  #define DEFINE_PROP_DMAADDR(_n, _s, _f, _d)                               \
>      DEFINE_PROP_UINT64(_n, _s, _f, _d)
>  
[...]

-- 
Eduardo

