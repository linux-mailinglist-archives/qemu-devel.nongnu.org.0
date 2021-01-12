Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7732F304F
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 14:09:56 +0100 (CET)
Received: from localhost ([::1]:59142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzJQq-0003nV-23
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 08:09:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60014)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1kzJOC-0002tc-Cy
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:07:12 -0500
Received: from mail.kernel.org ([198.145.29.99]:59948)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gregkh@linuxfoundation.org>)
 id 1kzJO9-0001ct-Iq
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 08:07:11 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6B8702311B;
 Tue, 12 Jan 2021 13:07:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1610456827;
 bh=AAVThBMSN6NMX4AAzXi3Ln1jtkaPVvhGY2TI/Z+L7Rg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=fgNjEF4bQdQXvkrVWWOBJEs9lwF3zlEYBpaLq2P7eKlpF9UPyUE6NJAvZm8wN9W82
 ggBNPpR194gK7PWvF53LvENanWLNE2Xc4euoiB+XV703LhvaVvRBf+gAz7lq1/mVsG
 ESqElFii2bw4Tp2l0o/2c7sKMM98oMS3tHStF1Do=
Date: Tue, 12 Jan 2021 14:08:15 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Adrian Catangiu <acatan@amazon.com>
Subject: Re: [PATCH v4 1/2] drivers/misc: sysgenid: add system generation id
 driver
Message-ID: <X/2fP9LNWXvp7up9@kroah.com>
References: <1610453760-13812-1-git-send-email-acatan@amazon.com>
 <1610453760-13812-2-git-send-email-acatan@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1610453760-13812-2-git-send-email-acatan@amazon.com>
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=gregkh@linuxfoundation.org; helo=mail.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_HI=-5,
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
 linux-s390@vger.kernel.org, corbet@lwn.net, mpe@ellerman.id.au, mst@redhat.com,
 ebiggers@kernel.org, borntraeger@de.ibm.com, sblbir@amazon.com,
 bonzini@gnu.org, arnd@arndb.de, jannh@google.com, raduweis@amazon.com,
 asmehra@redhat.com, graf@amazon.com, rppt@kernel.org, luto@kernel.org,
 gil@azul.com, colmmacc@amazon.com, tytso@mit.edu, ovzxemul@gmail.com,
 areber@redhat.com, linux-kernel@vger.kernel.org, ebiederm@xmission.com,
 rafael@kernel.org, w@1wt.eu, dwmw@amazon.co.uk
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jan 12, 2021 at 02:15:59PM +0200, Adrian Catangiu wrote:
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

"sizeof(unsigned)"?  How about being specific and making this a real "X
bits big" value please.

"unsigned" does not work well across user/kernel boundries.  Ok, that's
on understatement, the correct thing is "does not work at all".

Please be specific in your apis.

This is listed elsewhere also.

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

But this number can instantly change after it is read, what good is it?
It should never be relied on, so why is this needed at all?

What can userspace do with this information?

thanks,

greg k-h

