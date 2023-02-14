Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 194C1696CAB
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Feb 2023 19:23:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRzwD-00020c-2m; Tue, 14 Feb 2023 13:21:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pRzw5-0001y4-QB
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:21:51 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1pRzw3-00078s-Tp
 for qemu-devel@nongnu.org; Tue, 14 Feb 2023 13:21:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676398906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pG4T3Lvo75JBrA9ZKa3ToWxM5lVJLUNqaEUWMNaN1+g=;
 b=QiMt+C/nx30o9qhg+KB72WfBHUZH2ChOm2ue+U6ED3WIlAi9y4zSj45d6f+HX7Py4G/1Fn
 6ZV+OPDD8YiyaCInNTwR/TfedqO7jr3418rQxILPrhPbtNbXs/3APLqMGOdtEICy0IIZOL
 p+CoB2xfQIVPnFjq8zyp/DuKJMgoIwM=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-622-7O1rcGBSN8mHwkPmfwoP-Q-1; Tue, 14 Feb 2023 13:21:45 -0500
X-MC-Unique: 7O1rcGBSN8mHwkPmfwoP-Q-1
Received: by mail-pl1-f197.google.com with SMTP id
 c3-20020a170903234300b0019a94475927so5054434plh.3
 for <qemu-devel@nongnu.org>; Tue, 14 Feb 2023 10:21:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pG4T3Lvo75JBrA9ZKa3ToWxM5lVJLUNqaEUWMNaN1+g=;
 b=Q/cXugyRJGDTF4nLPnnqSlkbdBLtBEHknGnU8VhWNtgvn4NolJGIVmwT1lB56ydPJV
 uC3vElo/IiyECtdVJPZ0mSiUo1s9/Iqca4HCsRCcym6+iedF99pUWqW6SwzANdtLPTif
 88g8iu+I6Zdfdczt+yF/b/voR/oBiqdn2ixFELSKwcD7WMyvkprjinKfSiwh016zmsiy
 kap4f8lLW8Ty0I1t5b1HdX7pL76ZNY6chmHx6dbamlwjhe1wwrJLXD5Eq+d+XSRGMUHK
 MK4N6jpnCIONYwzc1xtAnDG90wIPabEneceIredya0FI2jITK1R1rAU/FceyGu0NfwMm
 wZzA==
X-Gm-Message-State: AO0yUKWxTche6Ws4qkjGvsrtnz1hCU+CTlaeUqpXc8kD8GJ1kMzBO062
 PvINpuREElo/o34qDaYdMIAW/UuEAIPyFWM9Y/p3/SR4WY68d1p3lSMrK72Z6PSOvTGKqdsoTkS
 L/7R1UTSH30iRU4vbccYfMcrOntMA4s4=
X-Received: by 2002:a63:6d01:0:b0:4fb:97bd:ac25 with SMTP id
 i1-20020a636d01000000b004fb97bdac25mr52797pgc.6.1676398904395; 
 Tue, 14 Feb 2023 10:21:44 -0800 (PST)
X-Google-Smtp-Source: AK7set/ofG3c7ocQZCv2zsue7o3qF2p9ZU7lqks3AZJFG70cOzz0Dq0stqqNXiaH9wq5/zyzi84/vVFmrDIEKoddAPU=
X-Received: by 2002:a63:6d01:0:b0:4fb:97bd:ac25 with SMTP id
 i1-20020a636d01000000b004fb97bdac25mr52792pgc.6.1676398904005; Tue, 14 Feb
 2023 10:21:44 -0800 (PST)
MIME-Version: 1.0
References: <ad7e1294-f19f-5bea-e891-f6adbe323cd5@proxmox.com>
In-Reply-To: <ad7e1294-f19f-5bea-e891-f6adbe323cd5@proxmox.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 14 Feb 2023 13:21:32 -0500
Message-ID: <CAFn=p-ahLoVd3W2GaFp5EUFq5EOudz+bUkEk5DV+Z07AjHaHtg@mail.gmail.com>
Subject: Re: Lost partition tables on ide-hd + ahci drive
To: Fiona Ebner <f.ebner@proxmox.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, 
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Thomas Lamprecht <t.lamprecht@proxmox.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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

On Thu, Feb 2, 2023 at 7:08 AM Fiona Ebner <f.ebner@proxmox.com> wrote:
>
> Hi,
> over the years we've got 1-2 dozen reports[0] about suddenly
> missing/corrupted MBR/partition tables. The issue seems to be very rare
> and there was no success in trying to reproduce it yet. I'm asking here
> in the hope that somebody has seen something similar.
>
> The only commonality seems to be the use of an ide-hd drive with ahci bus.
>
> It does seem to happen with both Linux and Windows guests (one of the
> reports even mentions FreeBSD) and backing storages for the VMs include
> ZFS, RBD, LVM-Thin as well as file-based storages.
>
> Relevant part of an example configuration:
>
> >   -device 'ahci,id=ahci0,multifunction=on,bus=pci.0,addr=0x7' \
> >   -drive 'file=/dev/zvol/myzpool/vm-168-disk-0,if=none,id=drive-sata0,format=raw,cache=none,aio=io_uring,detect-zeroes=on' \
> >   -device 'ide-hd,bus=ahci0.0,drive=drive-sata0,id=sata0' \
>
> The first reports are from before io_uring was used and there are also
> reports with writeback cache mode and discard=on,detect-zeroes=unmap.
>
> Some reports say that the issue occurred under high IO load.
>
> Many reports suspect backups causing the issue. Our backup mechanism
> uses backup_job_create() for each drive and runs the jobs sequentially.
> It uses a custom block driver as the backup target which just forwards
> the writes to the actual target which can be a file or our backup server.
> (If you really want to see the details, apply the patches in [1] and see
> pve-backup.c and block/backup-dump.c).
>
> Of course, the backup job will read sector 0 of the source disk, but I
> really can't see where a stray write would happen, why the issue would
> trigger so rarely or why seemingly only ide-hd+ahci would be affected.
>
> So again, just asking if somebody has seen something similar or has a
> hunch of what the cause might be.
>

Hi Floria;

I'm sorry to say that I haven't worked on the block devices (or
backup) for a little while now, so I am not immediately sure what
might be causing this problem. In general, I advise against using AHCI
in production as better performance (and dev support) can be achieved
through virtio. Still, I am not sure why the combination of AHCI with
backup_job_create() would be corrupting the early sectors of the disk.

Do you have any analysis on how much data gets corrupted? Is it the
first sector only, the first few? Has anyone taken a peek at the
backing storage to see if there are any interesting patterns that can
be observed? (Zeroes, garbage, old data?)

Have any errors or warnings been observed in either the guest or the
host that might offer some clues?

Is there any commonality in the storage format being used? Is it
qcow2? Is it network-backed?

Apologies for the "tier 1" questions.

> [0]: https://bugzilla.proxmox.com/show_bug.cgi?id=2874
> [1]: https://git.proxmox.com/?p=pve-qemu.git;a=tree;f=debian/patches;hb=HEAD
>


