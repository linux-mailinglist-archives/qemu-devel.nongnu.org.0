Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 699825EAB73
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 17:44:56 +0200 (CEST)
Received: from localhost ([::1]:46416 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocqHv-0002BT-Eo
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 11:44:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34324)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ocpuN-0001uk-AD
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:20:39 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:48737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ocpuL-0004Iy-7k
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 11:20:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:
 Content-ID:Content-Description;
 bh=Z+kaGhNgydXmrn5vF5tuqW+SW2bcB+dVGwSZMeabda4=; b=bg/osfRLt3PigpkF8l13WGXWBs
 mQNekD5ZFffvrVrF5f0z551QhloElLo5rDx4GhMPB65nUP4ohUWPW/wWUVd0DWN/AQAHS6dtGIzVm
 +JMveoRgBIawVFZNuuXaI9y2p1Ss2Cne0JIIwevQTeaY+RMpyRWebwVEfh4MLI57x+UjxP0Qr0mJb
 2V+VRGJWvcaCh+sqPQd5w3u4mJBr6PQNunnbntkTYnWQ/9UzWyWxsdYwIMQFcpULk7FEGcUNF/vy6
 fgyljTpUufezk70Cpcy785GfAHCZcy5DP/nuhmhZu8io1f0uxKsJ1JG8aL7kFiYmztU6tPHOBdNP9
 ZA4Dj4vk4lqIULpZXT5E6WyUPZzkhZBGsGnLanwv73zqRuF20QfGNuRfPZIe7oCFWVEPDGXXBZHb+
 H8GricfvmU1FfxRWzvMn2He3DbQp19Vap/0smsKlgG1h9JC4CFbmpbXYLAQqO4t/60Gdj9otHuu1u
 tgLmaRr6XWHVTtqPF0v3FIXv13xCdR9JmHdQwjVrDhWL8yeCwQO3XoEznncs5wHynGmQJ0M/n23tE
 rlKbPS9tt98nbwBEVlRM/K1eBVj1XoNIDu7tIC/IOaVnWrN3Op0yEtVxHvDz1kitDu2sthDs42jOx
 hu9W2x5gnoXH+smbUD65iNojETL/Ri6Y2ZQT7twgE=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] tests/9p: split virtio-9p-test.c into tests and 9p client
 part
Date: Mon, 26 Sep 2022 17:19:54 +0200
Message-ID: <4002004.219TK1JQ68@silver>
In-Reply-To: <20220926163053.565b7042@bahia>
References: <E1oX4nS-0001UM-Cz@lizzy.crudebyte.com>
 <20220926163053.565b7042@bahia>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Montag, 26. September 2022 16:30:53 CEST Greg Kurz wrote:
> On Sat, 10 Sep 2022 19:46:55 +0200
> 
> Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > This patch is pure refactoring, it does not change behaviour.
> > 
> > virtio-9p-test.c grew to 1657 lines. Let's split this file up between
> > actual 9p test cases vs. 9p test client, to make it easier to
> > concentrate on the actual 9p tests.
> > 
> > Move the 9p test client code to a new unit virtio-9p-client.c, which
> > are basically all functions and types prefixed with v9fs_* already.
> > 
> > Note that some client wrapper functions (do_*) are preserved in
> > virtio-9p-test.c, simply because these wrapper functions are going to
> > be wiped with subsequent patches anyway.
> > 
> > As the global QGuestAllocator variable is moved to virtio-9p-client.c,
> > add a new function v9fs_set_allocator() to be used by virtio-9p-test.c
> > instead of fiddling with a global variable across units and libraries.
> > 
> > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > ---
> > 
> > As I am working on extending the previously sent RFC [1] (which will be
> > using function calls with named function arguments), I realized that it
> > makes sense to first split the client code out to a new file, and then
> > make the upcoming patches based on this patch here. Because that way
> > I don't have to touch the order of the client functions and the upcoming
> > patches will therefore become better readable.
> 
> Hi Christian,
> 
> The change looks quite reasonable but you'll have to fix the includes...
> 
> > [1] https://lore.kernel.org/all/E1oDQqv-0003d4-Hm@lizzy.crudebyte.com/
> > 
> >  tests/qtest/libqos/meson.build        |   1 +
> >  tests/qtest/libqos/virtio-9p-client.c | 683 +++++++++++++++++++++++
> >  tests/qtest/libqos/virtio-9p-client.h | 139 +++++
> >  tests/qtest/virtio-9p-test.c          | 770 +-------------------------
> >  4 files changed, 849 insertions(+), 744 deletions(-)
> >  create mode 100644 tests/qtest/libqos/virtio-9p-client.c
> >  create mode 100644 tests/qtest/libqos/virtio-9p-client.h
> 
> [..snip..]
> 
> > diff --git a/tests/qtest/libqos/virtio-9p-client.h
> > b/tests/qtest/libqos/virtio-9p-client.h new file mode 100644
> > index 0000000000..8bea032a85
> > --- /dev/null
> > +++ b/tests/qtest/libqos/virtio-9p-client.h
> > @@ -0,0 +1,139 @@
> > +/*
> > + * 9P network client for VirtIO 9P test cases (based on QTest)
> > + *
> > + * Copyright (c) 2014 SUSE LINUX Products GmbH
> > + *
> > + * This work is licensed under the terms of the GNU GPL, version 2 or
> > later. + * See the COPYING file in the top-level directory.
> > + */
> > +
> > +/*
> > + * Not so fast! You might want to read the 9p developer docs first:
> > + * https://wiki.qemu.org/Documentation/9p
> > + */
> > +
> > +#ifndef TESTS_LIBQOS_VIRTIO_9P_CLIENT_H
> > +#define TESTS_LIBQOS_VIRTIO_9P_CLIENT_H
> > +
> > +#include "qemu/osdep.h"
> 
> ... here.
> 
> As explained in `docs/devel/style.rst`, the "qemu/osdep.h" header must
> only be included in .c files. Please move this #include directive to
> `tests/qtest/libqos/virtio-9p-client.c`:
> 
> #include "qemu/osdep.h"
> #include "virtio-9p-client.h"
> 
> With that fixed you can add R-b tag.
> 
> Cheers,

Good catch! Will do, thanks!

Best regards,
Christian Schoenebeck



