Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B67D6253FA
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 07:43:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otNkq-0004sJ-R0; Fri, 11 Nov 2022 01:43:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1otNkm-0004rf-Nb
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:43:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mrezanin@redhat.com>)
 id 1otNkl-0007J7-3D
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 01:43:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668148981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQUJ/OtQmKoCyPCGHue208+VWQ81MIVjff99BbH3mv8=;
 b=UkUj3KlR2z7yAJAYYuVctAsCgpBwaiE79VMtW7OdC93Fm6G/ilOOI6jZTa/TFc/A/xIAXr
 F7ELl8jf55RLBt4PsoLvvztdontPMsi4BJH+kKEBVGfJHgzKGDMiSMp4XyOw0ebxpsOZcp
 dJlDBcYq8VfY4DgPi2hhoIfr3hlbYw4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-584-5ZIr1wKvMMmO5NWr7fbZjQ-1; Fri, 11 Nov 2022 01:42:58 -0500
X-MC-Unique: 5ZIr1wKvMMmO5NWr7fbZjQ-1
Received: by mail-ej1-f70.google.com with SMTP id
 qb20-20020a1709077e9400b007ae67a9aa7dso2508693ejc.16
 for <qemu-devel@nongnu.org>; Thu, 10 Nov 2022 22:42:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sQUJ/OtQmKoCyPCGHue208+VWQ81MIVjff99BbH3mv8=;
 b=lW9FgEsJclZnAmCjhybE5n7ytMW88pohv9mxrwP59g2OFPkL2uuxZkQVHPx46N0RTp
 JY3sytI74PltXJpS97JMVqeQUajdaZ+50VujxnN6u77QYtkueun1v19+FysZ1mOFkm2z
 FwEaukfRXmfiQiHPXXOQK/otixbwQCWcUFQlpKER+lnl6JwuXRLneSOnKZP5ZB4BuUM8
 XmNbJJUO60TNPf9jVFZA2j+3FY835WLSMwQ5CBfGdDR09S3oHLB15ciLdwCYID5ki3/z
 sQaSCooU3QFRmN3xuDry5yNrZP6tJYMErG8qWatw2wRSCJDz13BqeBE6p8Wga0I7Hu2U
 ZigA==
X-Gm-Message-State: ANoB5pk+DoYEp5gOf/Ppvcr1Js9Lh4c/f23y9YsAXPe+kJtafnMpXAEG
 b9ObiHcgE806+i4BWKxIfMzKQfeioLsj+XaFMpla81LzzAEpYuFeVmbC8sDMGJxEqNivL5Rxi0K
 Ly7e4dt/XYTxd/oPOc9tIBhB6M3oFnuc=
X-Received: by 2002:a17:906:b102:b0:7ae:129b:2ce7 with SMTP id
 u2-20020a170906b10200b007ae129b2ce7mr788763ejy.92.1668148977292; 
 Thu, 10 Nov 2022 22:42:57 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4F9OOcz7FqK9EDQAZ2Z8EK4Alu4H5GSh5y824bCAaF71IActAGaBJ5X3toORt1H5YrvbRgeS2Q8RDVrQxEL1g=
X-Received: by 2002:a17:906:b102:b0:7ae:129b:2ce7 with SMTP id
 u2-20020a170906b10200b007ae129b2ce7mr788756ejy.92.1668148977134; Thu, 10 Nov
 2022 22:42:57 -0800 (PST)
MIME-Version: 1.0
References: <20221109153417.49132-1-mrezanin@redhat.com>
 <e5581406-3ce2-9586-5d5e-0277375747da@linaro.org>
In-Reply-To: <e5581406-3ce2-9586-5d5e-0277375747da@linaro.org>
From: Miroslav Rezanina <mrezanin@redhat.com>
Date: Fri, 11 Nov 2022 07:42:45 +0100
Message-ID: <CAKRGJ0BZoRiTmi6QtMLJ2ALzSNApssqCs2a8yKxmOoYZ1S+hew@mail.gmail.com>
Subject: Re: [PATCH] Add missing pixman dependecy
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, imammedo@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mrezanin@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Wed, Nov 9, 2022 at 5:14 PM Philippe Mathieu-Daud=C3=A9 <philmd@linaro.o=
rg> wrote:
>
> Hi Mirek,
>
> On 9/11/22 16:34, mrezanin@redhat.com wrote:
> > From: Miroslav Rezanina <mrezanin@redhat.com>
> >
> > Commit cfead31326 'acpi: pc: vga: use AcpiDevAmlIf interface to build V=
GA device descriptors' added
> > a new file - acpi-vga.c. This file (indirectly) includes pixman.h file =
so we need to ensure pixman
> > is available when file is compiled.
>
> We don't need this dependency if we move the build_vga_aml() declaration
> out of hw/display/vga_int.h, i.e. hw/display/acpi-vga.h.
>

I'm not confident enough to change header files, especially during RC
phase. I followed the pattern used in the hw/display/meson.build as we
need this to be fixed before GA.

Mirek

> Regards,
>
> Phil.
>


--=20
Miroslav =C5=98ezanina
Virtualization Team - Maintainer


