Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC49530CF9F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:07:25 +0100 (CET)
Received: from localhost ([::1]:36808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74lY-0004Fg-Qj
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:07:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rdunlap@infradead.org>)
 id 1l74d8-00083u-Fx
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:58:42 -0500
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1]:51992)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rdunlap@infradead.org>)
 id 1l74d4-00033g-0X; Tue, 02 Feb 2021 17:58:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=ENue7s30/AVYjJ+FLuK3utBLdl7fX7Wgo1RZFpgH4vM=; b=iCpPPCirUc9RhjKzpwe3y4FP9W
 Er4hHDaCbraQPxNrWmL2Yao94VNYmaPyexKnej4DgMa6blaJPt+pVpsgTWVPOEstB1gcQYPe73aAF
 v9VazIjrtXW9X/ChFtnTI+IpgqygQ3asQ16cZidy4PTIwoXo5z32Kxd87vp9zAXjdKA3kpFJuLBJE
 geVlY2+N3EIhy5WY1aMvzjCXYGfmzbKT5mCqHMujL6Fv8rV2q4Zib9vzCFy9tEuqFUS1QvISsZGHe
 WLRuK+q8+3pouAGoC2JuWkD8JsJGjQyF2NKqJlTbJhN+2kMaeBEtjP/6600EQAYF8StNRlB7VhEEF
 rYfAw2Fg==;
Received: from [2601:1c0:6280:3f0::2a53]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l74cg-0001Wj-VY; Tue, 02 Feb 2021 22:58:15 +0000
Subject: Re: [PATCH v5 1/2] drivers/misc: sysgenid: add system generation id
 driver
To: Adrian Catangiu <acatan@amazon.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org
References: <1612200294-17561-1-git-send-email-acatan@amazon.com>
 <1612200294-17561-2-git-send-email-acatan@amazon.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <5290f6f5-396f-aa47-3b74-8d50c2434a04@infradead.org>
Date: Tue, 2 Feb 2021 14:58:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1612200294-17561-2-git-send-email-acatan@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2001:8b0:10b:1231::1;
 envelope-from=rdunlap@infradead.org; helo=merlin.infradead.org
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.155,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Jason@zx2c4.com, dgunigun@redhat.com, mst@redhat.com, ghammer@redhat.com,
 vijaysun@ca.ibm.com, 0x7f454c46@gmail.com, mhocko@kernel.org,
 oridgar@gmail.com, avagin@gmail.com, pavel@ucw.cz, ptikhomirov@virtuozzo.com,
 corbet@lwn.net, mpe@ellerman.id.au, rafael@kernel.org, ebiggers@kernel.org,
 borntraeger@de.ibm.com, sblbir@amazon.com, bonzini@gnu.org, arnd@arndb.de,
 jannh@google.com, raduweis@amazon.com, asmehra@redhat.com, graf@amazon.com,
 rppt@kernel.org, luto@kernel.org, gil@azul.com, colmmacc@amazon.com,
 tytso@mit.edu, gregkh@linuxfoundation.org, areber@redhat.com,
 ebiederm@xmission.com, ovzxemul@gmail.com, w@1wt.eu, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi--

On 2/1/21 9:24 AM, Adrian Catangiu wrote:
> - Background and problem
> 
> The System Generation ID feature is required in virtualized or
> containerized environments by applications that work with local copies
> or caches of world-unique data such as random values, uuids,
> monotonically increasing counters, etc.

  ... if those applications want to comply with <some MS spec>.

> Such applications can be negatively affected by VM or container
> snapshotting when the VM or container is either cloned or returned to
> an earlier point in time.


> Signed-off-by: Adrian Catangiu <acatan@amazon.com>
> ---
>  Documentation/misc-devices/sysgenid.rst            | 236 ++++++++++++++++
>  Documentation/userspace-api/ioctl/ioctl-number.rst |   1 +
>  MAINTAINERS                                        |   8 +
>  drivers/misc/Kconfig                               |  16 ++
>  drivers/misc/Makefile                              |   1 +
>  drivers/misc/sysgenid.c                            | 307 +++++++++++++++++++++
>  include/uapi/linux/sysgenid.h                      |  17 ++
>  7 files changed, 586 insertions(+)
>  create mode 100644 Documentation/misc-devices/sysgenid.rst
>  create mode 100644 drivers/misc/sysgenid.c
>  create mode 100644 include/uapi/linux/sysgenid.h
> 
> diff --git a/Documentation/misc-devices/sysgenid.rst b/Documentation/misc-devices/sysgenid.rst
> new file mode 100644
> index 0000000..4337ca0
> --- /dev/null
> +++ b/Documentation/misc-devices/sysgenid.rst
> @@ -0,0 +1,236 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +========
> +SYSGENID
> +========
> +
> +The System Generation ID feature is required in virtualized or
> +containerized environments by applications that work with local copies
> +or caches of world-unique data such as random values, UUIDs,
> +monotonically increasing counters, etc.
> +Such applications can be negatively affected by VM or container
> +snapshotting when the VM or container is either cloned or returned to
> +an earlier point in time.
> +
> +The System Generation ID is a simple concept meant to alleviate the
> +issue by providing a monotonically increasing counter that changes
> +each time the VM or container is restored from a snapshot.
> +The driver for it lives at ``drivers/misc/sysgenid.c``.
> +
> +The ``sysgenid`` driver exposes a monotonic incremental System
> +Generation u32 counter via a char-dev FS interface accessible through

