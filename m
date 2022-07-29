Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 596F9584E76
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 12:02:42 +0200 (CEST)
Received: from localhost ([::1]:43756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHMpM-0006oJ-LH
	for lists+qemu-devel@lfdr.de; Fri, 29 Jul 2022 06:02:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oHMkw-0003ly-SG
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:58:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47275)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1oHMkr-0000tb-VT
 for qemu-devel@nongnu.org; Fri, 29 Jul 2022 05:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659088679;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IrrVTR8KwTjDsWJmC/zasH0OvxQVPaRlvnGNNMZ7OFk=;
 b=aS2pKMwcXJUIWPC7y4jNusmTZRpFBFzyQxLklcvhkIxVmgoaqHBH9H0ZS4pDSEn1snNUXS
 PY92eYC1u0gyBP/unAnWnOJ4puD2bnHvxJkhsuW61o43np9KbcVPX04GcPGDZLZv6bA+z4
 YDnJnqIITPWZbyMwI656xONMNNeVJ1A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-KSvvZYy-NZGmfRxCsxkxaw-1; Fri, 29 Jul 2022 05:57:57 -0400
X-MC-Unique: KSvvZYy-NZGmfRxCsxkxaw-1
Received: by mail-ed1-f69.google.com with SMTP id
 z1-20020a05640235c100b0043bca7d9b3eso2611658edc.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jul 2022 02:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IrrVTR8KwTjDsWJmC/zasH0OvxQVPaRlvnGNNMZ7OFk=;
 b=Z0MdE8XcQgLboafDZxJ1y2nYQbmlZySMPf2CxehfSpINuhUy0Ktc+dK9kjJGZlMwDs
 o+bFYniH0Y2L0OzA/WhzBo4X8lgdLrdcaQi0utEYpAyjyQWvpLOC5aDIUc+lLp1zHY8h
 GzMeN0uRy0VezC/0vJsHI5HYWYuayKhXVCTMfqIodkZjw8OeNrU9kLD5JTjkOmKUr+SR
 sN3OJIL+zdLsCgbuZ+MYcY1iUURkamT/aPWCB+sr1VflBxAmdMOlq7EszyAXy35ooArJ
 06zNGPRGMvu015u2sCpR0K138D+ZZA8LZDYOGbmdFWg2URMkHqhi1jxhrZb1rk3kzDwm
 NKhg==
X-Gm-Message-State: AJIora8RnJxZJ+YlrNtmFk4GR0PJD19WhbYLAzwbQQWFbK09TgSB4EB0
 Pg/M+rU9OglMUdgSF9hCzHmXciIGldOfSbcQOIdHW/PDr4wbJFuqPM77zc5Rul0h6BCfee4g9qe
 vmWAZKpnsjGw/79w=
X-Received: by 2002:a05:6402:d45:b0:43c:b9f5:9ed1 with SMTP id
 ec5-20020a0564020d4500b0043cb9f59ed1mr2740426edb.309.1659088675775; 
 Fri, 29 Jul 2022 02:57:55 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uWC1+zWtmWZhj9wcdGzgRoVCFVm6p8RpjigoztvGZ1Dj0saM6nubJHC+wKs8NY+E7yrBmqXA==
X-Received: by 2002:a05:6402:d45:b0:43c:b9f5:9ed1 with SMTP id
 ec5-20020a0564020d4500b0043cb9f59ed1mr2740395edb.309.1659088675261; 
 Fri, 29 Jul 2022 02:57:55 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a17090653d000b0072f72e6c147sm1469740ejo.106.2022.07.29.02.57.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jul 2022 02:57:54 -0700 (PDT)
Date: Fri, 29 Jul 2022 11:57:53 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 f4bug@amsat.org, aurelien@aurel32.net, jiaxun.yang@flygoat.com,
 ani@anisinha.ca, mst@redhat.com
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features
 of PIIX4_PM
Message-ID: <20220729115753.60d99772@redhat.com>
In-Reply-To: <CAFEAcA-H=P44_e9qbKiGiCXjs9JPCmhEK5qp23TLX229G=Y6rg@mail.gmail.com>
References: <20220728115034.1327988-1-imammedo@redhat.com>
 <YuKgxM4IjAXh/goO@work-vm> <20220728165411.5701befb@redhat.com>
 <YuKmuvgqMQtTXVjX@work-vm>
 <CAFEAcA-H=P44_e9qbKiGiCXjs9JPCmhEK5qp23TLX229G=Y6rg@mail.gmail.com>
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
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

On Thu, 28 Jul 2022 16:12:34 +0100
Peter Maydell <peter.maydell@linaro.org> wrote:

> On Thu, 28 Jul 2022 at 16:09, Dr. David Alan Gilbert
> <dgilbert@redhat.com> wrote:
> >
> > * Igor Mammedov (imammedo@redhat.com) wrote:  
> > > On Thu, 28 Jul 2022 15:44:20 +0100
> > > "Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> > >  
> > > > * Igor Mammedov (imammedo@redhat.com) wrote:  
> > > > > QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
> > > > >   $ qemu-system-mips -monitor stdio
> > > > >   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
> > > > >   Segmentation fault (core dumped)
> > > > >
> > > > > It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> > > > > which are valid only for x86 and not for MIPS (as it requires ACPI
> > > > > tables support which is not existent for ithe later)
> > > > >
> > > > > Issue was probably exposed by trying to cleanup/compile out unused
> > > > > ACPI bits from MIPS target (but forgetting about migration bits).
> > > > >
> > > > > Disable compiled out features using compat properties as the least
> > > > > risky way to deal with issue.  
> > > >
> > > > Isn't the problem partially due to a 'stub' vmsd which isn't terminated?  
> > >
> > > Not sure what "'stub' vmsd" is, can you explain?  
> >
> > In hw/acpi/acpi-pci-hotplug-stub.c there is :
> > const VMStateDescription vmstate_acpi_pcihp_pci_status;
I think that one is there only for linking purposes and not meant
to be actually used.

> > this seg happens when the migration code walks into that - this should
> > always get populated with some of the minimal fields, in particular the
> > .name and .fields array terminated with VMSTATE_END_OF_LIST().  
> 
> Either:
>  (1) we should be sure the vmstate struct does not get used if the
>      compile-time config has ended up with the stub
> or

>  (2) it needs to actually match the real vmstate struct, otherwise
>      migration between a QEMU built with a config that just got the
>      stub version and a QEMU built with a config that got the full
>      version will break
>
> This patch does the former. Segfaulting if we got something wrong
> and tried to use the vmstate when we weren't expecting to is
> arguably better than producing an incompatible migration stream.

> (Better still would be if we caught this on machine startup rather
> than only when savevm was invoked.)
Theoretically possible with a bunch of mips and x86 stubs, but ...
we typically don't do this kind of checks for migration sake
as that complicates things a lot in general.
i.e. it's common to let migration fail in case of incompatible
migration stream. It's not exactly friendly to user but it's
graceful failure (assuming code is correct and not crashes QEMU)
 
> thanks
> -- PMM
> 


