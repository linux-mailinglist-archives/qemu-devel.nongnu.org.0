Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD40C2C14A1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 20:43:52 +0100 (CET)
Received: from localhost ([::1]:41280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khHkd-000235-Vi
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 14:43:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1khHdH-0005tj-Ui
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:36:18 -0500
Received: from lizzy.crudebyte.com ([91.194.90.13]:59813)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1khHdC-0002sD-01
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 14:36:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=lizzy; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=nSPxOgWzlA2DWRC2NEcjmNWjzvMsVEWN7rm/m5OvTGY=; b=AQ1IO2HZW7xtZ7qtS2nVDcw+pQ
 /bxBI4fbKpfcUbtTl/s4dkzIEVE7Yg+QM4eivSQcKpS7qZyZf/4hDdjJFRDqvYDZ22qXM067O8scT
 xA7a71WsVRwlu+I0DyGRK96l9iDB3R+VLDNpHfhzNddC7gVjz7nKvN1ZRCTvNK5LnOLJyuqsiuJU9
 woyBxRBDVFMxE84Qzgv3OeuTmTkNHBYqAWNUnoM08mBcrWYPYWRyfGhN9GVeEYSJLbAdXiqpDo5BU
 FAmnFrn5wPvcgv58koSgtTEYxgE9uWk721f90Nu0PiHVV21KoukjBEXSWPHiT4cJtA7RRoax8U8H7
 YQoGcrcQ==;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Greg Kurz <groug@kaod.org>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH for-5.2] tests/9pfs: Mark "local" tests as "slow"
Date: Mon, 23 Nov 2020 20:35:58 +0100
Message-ID: <10297311.nEiT89vc6u@silver>
In-Reply-To: <1652137.SzlE5fuBRn@silver>
References: <160615331159.1339160.8458952247626802787.stgit@bahia.lan>
 <1652137.SzlE5fuBRn@silver>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=91.194.90.13; envelope-from=qemu_oss@crudebyte.com;
 helo=lizzy.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 23. November 2020 19:08:18 CET Christian Schoenebeck wrote:
> On Montag, 23. November 2020 18:41:51 CET Greg Kurz wrote:
> > The "local" tests can fail on some automated build systems as
> > reported here:
> > 
> > https://lists.nongnu.org/archive/html/qemu-devel/2020-11/msg05510.html
> > 
> > This will need to be investigated and addressed later. Let's go for a
> > workaround in the meantime : mark the "local" tests as "slow" so that
> > they aren't executed with a simple "make check" like in the case above.
> > 
> > Reported-by: Cole Robinson <crobinso@redhat.com>
> > Signed-off-by: Greg Kurz <groug@kaod.org>
> > ---
> > 
> > Unless there's a strong argument against merging this, I'll post
> > a PR with this fix for RC3.
> > ---
> > 
> >  tests/qtest/virtio-9p-test.c |   35 +++++++++++++++++++++--------------
> >  1 file changed, 21 insertions(+), 14 deletions(-)
> > 
> > diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> > index 21e340fa5f43..dad37ace9772 100644
> > --- a/tests/qtest/virtio-9p-test.c
> > +++ b/tests/qtest/virtio-9p-test.c
> > @@ -1454,20 +1454,27 @@ static void register_virtio_9p_test(void)
> > 
> >      qos_add_test("synth/readdir/split_128", "virtio-9p",
> >      
> >                   fs_readdir_split_128,  &opts);
> > 
> > -
> > -    /* 9pfs test cases using the 'local' filesystem driver */
> > -    opts.before = assign_9p_local_driver;
> > -    qos_add_test("local/config", "virtio-9p", pci_config,  &opts);
> > -    qos_add_test("local/create_dir", "virtio-9p", fs_create_dir, &opts);
> > -    qos_add_test("local/unlinkat_dir", "virtio-9p", fs_unlinkat_dir,
> > &opts); -    qos_add_test("local/create_file", "virtio-9p",
> > fs_create_file,
> > &opts); -    qos_add_test("local/unlinkat_file", "virtio-9p",
> > fs_unlinkat_file, &opts); -    qos_add_test("local/symlink_file",
> > "virtio-9p", fs_symlink_file, &opts); -
> > qos_add_test("local/unlinkat_symlink", "virtio-9p", fs_unlinkat_symlink, -
> > 
> >                &opts);
> > 
> > -    qos_add_test("local/hardlink_file", "virtio-9p", fs_hardlink_file,
> > &opts); -    qos_add_test("local/unlinkat_hardlink", "virtio-9p",
> > fs_unlinkat_hardlink, -                 &opts);
> > +    if (g_test_slow()) {
> 
> If you don't mind, I would suggest simply using
> 
> if (!g_test_slow()) {
> 	return;
> }
> 
> here to keep the diff noise low.
> 
> > +        /* 9pfs test cases using the 'local' filesystem driver */
> > +        /*
> > +         * XXX: Until we are sure that these tests can run everywhere,
> > +         * keep them as "slow" so that they aren't run with "make check"
> > +         */
> > +        opts.before = assign_9p_local_driver;
> > +        qos_add_test("local/config", "virtio-9p", pci_config,  &opts);
> > +        qos_add_test("local/create_dir", "virtio-9p", fs_create_dir,
> > &opts); +        qos_add_test("local/unlinkat_dir", "virtio-9p",
> > fs_unlinkat_dir, &opts); +        qos_add_test("local/create_file",
> > "virtio-9p", fs_create_file, &opts); +
> > qos_add_test("local/unlinkat_file", "virtio-9p", fs_unlinkat_file, +
> > 
> >              &opts);
> > 
> > +        qos_add_test("local/symlink_file", "virtio-9p", fs_symlink_file,
> > &opts); +        qos_add_test("local/unlinkat_symlink", "virtio-9p",
> > fs_unlinkat_symlink, +                     &opts);
> > +        qos_add_test("local/hardlink_file", "virtio-9p",
> > fs_hardlink_file,
> > +                     &opts);
> > +        qos_add_test("local/unlinkat_hardlink", "virtio-9p",
> > +                     fs_unlinkat_hardlink, &opts);
> > +    }
> > 
> >  }
> >  
> >  libqos_init(register_virtio_9p_test);
> 
> I agree that this is okay for now to avoid inconveniences with nearby 5.2
> release, but do we agree that this is going to be reverted when 6.0
> development phase starts?
> 
> In 6.0 I would rather handle this by introducing a previously mentioned
> 'loglevel' option for 9p, and asking for the required log data if the local
> tests fail for somebody. I can take care about the loglevel option when 6.0
> phase starts.
> 
> Best regards,
> Christian Schoenebeck

BTW, if I had to shoot in the dark, then my guess would be that system where 
mkdir() failed with ENOTSUPP, does not support xattrs.

If that's the root cause, then another option would be skipping the 'local' 9p 
tests if the host system lacks xattr support, instead of disabling these tests 
for all people by default.

Best regards,
Christian Schoenebeck



