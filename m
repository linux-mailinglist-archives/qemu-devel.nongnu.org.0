Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CBC6016552D
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Feb 2020 03:42:05 +0100 (CET)
Received: from localhost ([::1]:35032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j4bmu-0005lR-Tk
	for lists+qemu-devel@lfdr.de; Wed, 19 Feb 2020 21:42:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36502)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paulus@ozlabs.org>) id 1j4bmA-0005Ef-Tz
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 21:41:20 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paulus@ozlabs.org>) id 1j4bm9-0007vt-Jy
 for qemu-devel@nongnu.org; Wed, 19 Feb 2020 21:41:18 -0500
Received: from ozlabs.org ([203.11.71.1]:56163)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <paulus@ozlabs.org>)
 id 1j4bm8-0007r6-I5; Wed, 19 Feb 2020 21:41:17 -0500
Received: by ozlabs.org (Postfix, from userid 1003)
 id 48NJkF41yCz9sRs; Thu, 20 Feb 2020 13:41:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1582166469; bh=EirTQ09/f5t1EYSbjUDyAxjWGTMXmVM84kkpySotjb0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=y6+d2M6j7B4K1rxB/0vFXF0338eqA0PG1Pc5DIC2zboR7tx2OeSEMKDme7Z4HRPPz
 XxeuhSH8SHGE5w9aewijdSPEiVlQbEfEJy4/Nma6lRvx67TbCn/EcdvLZyiHNXMG2q
 gviBcoMgx4k0/Q/ebnJEX6GNg2KDNEtHZIOaJLnKRInQqojiB04WfKa336PF4YSzvh
 iOvgU7eKDSe46paaHCKOrKIbEt64zRx1OcICIX5KphPanvWyo2osVFwFumx4WLWXao
 F5OqurMJHr4KRQrXBO8bzbv1J7OwuVl4WAwopEePtJltnFsXjnrsseHcR56+mMEbtq
 LjsRKI4bkkz7Q==
Date: Thu, 20 Feb 2020 13:41:06 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Fabiano Rosas <farosas@linux.ibm.com>
Subject: Re: [PATCH v3 04/12] target/ppc: Introduce ppc_hash64_use_vrma()
 helper
Message-ID: <20200220024106.GA24750@oak.ozlabs.ibm.com>
References: <20200219005414.15635-1-david@gibson.dropbear.id.au>
 <20200219005414.15635-5-david@gibson.dropbear.id.au>
 <87blpud63n.fsf@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87blpud63n.fsf@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 203.11.71.1
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, philmd@redhat.com,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 19, 2020 at 11:06:20AM -0300, Fabiano Rosas wrote:
> David Gibson <david@gibson.dropbear.id.au> writes:
> 
> > When running guests under a hypervisor, the hypervisor obviously needs to
> > be protected from guest accesses even if those are in what the guest
> > considers real mode (translation off).  The POWER hardware provides two
> > ways of doing that: The old way has guest real mode accesses simply offset
> > and bounds checked into host addresses.  It works, but requires that a
> > significant chunk of the guest's memory - the RMA - be physically
> > contiguous in the host, which is pretty inconvenient.  The new way, known
> > as VRMA, has guest real mode accesses translated in roughly the normal way
> > but with some special parameters.
> >
> > In POWER7 and POWER8 the LPCR[VPM0] bit selected between the two modes, but
> > in POWER9 only VRMA mode is supported
> 
> ... when translation is off, right? Because I see in the 3.0 ISA that
> LPCR[VPM1] is still there.

VRMA stands for virtual real mode area, and the "real mode" part
implies that translation is off.  VRMA is not used when translation is
on because then the CPU is not in real mode.

LPCR[VPM1] is indeed still there, but it is a bit different to VPM0
(or what VPM0 used to do); VPM1 doesn't change how translation is
done, just what happens on a fault.

Paul.

