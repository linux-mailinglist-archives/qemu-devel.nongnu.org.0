Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED27F2F305A
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:14:33 +0100 (CET)
Received: from localhost ([::1]:35914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJVJ-0006EX-1t
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:14:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kzJQC-0004F0-M1
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:09:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60424)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kzJQ7-0002GP-Ra
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:09:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610456946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6v+aTfJYqMAsw5irQLmNR1KiyDmb7Qf/dWG1DUDZGfc=;
 b=FyBVtzLbwfHAkVwzJGvbpAddM2IJOqOvmzUwELMkpNPaF3qVa8pMRLGCLhaHfVn/s14Zz3
 UwBayCDWiLyRmTLLwIHcLYeb4Jlk5E/sRX43Bit0rHdjPYohilMPX+PNdBe2BUka5TMWxl
 6QRaK0h+SD6Fg/Vz4RqSRgmba4xARgw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-390-6SHJFvYCM7ei0iMI8wgBdg-1; Tue, 12 Jan 2021 08:09:01 -0500
X-MC-Unique: 6SHJFvYCM7ei0iMI8wgBdg-1
Received: by mail-wr1-f72.google.com with SMTP id n11so1132350wro.7
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 05:09:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=6v+aTfJYqMAsw5irQLmNR1KiyDmb7Qf/dWG1DUDZGfc=;
 b=M3zKCgE8BOf9EjObDte3ceFjPvkg9EzIjLLYgpEcgOFr3MI+XthpLYpP6LHu2O6vIx
 bq1inTi7sRJvROzZfq4GNRTXmcG3UmYlp79kuyPsdITtkk6UNQUp4ga2fS/CCTVfC6d5
 qvNhUrMZMGgbuixocg8GWuxAM5pM0TxVmEhuG85AlJid7fwzTt8FdRPbg/yE7OLYJ+kv
 QPY/ODQUNtZD+vtDe1uiNhjthuxxFGiqRONf6oILXizafuVXaG2N8518J03JuRhsv4EN
 ZxhIAMoYoMeTPwTRU+ROVnMwjbCj74bFAzRZtMRfnih3IEj6AkNPccNssfxVelASGVPP
 9m6A==
X-Gm-Message-State: AOAM533po11SnpePmEzUNziBguwZ41a/h6Y7zSW3Mn2y3tp0ddMtrL5P
 QlTAgGctFdyT0DyMRYFJYHJth2u3HE0f/u1Y3rbiaV1RhosZIvygS53yDOAyQ7eTWXGe2k6LlUO
 qM5bbDwP/Z2b/qFg=
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr3548021wmh.29.1610456940356; 
 Tue, 12 Jan 2021 05:09:00 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYJ1lg09c0hiOxSdzF/WeAPQGsPdYNyurgJ2Oo6AuMYfcUZlB9n6jvzO2xIlBZhP0sSdh0ng==
X-Received: by 2002:a7b:cc0f:: with SMTP id f15mr3547956wmh.29.1610456939966; 
 Tue, 12 Jan 2021 05:08:59 -0800 (PST)
Received: from redhat.com (bzq-79-178-32-166.red.bezeqint.net. [79.178.32.166])
 by smtp.gmail.com with ESMTPSA id r82sm4086034wma.18.2021.01.12.05.08.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jan 2021 05:08:59 -0800 (PST)
Date: Tue, 12 Jan 2021 08:08:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Adrian Catangiu <acatan@amazon.com>
Subject: Re: [PATCH v4 1/2] drivers/misc: sysgenid: add system generation id
 driver
Message-ID: <20210112080427-mutt-send-email-mst@kernel.org>
References: <1610453760-13812-1-git-send-email-acatan@amazon.com>
 <1610453760-13812-2-git-send-email-acatan@amazon.com>
