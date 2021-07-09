Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A7723C1F93
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 08:57:13 +0200 (CEST)
Received: from localhost ([::1]:47156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1kRk-0004FZ-7z
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 02:57:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1kQL-0002aq-RM
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 02:55:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25301)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m1kQI-0006JX-4u
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 02:55:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625813740;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DxMHwXs4LMFoNqf5GhcJkS6wSal7fkwZlyZ1LYf8qcI=;
 b=glq+ZVWYkc92IVye61OSiBzYrv4NTDe/bUlKwSVMZ6hm9WkzA0arKuXs5KvV/Txv76aIVn
 h2PQeC0+2x5mKk+2AJ7IJsYSVw3rOYnXSfo1YV4xChwG2sIn759k2PgMjLyW5KybLvNXy2
 B+ZIQWIbIKCOZzf3+qxO/VCiVizOxVY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-yOICoBEkMXWa87HAIf3gYA-1; Fri, 09 Jul 2021 02:55:38 -0400
X-MC-Unique: yOICoBEkMXWa87HAIf3gYA-1
Received: by mail-wr1-f69.google.com with SMTP id
 k3-20020a5d52430000b0290138092aea94so2463733wrc.20
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 23:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DxMHwXs4LMFoNqf5GhcJkS6wSal7fkwZlyZ1LYf8qcI=;
 b=oGjP8TYMvs5AL2AR/qC0kIgdYUrB7VTOqv+CweZ+VEmTf8eX5E+ZVGkWKPAPuR8EXp
 7JB36/9KUJKRM0LAvuyhSPd7TDfegeb7HsqifO0zWpngvpTSv+Pi5a6dpyVYW0686UQj
 7aS60+nSE/lxHJjGAS6a/Pq1tJasCi1akFl6GKgeniDP0R8cLgJsc7iWMEXcMau5j0Yq
 APlgS/kWz4pFx82Avscdoe2XBRQLZdy77HW5W28dScOktbhceyJthzcdoeA9qPLdyebr
 ArIxM7HUX5VxBoL3Pdqx3FJJDZ//+66i82SkpzHvqnjDuvO1GXSaTtXej2c6aFcApvB7
 4Ucw==
X-Gm-Message-State: AOAM530RqKM2ZJSpvZNOUHVUypaMGeeithgSuoQOt2H9MOOfotJ9FR7U
 5D9IBKpkq3szC4SLQyifelaJvq6CClIM1atzoFSKbh61pxYZqTFe5ezYgKsEVFXEG+h1SEHPff2
 c9ob2PCMMaFF3W7A=
X-Received: by 2002:adf:e546:: with SMTP id z6mr13524195wrm.245.1625813737060; 
 Thu, 08 Jul 2021 23:55:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzGGLZTIC9QWvBrAx+VjWQQhjlphbGJ9r02aBRiZ9YHTqT5QW9OKiYJhXcC85YbHBhHR2z4lA==
X-Received: by 2002:adf:e546:: with SMTP id z6mr13524156wrm.245.1625813736811; 
 Thu, 08 Jul 2021 23:55:36 -0700 (PDT)
Received: from redhat.com ([2.55.150.102])
 by smtp.gmail.com with ESMTPSA id z5sm1040056wrw.18.2021.07.08.23.55.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jul 2021 23:55:35 -0700 (PDT)
Date: Fri, 9 Jul 2021 02:55:30 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Dov Murik <dovmurik@linux.ibm.com>
Subject: Re: [PATCH v3 0/2] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
Message-ID: <20210709025512-mutt-send-email-mst@kernel.org>
References: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
MIME-Version: 1.0
In-Reply-To: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 24, 2021 at 10:20:38AM +0000, Dov Murik wrote:
> Currently booting with -kernel/-initrd/-append is not supported in SEV
> confidential guests, because the content of these blobs is not measured
> and therefore not trusted by the SEV guest.
> 
> However, in some cases the kernel, initrd, and cmdline are not secret
> but should not be modified by the host.  In such a case, we want to
> verify inside the trusted VM that the kernel, initrd, and cmdline are
> indeed the ones expected by the Guest Owner, and only if that is the
> case go on and boot them up (removing the need for grub inside OVMF in
> that mode).
> 
> To support that, OVMF adds a special area for hashes of
> kernel/initrd/cmdline; that area is expected to be filled by QEMU and
> encrypted as part of the initial SEV guest launch.  This in turn makes
> the hashes part of the PSP measured content, and OVMF can trust these
> inputs if they match the hashes.
> 
> This series adds an SEV function to generate the table of hashes for
> OVMF and encrypt it (patch 1/2), and calls this function if SEV is
> enabled when the kernel/initrd/cmdline are prepared (patch 2/2).
> 
> Corresponding OVMF support was submitted to edk2-devel [1] (patch series
> "Measured SEV boot with kernel/initrd/cmdline"); it's still under
> review.
> 
> [1] https://edk2.groups.io/g/devel/topic/patch_v1_0_8_measured_sev/83074450


Now that I figured the measurement angle

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> 
> v3 changes:
>  - initrd hash is now mandatory; if no -initrd is passed, calculate the
>    hash of the empty buffer.  This is now aligned with the OVMF
>    behaviour which verifies the empty initrd (correctly).
>  - make SevHashTable entries fixed: 3 entries for cmdline, initrd, and kernel.
>  - in sev_add_kernel_loader_hashes: first calculate all the hashes, only then
>    fill-in the hashes table in the guest's memory.
>  - Use g_assert_not_reached in sev-stub.c.
>  - Use QEMU_PACKED attribute for structs.
>  - Use QemuUUID type for guids.
>  - in sev_add_kernel_loader_hashes: use ARRAY_SIZE(iov) instead of literal 2.
> 
> v2: https://lore.kernel.org/qemu-devel/20210621190553.1763020-1-dovmurik@linux.ibm.com/
> v2 changes:
>  - Extract main functionality to sev.c (with empty stub in sev-stub.c)
>  - Use sev_enabled() instead of machine->cgs->ready to detect SEV guest
>  - Coding style changes
> 
> v1: https://lore.kernel.org/qemu-devel/20210525065931.1628554-1-dovmurik@linux.ibm.com/
> 
> Dov Murik (2):
>   sev/i386: Introduce sev_add_kernel_loader_hashes for measured linux
>     boot
>   x86/sev: generate SEV kernel loader hashes in x86_load_linux
> 
>  target/i386/sev_i386.h |  12 ++++
>  hw/i386/x86.c          |  25 +++++++-
>  target/i386/sev-stub.c |   5 ++
>  target/i386/sev.c      | 137 +++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 178 insertions(+), 1 deletion(-)
> 
> 
> base-commit: b22726abdfa54592d6ad88f65b0297c0e8b363e2
> -- 
> 2.25.1


