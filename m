Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44D1B63848
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jul 2019 16:57:51 +0200 (CEST)
Received: from localhost ([::1]:50718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hkrYz-0004Ai-TH
	for lists+qemu-devel@lfdr.de; Tue, 09 Jul 2019 10:57:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36777)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <imammedo@redhat.com>) id 1hkrU4-0002Gr-Pe
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:52:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1hkrU2-00087q-Rj
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:52:43 -0400
Received: from mx1.redhat.com ([209.132.183.28]:1561)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1hkrU2-0007P2-L6
 for qemu-devel@nongnu.org; Tue, 09 Jul 2019 10:52:42 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9765281E0B
 for <qemu-devel@nongnu.org>; Tue,  9 Jul 2019 14:51:27 +0000 (UTC)
Received: from localhost (unknown [10.43.2.182])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D7E1E95A59;
 Tue,  9 Jul 2019 14:51:26 +0000 (UTC)
Date: Tue, 9 Jul 2019 16:51:21 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eduardo Habkost <ehabkost@redhat.com>
Message-ID: <20190709165122.26ee5961@redhat.com>
In-Reply-To: <20190708222501.GY5198@habkost.net>
References: <20190702215726.23661-1-ehabkost@redhat.com>
 <20190703154723.7327-1-imammedo@redhat.com>
 <20190703193702.GA5198@habkost.net>
 <20190704093322.04d78d48@redhat.com>
 <20190708222501.GY5198@habkost.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Tue, 09 Jul 2019 14:51:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] tests: numa-test: use -numa memdev
 option instead of legacy 'mem' option
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

On Mon, 8 Jul 2019 19:25:01 -0300
Eduardo Habkost <ehabkost@redhat.com> wrote:

> On Thu, Jul 04, 2019 at 09:33:22AM +0200, Igor Mammedov wrote:
> > On Wed, 3 Jul 2019 16:37:02 -0300
> > Eduardo Habkost <ehabkost@redhat.com> wrote:  
> > > [...]  
> > > > +    TestData data = { .ram_size = 128 };
> > > >  
> > > > -    if (strcmp(arch, "aarch64") == 0) {
> > > > -        args = "-machine virt";
> > > > +    if (!strcmp(arch, "aarch64")) {
> > > > +        data.args = "-machine virt";
> > > > +    } else if (!strcmp(arch, "ppc64")) {
> > > > +        data.ram_size = 512;    
> > > 
> > > Wouldn't it be simpler to always use "-m 512M" and the same node
> > > sizes?  
> > it would, but it might make some CI instances start failing more
> > often where it used to work before. So I picked side of being
> > conservative and not to hog memory unless it's necessary.  
> 
> I don't understand.  Why would "-m 512M" make some CI instances
> start failing more often?

well, test would consume 4 times more RAM and if running in parallel
with other tests it might hit RAM limits set on test instance
(it seems travis-ci should be fine with 7G VMs (assuming it runs on them)
but who knows where else tests are running).

Anyways if you feel it should be 512, I can respin with it default
set to 512M (it will save a couple of lines, so honestly I don't see
a good reason to consume more where it's not necessary)

As for "the same node sizes?" it depends on testcases, for some it might be
fine but not for all (current numa-test cases are mostly focused on CPU
related parts but in bios-tables tests there is memory-less node testcase,
which hints that numa-test is rather incomplete).

