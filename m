Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FBEB443A8D
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 01:43:06 +0100 (CET)
Received: from localhost ([::1]:60288 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi4Mr-00089y-5R
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 20:43:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mi4L9-0007Sq-56
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 20:41:19 -0400
Received: from mga04.intel.com ([192.55.52.120]:58889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mi4L6-0006BN-3r
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 20:41:18 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="230121352"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="230121352"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 17:41:14 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="489326934"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.254.51.215])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 17:41:13 -0700
Date: Tue, 2 Nov 2021 17:41:10 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 1/2] virtio-gpu: splitting one extended mode guest fb
 into n-scanouts
Message-ID: <20211103004110.GA751@dongwonk-MOBL.amr.corp.intel.com>
References: <20210706235255.7575-1-dongwon.kim@intel.com>
 <20210726215950.26705-1-dongwon.kim@intel.com>
 <20211102135154.lfntfm7wdswa5kdf@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211102135154.lfntfm7wdswa5kdf@sirius.home.kraxel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.120; envelope-from=dongwon.kim@intel.com;
 helo=mga04.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, vivek.kasireddy@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I double-checked the patch and also tried to build with --disable-opengl
but couldn't find any issue. Can you please give me some hint? Like
build errors you saw. What are changed by the patch are pretty much
limited to virtio-gpu blob case and just one change in common area is
egl_fb_blit function but the function interface stays same and there are
no variables enabled only with certain define.

Is there any chance that the build system was building it with the
previous patch, "ui/gtk-egl: un-tab and re-tab should destroy egl
surface and context" still applied?

Thanks!
DW

On Tue, Nov 02, 2021 at 02:51:54PM +0100, Gerd Hoffmann wrote:
> On Mon, Jul 26, 2021 at 02:59:49PM -0700, Dongwon Kim wrote:
> > When guest is running Linux/X11 with extended multiple displays mode enabled,
> > the guest shares one scanout resource each time containing whole surface
> > rather than sharing individual display output separately. This extended frame
> > is properly splited and rendered on the corresponding scanout surfaces but
> > not in case of blob-resource (zero copy).
> > 
> > This code change lets the qemu split this one large surface data into multiple
> > in case of blob-resource as well so that each sub frame then can be blitted
> > properly to each scanout.
> 
> Fails windows test build too.
> 
> take care,
>   Gerd
> 

