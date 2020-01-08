Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FB59133911
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Jan 2020 03:19:02 +0100 (CET)
Received: from localhost ([::1]:32798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ip0w1-0008AH-F6
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 21:19:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52515)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paulus@ozlabs.org>) id 1ip0ux-00075o-TD
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 21:17:57 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paulus@ozlabs.org>) id 1ip0uw-0000AZ-Rz
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 21:17:55 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:45387 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <paulus@ozlabs.org>)
 id 1ip0uw-0008ST-5V; Tue, 07 Jan 2020 21:17:54 -0500
Received: by ozlabs.org (Postfix, from userid 1003)
 id 47stF53P4rz9sPn; Wed,  8 Jan 2020 13:17:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ozlabs.org; s=201707;
 t=1578449865; bh=0JRv+g9dydwa4ewH2+jP25s6rxhmacbE6e5QpltlZf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uwsoQ9OdD6eiq7m7iGypZ4QHhcOpo/zWowFrnNcBU8Wfl9u2zQqFkeoc8u/7zKfJd
 B5j0lbaNGSeGgbf2aBabkCRGwf50ABIduIGmrMOZO9LJ5x2CquiBHOMEbj+RkH6hEx
 Zc+SokDB5TOxa7HUE4SuNEL0AerTSwVLB9sESHbASSE4EmFgB6ZMJa02gsywbXxuR+
 2ocu+bjyiLS5ugt0ibtVKYkZDhftPMs3NFnHsn1hUI50SPAoKio+AZ4mKXJxGpEQ1J
 TXtB+tnF47vgY8AwsbB+5GUvjKorRWdb2jaVUffTm4LtLopXtLpe3AqkhRMfrYorSH
 lXAtMGuDCh/Mg==
Date: Wed, 8 Jan 2020 13:17:37 +1100
From: Paul Mackerras <paulus@ozlabs.org>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH v2 02/10] ppc: Remove stub of PPC970 HID4 implementation
Message-ID: <20200108021737.GA16515@oak.ozlabs.ibm.com>
References: <20200107044827.471355-1-david@gibson.dropbear.id.au>
 <20200107044827.471355-3-david@gibson.dropbear.id.au>
 <20200107183215.09ce18c6@bahia.lan>
 <20200107183638.1c84f172@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200107183638.1c84f172@bahia.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2401:3900:2:1::2
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
Cc: lvivier@redhat.com, qemu-devel@nongnu.org, qemu-ppc@nongnu.org,
 clg@kaod.org, philmd@redhat.com, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 07, 2020 at 06:36:38PM +0100, Greg Kurz wrote:
> On Tue, 7 Jan 2020 18:32:15 +0100
> Greg Kurz <groug@kaod.org> wrote:
> 
> > On Tue,  7 Jan 2020 15:48:19 +1100
> > David Gibson <david@gibson.dropbear.id.au> wrote:
> > 
> > > The PowerPC 970 CPU was a cut-down POWER4, which had hypervisor capability.
> > > However, it can be (and often was) strapped into "Apple mode", where the
> > > hypervisor capabilities were disabled (essentially putting it always in
> > > hypervisor mode).
> 
> Isn't it supervisor mode instead of hypervisor mode ?

No, it's hypervisor mode.  MSR[HV] always reads as 1.

Paul.

