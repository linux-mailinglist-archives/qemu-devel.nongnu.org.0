Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D14E2CE7DC
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Dec 2020 06:57:42 +0100 (CET)
Received: from localhost ([::1]:38656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kl468-0003s9-Un
	for lists+qemu-devel@lfdr.de; Fri, 04 Dec 2020 00:57:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1kl43y-0002WD-Ei
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 00:55:26 -0500
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642]:43383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dan.j.williams@intel.com>)
 id 1kl43t-0003dt-Rm
 for qemu-devel@nongnu.org; Fri, 04 Dec 2020 00:55:25 -0500
Received: by mail-ej1-x642.google.com with SMTP id jx16so6959419ejb.10
 for <qemu-devel@nongnu.org>; Thu, 03 Dec 2020 21:55:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DIoLkigUuznfdpJqxDjdyVPo16yJcn8VeLLf3HKKfVg=;
 b=pbc1yrtgx+wgsvpYgsLRbScGtqczaf0MaDPhFoVvvISZ+h8Zy5m0wpbSSEpqwJItqJ
 UvGqgtNanJD2reHF93w6+iTlGe5OBH3qXpnkh9s8HkCix6izgbLs6nnSMXxE1833mPr+
 RWh8c4Zj88RQsnRioL9WWiTjw2NAIltt7JnO553QWgP86tLASoFNlTVJMErR/F8bnYrq
 /rbSAa9iGgcoIJ7tYp7S1CREgCwmAf9tamY+Byvy3l7Y28GO8cRB/EMKVibGrguo5hsw
 uCKxC54U4vRQy/1QfX2UMuklH5w8xP3OSya1vmw10Ng89MPf1oQZAdZYKpC9IXwaTZYI
 ZVYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DIoLkigUuznfdpJqxDjdyVPo16yJcn8VeLLf3HKKfVg=;
 b=HVrEpaTcSsib74dUxYevh9LXep3ilSMwt2WA/TOKlQGJ3TWbIVL8N7aQ7GDudHIKde
 yoKzjw6PiYtJFLrSMKDUMamm3uUcSKiXijnk426Q82vQoWpjiMVxsu5T5NN9xUquzNgn
 A75oP2trmlMf6k2vQnJwH49/kZGclm9DjUZ2p5GQ1H9dGCUAZBNGGvODwQYtJXdQ8Q4m
 aI9WfMN1LVjTDgzozawlAPNWNgAlvhOeDG2zn0vG/mVHAUxc1ISOnrSurdGAPJ/3jcK0
 gWTVSivBPYwPJzOsKFq2oU/wZ7MQ9k4cIfh2H1arA77FUcVsPMzK2cZsVIVj9D/6elpz
 SnFQ==
X-Gm-Message-State: AOAM532U5HOkCxhX1r5ohHck7ogaTgHh6TvXyjUHrblQYlo02Z5jrDLj
 ZpD1pyd4KInSXgZ1Lb6LKyNv8nuYTD4lSjZSnSQqVg==
X-Google-Smtp-Source: ABdhPJw2TzrWyUsCRvLdNEwmuBMOzw873S9kH9iIgqr8MHImp46vGMCYz+KXcbSF3d9ywbs/waIdVzkz15siCXWeDFY=
X-Received: by 2002:a17:906:518a:: with SMTP id
 y10mr5743570ejk.323.1607061315701; 
 Thu, 03 Dec 2020 21:55:15 -0800 (PST)
MIME-Version: 1.0
References: <A0F02678-46AD-4AC7-92C3-9BEF3B3284DE@avery-design.com>
In-Reply-To: <A0F02678-46AD-4AC7-92C3-9BEF3B3284DE@avery-design.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 3 Dec 2020 21:55:11 -0800
Message-ID: <CAPcyv4gk5AcsOhzZEu57NWr9CBXQONyOkzXfSNZiFXP4Kj2G9g@mail.gmail.com>
Subject: Re: [RFC PATCH 00/25] Introduce CXL 2.0 Emulation
To: Chris Browy <cbrowy@avery-design.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::642;
 envelope-from=dan.j.williams@intel.com; helo=mail-ej1-x642.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Vishal L Verma <vishal.l.verma@intel.com>,
 Ben Widawsky <ben.widawsky@intel.com>, Qemu Developers <qemu-devel@nongnu.org>,
 linux-cxl@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[ add linux-cxl for the Linux driver question ]


On Thu, Dec 3, 2020 at 9:10 PM Chris Browy <cbrowy@avery-design.com> wrote:
[..]

I'll let Ben address the other questions...

> 4. What are the userspace system APIs for targeting CXL HDM address domain?
>    Usually you can mmap a SPA if you know how to look it up.

tl;dr: /proc/iomem and sysfs

There are a lot of moving pieces to this question. Once a CXL.mem
device is mapped the driver will arrange for it to appear in
/proc/iomem. If it is persistent memory it will be accessed through a
/dev/pmem or /dev/dax device, and if it is volatile it will show up as
just another "System RAM" range. The System RAM range may end up with
a unique Linux NUMA node id. Alternatively, if the BIOS maps the
device then the BIOS will set up the EFI memory map + ACPI
SRAT/SLIT/HMAT for Linux to interpret.

Once something shows up in /proc/iomem it was traditionally accessible
via /dev/mem. These days though /dev/mem is slowly being deprecated
due to security (see CONFIG_LOCK_DOWN_KERNEL*) and stability (see
CONFIG_IO_STRICT_DEVMEM)  concerns, so depending on your kernel
configuration tools may not be able to use /dev/mem to map the SPA
directly and will need to go through the driver provided interface.

The driver needs to be able coordinate coherent HDM settings across
multiple devices in an interleave, all switches in the path, and the
root bridge(s). So I am expecting a sysfs interface similar to the
nvdimm-subsystem and device-dax-subsystem where there will be
sysfs-files to enumerate the mappings and a provisioning mechanism to
reconfigure HDMs with various interleave settings. For a flavor of
what this might look like see the description of NVDIMM "Region"
devices:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/driver-api/nvdimm/nvdimm.rst#n469

The difference will be that unlike the nvdimm case where regions are
platform-firmware-defined and static, CXL regions are runtime dynamic.

