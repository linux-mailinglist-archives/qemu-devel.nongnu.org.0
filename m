Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B169B2FD238
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 15:18:58 +0100 (CET)
Received: from localhost ([::1]:43342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2EK1-0006L0-PN
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 09:18:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2EIH-0005c8-S9
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:17:10 -0500
Received: from relay64.bu.edu ([128.197.228.104]:58475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l2EIF-0003K0-L2
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 09:17:08 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 10KEGL56016756
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 20 Jan 2021 09:16:24 -0500
Date: Wed, 20 Jan 2021 09:16:21 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH] fuzz: refine the ide/ahci fuzzer configs
Message-ID: <20210120141621.35lt7vrz7g2ut5vm@mozz.bu.edu>
References: <20210120060745.558970-1-alxndr@bu.edu>
 <46576a57-f8c1-5300-2b2c-064b4d7642ba@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <46576a57-f8c1-5300-2b2c-064b4d7642ba@redhat.com>
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Bandan Das <bsd@redhat.com>, qemu-devel@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210120 1053, Thomas Huth wrote:
> On 20/01/2021 07.07, Alexander Bulekov wrote:
> > Disks work differently depending on the x86 machine type (SATA vs PATA).
> > Additionally, we should fuzz the atapi code paths, which might contain
> > vulnerabilities such as CVE-2020-29443. This patch adds hard-disk and
> > cdrom generic-fuzzer configs for both the pc (PATA) and q35 (SATA)
> > machine types.
> > 
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> >   tests/qtest/fuzz/generic_fuzz_configs.h | 20 +++++++++++++++++++-
> >   1 file changed, 19 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> > index 7fed035345..2ec52fbb63 100644
> > --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> > +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> > @@ -85,10 +85,28 @@ const generic_fuzz_config predefined_configs[] = {
> >           .objects = "intel-hda",
> >       },{
> >           .name = "ide-hd",
> > +        .args = "-machine pc -nodefaults "
> > +        "-drive file=null-co://,if=none,format=raw,id=disk0 "
> > +        "-device ide-hd,drive=disk0",
> > +        .objects = "*ide*",
> > +    },{
> > +        .name = "ide-atapi",
> > +        .args = "-machine pc -nodefaults "
> > +        "-drive file=null-co://,if=none,format=raw,id=disk0 "
> > +        "-device ide-cd,drive=disk0",
> > +        .objects = "*ide*",
> > +    },{
> > +        .name = "ahci-hd",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-drive file=null-co://,if=none,format=raw,id=disk0 "
> > +        "-device ide-hd,drive=disk0",
> > +        .objects = "*ahci*",
> > +    },{
> > +        .name = "ahci-atapi",
> >           .args = "-machine q35 -nodefaults "
> >           "-drive file=null-co://,if=none,format=raw,id=disk0 "
> >           "-device ide-hd,drive=disk0",
> 
> Shouldn't that be ide-cd now for ahci-atapi?

Thanks for catching that.
-Alex

> 
>  Thomas
> 

