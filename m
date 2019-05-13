Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0A51B4ED
	for <lists+qemu-devel@lfdr.de>; Mon, 13 May 2019 13:31:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55412 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQ9An-0003BK-8e
	for lists+qemu-devel@lfdr.de; Mon, 13 May 2019 07:31:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34434)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>) id 1hQ98T-0001zM-6U
	for qemu-devel@nongnu.org; Mon, 13 May 2019 07:28:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>) id 1hQ8w8-0004bP-Bx
	for qemu-devel@nongnu.org; Mon, 13 May 2019 07:16:05 -0400
Received: from foss.arm.com ([217.140.101.70]:49308)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <Dave.Martin@arm.com>)
	id 1hQ8w6-0004a0-Rq; Mon, 13 May 2019 07:16:03 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BAA5374;
	Mon, 13 May 2019 04:16:00 -0700 (PDT)
Received: from e103592.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
	[10.72.51.249])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A0B6D3F703;
	Mon, 13 May 2019 04:15:58 -0700 (PDT)
Date: Mon, 13 May 2019 12:15:56 +0100
From: Dave Martin <Dave.Martin@arm.com>
To: Andrea Bolognani <abologna@redhat.com>
Message-ID: <20190513111555.GC28398@e103592.cambridge.arm.com>
References: <20190512083624.8916-1-drjones@redhat.com>
	<9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.140.101.70
Subject: Re: [Qemu-devel] [PATCH 00/13] target/arm/kvm: enable SVE in guests
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
	Andrew Jones <drjones@redhat.com>,
	"richard.henderson@linaro.org" <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	"armbru@redhat.com" <armbru@redhat.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
	"alex.bennee@linaro.org" <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 13, 2019 at 10:32:46AM +0100, Andrea Bolognani wrote:
> On Sun, 2019-05-12 at 10:36 +0200, Andrew Jones wrote:
> [...]
> >    CPU type | accel | sve-max-vq | sve-vls-map
> >    -------------------------------------------
> >  1)     max | tcg   |  $MAX_VQ   |  $VLS_MAP
> >  2)     max | kvm   |  $MAX_VQ   |  $VLS_MAP
> >  3)    host | kvm   |  N/A       |  $VLS_MAP
> > 
> > Where for (1) $MAX_VQ sets the maximum vq and smaller vqs are
> > all supported when $VLS_MAP is zero, or when the vqs are selected
> > in $VLS_MAP.
> 
> I'm a bit confused by the nomenclature here. VL clearly stands for
> Vector Length, but what does VQ stand for? You seem to be using the
> two terms pretty much interchangeably throughout the cover letter.

From the Linux end, "vector length" or VL refers to the size of a vector
register, either in no particular unit or in bytes.

"VQ" refers specifically to the vector length in 128-bit quadwords.

In some situations, neither terminology is obviously better than the
other, such as in the way KVM_REG_ARM64_SVE_VLS is encoded.

> [...]
> > There is never any need to provide both properties, but if both
> > are provided then they are checked for consistency.
> 
> I would personally just error out when both are provided.
> 
> > The QMP query returns a list of valid vq lists. For example, if
> > a guest can use vqs 1, 2, 3, and 4, then the following list will
> > be returned
> > 
> >  [ [ 1 ], [ 1, 2 ], [ 1, 2, 3 ], [ 1, 2, 3, 4 ] ]
> > 
> > Another example might be 1, 2, 4, as the architecture states 3
> > is optional. In that case the list would be
> > 
> >  [ [ 1 ], [ 1, 2 ], [ 1, 2, 4 ] ]
> 
> I think the proposed QMP command is problematic, because it reports
> the valid vector lengths for either KVM or TCG based on which
> accelerator is currently enabled: it should report all information
> at all times instead, similarly to how query-gic-capabilities does
> it.

I wonder if this is premature flexibility?

The size of these lists is going to get cumbersome if the architecture
is ever extended.  Even today, we might need over 100 items in this
(nested) list.  If this is to be presented to the user this will be
far from friendly, it could get much worse if the architecutre changes
in future to allow larger vectors or more flexible virtualisation.

Could we just have a list of supported vector lengths and a possibly
empty list of additional capabilities that describe what kinds of
flexibility are allowed?

So, for example, we might support vector lengths of 1, 2, 4 and 8
quadwords, with the the ability to clamp the max vector length the
guest sees: the kernel ABI guarantees that you can do this, even
if you can't disable/enable each individual vector length independently.

So, [ 1, 2, 4, 8 ] seems sufficient to describe this in a forwards
compatible way.

Some day, we might report { "independent", [ 1, 2, 4, 8, 16, 32, ... ] }

I'm guessing about the data representation here.

[...]

Cheers
---Dave

