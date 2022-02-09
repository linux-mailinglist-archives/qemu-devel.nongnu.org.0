Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6695B4AF20E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 13:47:35 +0100 (CET)
Received: from localhost ([::1]:39118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHmNh-0007Zd-OI
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 07:47:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHmAz-0003ob-T5; Wed, 09 Feb 2022 07:34:25 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:52827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nHmAw-0002p6-9P; Wed, 09 Feb 2022 07:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=yT6gjUafrH61VY9rJX9omIrT4XSs2aee0EH3trEm0T4=; b=M0cUzKCkRXG+4/GBfacRleVo/r
 9LEiRrJJL6p9bNIjnWjwotdSxagb6YNXv8l7/MZu+UFsko+5bRqQZAhwdZasrOkr5iE9FQJHTYxNK
 eCNfh+hmeBIaeoWPZx+YIwhcp9/fK8ObbgPPCuA4DVgihOVSqax5izpYGa9eDRcttK8Be30Hqnrt9
 M2LYRoWNrLu94MAbeOrMqiGcnNO6GheaOgYTNhYltiifLKXFu/dcTvpLA0swvecFUa8Cqv/cWHtb4
 5RxaLg6khFshJKV1u/2eAIPA+rivUTZV5UlwUJlgsC8TBbevoj0Hc/roK7BXnqxrDzIE0aVQNR9dr
 egSeF9CdgOdxVzYhGnFqyVxHH9pzZW7YiLITLACUSxqzYd78XylmgbOkDHOBuEi5nrPDFsARBpEN8
 cpm5bxHS6ABhBm0t/7Vn6nAwhNEKb8/SI1F5CVEfJjo1KjyMksU8UHUX8zi+hkLq1x/CDLw+dAwLv
 1bnHpB0oLBcfdWTdglxUNY77zCD9J/zSEycSQ/AtGHDkBptdkEtwy1PLtZ5sRPueZCR83DM3D9YIy
 dbr9l6QUHCnl9aZJ+xj2U2+XU8icttVAYl19/2yeeGcm+sOcM7aaRcOZjCkT+mkHGdmh8q1HJsmDN
 uWqqv8E3wP6U8iSSXVnSXlNIC83krkLSGyiQsiaf4=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Vitaly Chikunov <vt@altlinux.org>, Greg Kurz <groug@kaod.org>,
 qemu-stable@nongnu.org, "Dmitry V . Levin" <ldv@altlinux.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH v4] 9pfs: Fix segfault in do_readdir_many caused by struct
 dirent overread
Date: Wed, 09 Feb 2022 13:34:08 +0100
Message-ID: <2508467.LGuOOJKFuP@silver>
In-Reply-To: <20220206013419.849161-1-vt@altlinux.org>
References: <20220206013419.849161-1-vt@altlinux.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sonntag, 6. Februar 2022 02:34:19 CET Vitaly Chikunov wrote:
> `struct dirent' returned from readdir(3) could be shorter (or longer)
> than `sizeof(struct dirent)', thus memcpy of sizeof length will overread
> into unallocated page causing SIGSEGV. Example stack trace:
> 
>  #0  0x00005555559ebeed v9fs_co_readdir_many (/usr/bin/qemu-system-x86_64 +
> 0x497eed) #1  0x00005555559ec2e9 v9fs_readdir (/usr/bin/qemu-system-x86_64
> + 0x4982e9) #2  0x0000555555eb7983 coroutine_trampoline
> (/usr/bin/qemu-system-x86_64 + 0x963983) #3  0x00007ffff73e0be0 n/a (n/a +
> 0x0)
> 
> While fixing, provide a helper for any future `struct dirent' cloning.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/841
> Cc: qemu-stable@nongnu.org
> Co-authored-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Reviewed-by: Dmitry V. Levin <ldv@altlinux.org>
> Signed-off-by: Vitaly Chikunov <vt@altlinux.org>
> ---
> Tested on x68-64 Linux with btrfs-progs tests and slow qos-test.
> Changes since v3:
> - Update commentary on qemu_dirent_dup logic.
> - Use g_memdup as suggested by Greg Kurz.
> 
>  hw/9pfs/codir.c      |  3 +--
>  include/qemu/osdep.h | 13 +++++++++++++
>  util/osdep.c         | 21 +++++++++++++++++++++
>  3 files changed, 35 insertions(+), 2 deletions(-)

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

I plan to send a PR with my current queue to Peter tomorrow.

Best regards,
Christian Schoenebeck



