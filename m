Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23F832F2F59
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 13:49:56 +0100 (CET)
Received: from localhost ([::1]:36390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJ7S-0001w7-L7
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 07:49:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kzJ6F-0001OY-J4
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:48:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kzJ6D-000354-2I
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 07:48:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610455716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3di3WiIDCT0haTp37A4dlkvRPB/If8ZucUraJvNLxLM=;
 b=Q0tb23sNHAadwl6gDyqOImgrxCNh7HgiWJoFgHwsA++4o+RFscX8byfTeAfxjN9HZ2ULqj
 cn5FHTXDanqzf+IKpqCRaBhO64xC55QF/OTm2Fy41jF7qJ1dRDj2B8fx8pNEZ0RpRlXCrU
 3SljaZf7Thn0wh8k7zUJBIVG+9CH2rE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-P3sqLpOlNgS6oC9ASGDi1w-1; Tue, 12 Jan 2021 07:48:34 -0500
X-MC-Unique: P3sqLpOlNgS6oC9ASGDi1w-1
Received: by mail-wr1-f72.google.com with SMTP id b8so1103104wrv.14
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 04:48:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=3di3WiIDCT0haTp37A4dlkvRPB/If8ZucUraJvNLxLM=;
 b=QKKaSedrIjrw9FUiL/Sh1wJJx6rke9mcjnQ7heSa0QFSfBdyQW7Ge5MRqSZJOO3ati
 IkVzL7rKREL2c/3pt+mJPm8Db748q/AVt3ZQ8SdWjhBIolrj+6CbHMJ+4q3+MU3B1uNv
 JMtXlQ6rjNH4y6dmXWYyUQyuUWpNhoLphKwjE+sIYVNzxWqV7lSI+Ok9gxqwC59x70lu
 rohD9UqI72YviqBTcsYqhgvu1otaJvwpokQXFWxcGj7iNAqirFemfdYk/bJkY9Kv/sHk
 tx4UaMY9rWGhLzO7gLmdqSiStLEk1BQQefem8Mt2x/EnFGBwCAf6WiQvx6C75vf46swj
 Yicg==
X-Gm-Message-State: AOAM533lWhQboXtdXzYCn8Zt622L4r+8uFPDWDlKr5mIRqVp37bSsPQr
 8MXy/U3aMekyhBIaeR2aQzCfH2QP9iMhra2w9GB2/9Xyu8l65b6mpss8pt4ys7TEVmbTPnVsaRz
 WdaYrhswuUOwjC9w=
X-Received: by 2002:a5d:6204:: with SMTP id y4mr4195254wru.48.1610455713466;
 Tue, 12 Jan 2021 04:48:33 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjLRoOBZSP/z6909MxSjSSPfO+4mnMDOjffdHUYYKda5rFiHxPiZst9Fk7g0GNmnbF8Daesw==
X-Received: by 2002:a5d:6204:: with SMTP id y4mr4195206wru.48.1610455713246;
 Tue, 12 Jan 2021 04:48:33 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id b10sm4019102wmj.5.2021.01.12.04.48.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 04:48:32 -0800 (PST)
Date: Tue, 12 Jan 2021 07:48:27 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Adrian Catangiu <acatan@amazon.com>
Subject: Re: [PATCH v4 0/2] System Generation ID driver and VMGENID backend
Message-ID: <20210112074658-mutt-send-email-mst@kernel.org>
References: <1610453760-13812-1-git-send-email-acatan@amazon.com>
MIME-Version: 1.0
In-Reply-To: <1610453760-13812-1-git-send-email-acatan@amazon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Jason@zx2c4.com, dgunigun@redhat.com, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, ghammer@redhat.com, vijaysun@ca.ibm.com,
 0x7f454c46@gmail.com, qemu-devel@nongnu.org, mhocko@kernel.org,
 oridgar@gmail.com, avagin@gmail.com, pavel@ucw.cz, ptikhomirov@virtuozzo.com,
 linux-s390@vger.kernel.org, corbet@lwn.net, mpe@ellerman.id.au,
 rafael@kernel.org, ebiggers@kernel.org, borntraeger@de.ibm.com,
 sblbir@amazon.com, bonzini@gnu.org, arnd@arndb.de, jannh@google.com,
 raduweis@amazon.com, asmehra@redhat.com, graf@amazon.com, rppt@kernel.org,
 luto@kernel.org, gil@azul.com, colmmacc@amazon.com, tytso@mit.edu,
 gregkh@linuxfoundation.org, areber@redhat.com, linux-kernel@vger.kernel.org,
 ebiederm@xmission.com, ovzxemul@gmail.com, w@1wt.eu, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 02:15:58PM +0200, Adrian Catangiu wrote:
> This feature is aimed at virtualized or containerized environments
> where VM or container snapshotting duplicates memory state, which is a
> challenge for applications that want to generate unique data such as
> request IDs, UUIDs, and cryptographic nonces.
> 
> The patch set introduces a mechanism that provides a userspace
> interface for applications and libraries to be made aware of uniqueness
> breaking events such as VM or container snapshotting, and allow them to
> react and adapt to such events.
> 
> Solving the uniqueness problem strongly enough for cryptographic
> purposes requires a mechanism which can deterministically reseed
> userspace PRNGs with new entropy at restore time. This mechanism must
> also support the high-throughput and low-latency use-cases that led
> programmers to pick a userspace PRNG in the first place; be usable by
> both application code and libraries; allow transparent retrofitting
> behind existing popular PRNG interfaces without changing application
> code; it must be efficient, especially on snapshot restore; and be
> simple enough for wide adoption.
> 
> The first patch in the set implements a device driver which exposes a
> read-only device /dev/sysgenid to userspace, which contains a
> monotonically increasing u32 generation counter. Libraries and
> applications are expected to open() the device, and then call read()
> which blocks until the SysGenId changes. Following an update, read()
> calls no longer block until the application acknowledges the new
> SysGenId by write()ing it back to the device. Non-blocking read() calls
> return EAGAIN when there is no new SysGenId available. Alternatively,
> libraries can mmap() the device to get a single shared page which
> contains the latest SysGenId at offset 0.

Looking at some specifications, the gen ID might actually be located
at an arbitrary address. How about instead of hard-coding the offset,
we expose it e.g. in sysfs?


> SysGenId also supports a notification mechanism exposed as two IOCTLs
> on the device. SYSGENID_GET_OUTDATED_WATCHERS immediately returns the
> number of file descriptors to the device that were open during the last
> SysGenId change but have not yet acknowledged the new id.
> SYSGENID_WAIT_WATCHERS blocks until there are no open file handles on
> the device which haven’t acknowledged the new id. These two interfaces
> are intended for serverless and container control planes, which want to
> confirm that all application code has detected and reacted to the new
> SysGenId before sending an invoke to the newly-restored sandbox.
> 
> The second patch in the set adds a VmGenId driver which makes use of
> the ACPI vmgenid device to drive SysGenId and to reseed kernel entropy
> on VM snapshots.
> 
> ---
> 
> v3 -> v4:
> 
>   - split functionality in two separate kernel modules: 
>     1. drivers/misc/sysgenid.c which provides the generic userspace
>        interface and mechanisms
>     2. drivers/virt/vmgenid.c as VMGENID acpi device driver that seeds
>        kernel entropy and acts as a driving backend for the generic
>        sysgenid
>   - renamed /dev/vmgenid -> /dev/sysgenid
>   - renamed uapi header file vmgenid.h -> sysgenid.h
>   - renamed ioctls VMGENID_* -> SYSGENID_*
>   - added ‘min_gen’ parameter to SYSGENID_FORCE_GEN_UPDATE ioctl
>   - fixed races in documentation examples
>   - various style nits
>   - rebased on top of linus latest
> 
> v2 -> v3:
> 
>   - separate the core driver logic and interface, from the ACPI device.
>     The ACPI vmgenid device is now one possible backend.
>   - fix issue when timeout=0 in VMGENID_WAIT_WATCHERS
>   - add locking to avoid races between fs ops handlers and hw irq
>     driven generation updates
>   - change VMGENID_WAIT_WATCHERS ioctl so if the current caller is
>     outdated or a generation change happens while waiting (thus making
>     current caller outdated), the ioctl returns -EINTR to signal the
>     user to handle event and retry. Fixes blocking on oneself.
>   - add VMGENID_FORCE_GEN_UPDATE ioctl conditioned by
>     CAP_CHECKPOINT_RESTORE capability, through which software can force
>     generation bump.
> 
> v1 -> v2:
> 
>   - expose to userspace a monotonically increasing u32 Vm Gen Counter
>     instead of the hw VmGen UUID
>   - since the hw/hypervisor-provided 128-bit UUID is not public
>     anymore, add it to the kernel RNG as device randomness
>   - insert driver page containing Vm Gen Counter in the user vma in
>     the driver's mmap handler instead of using a fault handler
>   - turn driver into a misc device driver to auto-create /dev/vmgenid
>   - change ioctl arg to avoid leaking kernel structs to userspace
>   - update documentation
>   - various nits
>   - rebase on top of linus latest
> 
> Adrian Catangiu (2):
>   drivers/misc: sysgenid: add system generation id driver
>   drivers/virt: vmgenid: add vm generation id driver
> 
>  Documentation/misc-devices/sysgenid.rst | 240 +++++++++++++++++++++++++
>  Documentation/virt/vmgenid.rst          |  34 ++++
>  drivers/misc/Kconfig                    |  16 ++
>  drivers/misc/Makefile                   |   1 +
>  drivers/misc/sysgenid.c                 | 298 ++++++++++++++++++++++++++++++++
>  drivers/virt/Kconfig                    |  14 ++
>  drivers/virt/Makefile                   |   1 +
>  drivers/virt/vmgenid.c                  | 153 ++++++++++++++++
>  include/uapi/linux/sysgenid.h           |  18 ++
>  9 files changed, 775 insertions(+)
>  create mode 100644 Documentation/misc-devices/sysgenid.rst
>  create mode 100644 Documentation/virt/vmgenid.rst
>  create mode 100644 drivers/misc/sysgenid.c
>  create mode 100644 drivers/virt/vmgenid.c
>  create mode 100644 include/uapi/linux/sysgenid.h
> 
> -- 
> 2.7.4
> 
> 
> 
> 
> Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in Romania. Registration number J22/2621/2005.


