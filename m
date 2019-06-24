Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDB051814
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 18:10:01 +0200 (CEST)
Received: from localhost ([::1]:52816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfRXd-00027j-2h
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 12:10:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53440)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <Dave.Martin@arm.com>) id 1hfRR7-0006Rg-3U
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 12:03:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Dave.Martin@arm.com>) id 1hfRR6-0007dd-1Y
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 12:03:16 -0400
Received: from foss.arm.com ([217.140.110.172]:52750)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <Dave.Martin@arm.com>)
 id 1hfRR3-0007ad-Hw; Mon, 24 Jun 2019 12:03:13 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0DE2B2B;
 Mon, 24 Jun 2019 09:03:12 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C67833F71E;
 Mon, 24 Jun 2019 09:03:10 -0700 (PDT)
Date: Mon, 24 Jun 2019 17:03:08 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20190624160308.GT2790@e103592.cambridge.arm.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-6-drjones@redhat.com>
 <20190624110507.GG2790@e103592.cambridge.arm.com>
 <20190624113037.m5onedluc4x7c5ej@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624113037.m5onedluc4x7c5ej@kamzik.brq.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.110.172
Subject: Re: [Qemu-devel] [PATCH v2 05/14] target/arm/helper: zcr: Add build
 bug next to value range assumption
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "imammedo@redhat.com" <imammedo@redhat.com>,
 "alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jun 24, 2019 at 12:30:37PM +0100, Andrew Jones wrote:
> On Mon, Jun 24, 2019 at 12:05:07PM +0100, Dave Martin wrote:
> > On Fri, Jun 21, 2019 at 05:34:13PM +0100, Andrew Jones wrote:
> > 
> > The purpose of this check should probably at least be described in a
> > comment -- i.e., what actually depends on this?
> 
> I was thinking the already present "Bits other than [3:0] are RAZ/WI."
> explained that, but how about this for an improvement?
> 
> /*
>  * Only the lowest 4 bits of ZCR_ELx may be used to constrain the vector
>  * length, the rest of the bits are RAZ/WI. Since the vector length of
>  * 128-bits (1 in quadwords) is represented as zero in ZCR_ELx, and all
>  * vector lengths are represented as their length in quadwords minus 1,
>  * then four bits allow up to quadword 16 to be selected.
>  */

No, maybe the existing comment is enough.

I thought there might be more code elsewhere that assumes that checks
sve_max_vq <= ARM_MAX_VQ then then assumes that sve_max_vq <= 16.  But
if not, we probably don't need an additional comment here.

I haven't tried to understand all the code in the series beyond the
user/kernel interactions, so maybe I was just paranoid.

[...]

Cheers
---Dave

