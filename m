Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5B5359FAC
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 15:18:53 +0200 (CEST)
Received: from localhost ([::1]:33150 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUr2B-0004qh-Oz
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 09:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUr0t-00047Q-Tk
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:17:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUr0s-0007B0-0W
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 09:17:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617974248;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=A1ouyzQKnUr2utf/6Nnn5FjjKKc2rPOATB0AKULEaSY=;
 b=Pmz40QF+BVYN5UWJpN/ILUlU4TMghwBg4Fbuil+HINJlYKiNcWXHxnjzAHzF2HXaLwbBS9
 7m9j+Kz5gFNz3PHDOH0zfgL5CY3InMxvKZtLTkx5IvanEiohTkIdlpui/qReY8wNDlBhGf
 O5ikI+X95Zct1S1ARA8jArFIT26NNo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-CpM_PmI6MEKi1XFFZnPQxA-1; Fri, 09 Apr 2021 09:17:25 -0400
X-MC-Unique: CpM_PmI6MEKi1XFFZnPQxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17EBD64149
 for <qemu-devel@nongnu.org>; Fri,  9 Apr 2021 13:17:24 +0000 (UTC)
Received: from redhat.com (ovpn-115-36.ams2.redhat.com [10.36.115.36])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 952016064B;
 Fri,  9 Apr 2021 13:17:16 +0000 (UTC)
Date: Fri, 9 Apr 2021 14:17:13 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v3 0/8] [RfC] fix tracing for modules
Message-ID: <YHBT2ZLdIesZOR4Q@redhat.com>
References: <20210121125028.3247190-1-kraxel@redhat.com>
 <20210203163202.GF241524@stefanha-x1.localdomain>
 <20210222151332.vea6cszd4pwtkeno@sirius.home.kraxel.org>
 <YFiHnr/uguP8/Vtz@redhat.com>
 <20210409131245.oqeu4ooueazqfcir@sirius.home.kraxel.org>
MIME-Version: 1.0
In-Reply-To: <20210409131245.oqeu4ooueazqfcir@sirius.home.kraxel.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 09, 2021 at 03:12:45PM +0200, Gerd Hoffmann wrote:
>   Hi,
> 
> > eg a trace point "dma_map_wait" gets mapped to probes in many
> > .stp files, once per target, because we need to match based on
> > the executable path:
> > 
> >   probe qemu.system.x86_64.dma_map_wait = process("/usr/libexec/qemu-system-x86_64").mark("dma_map_wait")
> 
> So, that changes with modules, we need the module name now, i.e.
> 
>     probe qemu.system.x86_64.qxl_soft_reset = \
> 	process("/home/kraxel/qemu-install/lib/qemu/hw-display-qxl.so").mark("qxl_soft_reset")
> 
> We could repeat that in every qemu-system-$arch.stp file.

This would have the surprise the 'qemu.system.x86_64.qxl_soft_reset'
probes will fire even for qemu-system-ppc64 / qemu-system-xxxxx etc
because we've not restricted the scope as the original probe did.

If we can't fix that, then we must use the second option to avoid
the surprise IMHO

> We could also have one stp file per module, with probes like this:
> 
>     probe qemu.modules.qxl_soft_reset = \
>         process("/home/kraxel/qemu-install/lib/qemu/hw-display-qxl.so").mark("qxl_soft_reset")
> 
> The later looks like a better fit to me, but has the drawback that the
> tracepoints have different names in modular and non-modular builds ...

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


