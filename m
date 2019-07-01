Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 937AE11C7C
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 17:19:58 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52989 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hMDV7-00035U-Pu
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 11:19:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:52220)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hMDCr-00044Y-CF
	for qemu-devel@nongnu.org; Thu, 02 May 2019 11:01:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hMDCq-0006Vi-Bp
	for qemu-devel@nongnu.org; Thu, 02 May 2019 11:01:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52638)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>)
	id 1hMDCi-0006QR-Np; Thu, 02 May 2019 11:00:56 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D4868307D978;
	Thu,  2 May 2019 15:00:49 +0000 (UTC)
Received: from Igors-MacBook-Pro (unknown [10.40.205.168])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5A3FD608A6;
	Thu,  2 May 2019 15:00:48 +0000 (UTC)
Date: Thu, 2 May 2019 17:00:42 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20190502170042.4b714211@Igors-MacBook-Pro>
In-Reply-To: <CAFEAcA-SFrcbQMdv19tJw_baGR8c_ngR2CtsgZKVXMALOo=zoA@mail.gmail.com>
References: <1556614240-36369-1-git-send-email-like.xu@linux.intel.com>
	<CAFEAcA-SFrcbQMdv19tJw_baGR8c_ngR2CtsgZKVXMALOo=zoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Thu, 02 May 2019 15:00:55 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/arm/fsl-imx: move cpus initialization
 to realize time after smp_cpus check
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>, Like Xu <like.xu@linux.intel.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 30 Apr 2019 10:18:37 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Tue, 30 Apr 2019 at 09:52, Like Xu <like.xu@linux.intel.com> wrote:
> >
> > If "smp_cpus> FSL_IMX6_NUM_CPUS" fails in *_realize(), there is no need to
> > initialize the CPUs in *_init(). So it could be better to create all cpus
> > after the validity in *_realize(). On the other hand, it makes the usages
> > of global variable smp_cpus more centrally for maintenance.
> 
> I'm not a great fan of this. I think that where possible
> we should init child objects in the parent's init
> function, and realize them in the realize function.
> There are a few cases where we're forced to do the
> child init in realize, but this doesn't seem like one of them.

well, if it were unconditional then initializing children in initfn would
be fine, however here number of children to initialize depends on global
smp_cpus. In order to get rid of global, we could move iniialization to realize
time or init all FSL_IMX6_NUM_CPUS and realize only smp_cpus at realize time.

> 
> thanks
> -- PMM


