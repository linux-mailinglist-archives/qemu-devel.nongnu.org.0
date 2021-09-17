Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D397640FDFD
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 18:36:58 +0200 (CEST)
Received: from localhost ([::1]:56546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mRGrB-0008Qw-Tc
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 12:36:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mRGp5-0004Th-J2
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:34:47 -0400
Received: from mga05.intel.com ([192.55.52.43]:58723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mRGp3-0005TT-0t
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 12:34:47 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10110"; a="308377625"
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="308377625"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 09:34:41 -0700
X-IronPort-AV: E=Sophos;i="5.85,301,1624345200"; d="scan'208";a="510009259"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.251.131.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2021 09:34:40 -0700
Date: Fri, 17 Sep 2021 09:34:39 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] ui/gtk: skip any extra draw of same guest scanout blob res
Message-ID: <20210917163439.GA65@dongwonk-MOBL.amr.corp.intel.com>
References: <20210916234156.5505-1-dongwon.kim@intel.com>
 <20210917100202.vrdadmmqbeebwp5g@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917100202.vrdadmmqbeebwp5g@sirius.home.kraxel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.43; envelope-from=dongwon.kim@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel@nongnu.org, Vivek Kasireddy <vivek.kasireddy@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Sep 17, 2021 at 12:02:02PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > +    bool      draw_submitted;
> > +    QemuMutex mutex;
> 
> Why the mutex?  I think all the code runs while holding the BQL so it
> should be serialized.

Guest drawing process using blob is serialized (gd_egl_flush->scheduling
draw call->gd_egl_draw) but an asynchronous draw event from another thread
is causing a problem.

I initially thought using a flag (draw_submitted) would be enough to get this
worked around, but it wasn't as the asynchronous draw could take it over before,

dambuf->draw_submitted = false;

happens during normal draw sequence. I thought mutex would be a reasonable
solution for this case.

> 
> > +#ifdef CONFIG_GBM
> > +        if (dmabuf) {
> > +            qemu_mutex_lock(&dmabuf->mutex);
> > +            if (!dmabuf->draw_submitted) {
> > +                qemu_mutex_unlock(&dmabuf->mutex);
> > +                return;
> > +            } else {
> > +                dmabuf->draw_submitted = false;
> > +            }
> > +        }
> > +#endif
> 
> Factoring out that into helper functions is probably a good idea.  Then
> have stub functions for the CONFIG_GBM=no case and *alot* less #ifdefs
> in the code ...

I will look into this part.
Thanks,
DW

> 
> thanks,
>   Gerd
> 

