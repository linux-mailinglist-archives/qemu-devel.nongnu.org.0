Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5B9D456D12
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 11:14:46 +0100 (CET)
Received: from localhost ([::1]:46540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo0ur-0006RT-Qf
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 05:14:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mo0rM-0003rm-VP
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:11:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mo0qv-0002Op-KD
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 05:11:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637316632;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Qplh+AR/Q9oM/wDzM2kpi4a9HIjQuCh3K0zBRboUY9I=;
 b=MfEtdEiF3CtcEJBpcfzKkJ+qd0qJ+4bLpCL1HALB6mushsnX9y62dU46+UkEgwMW4rcbMA
 e9GzpMFk5B+gc7IPUJlvYHgTNGCsIe3xwAT/UCYdLCgAINKwAK3utt8jl2MHMMzB1xcOh2
 7O1vqHgktjqTtBrYLgC40OGzpBSDHf4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-125-xBun3X1ROm6k3eOzFZYPZw-1; Fri, 19 Nov 2021 05:10:25 -0500
X-MC-Unique: xBun3X1ROm6k3eOzFZYPZw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E1E98100C661;
 Fri, 19 Nov 2021 10:10:24 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.110])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D6A695D9DE;
 Fri, 19 Nov 2021 10:10:22 +0000 (UTC)
Date: Fri, 19 Nov 2021 10:10:19 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-6.2 2/2] hw/display: Do not allow multiple identical
 VGA devices
Message-ID: <YZd4CwBciBOsjhrR@redhat.com>
References: <20211118192020.61245-1-philmd@redhat.com>
 <20211118192020.61245-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211118192020.61245-3-philmd@redhat.com>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>, "Jose R . Ziviani" <jziviani@suse.de>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 18, 2021 at 08:20:20PM +0100, Philippe Mathieu-Daudé wrote:
> vga_common_init() create a MemoryRegion named "vga.vram",
> used as a singleton for the device class. When creating
> the same device type multiple times, we get:
> 
>   $ qemu-system-mips64 -M pica61 -device isa-cirrus-vga
>   RAMBlock "vga.vram" already registered, abort!
>   Aborted (core dumped)

Admittedly that would Callers that aren't ready to 

> 
> Commit 7852a77f598 ("vga: don't abort when adding a duplicate
> isa-vga device") added a check for a single device, generalize
> it to all VGA devices which call vga_common_init():

Not all current VGA devices abort though

 $ qemu-system-x86_64 -device cirrus-vga -device cirrus-vga

runs without aborting.

Your goal was to eliminate the abort() scenario, which
makes sense, but we hit other scenarios too.

How about we instead have vmstate_register_ram() gain
an "Error **errp" so it can propagate the failure into
vga_common_init rather than aborting.  That would
ensure we only affect scenarios that curently abort
and nothing more.

Other callers can pass &error_abort if they dont want
to gracefully handle this scenario.

> 
>   $ qemu-system-mips64 -M pica61 -device isa-cirrus-vga
>   qemu-system-mips64: -device isa-cirrus-vga: at most one isa-cirrus-vga device is permitted
> 
> Reported-by: John Snow <jsnow@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/44
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/display/vga-isa.c |  9 ---------
>  hw/display/vga.c     | 13 +++++++++++++
>  2 files changed, 13 insertions(+), 9 deletions(-)
> 
> diff --git a/hw/display/vga-isa.c b/hw/display/vga-isa.c
> index 2782012196a..b930c8d2667 100644
> --- a/hw/display/vga-isa.c
> +++ b/hw/display/vga-isa.c
> @@ -62,15 +62,6 @@ static void vga_isa_realizefn(DeviceState *dev, Error **errp)
>      MemoryRegion *vga_io_memory;
>      const MemoryRegionPortio *vga_ports, *vbe_ports;
>  
> -    /*
> -     * make sure this device is not being added twice, if so
> -     * exit without crashing qemu
> -     */
> -    if (object_resolve_path_type("", TYPE_ISA_VGA, NULL)) {
> -        error_setg(errp, "at most one %s device is permitted", TYPE_ISA_VGA);
> -        return;
> -    }
> -
>      s->global_vmstate = true;
>      if (!vga_common_init(s, OBJECT(dev), errp)) {
>          return;
> diff --git a/hw/display/vga.c b/hw/display/vga.c
> index a6759c7e934..8f0d5cc9019 100644
> --- a/hw/display/vga.c
> +++ b/hw/display/vga.c
> @@ -2172,6 +2172,19 @@ bool vga_common_init(VGACommonState *s, Object *obj, Error **errp)
>  {
>      int i, j, v, b;
>  
> +    if (obj) {
> +        const char *typename = object_get_typename(obj);
> +
> +        /*
> +         * make sure this device is not being added twice,
> +         * if so exit without crashing qemu
> +         */
> +        if (object_resolve_path_type("", typename, NULL)) {
> +            error_setg(errp, "at most one %s device is permitted", typename);
> +            return false;
> +        }
> +    }
> +
>      for(i = 0;i < 256; i++) {
>          v = 0;
>          for(j = 0; j < 8; j++) {
> -- 
> 2.31.1
> 
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


