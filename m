Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A87A60AF9D
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 17:53:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1omyoj-0004iT-Sk; Mon, 24 Oct 2022 10:52:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1omyog-0004iF-C1
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:52:38 -0400
Received: from ams.source.kernel.org ([145.40.68.75])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1omyoe-0002UE-Iy
 for qemu-devel@nongnu.org; Mon, 24 Oct 2022 10:52:38 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 62D49B816A2;
 Mon, 24 Oct 2022 14:52:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52EFBC433C1;
 Mon, 24 Oct 2022 14:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666623153;
 bh=iIf7CBp4DRtS4RK5w27tn1+7LfTAdJA8NimWQF9sSvg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=0R1tizG1JTD1VZMfei9eZUwBceJMo27F3IPhrwxgizVbdIXR/VebztKIjUAfm+TJ2
 cpiPAbSdylVk4YR/PmDNZIIZzoMbWnp7XnOykqA3Po0XqNtgjvxOXuMeqXyiEX1VR+
 i+cMHZA9GYInHS3HEvmT7UEBSkL+YkXi0BemMqzI=
Date: Mon, 24 Oct 2022 16:53:22 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Yang Yingliang <yangyingliang@huawei.com>
Cc: linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
 linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 rafael@kernel.org, somlo@cmu.edu, mst@redhat.com,
 jaegeuk@kernel.org, chao@kernel.org, hsiangkao@linux.alibaba.com,
 huangjianan@oppo.com, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, akpm@linux-foundation.org,
 alexander.deucher@amd.com, luben.tuikov@amd.com, richard@nod.at,
 liushixin2@huawei.com
Subject: Re: [PATCH v2] kset: fix memory leak when kset_register() returns
 error
Message-ID: <Y1am4mjS+obAbUTJ@kroah.com>
References: <20221024121910.1169801-1-yangyingliang@huawei.com>
 <Y1aYuLmlXBRvMP1Z@kroah.com>
 <8281fc72-948a-162d-6e5f-a9fe29d8ee46@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8281fc72-948a-162d-6e5f-a9fe29d8ee46@huawei.com>
Received-SPF: pass client-ip=145.40.68.75;
 envelope-from=gregkh@linuxfoundation.org; helo=ams.source.kernel.org
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.503,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Mon, Oct 24, 2022 at 10:39:44PM +0800, Yang Yingliang wrote:
> 
> On 2022/10/24 21:52, Greg KH wrote:
> > On Mon, Oct 24, 2022 at 08:19:10PM +0800, Yang Yingliang wrote:
> > > Inject fault while loading module, kset_register() may fail.
> > > If it fails, the name allocated by kobject_set_name() which
> > > is called before kset_register() is leaked, because refcount
> > > of kobject is hold in kset_init().
> > > 
> > > As a kset may be embedded in a larger structure which needs
> > > be freed in release() function or error path in callers, we
> > > can not call kset_put() in kset_register(), or it will cause
> > > double free, so just call kfree_const() to free the name and
> > > set it to NULL.
> > > 
> > > With this fix, the callers don't need to care about the name
> > > freeing and call an extra kset_put() if kset_register() fails.
> > > 
> > > Suggested-by: Luben Tuikov <luben.tuikov@amd.com>
> > > Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> > > ---
> > > v1 -> v2:
> > >    Free name inside of kset_register() instead of calling kset_put()
> > >    in drivers.
> > > ---
> > >   lib/kobject.c | 8 +++++++-
> > >   1 file changed, 7 insertions(+), 1 deletion(-)
> > > 
> > > diff --git a/lib/kobject.c b/lib/kobject.c
> > > index a0b2dbfcfa23..3409a89c81e5 100644
> > > --- a/lib/kobject.c
> > > +++ b/lib/kobject.c
> > > @@ -834,6 +834,9 @@ EXPORT_SYMBOL_GPL(kobj_sysfs_ops);
> > >   /**
> > >    * kset_register() - Initialize and add a kset.
> > >    * @k: kset.
> > > + *
> > > + * NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
> > > + * which is called before kset_register() in caller need be freed.
> > This comment doesn't make any sense anymore.  No caller needs to worry
> > about this, right?
> With this fix, the name is freed inside of kset_register(), it can not be
> accessed,

Agreed.

> if it allocated dynamically, but callers don't know this if no comment here,
> they may use it in error path (something like to print error message with
> it),
> so how about comment like this to tell callers not to use the name:
> 
> NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
> is freed, it can not be used any more.

Sure, that's a better way to word it.

> > >    */
> > >   int kset_register(struct kset *k)
> > >   {
> > > @@ -844,8 +847,11 @@ int kset_register(struct kset *k)
> > >   	kset_init(k);
> > >   	err = kobject_add_internal(&k->kobj);
> > > -	if (err)
> > > +	if (err) {
> > > +		kfree_const(k->kobj.name);
> > > +		k->kobj.name = NULL;
> > Why are you setting the name here to NULL?
> I set it to NULL to avoid accessing bad pointer in callers,
> if callers use it in error path, current callers won't use this
> name pointer in error path, so we can remove this assignment?

Ah, I didn't think about using it on error paths.  Ideally that would
never happen, but that's good to set just to make it obvious.  How about
adding a small comment here saying why you are setting it so we all
remember it in 5 years when we look at the code again.

thanks,

greg k-h

