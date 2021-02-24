Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 949EE32392D
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Feb 2021 10:07:12 +0100 (CET)
Received: from localhost ([::1]:39990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEq8V-0005NW-LR
	for lists+qemu-devel@lfdr.de; Wed, 24 Feb 2021 04:07:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEq6j-0004Cm-SG
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:05:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEq6f-0008E9-7N
 for qemu-devel@nongnu.org; Wed, 24 Feb 2021 04:05:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614157515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QqFm1NSygbJXw0rWa68aFsGxKE3C5g6IlhiIzb/mOPY=;
 b=DYlQC+MIbkNJ5Xe3pFauAH9ukP8/wfi6ZUnFi17JrGSq+mKMbKwqChxwhzfM5QxkWmTI+l
 hRXpDEtnKEJMYufD8PMGJeBZMDmNlR/4HNpRsOm8hy+dboB9hjjad3UBnnc0u6ScB0AXcZ
 oi4uhvrsy8Z47l+cveR0PlajezXSAXY=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-FScopkokPleeRIrVoXW38g-1; Wed, 24 Feb 2021 04:05:13 -0500
X-MC-Unique: FScopkokPleeRIrVoXW38g-1
Received: by mail-ed1-f71.google.com with SMTP id q2so547522edt.16
 for <qemu-devel@nongnu.org>; Wed, 24 Feb 2021 01:05:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QqFm1NSygbJXw0rWa68aFsGxKE3C5g6IlhiIzb/mOPY=;
 b=V+KnDSrQGRbVLS708FIJXp5cBp3cyLTMPCW12bqcHPY/+i6uJsAMoH5g3H5t0YIaz+
 /pfZf9SvADN235izihAuXPN7T+T17DO+0ZGOuCxxIPLMmvQabrNgEkL46+JUw5+1P0SK
 MOQT4WFMjkrs97aGSlwXDT+5aKaptNJ0MF2xv7ss9KKP1IoZTXC1Sa/O4/cla/khhw+w
 ZiXAi/YgywYB+LgZAXeJnbNdhygSmnBGftuanke+4ZUimFRZljUZ5RZqYQB1E0vQcGki
 93yv1p5QxDgFDR0vLyo8S36OzeOnegDkSL8mXGMYctMgGuLn9QFN8T06sbeIlOR2lYxb
 mEIg==
X-Gm-Message-State: AOAM532nyK6uVy9ZRJwBvXJFIP1bPDzEQt4xjOOERaz4x57urplRFTTD
 5JNUkLkMUOTK9VbIjBbvMgh3tqVTNs6C8kBeMkPlRrP/nd0pZtYYG468/flQNd1EzdCUR5WP9YM
 2e5uRnl5pPbRf0uQ=
X-Received: by 2002:a17:906:27cc:: with SMTP id
 k12mr30689095ejc.8.1614157512119; 
 Wed, 24 Feb 2021 01:05:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwB+2pkCXGcB7fc6xM7Z1RAg7wAhQFJTErDSVFXdqZyiyFbzB3jPIgR1cW6VaLQuWhn+I2l+w==
X-Received: by 2002:a17:906:27cc:: with SMTP id
 k12mr30689054ejc.8.1614157511871; 
 Wed, 24 Feb 2021 01:05:11 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id t8sm818884ejr.71.2021.02.24.01.05.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 01:05:10 -0800 (PST)
Date: Wed, 24 Feb 2021 04:05:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Adrian Catangiu <acatan@amazon.com>
Subject: Re: [PATCH v7 0/2] System Generation ID driver and VMGENID backend
Message-ID: <20210224040034-mutt-send-email-mst@kernel.org>
References: <1614156452-17311-1-git-send-email-acatan@amazon.com>
MIME-Version: 1.0
In-Reply-To: <1614156452-17311-1-git-send-email-acatan@amazon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Jason@zx2c4.com, areber@redhat.com, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, ghammer@redhat.com, vijaysun@ca.ibm.com,
 0x7f454c46@gmail.com, qemu-devel@nongnu.org, mhocko@kernel.org,
 dgunigun@redhat.com, avagin@gmail.com, pavel@ucw.cz, ptikhomirov@virtuozzo.com,
 linux-s390@vger.kernel.org, corbet@lwn.net, mpe@ellerman.id.au,
 rafael@kernel.org, ebiggers@kernel.org, borntraeger@de.ibm.com,
 sblbir@amazon.com, bonzini@gnu.org, arnd@arndb.de, jannh@google.com,
 raduweis@amazon.com, asmehra@redhat.com, graf@amazon.com, rppt@kernel.org,
 luto@kernel.org, gil@azul.com, oridgar@gmail.com, colmmacc@amazon.com,
 tytso@mit.edu, gregkh@linuxfoundation.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, ebiederm@xmission.com, ovzxemul@gmail.com,
 w@1wt.eu, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 24, 2021 at 10:47:30AM +0200, Adrian Catangiu wrote:
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
> the /dev/sysgenid char device to userspace. Its associated filesystem
> operations operations can be used to build a system level safe workflow
> that guest software can follow to protect itself from negative system
> snapshot effects.
> 
> The second patch in the set adds a VmGenId driver which makes use of
> the ACPI vmgenid device to drive SysGenId and to reseed kernel entropy
> following VM snapshots.
> 
> **Please note**, SysGenID alone does not guarantee complete snapshot
> safety to applications using it. A certain workflow needs to be
> followed at the system level, in order to make the system
> snapshot-resilient. Please see the "Snapshot Safety Prerequisites"
> section in the included SysGenID documentation.
> 
> ---
> 
> v6 -> v7:
>   - remove sysgenid uevent

How about we drop mmap too?

There's simply no way I can see to make it safe, and
no implementation is worse than a racy one imho.

Yea there's some decumentation explaining how it is not
supposed to be used but it will *seem* to work for people
and we will be stuck trying to maintain it.

Let's see if userspace using this often enough to make the
system call 



> v5 -> v6:
> 
>   - sysgenid: watcher tracking disabled by default
>   - sysgenid: add SYSGENID_SET_WATCHER_TRACKING ioctl to allow each
>     file descriptor to set whether they should be tracked as watchers
>   - rename SYSGENID_FORCE_GEN_UPDATE -> SYSGENID_TRIGGER_GEN_UPDATE
>   - rework all documentation to clearly capture all prerequisites for
>     achieving snapshot safety when using the provided mechanism
>   - sysgenid documentation: replace individual filesystem operations
>     examples with a higher level example showcasing system-level
>     snapshot-safe workflow
> 
> v4 -> v5:
> 
>   - sysgenid: generation changes are also exported through uevents
>   - remove SYSGENID_GET_OUTDATED_WATCHERS ioctl
>   - document sysgenid ioctl major/minor numbers
> 
> v3 -> v4:
> 
>   - split functionality in two separate kernel modules: 
>     1. drivers/misc/sysgenid.c which provides the generic userspace
>        interface and mechanisms
>     2. drivers/virt/vmgenid.c as VMGENID acpi device driver that seeds
>        kernel entropy and acts as a driving backend for the generic
>        sysgenid
>   - rename /dev/vmgenid -> /dev/sysgenid
>   - rename uapi header file vmgenid.h -> sysgenid.h
>   - rename ioctls VMGENID_* -> SYSGENID_*
>   - add ‘min_gen’ parameter to SYSGENID_FORCE_GEN_UPDATE ioctl
>   - fix races in documentation examples
> 
> v2 -> v3:
> 
>   - separate the core driver logic and interface, from the ACPI device.
>     The ACPI vmgenid device is now one possible backend
>   - fix issue when timeout=0 in VMGENID_WAIT_WATCHERS
>   - add locking to avoid races between fs ops handlers and hw irq
>     driven generation updates
>   - change VMGENID_WAIT_WATCHERS ioctl so if the current caller is
>     outdated or a generation change happens while waiting (thus making
>     current caller outdated), the ioctl returns -EINTR to signal the
>     user to handle event and retry. Fixes blocking on oneself
>   - add VMGENID_FORCE_GEN_UPDATE ioctl conditioned by
>     CAP_CHECKPOINT_RESTORE capability, through which software can force
>     generation bump
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
> 
> Adrian Catangiu (2):
>   drivers/misc: sysgenid: add system generation id driver
>   drivers/virt: vmgenid: add vm generation id driver
> 
>  Documentation/misc-devices/sysgenid.rst            | 229 +++++++++++++++
>  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
>  Documentation/virt/vmgenid.rst                     |  36 +++
>  MAINTAINERS                                        |  15 +
>  drivers/misc/Kconfig                               |  15 +
>  drivers/misc/Makefile                              |   1 +
>  drivers/misc/sysgenid.c                            | 322 +++++++++++++++++++++
>  drivers/virt/Kconfig                               |  13 +
>  drivers/virt/Makefile                              |   1 +
>  drivers/virt/vmgenid.c                             | 153 ++++++++++
>  include/uapi/linux/sysgenid.h                      |  18 ++
>  11 files changed, 804 insertions(+)
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


