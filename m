Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBC72F7FDF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:42:56 +0100 (CET)
Received: from localhost ([::1]:57620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0RFX-0003zU-4h
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:42:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l0R7B-0000a0-2T
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:34:17 -0500
Received: from relay64.bu.edu ([128.197.228.104]:50760)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l0R78-0002O0-W3
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:34:16 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 10FFWZYl010619
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 15 Jan 2021 10:32:38 -0500
Date: Fri, 15 Jan 2021 10:32:35 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] fuzz: Add virtio-9p configurations for fuzzing
Message-ID: <20210115153235.pc4nijjc2eyndfaa@mozz.bu.edu>
References: <20210114221748.503565-1-alxndr@bu.edu>
 <20210115132308.371a0675@bahia.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210115132308.371a0675@bahia.lan>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.998, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 Bandan Das <bsd@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210115 1323, Greg Kurz wrote:
> On Thu, 14 Jan 2021 17:17:48 -0500
> Alexander Bulekov <alxndr@bu.edu> wrote:
> 
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> 
> No changelog at all ? 
> 
> >  tests/qtest/fuzz/generic_fuzz_configs.h | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> > index 7fed035345..ffdb590c58 100644
> > --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> > +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> > @@ -59,6 +59,18 @@ const generic_fuzz_config predefined_configs[] = {
> >          .name = "virtio-mouse",
> >          .args = "-machine q35 -nodefaults -device virtio-mouse",
> >          .objects = "virtio*",
> > +    },{
> > +        .name = "virtio-9p",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
> > +        "-fsdev local,id=hshare,path=/tmp/,security_model=none",
> 
> Sharing a general purpose directory like "/tmp" is definitely not a
> recommended practice. This is typically the kind of thing that I'd
> like to see documented in the changelog to help me understand ;-)

Hi Greg,
Yes it is not a great solution. The fuzzers in this file are mainly
configured to run on OSS-Fuzz (https://github.com/google/oss-fuzz),
where fuzzers are executed in individual containers, and there shouldn't
be anything sensitive in /tmp/. In v2, I'll use a safer solution.

> 
> What operations does the fuzz test perform on the device ?

The generic-fuzzer will interact with the Port IO/MMIO and PCI Config
Space regions associated with the virtio-9p device. When the
device tries to access some guest memory using DMA, the fuzzer will
place some fuzzed data at the corresponding location. For many devices,
this is sufficient to achieve high coverage. If this doesn't work well
for the virtio-9p, we can add a tailored fuzzer based on the libqos
interface, in the future.

> 
> > +        .objects = "virtio*",
> > +    },{
> > +        .name = "virtio-9p-synth",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
> > +        "-fsdev synth,id=hshare",
> > +        .objects = "virtio*",
> 
> Not sure this is super useful since the only known use case for
> the synth fsdev driver is running the virtio-9p qtest, but
> it looks fine anyway.

My hope here was is that this configureation will cut down on syscalls
(improve fuzzing speed) and avoid leaky state (files left in the /tmp/
directory between individual fuzzer inputs).
-Alex

> 
> >      },{
> >          .name = "e1000",
> >          .args = "-M q35 -nodefaults "
> 

