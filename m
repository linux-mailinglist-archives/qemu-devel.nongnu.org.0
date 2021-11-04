Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4FFC444FA7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 08:24:04 +0100 (CET)
Received: from localhost ([::1]:58840 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miX6S-0000AG-0T
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 03:24:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1miX2J-0002sp-88
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:19:47 -0400
Received: from mga01.intel.com ([192.55.52.88]:55500)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1miX2G-0004R1-OL
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:19:46 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="255297397"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="255297397"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 00:19:39 -0700
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="729212739"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.254.52.249])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 00:19:39 -0700
Date: Thu, 4 Nov 2021 00:19:37 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 1/2] virtio-gpu: splitting one extended mode guest fb
 into n-scanouts
Message-ID: <20211104071937.GA1257@dongwonk-MOBL.amr.corp.intel.com>
References: <20210706235255.7575-1-dongwon.kim@intel.com>
 <20210726215950.26705-1-dongwon.kim@intel.com>
 <20211102135154.lfntfm7wdswa5kdf@sirius.home.kraxel.org>
 <20211103004110.GA751@dongwonk-MOBL.amr.corp.intel.com>
 <20211103053937.on4dg37wmkx2f2t5@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211103053937.on4dg37wmkx2f2t5@sirius.home.kraxel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.88; envelope-from=dongwon.kim@intel.com;
 helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, vivek.kasireddy@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I found the virtio-gpu-splitting-one-extended-mode-guest-fb-into.patch
didn't include the func interface change in one of stubs. I believe
that was the reason for win32/64 build failure (verified it with gitlab
CI). I updated that patch then I combined all 6 (4 for untabifying issue
and 2 for multiple guest scanouts with blob) into one patch series and just
sent it to as a reply.

Regarding Vivek's series for default sync mechanism that you referred
below, that series has already been merged.

Thanks,
DW

On Wed, Nov 03, 2021 at 06:39:37AM +0100, Gerd Hoffmann wrote:
> On Tue, Nov 02, 2021 at 05:41:10PM -0700, Dongwon Kim wrote:
> > I double-checked the patch and also tried to build with --disable-opengl
> > but couldn't find any issue. Can you please give me some hint? Like
> > build errors you saw. What are changed by the patch are pretty much
> > limited to virtio-gpu blob case and just one change in common area is
> > egl_fb_blit function but the function interface stays same and there are
> > no variables enabled only with certain define.
> > 
> > Is there any chance that the build system was building it with the
> > previous patch, "ui/gtk-egl: un-tab and re-tab should destroy egl
> > surface and context" still applied?
> 
> Hmm, I had applied both, then dropped the failing series, but possibly I
> missed some broken patch.
> 
> Trying to apply the series on top of the v2 just sent failed.
> 
> Any chance you can send a single patch series with all pending patches
> (including the "virtio-gpu: Add a default synchronization mechanism for
> blobs" series by Vivek which also doesn't apply cleanly any more)?
> 
> Ideally tested in gitlab ci?
> 
> thanks,
>   Gerd
> 