MIME-Version: 1.0
In-Reply-To: <1610453760-13812-2-git-send-email-acatan@amazon.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On Tue, Jan 12, 2021 at 02:15:59PM +0200, Adrian Catangiu wrote:
> - Background and problem
> 
> The System Generation ID feature is required in virtualized or
> containerized environments by applications that work with local copies
> or caches of world-unique data such as random values, uuids,
> monotonically increasing counters, etc.
> Such applications can be negatively affected by VM or container
> snapshotting when the VM or container is either cloned or returned to
> an earlier point in time.
> 
> Furthermore, simply finding out about a system generation change is
> only the starting point of a process to renew internal states of
> possibly multiple applications across the system. This process could
> benefit from a driver that provides an interface through which
> orchestration can be easily done.
> 
> - Solution
> 
> The System Generation ID is a simple concept meant to alleviate the
> issue by providing a monotonically increasing u32 counter that changes
> each time the VM or container is restored from a snapshot.
> 
> The `sysgenid` driver exposes a monotonic incremental System Generation
> u32 counter via a char-dev FS interface that provides sync and async
> SysGen counter updates notifications. It also provides SysGen counter
> retrieval and confirmation mechanisms.
> 
> The counter starts from zero when the driver is initialized and
> monotonically increments every time the system generation changes.
> 
> The `sysgenid` driver exports the `void sysgenid_bump_generation()`
> symbol which can be used by backend drivers to drive system generation
> changes based on hardware events.
> System generation changes can also be driven by userspace software
> through a dedicated driver ioctl.
> 
> Userspace applications or libraries can then (a)synchronously consume
> the system generation counter through the provided FS interface to make
> any necessary internal adjustments following a system generation
> update.
> 
> Signed-off-by: Adrian Catangiu <acatan@amazon.com>
> ---
>  Documentation/misc-devices/sysgenid.rst | 240 +++++++++++++++++++++++++
>  drivers/misc/Kconfig                    |  16 ++
>  drivers/misc/Makefile                   |   1 +
>  drivers/misc/sysgenid.c                 | 298 ++++++++++++++++++++++++++++++++
>  include/uapi/linux/sysgenid.h           |  18 ++
>  5 files changed, 573 insertions(+)
>  create mode 100644 Documentation/misc-devices/sysgenid.rst
>  create mode 100644 drivers/misc/sysgenid.c
>  create mode 100644 include/uapi/linux/sysgenid.h
> 
> diff --git a/Documentation/misc-devices/sysgenid.rst b/Documentation/misc-devices/sysgenid.rst
> new file mode 100644
> index 0000000..0b31ccf
> --- /dev/null
> +++ b/Documentation/misc-devices/sysgenid.rst
> @@ -0,0 +1,240 @@
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
> +``/dev/sysgenid`` that provides sync and async SysGen counter updates
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
> +  ``sizeof(unsigned)`` in size.
> +
> +``write()``:
> +  Write is used to confirm the up-to-date Sys Gen counter back to the
> +  driver.
> +  Following a VM generation change, all existing watchers are marked
> +  as *outdated*. Each file descriptor will maintain the *outdated*
> +  status until a ``write()`` confirms the up-to-date counter back to
> +  the driver.
> +  Partial writes are not allowed - write buffer should be exactly
> +  ``sizeof(unsigned)`` in size.
> +
> +``poll()``:
> +  Poll is implemented to allow polling for generation counter updates.
> +  Such updates result in ``EPOLLIN`` polling status until the new
> +  up-to-date counter is confirmed back to the driver through a
> +  ``write()``.
> +
> +``ioctl()``:
> +  The driver also adds support for tracking count of open file
> +  descriptors that haven't acknowledged a generation counter update,
> +  as well as a mechanism for userspace to *force* a generation update:
> +
> +  - SYSGENID_GET_OUTDATED_WATCHERS: immediately returns the number of
> +    *outdated* watchers - number of file descriptors that were open
> +    during a system generation change, and which have not yet confirmed
> +    the new generation counter.
> +  - SYSGENID_WAIT_WATCHERS: blocks until there are no more *outdated*
> +    watchers, or if a ``timeout`` argument is provided, until the
> +    timeout expires.
> +    If the current caller is *outdated* or a generation change happens
> +    while waiting (thus making current caller *outdated*), the ioctl
> +    returns ``-EINTR`` to signal the user to handle event and retry.
> +  - SYSGENID_FORCE_GEN_UPDATE: forces a generation counter increment.
> +    It takes a ``minimum-generation`` argument which represents the
> +    minimum value the generation counter will be incremented to. For
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
> +1) Watchdog thread simplified example::
> +
> +	void watchdog_thread_handler(int *thread_active)
> +	{
> +		unsigned genid;
> +		int fd = open("/dev/sysgenid", O_RDWR | O_CLOEXEC, S_IRUSR | S_IWUSR);
> +
> +		do {
> +			// read new gen ID - blocks until VM generation changes
> +			read(fd, &genid, sizeof(genid));
> +
> +			// because of VM generation change, we need to rebuild world
> +			reseed_app_env();
> +
> +			// confirm we're done handling gen ID update
> +			write(fd, &genid, sizeof(genid));
> +		} while (atomic_read(thread_active));
> +
> +		close(fd);
> +	}
> +
> +2) ASYNC simplified example::
> +
> +	void handle_io_on_sysgenfd(int sysgenfd)
> +	{
> +		unsigned genid;
> +
> +		// read new gen ID - we need it to confirm we've handled update
> +		read(fd, &genid, sizeof(genid));
> +
> +		// because of VM generation change, we need to rebuild world
> +		reseed_app_env();
> +
> +		// confirm we're done handling the gen ID update
> +		write(fd, &genid, sizeof(genid));
> +	}
> +
> +	int main() {
> +		int epfd, sysgenfd;
> +		struct epoll_event ev;
> +
> +		epfd = epoll_create(EPOLL_QUEUE_LEN);
> +
> +		sysgenfd = open("/dev/sysgenid",
> +		               O_RDWR | O_CLOEXEC | O_NONBLOCK,
> +		               S_IRUSR | S_IWUSR);
> +
> +		// register sysgenid for polling
> +		ev.events = EPOLLIN;
> +		ev.data.fd = sysgenfd;
> +		epoll_ctl(epfd, EPOLL_CTL_ADD, sysgenfd, &ev);
> +
> +		// register other parts of your app for polling
> +		// ...
> +
> +		while (1) {
> +			// wait for something to do...
> +			int nfds = epoll_wait(epfd, events,
> +				MAX_EPOLL_EVENTS_PER_RUN,
> +				EPOLL_RUN_TIMEOUT);
> +			if (nfds < 0) die("Error in epoll_wait!");
> +
> +			// for each ready fd
> +			for(int i = 0; i < nfds; i++) {
> +				int fd = events[i].data.fd;
> +
> +				if (fd == sysgenfd)
> +					handle_io_on_sysgenfd(sysgenfd);
> +				else
> +					handle_some_other_part_of_the_app(fd);
> +			}
> +		}
> +
> +		return 0;
> +	}
> +
> +3) Mapped memory polling simplified example::
> +
> +	/*
> +	 * app/library function that provides cached secrets
> +	 */
> +	char * safe_cached_secret(app_data_t *app)
> +	{
> +		char *secret;
> +		volatile unsigned *const genid_ptr = get_sysgenid_mapping(app);
> +	again:
> +		secret = __cached_secret(app);
> +
> +		if (unlikely(*genid_ptr != app->cached_genid)) {
> +			app->cached_genid = *genid_ptr;
> +			barrier();
> +
> +			// rebuild world then confirm the genid update (thru write)
> +			rebuild_caches(app);
> +
> +			ack_sysgenid_update(app);
> +
> +			goto again;
> +		}
> +
> +		return secret;



Hmm. This seems to rely on the assumption that if you have
read the ID and it did not change, then all is well.

Problem is, in the interrupt driven implementation
this is not a safe assumption to make: ID
from hypervisor might have changed but interrupt
could be delayed.


If we map the hypervisor ID to userspace then we won't
have this race ... worth worry about? why not?



> +	}
> +
> +4) Orchestrator simplified example::
> +
> +	/*
> +	 * orchestrator - manages multiple applications and libraries used by
> +	 * a service and tries to make sure all sensitive components gracefully
> +	 * handle VM generation changes.
> +	 * Following function is called on detection of a VM generation change.
> +	 */
> +	int handle_sysgen_update(int sysgen_fd, unsigned new_gen_id)
> +	{
> +		// pause until all components have handled event
> +		pause_service();
> +
> +		// confirm *this* watcher as up-to-date
> +		write(sysgen_fd, &new_gen_id, sizeof(unsigned));
> +
> +		// wait for all *others* for at most 5 seconds.
> +		ioctl(sysgen_fd, VMGENID_WAIT_WATCHERS, 5000);
> +
> +		// all applications on the system have rebuilt worlds
> +		resume_service();
> +	}
> diff --git a/drivers/misc/Kconfig b/drivers/misc/Kconfig
> index fafa8b0..931d716 100644
> --- a/drivers/misc/Kconfig
> +++ b/drivers/misc/Kconfig
> @@ -456,6 +456,22 @@ config PVPANIC
>  	  a paravirtualized device provided by QEMU; it lets a virtual machine
>  	  (guest) communicate panic events to the host.
>  
> +config SYSGENID
> +	tristate "System Generation ID driver"
> +	default N
> +	help
> +	  This is a System Generation ID driver which provides a system
> +	  generation counter. The driver exposes FS ops on /dev/sysgenid
> +	  through which it can provide information and notifications on system
> +	  generation changes that happen because of VM or container snapshots
> +	  or cloning.
> +	  This enables applications and libraries that store or cache
> +	  sensitive information, to know that they need to regenerate it
> +	  after process memory has been exposed to potential copying.
> +
> +	  To compile this driver as a module, choose M here: the
> +	  module will be called sysgenid.
> +
>  config HISI_HIKEY_USB
>  	tristate "USB GPIO Hub on HiSilicon Hikey 960/970 Platform"
>  	depends on (OF && GPIOLIB) || COMPILE_TEST
> diff --git a/drivers/misc/Makefile b/drivers/misc/Makefile
> index d23231e..4b4933d 100644
> --- a/drivers/misc/Makefile
> +++ b/drivers/misc/Makefile
> @@ -57,3 +57,4 @@ obj-$(CONFIG_HABANA_AI)		+= habanalabs/
>  obj-$(CONFIG_UACCE)		+= uacce/
>  obj-$(CONFIG_XILINX_SDFEC)	+= xilinx_sdfec.o
>  obj-$(CONFIG_HISI_HIKEY_USB)	+= hisi_hikey_usb.o
> +obj-$(CONFIG_SYSGENID)		+= sysgenid.o
> diff --git a/drivers/misc/sysgenid.c b/drivers/misc/sysgenid.c
> new file mode 100644
> index 0000000..dd64099
> --- /dev/null
> +++ b/drivers/misc/sysgenid.c
> @@ -0,0 +1,298 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * System Generation ID driver
> + *
> + * Copyright (C) 2020 Amazon. All rights reserved.
> + *
> + *	Authors:
> + *	  Adrian Catangiu <acatan@amazon.com>
> + *
> + */
> +#include <linux/acpi.h>
> +#include <linux/kernel.h>
> +#include <linux/minmax.h>
> +#include <linux/miscdevice.h>
> +#include <linux/mm.h>
> +#include <linux/module.h>
> +#include <linux/poll.h>
> +#include <linux/random.h>
> +#include <linux/uuid.h>
> +#include <linux/sysgenid.h>
> +
> +struct sysgenid_data {
> +	unsigned long		map_buf;
> +	wait_queue_head_t	read_waitq;
> +	atomic_t		generation_counter;
> +
> +	unsigned int		watchers;
> +	atomic_t		outdated_watchers;
> +	wait_queue_head_t	outdated_waitq;
> +	spinlock_t		lock;
> +};
> +static struct sysgenid_data sysgenid_data;
> +
> +struct file_data {
> +	unsigned int acked_gen_counter;
> +};
> +
> +static int equals_gen_counter(unsigned int counter)
> +{
> +	return counter == atomic_read(&sysgenid_data.generation_counter);
> +}
> +
> +static void _bump_generation(int min_gen)
> +{
> +	unsigned long flags;
> +	int counter;
> +
> +	spin_lock_irqsave(&sysgenid_data.lock, flags);
> +	counter = max(min_gen, 1 + atomic_read(&sysgenid_data.generation_counter));
> +	atomic_set(&sysgenid_data.generation_counter, counter);
> +	*((int *) sysgenid_data.map_buf) = counter;
> +	atomic_set(&sysgenid_data.outdated_watchers, sysgenid_data.watchers);
> +
> +	wake_up_interruptible(&sysgenid_data.read_waitq);
> +	wake_up_interruptible(&sysgenid_data.outdated_waitq);
> +	spin_unlock_irqrestore(&sysgenid_data.lock, flags);
> +}
> +
> +void sysgenid_bump_generation(void)
> +{
> +	_bump_generation(0);
> +}
> +EXPORT_SYMBOL(sysgenid_bump_generation);
> +
> +static void put_outdated_watchers(void)
> +{
> +	if (atomic_dec_and_test(&sysgenid_data.outdated_watchers))
> +		wake_up_interruptible(&sysgenid_data.outdated_waitq);
> +}
> +
> +static int sysgenid_open(struct inode *inode, struct file *file)
> +{
> +	struct file_data *fdata = kzalloc(sizeof(struct file_data), GFP_KERNEL);
> +	unsigned long flags;
> +
> +	if (!fdata)
> +		return -ENOMEM;
> +
> +	spin_lock_irqsave(&sysgenid_data.lock, flags);
> +	fdata->acked_gen_counter = atomic_read(&sysgenid_data.generation_counter);
> +	++sysgenid_data.watchers;
> +	spin_unlock_irqrestore(&sysgenid_data.lock, flags);
> +
> +	file->private_data = fdata;
> +
> +	return 0;
> +}
> +
> +static int sysgenid_close(struct inode *inode, struct file *file)
> +{
> +	struct file_data *fdata = file->private_data;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&sysgenid_data.lock, flags);
> +	if (!equals_gen_counter(fdata->acked_gen_counter))
> +		put_outdated_watchers();
> +	--sysgenid_data.watchers;
> +	spin_unlock_irqrestore(&sysgenid_data.lock, flags);
> +
> +	kfree(fdata);
> +
> +	return 0;
> +}
> +
> +static ssize_t sysgenid_read(struct file *file, char __user *ubuf,
> +							 size_t nbytes, loff_t *ppos)
> +{
> +	struct file_data *fdata = file->private_data;
> +	ssize_t ret;
> +	int gen_counter;
> +
> +	if (nbytes == 0)
> +		return 0;
> +	/* disallow partial reads */
> +	if (nbytes < sizeof(gen_counter))
> +		return -EINVAL;
> +
> +	if (equals_gen_counter(fdata->acked_gen_counter)) {
> +		if (file->f_flags & O_NONBLOCK)
> +			return -EAGAIN;
> +		ret = wait_event_interruptible(
> +			sysgenid_data.read_waitq,
> +			!equals_gen_counter(fdata->acked_gen_counter)
> +		);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	gen_counter = atomic_read(&sysgenid_data.generation_counter);
> +	ret = copy_to_user(ubuf, &gen_counter, sizeof(gen_counter));
> +	if (ret)
> +		return -EFAULT;
> +
> +	return sizeof(gen_counter);
> +}
> +
> +static ssize_t sysgenid_write(struct file *file, const char __user *ubuf,
> +							  size_t count, loff_t *ppos)
> +{
> +	struct file_data *fdata = file->private_data;
> +	unsigned int new_acked_gen;
> +	unsigned long flags;
> +
> +	/* disallow partial writes */
> +	if (count != sizeof(new_acked_gen))
> +		return -EINVAL;
> +	if (copy_from_user(&new_acked_gen, ubuf, count))
> +		return -EFAULT;
> +
> +	spin_lock_irqsave(&sysgenid_data.lock, flags);
> +	/* wrong gen-counter acknowledged */
> +	if (!equals_gen_counter(new_acked_gen)) {
> +		spin_unlock_irqrestore(&sysgenid_data.lock, flags);
> +		return -EINVAL;
> +	}
> +	if (!equals_gen_counter(fdata->acked_gen_counter)) {
> +		fdata->acked_gen_counter = new_acked_gen;
> +		put_outdated_watchers();
> +	}
> +	spin_unlock_irqrestore(&sysgenid_data.lock, flags);
> +
> +	return (ssize_t)count;
> +}
> +
> +static __poll_t sysgenid_poll(struct file *file, poll_table *wait)
> +{
> +	__poll_t mask = 0;
> +	struct file_data *fdata = file->private_data;
> +
> +	if (!equals_gen_counter(fdata->acked_gen_counter))
> +		return EPOLLIN | EPOLLRDNORM;
> +
> +	poll_wait(file, &sysgenid_data.read_waitq, wait);
> +
> +	if (!equals_gen_counter(fdata->acked_gen_counter))
> +		mask = EPOLLIN | EPOLLRDNORM;
> +
> +	return mask;
> +}
> +
> +static long sysgenid_ioctl(struct file *file,
> +						   unsigned int cmd, unsigned long arg)
> +{
> +	struct file_data *fdata = file->private_data;
> +	unsigned long timeout_ns, min_gen;
> +	ktime_t until;
> +	int ret = 0;
> +
> +	switch (cmd) {
> +	case SYSGENID_GET_OUTDATED_WATCHERS:
> +		ret = atomic_read(&sysgenid_data.outdated_watchers);
> +		break;
> +	case SYSGENID_WAIT_WATCHERS:
> +		timeout_ns = arg * NSEC_PER_MSEC;
> +		until = timeout_ns ? ktime_set(0, timeout_ns) : KTIME_MAX;
> +
> +		ret = wait_event_interruptible_hrtimeout(
> +			sysgenid_data.outdated_waitq,
> +			(!atomic_read(&sysgenid_data.outdated_watchers) ||
> +					!equals_gen_counter(fdata->acked_gen_counter)),
> +			until
> +		);
> +		if (atomic_read(&sysgenid_data.outdated_watchers))
> +			ret = -EINTR;
> +		else
> +			ret = 0;
> +		break;
> +	case SYSGENID_FORCE_GEN_UPDATE:
> +		if (!checkpoint_restore_ns_capable(current_user_ns()))
> +			return -EACCES;
> +		min_gen = arg;
> +		_bump_generation(min_gen);
> +		break;
> +	default:
> +		ret = -EINVAL;
> +		break;
> +	}
> +	return ret;
> +}
> +
> +static int sysgenid_mmap(struct file *file, struct vm_area_struct *vma)
> +{
> +	struct file_data *fdata = file->private_data;
> +
> +	if (vma->vm_pgoff != 0 || vma_pages(vma) > 1)
> +		return -EINVAL;
> +
> +	if ((vma->vm_flags & VM_WRITE) != 0)
> +		return -EPERM;
> +
> +	vma->vm_flags |= VM_DONTEXPAND | VM_DONTDUMP;
> +	vma->vm_flags &= ~VM_MAYWRITE;
> +	vma->vm_private_data = fdata;
> +
> +	return vm_insert_page(vma, vma->vm_start,
> +						  virt_to_page(sysgenid_data.map_buf));
> +}
> +
> +static const struct file_operations fops = {
> +	.owner		= THIS_MODULE,
> +	.mmap		= sysgenid_mmap,
> +	.open		= sysgenid_open,
> +	.release	= sysgenid_close,
> +	.read		= sysgenid_read,
> +	.write		= sysgenid_write,
> +	.poll		= sysgenid_poll,
> +	.unlocked_ioctl	= sysgenid_ioctl,
> +};
> +
> +static struct miscdevice sysgenid_misc = {
> +	.minor = MISC_DYNAMIC_MINOR,
> +	.name = "sysgenid",
> +	.fops = &fops,
> +};
> +
> +static int __init sysgenid_init(void)
> +{
> +	int ret;
> +
> +	sysgenid_data.map_buf = get_zeroed_page(GFP_KERNEL);
> +	if (!sysgenid_data.map_buf)
> +		return -ENOMEM;
> +
> +	atomic_set(&sysgenid_data.generation_counter, 0);
> +	atomic_set(&sysgenid_data.outdated_watchers, 0);
> +	init_waitqueue_head(&sysgenid_data.read_waitq);
> +	init_waitqueue_head(&sysgenid_data.outdated_waitq);
> +	spin_lock_init(&sysgenid_data.lock);
> +
> +	ret = misc_register(&sysgenid_misc);
> +	if (ret < 0) {
> +		pr_err("misc_register() failed for sysgenid\n");
> +		goto err;
> +	}
> +
> +	return 0;
> +
> +err:
> +	free_pages(sysgenid_data.map_buf, 0);
> +	sysgenid_data.map_buf = 0;
> +
> +	return ret;
> +}
> +
> +static void __exit sysgenid_exit(void)
> +{
> +	misc_deregister(&sysgenid_misc);
> +	free_pages(sysgenid_data.map_buf, 0);
> +	sysgenid_data.map_buf = 0;
> +}
> +
> +module_init(sysgenid_init);
> +module_exit(sysgenid_exit);
> +
> +MODULE_AUTHOR("Adrian Catangiu");
> +MODULE_DESCRIPTION("System Generation ID");
> +MODULE_LICENSE("GPL");
> +MODULE_VERSION("0.1");
> diff --git a/include/uapi/linux/sysgenid.h b/include/uapi/linux/sysgenid.h
> new file mode 100644
> index 0000000..ea38fd3
> --- /dev/null
> +++ b/include/uapi/linux/sysgenid.h
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0+ WITH Linux-syscall-note */
> +
> +#ifndef _UAPI_LINUX_SYSGENID_H
> +#define _UAPI_LINUX_SYSGENID_H
> +
> +#include <linux/ioctl.h>
> +
> +#define SYSGENID_IOCTL 0x2d
> +#define SYSGENID_GET_OUTDATED_WATCHERS _IO(SYSGENID_IOCTL, 1)
> +#define SYSGENID_WAIT_WATCHERS         _IO(SYSGENID_IOCTL, 2)
> +#define SYSGENID_FORCE_GEN_UPDATE      _IO(SYSGENID_IOCTL, 3)
> +
> +#ifdef __KERNEL__
> +void sysgenid_bump_generation(void);
> +#endif /* __KERNEL__ */
> +
> +#endif /* _UAPI_LINUX_SYSGENID_H */
> +
> -- 
> 2.7.4
> 
> 
> 
> 
> Amazon Development Center (Romania) S.R.L. registered office: 27A Sf. Lazar Street, UBC5, floor 2, Iasi, Iasi County, 700045, Romania. Registered in Romania. Registration number J22/2621/2005.


