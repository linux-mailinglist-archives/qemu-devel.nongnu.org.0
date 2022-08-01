Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A50B5866CA
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Aug 2022 11:20:54 +0200 (CEST)
Received: from localhost ([::1]:39144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oIRbW-0000PL-3c
	for lists+qemu-devel@lfdr.de; Mon, 01 Aug 2022 05:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39072)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIRY2-0007La-Hc
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 05:17:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1oIRXy-0000ql-Kf
 for qemu-devel@nongnu.org; Mon, 01 Aug 2022 05:17:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659345428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=dKqeGN4YuDFGb7B2Ds6dGWUWz3qAHa018mdUKFPqVXg=;
 b=WSrszbxIt0JIt858IK4nyLnPyJnlMiXgjbtjR3eYAktCjn4z4Lpi/tz0I8IkDuGPz1Wopj
 Zmgv/V2cIJsQM5hMCTO7RP2Rip95bhk51Km36SiSQEPvPSXDyTC8HbYA7VjUZq/FhMi5Be
 uNUfpyAytdJzGToQp/6yG3+nacodPro=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-64-7GqsJ7dwM4WS60nA5r8KRA-1; Mon, 01 Aug 2022 05:17:07 -0400
X-MC-Unique: 7GqsJ7dwM4WS60nA5r8KRA-1
Received: by mail-wr1-f70.google.com with SMTP id
 v5-20020adfa1c5000000b002205c89c80aso848241wrv.6
 for <qemu-devel@nongnu.org>; Mon, 01 Aug 2022 02:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=dKqeGN4YuDFGb7B2Ds6dGWUWz3qAHa018mdUKFPqVXg=;
 b=TvCN03x6K9iCn38giXyzy7NImSE7GU4y12uWMPu+MxUxTfG1IRaxvx8vbHcZgUc5hL
 fub3KNKfB+A0kzUyokSBdomuM897BqtZfVzkXJW5iqvIS+v7mDMjRa/htrH0VkGqZq2I
 OcfqKuAMKQfFkotrkZHB7XmTwxGU5f7TsXG7DLsuTAmu1wCvmA0F3ukX+WoezMvxnwgF
 kQsFTesdcH7u3EUzV6frx5S54EP4DPi69CzLcnFvriqkiVaNxFXY03/ME5KLw2tJenYO
 /VA71PIp4kVjUvfSqvJRb2LO1BngsMw38ihDiExMF/PyN8DmV94Udx3OiRrNwZTX/lLi
 RdRQ==
X-Gm-Message-State: ACgBeo07aUGrnS1MSFgZhynG6G/dOYuDcJnAqsfIdWl5Zj6E9kdMQyVQ
 HeQJv6yQR6dIaSu1OVlfIIwyUtU5CDtzfGC8LaCQaTX+nw9Xkp0v1ace+uQhvwgAqo2lTt7D/sQ
 nfyUyAjIr7PJYtaI=
X-Received: by 2002:adf:fd0d:0:b0:21e:f27b:10dd with SMTP id
 e13-20020adffd0d000000b0021ef27b10ddmr9833248wrr.295.1659345426406; 
 Mon, 01 Aug 2022 02:17:06 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7klMeTwKH+2Rssolsl07pZyRbw8tJA5EHBk+GC7O8pHdYdHpSVGgHknSznA5RyFHhQWFaNAQ==
X-Received: by 2002:adf:fd0d:0:b0:21e:f27b:10dd with SMTP id
 e13-20020adffd0d000000b0021ef27b10ddmr9833224wrr.295.1659345426133; 
 Mon, 01 Aug 2022 02:17:06 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 p18-20020a5d4592000000b0021f73c66198sm7058285wrq.1.2022.08.01.02.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Aug 2022 02:17:05 -0700 (PDT)
