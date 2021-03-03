Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 241A332B929
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 17:22:54 +0100 (CET)
Received: from localhost ([::1]:40418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHUGz-0000C4-7a
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 11:22:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lHUG3-00085n-GX
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:21:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20251)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lHUFz-0008GF-Hi
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 11:21:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614788509;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=vQsTQGk2QtM+nVJbYOEW9fwjuW5q8x8CI5FMIDApGbU=;
 b=B7Dp2Y34cF/UBRMdMCkmdEBpFXojaEydVcn99twtdJB32oYMaRAzXgs/EjomXOpVYVHuaj
 Fh93XEUP2CVhGjjoVf/CRKH4Tp36Z6ScJXHXvCUI9dAA6FXZrfx6ebRI/Ln/A6ISKvFjIj
 W0U/GgIDKqpgS+ORyL84nPrrZ/XxJ7U=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-z1HRDpWYMOSIDyzPNjIH3A-1; Wed, 03 Mar 2021 11:21:47 -0500
X-MC-Unique: z1HRDpWYMOSIDyzPNjIH3A-1
Received: by mail-ej1-f69.google.com with SMTP id h14so6786563ejg.7
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 08:21:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=vQsTQGk2QtM+nVJbYOEW9fwjuW5q8x8CI5FMIDApGbU=;
 b=SXXLceyski3NMNeIeCVMqnk20Th1CbpR3oFVoiP84Rmo/nE2hBJ2CNGm+PIwOVNZqQ
 kHFgzeDs878xl+ujUwrgQ7gFoHNMfdMm/Cu6X+yrwTl7XQE9Kr3kiUeaUgJT2rg2hChV
 UQ6IGTkzmY9ZtG11ee6u/J4NGk2X9lkypr+iDYCbs5hjRQ1NdRKpJU9oP0OulJqcmKJ5
 UVjAVcpyRGdAD+D3CAJKb1f2WFd9eZ3L5XQZ5c9ObxUQB+JciD6rvC9i0HHV8yF/6ycx
 FejKBOasqgFA3076k3XFUiCpbxlCeNkkt6aEGHr1P4OBVc2B+5NGd6qYdB2+3D57x47t
 vK7A==
X-Gm-Message-State: AOAM530PJhY2J1C0iG5TwBUQ9t6tdTaawVcbli23gYDgp2tgqeCPhF8/
 jow9930bS1yRwhNSP/cmbHNCjMeTLn0flT9myeQtwt9eEAMHZzCsTnYGingEsHz2jyIXode4EoG
 3BsF1dQr1HDSgYm8=
X-Received: by 2002:a17:906:af91:: with SMTP id
 mj17mr25512594ejb.230.1614788506122; 
 Wed, 03 Mar 2021 08:21:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdneVl4nxma8GQDS8IUh7aRSo9EQSQsFSywiQ7cJxG96/kOP2TKS1ut4Y4HhPn2fTWxYzrbA==
X-Received: by 2002:a17:906:af91:: with SMTP id
 mj17mr25512566ejb.230.1614788505826; 
 Wed, 03 Mar 2021 08:21:45 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id m10sm3890297ejx.10.2021.03.03.08.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 08:21:44 -0800 (PST)
Date: Wed, 3 Mar 2021 11:21:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Subject: Re: [PATCH v1] acpi: increase maximum size for "etc/table-loader" blob
Message-ID: <20210303111731-mutt-send-email-mst@kernel.org>
References: <20210301104833.45580-1-david@redhat.com>
 <20210302172323.6cac394a@MiWiFi-RA69-srv>
 <09fbdaa9-2882-2056-a5a2-2ca0da8c12cf@redhat.com>
 <7d8281a8-0479-ac81-c602-ed87c71ce3e2@redhat.com>
 <4bc8c306-48d2-8122-c096-dcac15170791@redhat.com>
 <20210303170916.278cdcc2@MiWiFi-RA69-srv>
