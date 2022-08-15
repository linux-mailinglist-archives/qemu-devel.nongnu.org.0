Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 651F2592E2D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 13:27:05 +0200 (CEST)
Received: from localhost ([::1]:34106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNYFM-0007uw-07
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 07:27:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oNYBE-0005Jx-Pz
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 07:22:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45362)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1oNYBB-0005PC-0Q
 for qemu-devel@nongnu.org; Mon, 15 Aug 2022 07:22:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660562563;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xg7Y37c7+Mu2tte7xay/if57/McOvInDyjpF61fwY5U=;
 b=ceyKxhKFeHXG+VlBWYq8+hVL7GZmLL8VKPbzt34TznLVhQRi2ElW2SY5D8eTIaCVL4l/du
 y6hSIJNp0/gVKI0eE2mCzfd0lIfyqEtHi+PCvTibt3mHt2dws+oDkIPhT5fTHAJ5BSUZBM
 4jYVOAq7PDjdNY0ebTnidodzmKJfzKs=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-80-BAttUL_nNGWZKhTpHjPuJw-1; Mon, 15 Aug 2022 07:22:42 -0400
X-MC-Unique: BAttUL_nNGWZKhTpHjPuJw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4C363801157;
 Mon, 15 Aug 2022 11:22:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (unknown [10.39.192.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 640F14050067;
 Mon, 15 Aug 2022 11:22:41 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 960791800082; Mon, 15 Aug 2022 13:22:39 +0200 (CEST)
Date: Mon, 15 Aug 2022 13:22:39 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: Re: race condition in display device caused by run_on_cpu() dropping
 the iothread lock
Message-ID: <20220815112239.37xm3zwbe5gd7trz@sirius.home.kraxel.org>
References: <CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9odnPo2LPip295Uztri7JfoVnQbkJ=Wn+k8dQneB_ynQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Mon, Aug 01, 2022 at 02:23:55PM +0100, Peter Maydell wrote:
> I've been debugging a segfault in the raspi3b display device, and I've
> tracked it down to a race condition, but I'm not sure what the right
> way to fix it is...
> 
> The race is that a vCPU thread is handling a guest register write that
> says "resize the framebuffer", which it implements by calling
> qemu_console_resize().

[ back online after vacation ]

Easiest is probably to not instantly resize the display surface but
let the update handler do that on the next display refresh.

Many display devices do that anyway because often multiple register
updates are needed to perform a resize and you don't want your ui
window run through all the temporary states ...

Alternative: The DisplaySurface is backed by pixman images which are
reference counted.  Some qemu code which depends on the backing store
staying around while not holding the iolock work with the pixman image
directly because they can just take a reference then to avoid the image
being freed while they use it.

>  * memory_region_snapshot_and_clear_dirty() ends up calling run_on_cpu(),
>    which briefly drops the iothread lock.

Oh.  Is that new?

> How is this intended to work? I feel like if run_on_cpu() silently
> drops the iothread lock this probably invalidates a lot of assumptions
> that QEMU code makes, especially in this kind of setup where
> the code making the assumptions is several layers in the callstack
> above whatever it is that ends up calling run_on_cpu()...

Indeed.  The display update code paths using dirty bitmap snapshots
certainly don't expect that.

take care,
  Gerd