Date: Mon, 1 Aug 2022 10:17:03 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 ani@anisinha.ca, mst@redhat.com
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
Message-ID: <YueaDxgaMNGLezQd@work-vm>
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <YuKgxM4IjAXh/goO@work-vm> <20220728165411.5701befb@redhat.com>
 <YuKmuvgqMQtTXVjX@work-vm>
 <CAFEAcA-H=P44_e9qbKiGiCXjs9JPCmhEK5qp23TLX229G=Y6rg@mail.gmail.com>
 <20220729115753.60d99772@redhat.com>
 <CAFEAcA_Xa68t7N1MgCy6=xYvE9Cr6SM2xZp-iDdx_e8+tFwpCw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA_Xa68t7N1MgCy6=xYvE9Cr6SM2xZp-iDdx_e8+tFwpCw@mail.gmail.com>
User-Agent: Mutt/2.2.6 (2022-06-05)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
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

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Fri, 29 Jul 2022 at 10:57, Igor Mammedov <imammedo@redhat.com> wrote:
> >
> > On Thu, 28 Jul 2022 16:12:34 +0100
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > > On Thu, 28 Jul 2022 at 16:09, Dr. David Alan Gilbert
> > > <dgilbert@redhat.com> wrote:
> > > >
> > > > * Igor Mammedov (imammedo@redhat.com) wrote:
> > > > > On Thu, 28 Jul 2022 15:44:20 +0100
> > > > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > > > >
> > > > > > * Igor Mammedov (imammedo@redhat.com) wrote:
> > > > > > > QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
> > > > > > >   $ qemu-system-mips -monitor stdio
> > > > > > >   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> > > > > > >   Segmentation fault (core dumped)
> > > > > > >
> > > > > > > It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> > > > > > > which are valid only for x86 and not for MIPS (as it requires ACPI
> > > > > > > tables support which is not existent for ithe later)
> > > > > > >
> > > > > > > Issue was probably exposed by trying to cleanup/compile out unused
> > > > > > > ACPI bits from MIPS target (but forgetting about migration bits).
> > > > > > >
> > > > > > > Disable compiled out features using compat properties as the least
> > > > > > > risky way to deal with issue.
> > > > > >
> > > > > > Isn't the problem partially due to a 'stub' vmsd which isn't terminated?
> > > > >
> > > > > Not sure what "'stub' vmsd" is, can you explain?
> > > >
> > > > In hw/acpi/acpi-pci-hotplug-stub.c there is :
> > > > const VMStateDescription vmstate_acpi_pcihp_pci_status;
> > I think that one is there only for linking purposes and not meant
> > to be actually used.
> 
> Yes, exactly. The problem is that without this patch which
> sets various properties it *does* get used...
> 
> > > > this seg happens when the migration code walks into that - this should
> > > > always get populated with some of the minimal fields, in particular the
> > > > .name and .fields array terminated with VMSTATE_END_OF_LIST().
> > >
> > > Either:
> > >  (1) we should be sure the vmstate struct does not get used if the
> > >      compile-time config has ended up with the stub
> > > or
> >
> > >  (2) it needs to actually match the real vmstate struct, otherwise
> > >      migration between a QEMU built with a config that just got the
> > >      stub version and a QEMU built with a config that got the full
> > >      version will break
> > >
> > > This patch does the former. Segfaulting if we got something wrong
> > > and tried to use the vmstate when we weren't expecting to is
> > > arguably better than producing an incompatible migration stream.
> >
> > > (Better still would be if we caught this on machine startup rather
> > > than only when savevm was invoked.)
> > Theoretically possible with a bunch of mips and x86 stubs, but ...
> > we typically don't do this kind of checks for migration sake
> > as that complicates things a lot in general.
> > i.e. it's common to let migration fail in case of incompatible
> > migration stream. It's not exactly friendly to user but it's
> > graceful failure (assuming code is correct and not crashes QEMU)
> 
> The point here is that if we ever try to do a migrate with the
> stub vmstate struct then that's a bug in QEMU. We should prefer
> to catch those early and clearly.

I'd rather have something that was explicitly poisoned rather than just
walking off the end of an uninitialised array and having to break out
gdb.

Dave

> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


