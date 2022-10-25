Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09FDA60D22D
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Oct 2022 19:00:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onNFi-0006JC-74; Tue, 25 Oct 2022 12:58:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1onNFb-0005lP-Ce
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:58:03 -0400
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1onNFZ-0004tz-H2
 for qemu-devel@nongnu.org; Tue, 25 Oct 2022 12:58:03 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A2DE8B81DB8;
 Tue, 25 Oct 2022 16:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C254DC433D6;
 Tue, 25 Oct 2022 16:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1666717074;
 bh=TOr7/IBl9W+Hpc/R8LxJAyq9QpYQbWCv3WJvy2nka0k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IuS0pwxkNWhb/Pc3fD1YeILTwYuQDWG7J6hJ35bK6Ucsyh68N7Gpf7db0oIcWSg5J
 +A52AVp6gq97BqnXsSXSdptDSLkW3H2w/eBLbjyhblutXXWvXsvxCZQTb1o8df8D0g
 X2/xsNKaI+imRsgqBblFS8hu7gUdhG4pmfgst1Zw=
Date: Tue, 25 Oct 2022 18:57:51 +0200
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
Subject: Re: [PATCH v3] kset: fix memory leak when kset_register() returns
 error
Message-ID: <Y1gVj6Uq2NDScYdY@kroah.com>
References: <20221025071549.1280528-1-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221025071549.1280528-1-yangyingliang@huawei.com>
Received-SPF: pass client-ip=2604:1380:4601:e00::1;
 envelope-from=gregkh@linuxfoundation.org; helo=ams.source.kernel.org
X-Spam_score_int: -75
X-Spam_score: -7.6
X-Spam_bar: -------
X-Spam_report: (-7.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.517,
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

On Tue, Oct 25, 2022 at 03:15:49PM +0800, Yang Yingliang wrote:
> Inject fault while loading module, kset_register() may fail.
> If it fails, the kset.kobj.name allocated by kobject_set_name()
> which must be called before a call to kset_register() may be
> leaked, since refcount of kobj was set in kset_init().
> 
> To mitigate this, we free the name in kset_register() when an
> error is encountered, i.e. when kset_register() returns an error.
> 
> A kset may be embedded in a larger structure which may be dynamically
> allocated in callers, it needs to be freed in ktype.release() or error
> path in callers, in this case, we can not call kset_put() in kset_register(),
> or it will cause double free, so just call kfree_const() to free the
> name and set it to NULL to avoid accessing bad pointer in callers.
> 
> With this fix, the callers don't need care about freeing the name
> and may call kset_put() if kset_register() fails.
> 
> Suggested-by: Luben Tuikov <luben.tuikov@amd.com>
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
> ---
> v2 -> v3:
>   Update commit message and comment of kset_register().
> 
> v1 -> v2:
>   Free name inside of kset_register() instead of calling kset_put()
>   in drivers.

Thank you for all of this, it's a much nicer and cleaner fix than
forcing all callers to try to handle it instead.

greg k-h

