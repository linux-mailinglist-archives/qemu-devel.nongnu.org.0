Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 723B75187A
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 18:23:55 +0200 (CEST)
Received: from localhost ([::1]:52970 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfRl4-0003YC-Mj
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 12:23:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55160)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <Dave.Martin@arm.com>) id 1hfRWs-00023z-Fs
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 12:09:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <Dave.Martin@arm.com>) id 1hfRWr-0004JQ-E8
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 12:09:14 -0400
Received: from foss.arm.com ([217.140.110.172]:52816)
 by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <Dave.Martin@arm.com>)
 id 1hfRWl-00047P-J8; Mon, 24 Jun 2019 12:09:09 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 723DF2B;
 Mon, 24 Jun 2019 09:09:03 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 19E0E3F71E;
 Mon, 24 Jun 2019 09:09:01 -0700 (PDT)
Date: Mon, 24 Jun 2019 17:09:00 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrew Jones <drjones@redhat.com>
Message-ID: <20190624160859.GV2790@e103592.cambridge.arm.com>
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-11-drjones@redhat.com>
 <20190624110535.GI2790@e103592.cambridge.arm.com>
 <20190624115553.ef22fdempvxkzzog@kamzik.brq.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190624115553.ef22fdempvxkzzog@kamzik.brq.redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.110.172
Subject: Re: [Qemu-devel] [PATCH v2 10/14] target/arm/kvm64: Add
 kvm_arch_get/put_sve
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

On Mon, Jun 24, 2019 at 12:55:53PM +0100, Andrew Jones wrote:
> On Mon, Jun 24, 2019 at 12:05:35PM +0100, Dave Martin wrote:
> > On Fri, Jun 21, 2019 at 05:34:18PM +0100, Andrew Jones wrote:
> > > These are the SVE equivalents to kvm_arch_get/put_fpsimd. Note, the
> > > swabbing is different than it is for fpsmid because the vector format
> > > is a little-endian stream of words.
> > 
> > Note, on big-endian hosts the FPSIMD view Vn and the SVE view Zn[127:0]
> > of the FPSIMD/SVE common register bits has the opposite endianness for
> > SVE_{GET,SET}_ONE_REG.
> > 
> > This only matters if mixing the two views: just from this patch I don't
> > know whether this is an issue for QEMU or not.
> 
> I don't know either. My experience with the emulation side of QEMU is
> mostly the zcr_write tweak in this series. And, TBH, I didn't put too
> much thought into the endianness stuff, nor test this series with big
> endian.

Neither did I (at least beyond the "does it boot" level) -- hence the
bug ;)

And of course, few people are using big-endian, so nobody complained.

Just flagging it up so it doesn't get missed!

> Hopefully Richard can chime in on this.

It would be interesting to know whether you do hit this issue
somewhere, or whether you have a strong view about the clarification to
the KVM ABI.

Cheers
---Dave

