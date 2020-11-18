Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CD12B826A
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 17:57:35 +0100 (CET)
Received: from localhost ([::1]:36242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfQly-00057b-UX
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 11:57:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kfQkL-0004SV-FU
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:55:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57182)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1kfQkI-0007Dv-Mu
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 11:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605718549;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ul54MnXH6FOQxECF0JvwmnK0ZwykxqQGORlrRJHF37Y=;
 b=Nnw5i2orB5ASjrOC+y+QSVxyGyTjWvjQXoFXoWN0UbRELaj7r+UyFPgMWHohatGKv3h5NM
 W3s0WYLdhb62UfSMoWXuC16bSi9+21QCVfxAG4yEi3BeT5IkkotTcm/uiSOW0xPViOoPvm
 eNfuNAf6XJTnXe3YhmYYFdRt7sTnbu0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-tP1iCaOcOMSg7Q-9X_ZCUg-1; Wed, 18 Nov 2020 11:55:46 -0500
X-MC-Unique: tP1iCaOcOMSg7Q-9X_ZCUg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 498F21005D54
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 16:55:45 +0000 (UTC)
Received: from localhost (unknown [10.40.208.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7AFC95D9CA;
 Wed, 18 Nov 2020 16:55:44 +0000 (UTC)
Date: Wed, 18 Nov 2020 17:55:43 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 11/29] vl: extract various command line desugaring
 snippets to a new function
Message-ID: <20201118175543.0c4df4ec@redhat.com>
In-Reply-To: <CABgObfajgDhspSzbuuwhKT=2UZ-SsJS5Py0qrwQvagTKbZoHFw@mail.gmail.com>
References: <20201027182144.3315885-1-pbonzini@redhat.com>
 <20201027182144.3315885-12-pbonzini@redhat.com>
 <20201111205715.2058792e@redhat.com>
 <CABgObfajgDhspSzbuuwhKT=2UZ-SsJS5Py0qrwQvagTKbZoHFw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/18 00:38:29
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 11 Nov 2020 21:04:53 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> Il mer 11 nov 2020, 20:57 Igor Mammedov <imammedo@redhat.com> ha scritto:
> 
> > On Tue, 27 Oct 2020 14:21:26 -0400
> > Paolo Bonzini <pbonzini@redhat.com> wrote:
> >  
> > > Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> > > ---
> > >  softmmu/vl.c | 40 ++++++++++++++++++++++------------------
> > >  1 file changed, 22 insertions(+), 18 deletions(-)
> > >
> > > diff --git a/softmmu/vl.c b/softmmu/vl.c
> > > index c2a5ee61f9..6749109b29 100644
> > > --- a/softmmu/vl.c
> > > +++ b/softmmu/vl.c
> > > @@ -126,6 +126,7 @@ static const char *boot_once;
> > >  static const char *incoming;
> > >  static const char *loadvm;
> > >  enum vga_retrace_method vga_retrace_method = VGA_RETRACE_DUMB;  
> >  
> > > +int mem_prealloc; /* force preallocation of physical target memory */  
> > Is there a reason for it not being static?
> >  
> 
> I will check if I am using it later in the series, but I don't think so.
with it fixed to static

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> 
> 
> > >  int display_opengl;
> > >  const char* keyboard_layout = NULL;
> > >  ram_addr_t ram_size;
> > > @@ -159,7 +160,7 @@ int fd_bootchk = 1;
> > >  static int no_reboot;
> > >  int no_shutdown = 0;
> > >  int graphic_rotate = 0;
> > > -const char *watchdog;
> > > +static const char *watchdog;
> > >  QEMUOptionRom option_rom[MAX_OPTION_ROMS];
> > >  int nb_option_roms;
> > >  int old_param = 0;
> > > @@ -2910,6 +2911,25 @@ static void qemu_validate_options(void)
> > >  #endif
> > >  }
> > >
> > > +static void qemu_process_sugar_options(void)
> > > +{
> > > +    if (mem_prealloc) {
> > > +        char *val;
> > > +
> > > +        val = g_strdup_printf("%d",
> > > +                 (uint32_t)  
> > qemu_opt_get_number(qemu_find_opts_singleton("smp-opts"), "cpus", 1));
> > if -smp isn't present it value used here was mc->default_cpus,
> > which in most cases is 1 modulo some ARM boards and riscv.
> >  
> 
> Yes, I remember noticing that but decided I would not care. I should have
> added it to the commit message, though.
> 
> Paolo


