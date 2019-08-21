Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2EEE9759E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Aug 2019 11:09:44 +0200 (CEST)
Received: from localhost ([::1]:45980 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0Mch-0007TU-MW
	for lists+qemu-devel@lfdr.de; Wed, 21 Aug 2019 05:09:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34176)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i0MbZ-0006Qs-66
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 05:08:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i0MbV-0002Ty-Uh
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 05:08:31 -0400
Received: from mx1.redhat.com ([209.132.183.28]:36458)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i0MbV-0002T2-0X
 for qemu-devel@nongnu.org; Wed, 21 Aug 2019 05:08:29 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id EA2EA7BDA0;
 Wed, 21 Aug 2019 09:08:27 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A3C0F60BF3;
 Wed, 21 Aug 2019 09:08:27 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B0CA016E1A; Wed, 21 Aug 2019 11:08:26 +0200 (CEST)
Date: Wed, 21 Aug 2019 11:08:26 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
Message-ID: <20190821090826.edlqptxyjg4cyacj@sirius.home.kraxel.org>
References: <cover.1565907489.git.balaton@eik.bme.hu>
 <1e658a7a7198a9ab10084bb85348e7d0a37a9055.1565907489.git.balaton@eik.bme.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1e658a7a7198a9ab10084bb85348e7d0a37a9055.1565907489.git.balaton@eik.bme.hu>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.26]); Wed, 21 Aug 2019 09:08:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 2/3] ati-vga: Support unaligned access to
 hardware cursor registers
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> @@ -672,48 +678,71 @@ static void ati_mm_write(void *opaque, hwaddr addr,
>      case 0xf00 ... 0xfff:
>          /* read-only copy of PCI config space so ignore writes */
>          break;
> -    case CUR_OFFSET:
> -        if (s->regs.cur_offset != (data & 0x87fffff0)) {
> -            s->regs.cur_offset = data & 0x87fffff0;
> +    case CUR_OFFSET ... CUR_OFFSET + 3:
> +    {
> +        uint32_t t = s->regs.cur_offset;
> +
> +        ati_reg_write_offs(&t, addr - CUR_OFFSET, data, size);
> +        t &= 0x87fffff0;
> +        if (s->regs.cur_offset != t) {
> +            s->regs.cur_offset = t;

Repeated pattern.  I'd suggest to add a "wmask" parameter to
ati_reg_write_offs.  Maybe also make it return true/false depending
on whenever the value did change or not.

cheers,
  Gerd


