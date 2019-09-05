Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 506CEA9F8D
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Sep 2019 12:23:52 +0200 (CEST)
Received: from localhost ([::1]:44298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i5ovf-0004Am-Do
	for lists+qemu-devel@lfdr.de; Thu, 05 Sep 2019 06:23:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60977)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i5oub-0003jj-30
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 06:22:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i5ouZ-0007bk-5k
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 06:22:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51996)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i5ouY-0007as-V3
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 06:22:43 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B089887521F;
 Thu,  5 Sep 2019 10:22:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23BEF5C3FA;
 Thu,  5 Sep 2019 10:22:35 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 5553231E8D; Thu,  5 Sep 2019 12:22:34 +0200 (CEST)
Date: Thu, 5 Sep 2019 12:22:34 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Message-ID: <20190905102234.ut5vrfr7uixnzwvq@sirius.home.kraxel.org>
References: <cover.1567534653.git.jag.raman@oracle.com>
 <4c59e3b3d38d1e269be889cc31859ea97c15b2ff.1567534653.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c59e3b3d38d1e269be889cc31859ea97c15b2ff.1567534653.git.jag.raman@oracle.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.68]); Thu, 05 Sep 2019 10:22:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC v3 PATCH 19/45] multi-process: Add LSI device
 proxy object
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
Cc: elena.ufimtseva@oracle.com, fam@euphon.net, john.g.johnson@oracle.com,
 mst@redhat.com, qemu-devel@nongnu.org, quintela@redhat.com, armbru@redhat.com,
 kanth.ghatraju@oracle.com, thuth@redhat.com, ehabkost@redhat.com,
 konrad.wilk@oracle.com, dgilbert@redhat.com, liran.alon@oracle.com,
 stefanha@redhat.com, rth@twiddle.net, kwolf@redhat.com, berrange@redhat.com,
 mreitz@redhat.com, ross.lagerwall@citrix.com, marcandre.lureau@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> +static uint64_t proxy_lsi_io_read(void *opaque, hwaddr addr, unsigned size)
> +{
> +    ProxyLSIState *s = opaque;
> +
> +    return proxy_default_bar_read(PCI_PROXY_DEV(s), &s->io_io, addr, size,
> +                                  false);
> +}
> +
> +static void proxy_lsi_io_write(void *opaque, hwaddr addr, uint64_t val,
> +                               unsigned size)
> +{
> +    ProxyLSIState *s = opaque;
> +
> +    proxy_default_bar_write(PCI_PROXY_DEV(s), &s->io_io, addr, val, size,
> +                            false);
> +}
> +
> +static const MemoryRegionOps proxy_lsi_io_ops = {
> +    .read = proxy_lsi_io_read,
> +    .write = proxy_lsi_io_write,
> +    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .impl = {
> +        .min_access_size = 1,
> +        .max_access_size = 1,
> +    },
> +};

Hmm, as more devices get proxy support there will be alot of simliar
boilerplate.

I think it would be useful to have a

struct pci_device_description {
	u16 vendor_id,
	u16 device_id,
	[ ... ]
	struct {
		[ ... ]
	} bar[6];
};

> +    proxy_class->realize = proxy_lsi_realize;
> +    proxy_class->command = g_strdup("qemu-scsi-dev");

Hook that up here (proxy_class->description = &lsi_description),
then have the pci proxy realize function setup everything.  All pci
bar access is just forwarded to the proxy, that should be doable
without duplicating the code for each proxied pci device ...

At least parts of the pci_device_description can probably also used for
non-proxy device setup (should work for pci config space, probably
would not work for memory regions as they are very device specific).

cheers,
  Gerd