MIME-Version: 1.0
In-Reply-To: <20210303170916.278cdcc2@MiWiFi-RA69-srv>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@xilinx.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 03, 2021 at 05:09:16PM +0100, Igor Mammedov wrote:
> On Wed, 3 Mar 2021 16:03:36 +0100
> Laszlo Ersek <lersek@redhat.com> wrote:
> 
> > On 03/02/21 19:43, David Hildenbrand wrote:
> > 
> > > We are dealing with different blobs here (tables_blob vs. cmd_blob).  
> > 
> > OK, thanks -- this was the important bit I was missing. Over time I've
> > lost track of the actual set of fw_cfg blobs that QEMU exposes, for the
> > purposes of the ACPI linker/loader.
> > 
> > I've looked up the acpi_add_rom_blob() calls in "hw/i386/acpi-build.c"
> > and "hw/arm/virt-acpi-build.c":
> > 
> >   hw       name                                         max_size                              notes
> >   -------  -------------------------------------------  ------------------------------------  ------
> > 
> >   virt     ACPI_BUILD_TABLE_FILE ("etc/acpi/tables")    ACPI_BUILD_TABLE_MAX_SIZE (0x200000)  n/a
> >   virt     ACPI_BUILD_LOADER_FILE ("etc/table-loader")  0                                     n/a
> >   virt     ACPI_BUILD_RSDP_FILE ("etc/acpi/rsdp")       0                                     simply modeled on i386 (below)
> > 
> >   i386     ACPI_BUILD_TABLE_FILE ("etc/acpi/tables")    ACPI_BUILD_TABLE_MAX_SIZE (0x200000)  n/a
> >   i386     ACPI_BUILD_LOADER_FILE ("etc/table-loader")  0                                     n/a
> >   i386     ACPI_BUILD_RSDP_FILE ("etc/acpi/rsdp")       0                                     d70414a5788c, 358774d780ee8
> > 
> >   microvm  ACPI_BUILD_TABLE_FILE ("etc/acpi/tables")    ACPI_BUILD_TABLE_MAX_SIZE (0x200000)  n/a
> >   microvm  "etc/table-loader"                           0                                     no macro for name???
> >   microvm  ACPI_BUILD_RSDP_FILE ("etc/acpi/rsdp")       0                                     simply modeled on i386 (above)
> > 
> > (I notice there are some other (optional) fw_cfg blobs too, related TPM,
> > vmgenid, nvdimm etc, using fw_cfg_add_file() rather than
> > acpi_add_rom_blob() -- so those are immutable (never regenerated). I
> > definitely needed this reminder...)
> 
> most of them are just guest RAM reservations (guest/hose exchange buffer)
> and "etc/tpm/config" seems to immutable for specific configuration
> 
> 
> > So, my observations:
> > 
> > (1) microvm open-codes "etc/table-loader", rather than using the macro
> > ACPI_BUILD_LOADER_FILE.
> > 
> > The proposed patch corrects it, which I welcome per se. However, it
> > should arguably be a separate patch. I found it distracting, in spite of
> > the commit message highlighting it. I don't insist though, I'm
> > admittedly rusty on this code.
> > 
> > 
> > (2) The proposed patch sets "max_size" to ACPI_BUILD_LOADER_MAX_SIZE for
> > each ACPI_BUILD_LOADER_FILE. Makes sense, upon constructing / reviewing
> > the above table.
> > 
> > (I'm no longer sure if tweaking the alignment were the preferable path
> > forward.)
> > 
> > Either way, I'd request including the above table in the commit message.
> > (Maybe drop the "notes" column.)
> > 
> > 
> > (3) The above 9 invocations are *all* of the acpi_add_rom_blob()
> > invocations. I find the interface brittle. It's not helpful to have so
> > many macros for the names and the max sizes. We should have a table with
> > three entries and -- minimally -- two columns, specifying name and
> > max_size -- possibly some more call arguments, if such can be extracted.
> > We should also have an enum type for selecting a row in this table, and
> > then acpi_add_rom_blob() should be called with an enum constant.
> > 
> > Of course, talk is cheap. :)
> > 
> > 
> > (4) When do we plan to introduce a nonzero "max_size" for
> > ACPI_BUILD_RSDP_FILE ("etc/acpi/rsdp")?
> > 
> > Is the current zero value a time bomb?
> 
> it's not likely to go over 4k, but if we enforce max_size!=0 we may set it 4k,
> which it's aligned to anyways.

Right. BTW there is an alternative I did not think of earlier.

Lots of tables are actually fixed. We currently let guest calculate
the checksum for all tables but that is not a must. We could prefill the
checksum for most of them and cut the size by almost half.

This fixes the issues in a way that seems cleaner to me as
it migrates both ways for all configs and saves some resources.
I'm not against making it resizeable too though.


> 
> > Put differently: acpi_add_rom_blob() should be *impossible* to call with
> > "max_size=0", arguably. *Whenever* we call acpi_add_rom_blob(), we do
> > that because the blob is resizable (mutable) -- but that also means we
> > should have a safety margin, does it not? So calling acpi_add_rom_blob()
> > with "max_size=0" looks self-contradictory.
> 
> main use-case for using acpi_add_rom_blob() is for mutable blobs,
> so that all these blobs were transferred during migration to the destination,
> to ensure that guest sees consistent data set (from source instead of mix of
> source/dst blobs).
> 
> Resize came later on, when we got sick of ad-hock (align)/size bumping of
> "etc/acpi/tables" in configurations where size was on verge of crossing
> border to the next aligned size and related knobs to keep that mess
> migratable.
> 
> > 
> > FWIW, this could be covered by the table proposed in point (3).
> > 
> > 
> > In total, I don't disagree with the patch (beyond the fact that the new
> > macro's value doesn't match the commit message), functionally speaking.
> > However, wrt. readability, I think the patch further complicates the
> > code. I'd suggest five patches:
> > 
> > #1 -- use "etc/table-loader" via the proper macro name in "microvm",
> > 
> > #2 -- rework acpi_add_rom_blob() for using a table of constants + an
> >       enum type,
> > 
> > #3 -- bump the "max_size" field for ACPI_BUILD_LOADER_FILE, for the
> >       current symptom,
> > 
> > #4 -- set a nonzero "max_size" for the remaining ACPI_BUILD_RSDP_FILE,
> >       for "future-proofing",
> > 
> > #5 -- in the new acpi_add_rom_blob() implementation, taking the enum,
> >       assert(max_size != 0).
> > 
> > (I haven't thought through what this would mean for migration, forward
> > or backward; I'm just brain-storming.)
> > 
> > Thanks
> > Laszlo


