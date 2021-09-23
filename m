Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FED4416894
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Sep 2021 01:44:05 +0200 (CEST)
Received: from localhost ([::1]:49134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTYNn-0003Zc-NA
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 19:44:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mTYLM-0002UR-QW
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 19:41:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:34826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mTYLK-0007OC-Q0
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 19:41:32 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10116"; a="204124271"
X-IronPort-AV: E=Sophos;i="5.85,318,1624345200"; d="scan'208";a="204124271"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 16:41:20 -0700
X-IronPort-AV: E=Sophos;i="5.85,318,1624345200"; d="scan'208";a="475780626"
Received: from dongwonk-mobl.amr.corp.intel.com ([10.255.69.218])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 16:41:19 -0700
Date: Thu, 23 Sep 2021 16:41:17 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH] ui/gtk: skip any extra draw of same guest scanout blob res
Message-ID: <20210923234117.GA265@dongwonk-MOBL.amr.corp.intel.com>
References: <20210916234156.5505-1-dongwon.kim@intel.com>
 <20210917100202.vrdadmmqbeebwp5g@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210917100202.vrdadmmqbeebwp5g@sirius.home.kraxel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Received-SPF: pass client-ip=192.55.52.151; envelope-from=dongwon.kim@intel.com;
 helo=mga17.intel.com
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

Gerd, I did more experiment and verified mutex is actually not required.
I think I had some wrong belief after seeing some of sync problem
resolved after adding mutex but the code sequence was different at that
time.. I will remove mutex.

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
> 

There are oter places controlled by #ifdef CONFIG_GBM.
What about taking care of CONFIG_GBM altogher after v2 (same but no
mutex) of this patch?

> thanks,
>   Gerd
> 

