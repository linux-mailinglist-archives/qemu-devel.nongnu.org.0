Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25A3C2F7F62
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:21:57 +0100 (CET)
Received: from localhost ([::1]:33406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0QvE-000785-7B
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:21:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l0Qte-0005wH-BI
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:20:18 -0500
Received: from relay64.bu.edu ([128.197.228.104]:49727)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l0Qtc-0004If-8V
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:20:17 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay64.bu.edu (8.14.3/8.14.3) with ESMTP id 10FFIakD001245
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Fri, 15 Jan 2021 10:18:39 -0500
Date: Fri, 15 Jan 2021 10:18:36 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Darren Kenny <darren.kenny@oracle.com>
Subject: Re: [PATCH] fuzz: Add virtio-9p configurations for fuzzing
Message-ID: <20210115151836.5qs2ck6kzkgzuyzl@mozz.bu.edu>
References: <20210114221748.503565-1-alxndr@bu.edu> <m2sg72fq09.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m2sg72fq09.fsf@oracle.com>
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
 Greg Kurz <groug@kaod.org>, Bandan Das <bsd@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 210115 1033, Darren Kenny wrote:
> Hi Alex,
> 
> On Thursday, 2021-01-14 at 17:17:48 -05, Alexander Bulekov wrote:
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> 
> In general this look good, so:
> 
> Reviewed-by: Darren Kenny <darren.kenny@oracle.com>
> 
> but I do have a question below...
> 
> > ---
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
> > +        .objects = "virtio*",
> 
> I wonder about the use of "/tmp" rather than maybe some generated name
> using mkdtemp() - I also realise that the ability to generate this and
> plug it in here probably doesn't exist either, hence not holding you to
> it for this patch. Also the fact that in OSS-Fuzz this is run in limited
> containers.
> 
> Have you observed any changes to "/tmp" while this is running? My
> concerns may be unfounded since I don't really know what state things
> are in while this is executed with no running OS.
> 

So far, I haven't seen any files created, however this might be due to
the fact that I used security_model=none. In any case, I agree that this
is not a nice solution. I'll think of a way to use mkdtemp() for v2.
-Alex

> Thanks,
> 
> Darren.
> 

