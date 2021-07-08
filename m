Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C433C17D8
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 19:11:48 +0200 (CEST)
Received: from localhost ([::1]:42372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1XYx-0002N1-3r
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 13:11:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m1X5n-0002G2-CB
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1m1X5k-0008SG-FO
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:41:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625762491;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pLiE7F4xKbWjwTGLYDG5ejF+BxM6X2by2sWv6mtkQZg=;
 b=O5t7uQb2IH31WRtZX6Ehup30Ru66zohjAslM7soQSd1w+VMu8qwlJqgGrnyuD7NbSuA1c/
 kcFw5gkoZxRbz/vMqpdaqI+e3GnUNEGAMxDCbWMpv0GvpJ3sIAJPwxZ/pAbl+Oe7vqemWJ
 kHJ4/TvQkK02P17sHutGn4X8xgTcenA=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-314-RdE944Y7NOWjObzBgwh3Sw-1; Thu, 08 Jul 2021 12:41:30 -0400
X-MC-Unique: RdE944Y7NOWjObzBgwh3Sw-1
Received: by mail-pg1-f199.google.com with SMTP id
 u8-20020a6345480000b0290227a64be361so4971021pgk.9
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pLiE7F4xKbWjwTGLYDG5ejF+BxM6X2by2sWv6mtkQZg=;
 b=fqmv8hky2DBHf0zRlU3FjwSg56VjryVtK4TtqAYL8+BMrI1AV3ifaPRaQpemenDVdX
 v+0bPOe9MMmsmYPxNNUcYPk55Jr0PA8L1b0/0HIM8rqT3JgQgzEmdrBsAQ3wx/oZAa3+
 AL9FD0TabBRF5Jya6nQbTGSbondDQM954s8mz7whIil+V+VAhMIjJm2hedUN2/mS4yv1
 LK3Pi/4quqgMaY3j+8m32ofrtuqlKheFcQwWsx72sDgP0lpJ4zgi9t+H2eoWKiL8yxfy
 kDjhrPFxLAWTnBZh2jPzfbyeZ4nOnY1At3FRevYN6nLc7Yy7yDBB69TcUQ3/RtMxCDDb
 AQ5A==
X-Gm-Message-State: AOAM530mmD+SOQBB86HsPUJ4VvfS7YyGyqAV2NXUKQW2JiEAUni1NQLW
 gMD7bp8ZPT5g/gnCvPyFkDeB/rmAa0bxKA9HHss7mhh+zjCogpx6IhCNZ+ZijR9RYyBsVsO4sNJ
 ROSKgFTcbNI5ukyg=
X-Received: by 2002:a63:2b92:: with SMTP id
 r140mr32624122pgr.394.1625762487806; 
 Thu, 08 Jul 2021 09:41:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX/cwZlQWRra/nhJY9RwBeAQBPowC4phu/QwP52KvtL+ieuYVbr71LWZE34tBZUPtVaVYcHQ==
X-Received: by 2002:a63:2b92:: with SMTP id
 r140mr32624091pgr.394.1625762487544; 
 Thu, 08 Jul 2021 09:41:27 -0700 (PDT)
Received: from [192.168.1.183] (c-76-27-223-100.hsd1.or.comcast.net.
 [76.27.223.100])
 by smtp.gmail.com with ESMTPSA id k19sm3017425pji.32.2021.07.08.09.41.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 09:41:27 -0700 (PDT)
Subject: Re: [PATCH v3 0/2] x86/sev: Measured Linux SEV guest with
 kernel/initrd/cmdline
To: Paolo Bonzini <pbonzini@redhat.com>
References: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <2dc6c60e-48f8-7c6f-6131-0bc1020e106f@redhat.com>
Date: Thu, 8 Jul 2021 09:41:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210624102040.2015280-1-dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Paolo,

Please consider this series[1] for inclusion into your next pull request.

Just a note that this series has a companion series that is getting
upstreamed into OVMF[2]

[1] Patchwork link, if convenient: https://patchwork.kernel.org/project/qemu-devel/cover/20210624102040.2015280-1-dovmurik@linux.ibm.com/
[2] https://bugzilla.tianocore.org/show_bug.cgi?id=3457#c6

Thank you,

Connor

On 6/24/21 3:20 AM, Dov Murik wrote:
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
> 
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
> 


