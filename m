Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B6F3D2584
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 16:17:38 +0200 (CEST)
Received: from localhost ([::1]:41842 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ZW5-0004AG-QI
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 10:17:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1m6ZRM-00063T-UT
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:12:44 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:26331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1m6ZRI-0005xv-DA
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 10:12:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1626963160;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=8i7/RhkbG8i8iGp6/KXzouNQ7fz0VX8u4ti+O4wZlS4=;
 b=MkE4v7M6DINXKuHx2HlbxGh/3DTq9HMiM+WvSGmpmL3ZrmI1fjJRafwo
 sE2Q/99BVT48MEsQ0n5LybqcL6snV6IztdC5W37CO4c6tFtz9yXDVig22
 kU3Bp+c+wiStClQX/vFCIy6+TQ96ILeA0OURmIdp0LH9jHbB6vJurgJuR A=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: qHqLuLlUgp0+8rWtYRb4/O0NLQm2IPo3X3SUfZZywG69bIXv8WdNxCyEk6tgIB/9pHIaAGDwLW
 BjL0W8/QVRWq3CpS8VJDOs3K+pGFwe7um29+eatlsO+awU2AMxZgco8vnjGEqUyKrsA29Hb+41
 YNe68X8paXCR3K/iiGHvmGCtBzY2iSXM91c/lAO8vbg1cy4qbiJPZ7micr2U/YuOc7D9snlMy1
 d0KiFnSYrldzzB37pi7BUNPE8fJNpcTevGxQ5QB+g9bvtKTkwXcE3rVmE+ZlGSyUjJjLUqy//0
 pygq9I83akLGFBZ2tdw00U+A
X-SBRS: 5.1
X-MesageID: 48909183
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:at/y260s0v0WudClQp2tKwqjBLAkLtp133Aq2lEZdPRUGvb4qy
 mLpoV96faUskd0ZJhOo7y90cW7Lk80sKQFh7X5Xo3SOTUO2lHYT72KhLGKq1aLdhEWtNQtt5
 uIG5IOceEYZmIbsS+V2meFL+o=
X-IronPort-AV: E=Sophos;i="5.84,261,1620705600"; d="scan'208";a="48909183"
Date: Thu, 22 Jul 2021 15:12:33 +0100
To: Jason Andryuk <jandryuk@gmail.com>
CC: <pbonzini@redhat.com>, <qemu-devel@nongnu.org>,
 <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH] vl: Parse legacy default_machine_opts
Message-ID: <YPl80YnsDpLI8gtN@perard>
References: <CAKf6xps07sbk7MnehPTKes52sst0UyaHiHjjSdEX0bFjT+E_ag@mail.gmail.com>
 <20210713021552.19110-1-jandryuk@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210713021552.19110-1-jandryuk@gmail.com>
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=anthony.perard@citrix.com; helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -58
X-Spam_score: -5.9
X-Spam_bar: -----
X-Spam_report: (-5.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

On Mon, Jul 12, 2021 at 10:15:52PM -0400, Jason Andryuk wrote:
> qemu can't start a xen vm after commit d8fb7d0969d5
> "vl: switch -M parsing to keyval" with:
> 
> $ ./qemu-system-i386 -M xenfv
> Unexpected error in object_property_find_err() at ../qom/object.c:1298:
> qemu-system-i386: Property 'xenfv-3.1-machine.accel' not found
> Aborted (core dumped)
> 
> The default_machine_opts handling doesn't process the legacy machine
> options like "accel".  Call qemu_apply_legacy_machine_options to provide
> the legacy handling.
> 
> Signed-off-by: Jason Andryuk <jandryuk@gmail.com>

Reviewed-by: Anthony PERARD <anthony.perard@citrix.com>

I can't find a different way to set a default "accelerator" to a
machine, so this patch seems necessary.

Thanks,

> ---
>  softmmu/vl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 4df1496101..f4d8630fc6 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2126,6 +2126,7 @@ static void qemu_create_machine(QDict *qdict)
>          QDict *default_opts =
>              keyval_parse(machine_class->default_machine_opts, NULL, NULL,
>                           &error_abort);
> +        qemu_apply_legacy_machine_options(default_opts);
>          object_set_properties_from_keyval(OBJECT(current_machine), default_opts,
>                                            false, &error_abort);
>          qobject_unref(default_opts);

-- 
Anthony PERARD

