Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ADB15631ED
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 12:52:56 +0200 (CEST)
Received: from localhost ([::1]:48712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7EGa-00016x-1n
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 06:52:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o7EF3-00081v-TK
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:51:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:39923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1o7EEz-0004FQ-BY
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 06:51:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656672669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RTdlRJEIqeZR/gMDnImgXK2t7SXAFjxFFSvCwwCTvlw=;
 b=ha3hpyYM0zCBLiMovqet2C00PD/NgyS3PkOdXJOrbWsukM5LclfCtyK/27dyYW0Y+wtI13
 vzNwyRKyEmpQ2JNmPRlplXsQEXPi4HfD314aRRqYm+mOJIIh4gWOcSrtVNBpGgnFuHL9VK
 qdJ3Q6YRXELeiOu9n94Wn03gUvy9yI8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-611-mGxJO0tbONWvIOTf-x64Kw-1; Fri, 01 Jul 2022 06:51:08 -0400
X-MC-Unique: mGxJO0tbONWvIOTf-x64Kw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 037C429324BD;
 Fri,  1 Jul 2022 10:51:08 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.27])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C839D40D1B97;
 Fri,  1 Jul 2022 10:51:07 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 37B25180091D; Fri,  1 Jul 2022 12:51:06 +0200 (CEST)
Date: Fri, 1 Jul 2022 12:51:06 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Hongren (Zenithal) Zheng" <i@zenithal.me>
Cc: qemu-devel@nongnu.org, contact@canokeys.org,
 MkfsSion <myychina28759@gmail.com>
Subject: Re: [PATCH v2 0/3] CanoKey: Fix xHCI compatibility and CCID ZLP
Message-ID: <20220701105106.fzlu44cgvfmb5z4g@sirius.home.kraxel.org>
References: <YqcptnhfCtUn2+T6@Sun>
 <YrSD1xGYsWWk996E@Sun>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YrSD1xGYsWWk996E@Sun>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 23, 2022 at 11:16:39PM +0800, Hongren (Zenithal) Zheng wrote:
> On Mon, Jun 13, 2022 at 08:12:38PM +0800, Hongren (Zenithal) Zheng wrote:
>  
> > ---
> > v2: 
> >   * use usb_ep_get instead of recording ep_in_pointer
> >       as suggested by kraxel
> >   * CI result for v2 is at
> > https://gitlab.com/ZenithalHourlyRate/qemu/-/pipelines/562306905
> 
> Hi kraxel, is there any further feedback on this?
> 
> BTW, as the commit "add myself as CanoKey maintainer" has been
> merged, how should I submit patches on CanoKey to you and QEMU?

Sending to the list with /me Cc'ed is fine.

> For other contributors, before I can send PULL (my key is not signed yet)
> I think I should first give Reviewed-by tags then request you
> to pass them.

Yes.

Series queued up now.

thanks,
  Gerd


