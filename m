Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E73AF2DDB28
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Dec 2020 23:03:01 +0100 (CET)
Received: from localhost ([::1]:38660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kq1MS-0006bG-Il
	for lists+qemu-devel@lfdr.de; Thu, 17 Dec 2020 17:03:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kq1L7-00063H-BR
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 17:01:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:57009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kq1L3-0001RN-1q
 for qemu-devel@nongnu.org; Thu, 17 Dec 2020 17:01:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608242491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C6wn7due1XakCHxGpE4fEAFq/ym+1X8S05mpbVM9AE8=;
 b=SLOk+MoPe7ydCUfhVvDWZG6MXNWPZIaFww26TcWBG2Vm7LLHptF6eajK6hGZ4p6ed6gDK6
 Nh0G+972LsBOsixn6OwNOsxGvuk5cJpuG9+ofl3V/ki+Hd+unLTTiVMhr9uNTatc2A211v
 UbXTD23S2slUerISStajOsRLXKD1RoU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-492-cBwcLqVON_aT4iOYJ__yGQ-1; Thu, 17 Dec 2020 17:01:27 -0500
X-MC-Unique: cBwcLqVON_aT4iOYJ__yGQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F1FB2800D55;
 Thu, 17 Dec 2020 22:01:25 +0000 (UTC)
Received: from localhost (ovpn-115-226.rdu2.redhat.com [10.10.115.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 77DE560BE5;
 Thu, 17 Dec 2020 22:01:22 +0000 (UTC)
Date: Thu, 17 Dec 2020 17:01:21 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: dangers of current NEED_CPU_H, CONFIG_SOFTMMU, CONFIG_USER_ONLY
 (was: [PATCH v11 7/7] cpu: introduce cpu_accel_instance_init)
Message-ID: <20201217220121.GN3140057@habkost.net>
References: <20201211100908.19696-1-cfontana@suse.de>
 <20201211100908.19696-8-cfontana@suse.de>
 <e47ef5e5-2053-d98d-9cd5-f6d96c423c82@suse.de>
 <CAFEAcA8FL23_bZaOM_u8CdSQoCrrQ2SxnuOoU0H9kPFeANyT0A@mail.gmail.com>
 <CAFEAcA8RyT58QCX=UpfGRrOvBZWAC7Jhvq0t+X2cAX7qEjhfkQ@mail.gmail.com>
 <CABgObfaQBuwQ3UHC6VLm03Y=djQQnorT+Ecqx5QLe0oz_XrAXQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABgObfaQBuwQ3UHC6VLm03Y=djQQnorT+Ecqx5QLe0oz_XrAXQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Claudio Fontana <cfontana@suse.de>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex Bennee <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 17, 2020 at 10:13:17PM +0100, Paolo Bonzini wrote:
> I will take a look, CONFIG_USER_ONLY is definitely something that should be
> poisoned.

Thanks!  I started looking at it, but I gave up when I realized
how much work it would required.  :)

In any case, feel free to reuse the 2 small commits I've just pushed to
https://gitlab.com/ehabkost/qemu/-/commits/work/poison-user-only

> 
> Paolo
> 
> Il gio 17 dic 2020, 21:26 Peter Maydell <peter.maydell@linaro.org> ha
> scritto:
> 
> > On Thu, 17 Dec 2020 at 20:15, Peter Maydell <peter.maydell@linaro.org>
> > wrote:
> > > (So in theory we could make CONFIG_USER_ONLY
> > > a poisoned identifier but that will require some work to
> > > adjust places where we currently use it in "safe" ways...)
> >
> > Specifically, putting it in poison.h turns up these places
> > that would need to be made to do what they're doing in a
> > different way somehow:
> >
> > ../../hw/core/cpu.c:211:14: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/disas/disas.h:27:13: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/exec/address-spaces.h:24:9: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/exec/cpu-common.h:20:14: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/exec/cpu-common.h:6:9: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/exec/ioport.h:43:9: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/exec/memory.h:17:9: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/exec/ramblock.h:22:9: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/hw/core/cpu.h:1035:8: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/hw/core/cpu.h:518:14: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/hw/core/cpu.h:602:9: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/hw/hw.h:4:8: error: attempt to use poisoned "CONFIG_USER_ONLY"
> > include/hw/semihosting/semihost.h:29:8: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/sysemu/accel.h:40:9: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/sysemu/cpus.h:65:9: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/sysemu/dma.h:34:9: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> > include/sysemu/xen.h:27:9: error: attempt to use poisoned
> > "CONFIG_USER_ONLY"
> >
> > That cpu.c one is definitely dubious given it's in a C file,
> > not a header.
> >
> > thanks
> > -- PMM
> >
> >

-- 
Eduardo


