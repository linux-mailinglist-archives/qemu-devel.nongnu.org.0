Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 314052FA515
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jan 2021 16:47:58 +0100 (CET)
Received: from localhost ([::1]:60400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1Wl3-0001YS-A0
	for lists+qemu-devel@lfdr.de; Mon, 18 Jan 2021 10:47:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1Wif-0000eF-QI
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:45:31 -0500
Received: from relay68.bu.edu ([128.197.228.73]:50048)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1l1WiZ-00072F-E9
 for qemu-devel@nongnu.org; Mon, 18 Jan 2021 10:45:26 -0500
X-Envelope-From: alxndr@bu.edu
X-BU-AUTH: mozz.bu.edu [128.197.127.33]
Received: from BU-AUTH (localhost.localdomain [127.0.0.1]) (authenticated
 bits=0)
 by relay68.bu.edu (8.14.3/8.14.3) with ESMTP id 10IFiblO019120
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Mon, 18 Jan 2021 10:44:40 -0500
Date: Mon, 18 Jan 2021 10:44:37 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Darren Kenny <darren.kenny@oracle.com>
Subject: Re: [PATCH v2 3/3] fuzz: add virtio-9p configurations for fuzzing
Message-ID: <20210118154437.rk6fwk3s7iusykrk@mozz.bu.edu>
References: <20210117230924.449676-1-alxndr@bu.edu>
 <20210117230924.449676-4-alxndr@bu.edu> <m25z3ufe9p.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <m25z3ufe9p.fsf@oracle.com>
Received-SPF: pass client-ip=128.197.228.73; envelope-from=alxndr@bu.edu;
 helo=relay68.bu.edu
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

On 210118 1536, Darren Kenny wrote:
> On Sunday, 2021-01-17 at 18:09:24 -05, Alexander Bulekov wrote:
> > virtio-9p devices are often used to expose a virtual-filesystem to the
> > guest. There have been some bugs reported in this device, such as
> > CVE-2018-19364, and CVE-2021-20181. We should fuzz this device
> >
> > This patch adds two virtio-9p configurations:
> >  * One with the widely used -fsdev local driver. This driver leaks some
> >    state in the form of files/directories created in the shared dir.
> >  * One with the synth driver. While it is not used in the real world, this
> >    driver won't leak leak state between fuzz inputs.
> >
> > Signed-off-by: Alexander Bulekov <alxndr@bu.edu>
> > ---
> > CC: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > CC: Greg Kurz <groug@kaod.org>
> >
> > I considered adding an atexit handler to remove the temp directory,
> > however I am worried that there might be some error that results in a
> > call to exit(), rather than abort(), which will cause problems for
> > future fork()-ed fuzzers. I don't think there are such calls in the 9p
> > code, however there might be something in the APIs used by 9p. As this
> > code is primarily for ephemeral OSS-Fuzz conainers, this shouldn't be
> > too much of an issue.
> 
> As I understand it, this creation of a new directory should happen a lot
> less than the amount of actual executions of the target, since it is
> only run on the first 'parent' target process executed, prior to the
> process cloning operations that the fork execution performs - or any
> time that 'parent' target process is renewed, after several thousand
> cloned processes.
> 
> Is that correct? Or am I misunderstanding when the
> generic_fuzzer_virtio_9p_args() function is run?

Correct. It happens once: before we initialize QEMU in the parent
fuzzing process. There are two questions:
1. What is the best way to remove the directory after the parent process
   exits(and not after child processes exit())?
2. Should we do any cleanup on the temp directory between input
   executions.
-Alex

> 
> Thanks,
> 
> Darren.
> 
> >  tests/qtest/fuzz/generic_fuzz_configs.h | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/tests/qtest/fuzz/generic_fuzz_configs.h b/tests/qtest/fuzz/generic_fuzz_configs.h
> > index 1a133655ee..f99657cdbc 100644
> > --- a/tests/qtest/fuzz/generic_fuzz_configs.h
> > +++ b/tests/qtest/fuzz/generic_fuzz_configs.h
> > @@ -19,6 +19,16 @@ typedef struct generic_fuzz_config {
> >      gchar* (*argfunc)(void); /* Result must be freeable by g_free() */
> >  } generic_fuzz_config;
> >  
> > +static inline gchar *generic_fuzzer_virtio_9p_args(void){
> > +    char tmpdir[] = "/tmp/qemu-fuzz.XXXXXX";
> > +    g_assert_nonnull(mkdtemp(tmpdir));
> > +
> > +    return g_strdup_printf("-machine q35 -nodefaults "
> > +    "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
> > +    "-fsdev local,id=hshare,path=%s,security_model=mapped-xattr,"
> > +    "writeout=immediate,fmode=0600,dmode=0700", tmpdir);
> > +}
> > +
> >  const generic_fuzz_config predefined_configs[] = {
> >      {
> >          .name = "virtio-net-pci-slirp",
> > @@ -60,6 +70,16 @@ const generic_fuzz_config predefined_configs[] = {
> >          .name = "virtio-mouse",
> >          .args = "-machine q35 -nodefaults -device virtio-mouse",
> >          .objects = "virtio*",
> > +    },{
> > +        .name = "virtio-9p",
> > +        .argfunc = generic_fuzzer_virtio_9p_args,
> > +        .objects = "virtio*",
> > +    },{
> > +        .name = "virtio-9p-synth",
> > +        .args = "-machine q35 -nodefaults "
> > +        "-device virtio-9p,fsdev=hshare,mount_tag=hshare "
> > +        "-fsdev synth,id=hshare",
> > +        .objects = "virtio*",
> >      },{
> >          .name = "e1000",
> >          .args = "-M q35 -nodefaults "
> > -- 
> > 2.28.0

