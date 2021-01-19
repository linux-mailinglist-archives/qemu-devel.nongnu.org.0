Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4142F2FC3F2
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 23:42:58 +0100 (CET)
Received: from localhost ([::1]:47962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1ziC-00085I-RV
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 17:42:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rdunlap@infradead.org>)
 id 1l1zah-0005hS-9T
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 17:35:11 -0500
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1]:57534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rdunlap@infradead.org>)
 id 1l1zac-0007qu-Ui; Tue, 19 Jan 2021 17:35:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=OtL4sdAGsJ08z7fCxeCmMVsJDaQwBot6LG44qZyyGSk=; b=DXq12zrUsz5JbfiOkM3/P+/8RC
 RVJssaknA/7T+p+K1KP2P7Sc4lQOv1swnQ+FwXP4oSwuCDe5IOLaHX2Ajp6t/wJbb6hzSJC01rsuX
 MsegCFIS23WG4OTrofNGyE1GuKF6m4qq9rU/ObWUy1s5/taEm7+hlJHxrltuO/LgxeYAAcSU4wZnF
 A7VGnrMdtgpDsxEbHE2gHVm+oogiA0eiKzPk3I+pxtKTmlN3wUySac8uDXl3G4h3VibiZHmo6sdcQ
 ktwmyM50mI9O6KIwfVx7I02IwEs/kmZA6Wt0IaTHTExSlyJzLDwJIT8DR/+pLQCCByDxwzqDhTFqf
 oTk/e/sA==;
Received: from [2601:1c0:6280:3f0::9abc]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1za7-0002Cl-CZ; Tue, 19 Jan 2021 22:34:36 +0000
Subject: Re: [PATCH v4 1/2] drivers/misc: sysgenid: add system generation id
 driver
To: Adrian Catangiu <acatan@amazon.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org, kvm@vger.kernel.org,
 linux-s390@vger.kernel.org
References: <1610453760-13812-1-git-send-email-acatan@amazon.com>
 <1610453760-13812-2-git-send-email-acatan@amazon.com>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <2764a194-934c-5426-728a-cd755a6e395f@infradead.org>
Date: Tue, 19 Jan 2021 14:34:17 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <1610453760-13812-2-git-send-email-acatan@amazon.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=2001:8b0:10b:1231::1;
 envelope-from=rdunlap@infradead.org; helo=merlin.infradead.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 1/12/21 4:15 AM, Adrian Catangiu wrote:
> - Background and problem
> 

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

                                                                 update

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

Please use (unsigned int), not just (unsigned).
(Linux style)

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

ditto.

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

		unsigned int genid;

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

		unsigned int genid;

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

		         unsigned int

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

	                                        unsigned int

> +	{
> +		// pause until all components have handled event
> +		pause_service();
> +
> +		// confirm *this* watcher as up-to-date
> +		write(sysgen_fd, &new_gen_id, sizeof(unsigned));

		                                     unsigned int

> +
> +		// wait for all *others* for at most 5 seconds.
> +		ioctl(sysgen_fd, VMGENID_WAIT_WATCHERS, 5000);
> +
> +		// all applications on the system have rebuilt worlds
> +		resume_service();
> +	}


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

Please document new IOCTL major/magic values in
Documentation/userspace-api/ioctl/ioctl-number.rst.



thanks.
-- 
~Randy
"He closes his eyes and drops the goggles.  You can't get hurt
by looking at a bitmap.  Or can you?"
(Neal Stephenson: Snow Crash)

