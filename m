Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6B252D91E
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 11:33:03 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50597 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVuxD-0008VE-0O
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 05:33:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53151)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hVuvt-0008BB-Ne
	for qemu-devel@nongnu.org; Wed, 29 May 2019 05:31:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cohuck@redhat.com>) id 1hVuvs-0007nV-R9
	for qemu-devel@nongnu.org; Wed, 29 May 2019 05:31:41 -0400
Received: from mx1.redhat.com ([209.132.183.28]:62385)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cohuck@redhat.com>) id 1hVuvs-0007nD-MU
	for qemu-devel@nongnu.org; Wed, 29 May 2019 05:31:40 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id D1B5FC06647C;
	Wed, 29 May 2019 09:31:25 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 524CD271A4;
	Wed, 29 May 2019 09:31:22 +0000 (UTC)
Date: Wed, 29 May 2019 11:31:19 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Laurent Vivier <laurent@vivier.eu>
Message-ID: <20190529113119.58212175.cohuck@redhat.com>
In-Reply-To: <20190529084804.25950-1-laurent@vivier.eu>
References: <20190529084804.25950-1-laurent@vivier.eu>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.31]);
	Wed, 29 May 2019 09:31:31 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] linux-user: emulate msgsnd(),
 msgrcv() and semtimedop()
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>,
	Riku Voipio <riku.voipio@iki.fi>, qemu-devel@nongnu.org,
	Alex =?UTF-8?B?QmVubsOpZQ==?= <alex.bennee@linaro.org>,
	Aleksandar Markovic <aleksandar.m.mail@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 May 2019 10:48:04 +0200
Laurent Vivier <laurent@vivier.eu> wrote:

> When we have updated kernel headers to 5.2-rc1 we have introduced
> new syscall numbers that can be not supported by older kernels
> and fail with ENOSYS while the guest emulation succeeded before
> because the syscalls were emulated with ipc().
> 
> This patch fixes the problem by using ipc() if the new syscall
> returns ENOSYS.
> 
> Fixes: 86e636951ddc ("linux-user: fix __NR_semtimedop undeclared error")
> Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> ---
> 
> Notes:
>     v2: replace ENOSYS by TARGET_ENOSYS
> 
>  linux-user/syscall.c      | 61 +++++++++++++++++++--------------------
>  linux-user/syscall_defs.h |  1 +
>  2 files changed, 31 insertions(+), 31 deletions(-)

I hope this headers update is now done with bringing joy :)

Not a linux-user expert, but it does look reasonable.

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

