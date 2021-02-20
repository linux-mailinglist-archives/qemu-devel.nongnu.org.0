Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEE3320361
	for <lists+qemu-devel@lfdr.de>; Sat, 20 Feb 2021 04:04:04 +0100 (CET)
Received: from localhost ([::1]:43174 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lDIYo-0008Vq-6L
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 22:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37994)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lDIXa-00086U-Ba
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 22:02:42 -0500
Received: from relay64.bu.edu ([128.197.228.104]:49511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1lDIXX-0006Ke-Eu
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 22:02:40 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 11K31sON000963
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 19 Feb 2021 22:01:58 -0500
Date: Fri, 19 Feb 2021 22:01:54 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [RFC PATCH 3/5] tests: add a sdhci reproducer
Message-ID: <20210220030154.26ymtyiontmcmu6g@mozz.bu.edu>
References: <20210218211224.2513413-1-alxndr@bu.edu>
 <20210218211224.2513413-4-alxndr@bu.edu>
 <79517851-a131-14bc-3947-629fa3e098fa@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <79517851-a131-14bc-3947-629fa3e098fa@amsat.org>
Received-SPF: pass client-ip=128.197.228.104; envelope-from=alxndr@bu.edu;
 helo=relay64.bu.edu
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, HK_RANDOM_ENVFROM=0.001,
 HK_RANDOM_FROM=0.999, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210219 2306, Philippe Mathieu-Daudé wrote:
> On 2/18/21 10:12 PM, Alexander Bulekov wrote:
> > This patch serves as an example of a file generated with the
> > ./scripts/oss-fuzz/output_reproducer.py script:
> > The source file in this patch was generated like this:
> > 
> > $ wget https://paste.debian.net/plain/118513 -O /tmp/trace
> > $ export QEMU_ARGS="-nographic -machine accel=qtest -m 512M \
> > -nodefaults -device sdhci-pci,sd-spec-version=3 -drive \
> > if=sd,index=0,file=null-co://,format=raw,id=mydrive \
> > -device sd-card,drive=mydrive -qtest stdio"
> > $ export QEMU_PATH=./qemu-system-i386
> > $ ./scripts/oss-fuzz/output_reproducer.py \
> > -owner "Alexander Bulekov <alxndr@bu.edu>" /tmp/trace | \
> > clang-format -style="{BasedOnStyle: llvm, IndentWidth: 4, \
> > ColumnLimit: 90, BreakBeforeBraces: Linux}" > ../tests/qtest/fuzz-sdhci.c
> > 
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >  tests/qtest/fuzz-sdhci.c | 90 ++++++++++++++++++++++++++++++++++++++++
> >  tests/qtest/meson.build  |  2 +
> >  2 files changed, 92 insertions(+)
> >  create mode 100644 tests/qtest/fuzz-sdhci.c
> ...
> 
> > diff --git a/tests/qtest/meson.build b/tests/qtest/meson.build
> > index c83bc211b6..97caf84443 100644
> > --- a/tests/qtest/meson.build
> > +++ b/tests/qtest/meson.build
> > @@ -56,6 +56,8 @@ qtests_i386 = \
> >     'rtc-test',
> >     'i440fx-test',
> >     'fuzz-test',
> > +   'fuzz-sdhci',
> > +   'sdhci-test',
> 
> This line ^ belongs to the next patch.

I think the line doesn't belong at all. The next patch justs adds to
fuzz-sdhci.c

> 
> >     'fw_cfg-test',
> >     'device-plug-test',
> >     'drive_del-test',
> > 