s/FS/filesystem/

> +``/dev/sysgenid`` that provides sync and async SysGen counter update
> +notifications. It also provides SysGen counter retrieval and
> +confirmation mechanisms.
> +
> +The counter starts from zero when the driver is initialized and
> +monotonically increments every time the system generation changes.
> +
> +The ``sysgenid`` driver exports the ``void sysgenid_bump_generation()``
> +symbol which can be used by backend drivers to drive system generation
> +changes based on hardware events.
> +System generation changes can also be driven by userspace software
> +through a dedicated driver ioctl.
> +
> +Userspace applications or libraries can (a)synchronously consume the
> +system generation counter through the provided FS interface, to make

s/FS/filesystem/

> +any necessary internal adjustments following a system generation update.
> +
> +Driver FS interface:
> +
> +``open()``:
> +  When the device is opened, a copy of the current Sys-Gen-Id (counter)
> +  is associated with the open file descriptor. The driver now tracks
> +  this file as an independent *watcher*. The driver tracks how many
> +  watchers are aware of the latest Sys-Gen-Id counter and how many of
> +  them are *outdated*; outdated being those that have lived through
> +  a Sys-Gen-Id change but not yet confirmed the new generation counter.
> +
> +``read()``:
> +  Read is meant to provide the *new* system generation counter when a
> +  generation change takes place. The read operation blocks until the
> +  associated counter is no longer up to date, at which point the new
> +  counter is provided/returned.
> +  Nonblocking ``read()`` uses ``EAGAIN`` to signal that there is no
> +  *new* counter value available. The generation counter is considered
> +  *new* for each open file descriptor that hasn't confirmed the new
> +  value following a generation change. Therefore, once a generation
> +  change takes place, all ``read()`` calls will immediately return the
> +  new generation counter and will continue to do so until the
> +  new value is confirmed back to the driver through ``write()``.
> +  Partial reads are not allowed - read buffer needs to be at least
> +  32 bits in size.
> +
> +``write()``:
> +  Write is used to confirm the up-to-date Sys Gen counter back to the
> +  driver.
> +  Following a VM generation change, all existing watchers are marked
> +  as *outdated*. Each file descriptor will maintain the *outdated*
> +  status until a ``write()`` confirms the up-to-date counter back to
> +  the driver.
> +  Partial writes are not allowed - write buffer should be exactly
> +  32 bits in size.
> +
> +``poll()``:
> +  Poll is implemented to allow polling for generation counter updates.
> +  Such updates result in ``EPOLLIN`` polling status until the new
> +  up-to-date counter is confirmed back to the driver through a
> +  ``write()``.
> +
> +``ioctl()``:
> +  The driver also adds support for waiting on open file descriptors
> +  that haven't acknowledged a generation counter update, as well as a
> +  mechanism for userspace to *force* a generation update:
> +
> +  - SYSGENID_WAIT_WATCHERS: blocks until there are no more *outdated*
> +    watchers, or if a ``timeout`` argument is provided, until the
> +    timeout expires.
> +    If the current caller is *outdated* or a generation change happens
> +    while waiting (thus making current caller *outdated*), the ioctl
> +    returns ``-EINTR`` to signal the user to handle event and retry.
> +  - SYSGENID_FORCE_GEN_UPDATE: forces a generation counter increment.
> +    It takes a ``minimum-generation`` argument which represents the
> +    minimum value the generation counter will be incremented to. For

                                            will be set to. For
It's not so much an increment as it is a "set to this value or higher".

> +    example if current generation is ``5`` and ``SYSGENID_FORCE_GEN_UPDATE(8)``
> +    is called, the generation counter will increment to ``8``.
> +    This IOCTL can only be used by processes with CAP_CHECKPOINT_RESTORE
> +    or CAP_SYS_ADMIN capabilities.
> +
> +``mmap()``:
> +  The driver supports ``PROT_READ, MAP_SHARED`` mmaps of a single page
> +  in size. The first 4 bytes of the mapped page will contain an
> +  up-to-date u32 copy of the system generation counter.
> +  The mapped memory can be used as a low-latency generation counter
> +  probe mechanism in critical sections - see examples.
> +
> +``close()``:
> +  Removes the file descriptor as a system generation counter *watcher*.
> +
> +Example application workflows
> +-----------------------------
> +
[snip]


-- 
~Randy


