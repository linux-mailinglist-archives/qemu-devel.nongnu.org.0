Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCCC18DAA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 18:08:11 +0200 (CEST)
Received: from localhost ([127.0.0.1]:57292 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOlac-0005IN-Dj
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 12:08:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59089)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hOlYi-0004Qj-FS
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:06:14 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <imammedo@redhat.com>) id 1hOlYh-0001c4-Aj
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:06:12 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46066)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hOlYh-0001bp-4U
	for qemu-devel@nongnu.org; Thu, 09 May 2019 12:06:11 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BDA7381259;
	Thu,  9 May 2019 16:06:09 +0000 (UTC)
Received: from Igors-MacBook-Pro (ovpn-204-72.brq.redhat.com [10.40.204.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7396C60CC0;
	Thu,  9 May 2019 16:06:08 +0000 (UTC)
Date: Thu, 9 May 2019 18:06:03 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20190509180603.424c8277@Igors-MacBook-Pro>
In-Reply-To: <20190509135617.GH4189@habkost.net>
References: <20190422234742.15780-1-ehabkost@redhat.com>
	<20190509133537.GK7181@orkuz.int.mamuti.net>
	<20190509135617.GH4189@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Thu, 09 May 2019 16:06:09 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/2] i386: "unavailable-features" QOM
 property
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jiri Denemark <jdenemar@redhat.com>,
	qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 May 2019 10:56:17 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, May 09, 2019 at 03:35:37PM +0200, Jiri Denemark wrote:
> > On Mon, Apr 22, 2019 at 20:47:40 -0300, Eduardo Habkost wrote:
> > > Currently, libvirt uses the "filtered-features" QOM property at
> > > runtime to ensure no feature was accidentally disabled on VCPUs
> > > because it's not available on the host.
> > > 
> > > However, the code for "feature-words" assumes that all missing
> > > features have a corresponding CPUID bit, which is not true for
> > > MSR-based features like the ones at FEAT_ARCH_CAPABILITIES.
> > > 
> > > We could extend X86CPUFeatureWordInfo to include information
> > > about MSR features, but it's impossible to do that while keeping
> > > compatibility with clients that (reasonably) expect all elements
> > > of "filtered-features" to have the cpuid-* fields.
> > > 
> > > We have a field in "query-cpu-definitions" that already describes
> > > all features that are missing on a CPU, including MSR features:
> > > CpuDefinitionInfo.unavailable-features.  The existing code for
> > > building the unavailable-features array even uses
> > > X86CPU::filtered_features to build the feature list.
> > > 
> > > This series adds a "unavailable-features" QOM property to X86CPU
> > > objects that have the same semantics of "unavailable-features" on
> > > query-cpu-definitions.  The new property has the same goal of
> > > "filtered-features", but is generic enough to let any kind of CPU
> > > feature to be listed there without relying on low level details
> > > like CPUID leaves or MSR numbers.
> > 
> > Thanks.
> > 
> > Would this unavailable-features property contain only canonical names of
> > the features or all possible aliases of all features? For example,
> > "tsc-adjust" can also be spelled as "tsc_adjust". When calling
> > query-cpu-model-expansion, we have a way to request all variants by
> > running full expansion on the result of a previous static expansion. Can
> > we get something like this for unavailable-features too?
> 
> I'd like to avoid that, and refer only to the canonical names.

Can we deprecate aliases to avoid confusion in future?
(there aren't that many of them that used pre-QOM name format)


