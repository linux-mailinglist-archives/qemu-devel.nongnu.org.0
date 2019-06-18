Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D416349983
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Jun 2019 08:55:11 +0200 (CEST)
Received: from localhost ([::1]:54210 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hd81P-0002xN-3t
	for lists+qemu-devel@lfdr.de; Tue, 18 Jun 2019 02:55:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45407)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hd7zv-00024L-AQ
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 02:53:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hd7zu-0008Uo-Bw
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 02:53:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:48076)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hd7zu-0008UL-68
 for qemu-devel@nongnu.org; Tue, 18 Jun 2019 02:53:38 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 0DF643092664;
 Tue, 18 Jun 2019 06:53:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-33.ams2.redhat.com
 [10.36.116.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5A4209CC7;
 Tue, 18 Jun 2019 06:53:22 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8EA1B11AAF; Tue, 18 Jun 2019 08:53:21 +0200 (CEST)
Date: Tue, 18 Jun 2019 08:53:21 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: elena.ufimtseva@oracle.com
Message-ID: <20190618065321.f55peregolzan4iv@sirius.home.kraxel.org>
References: <20190617181539.29532-1-elena.ufimtseva@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190617181539.29532-1-elena.ufimtseva@oracle.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Tue, 18 Jun 2019 06:53:37 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [RFC PATCH v2 09/35] multi-process: setup PCI host
 bridge for remote device
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
Cc: john.g.johnson@oracle.com, jag.raman@oracle.com, mst@redhat.com,
 konrad.wilk@oracle.com, qemu-devel@nongnu.org, ross.lagerwall@citrix.com,
 liran.alon@oracle.com, stefanha@redhat.com, kanth.ghatraju@oracle.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 17, 2019 at 11:15:39AM -0700, elena.ufimtseva@oracle.com wrote:
> From: Jagannathan Raman <jag.raman@oracle.com>
> 
> PCI host bridge is setup for the remote device process. It is
> implemented using remote-pcihost object. It is an extension of the PCI
> host bridge setup by QEMU.
> Remote-pcihost configures a PCI bus which could be used by the remote
>  PCI device to latch on to.

Hmm, this (and at least the next two patches) look like you just fake
everything the device emulation needs in the remote process.

I doubt this is a good long-term plan.

IIRC there was some discussion on the last kvm forum on the idea to
re-use the vfio API for pci emulation in a separate process, i.e. create
something like vfio-user.  Have you considered this?

Sure, the lsi host adapter will probably need some refactoring so the
code can compiled into both qemu and a vfio-user server.  But that way
the chance that this can be maintained long-term without too much
headache is much higher.

A small, well-defined interface will also make it easier to re-write the
device emulation in another language like rust or go.

The current patch series feels more like a early proof-of-concept than
something mergeable ...

cheers,
  Gerd


