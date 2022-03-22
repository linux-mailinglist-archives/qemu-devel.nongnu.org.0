Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 676AC4E3CFF
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 11:54:06 +0100 (CET)
Received: from localhost ([::1]:46370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWc9N-0004rK-GX
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 06:54:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWc7E-0002lO-8r
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:51:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46720)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nWc7B-0008HE-FQ
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 06:51:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647946308;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=44YSN+QTQaaBGO+fb/OTwW8VxyUI8gU87xDJF7RXyhw=;
 b=e7epmEUqQKpC3GY5Z0eqq/D6wcXplxObfxrP7XPa8gM/4+zcnSAzcv+r32RboyNCKjjj5j
 rig870qVdoKDVWfCQL8ehjlywjwuVUhukv+et/gqyM39k4SxAyvfvUlqM5eH1jJF4HO0da
 MTaJGNmjDbhD2tBDngIAzzhu3ri0PAA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-473-u34sQgP9MmmveWh_9rXIag-1; Tue, 22 Mar 2022 06:51:45 -0400
X-MC-Unique: u34sQgP9MmmveWh_9rXIag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AC0D51C07833;
 Tue, 22 Mar 2022 10:51:44 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.0])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 177B7141DEFA;
 Tue, 22 Mar 2022 10:51:40 +0000 (UTC)
Date: Tue, 22 Mar 2022 10:51:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [RFC PATCH v3 17/36] pflash_cfi01/tdx: Introduce ram_mode of
 pflash for TDVF
Message-ID: <YjmqOolbafWkMEHN@redhat.com>
References: <20220317135913.2166202-1-xiaoyao.li@intel.com>
 <20220317135913.2166202-18-xiaoyao.li@intel.com>
 <f418548e-c24c-1bc3-4e16-d7a775298a18@gmail.com>
 <7a8233e4-0cae-b05a-7931-695a7ee87fc9@intel.com>
 <20220322092141.qsgv3pqlvlemgrgw@sirius.home.kraxel.org>
 <YjmXFZRCbKXTkAhN@redhat.com>
 <20220322103518.ljbi4pvghbgjxm7k@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20220322103518.ljbi4pvghbgjxm7k@sirius.home.kraxel.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: isaku.yamahata@intel.com, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>,
 seanjc@google.com, erdemaktas@google.com, Paolo Bonzini <pbonzini@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 22, 2022 at 11:35:18AM +0100, Gerd Hoffmann wrote:
>   Hi,
> 
> > > Just using -bios OVMF.fd might work too.  Daniel tried that recently for
> > > sev, but ran into problems with wiring up ovmf metadata parsing for
> > > -bios.  Don't remember the details though.
> > 
> > It was related to the BIOS shadowing, whereby QEMU loads it at one
> > address, and then when CPUs start it is copied to another address.
> 
> Is this the top 128k of the firmware being copied below 1M so the
> firmware reset vector is available in real mode address space?

It was the 'rom_reset' method in hw/core/loader.c that was involved
in the root of the problem, copying the firmware from ROM to RAM.

At the time I did try a gross hack that (IIRC) disabled the
rom_reset logic, and munged x86_bios_rom_init so that it would
force load it straight at the RAM location. I couldn't figure
out an attractive way to make this into something supportable,
so abandoned the whole idea. Messing with this area of code is
a somewhat beyond my level of understanding of x86 boot process
anyway.

> > This was not compatible with the way AMD SEV wants to do measurement
> > of the firmware. May or may not be relevant for TDX, I don't know
> > enough about TDX to say.
> 
> TDX boots in 32bit mode, so simply skipping any real mode compatibility
> stuff shouldn't cause any problems here.
> 
> Not sure about SEV.  There is this SevProcessorReset entry in the ovmf
> metadata block.  Is that the SEV reset vector?  If SEV cpu bringup
> doesn't go through real mode either we maybe can just skip the BIOS
> shadowing setup for confidential computing guests ...


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


