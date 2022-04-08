Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CE24F9771
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Apr 2022 15:58:38 +0200 (CEST)
Received: from localhost ([::1]:36228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncp8I-0004P2-1y
	for lists+qemu-devel@lfdr.de; Fri, 08 Apr 2022 09:58:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ncp2N-0003eH-Un
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 09:52:32 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:40991)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1ncp2L-0006SG-RS
 for qemu-devel@nongnu.org; Fri, 08 Apr 2022 09:52:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=TxFZzDmwQ9FOlRqyH4eE9Th8P8FOoYDhUz9oflHG7JY=; b=k2rDixytZy1P69UtE1splNKtgK
 EJBhgd1iQuqB5VXKBzsF7Azcd98Y614omdho1TFa/mtjsIj9Mr7FP9yI+MlR0Wi1mc6xg0EniHCnZ
 D+qbgGhW/GcC19nXW429wPEMra4q4AmkJXjZzR3NgubWNPG4pLfnVK997J/gIrGma8mdMOmDpNVql
 7VqQIStQpTKtbIFutb+BV/1foE5/UwAh5ZFjGCTQ+tQs3g+vxonnDnGcRzjTmTYfuRRaNhpHFKLFa
 jbEwdXQaB04myHF1SSHTEOWLfyEeAEZiRvrynRNyCYNKUkFmCQiazJ+4pOgJKqcV0VjiKmwztBZax
 or+dckXBjkvk5ALvRpj6yVINq4X6fJuEJ6RpOAY5JJmd/lddKm2/+7qtBuE8PF9Z/9OuBGbgsl+Oj
 jMON10RDMf9SRQmijJxk48oLjXNT895tTEfOz6dFzIGN2zEEHNlXap8WoT/IUqDqCHaAcbA9nolPa
 qfXPLkrzUyeRkQapWdaMSAaTcF+OLJL3GonIu6tfc/1kOTVM2J2fXLtIZwSd/7kssL7omNAfVcCNa
 P0Mw+2yTeldKFw0i9isqShw2xkO+v2Wc0RIr/txW2P2LNaiSy1DBuvkq6H3lOLtjLyrJsQQi6+5f5
 jgdsUgegmMwv+ayQnUbWmiybXmje2AQgJZC8dzGVA=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Greg Kurz <groug@kaod.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>, hi@alyssa.is,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Keno Fischer <keno@juliacomputing.com>,
 Will Cohen <wwcohen@gmail.com>
Subject: Re: [PATCH v9 09/11] 9p: darwin: Implement compatibility for mknodat
Date: Fri, 08 Apr 2022 15:52:25 +0200
Message-ID: <1684580.f98VPQ1boI@silver>
In-Reply-To: <20220227223522.91937-10-wwcohen@gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
 <20220227223522.91937-10-wwcohen@gmail.com>
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

On Sonntag, 27. Februar 2022 23:35:20 CEST Will Cohen wrote:
> From: Keno Fischer <keno@juliacomputing.com>
> 
> Darwin does not support mknodat. However, to avoid race conditions
> with later setting the permissions, we must avoid using mknod on
> the full path instead. We could try to fchdir, but that would cause
> problems if multiple threads try to call mknodat at the same time.
> However, luckily there is a solution: Darwin includes a function
> that sets the cwd for the current thread only.
> This should suffice to use mknod safely.
[...]
> diff --git a/hw/9pfs/9p-util-darwin.c b/hw/9pfs/9p-util-darwin.c
> index cdb4c9e24c..bec0253474 100644
> --- a/hw/9pfs/9p-util-darwin.c
> +++ b/hw/9pfs/9p-util-darwin.c
> @@ -7,6 +7,8 @@
> 
>  #include "qemu/osdep.h"
>  #include "qemu/xattr.h"
> +#include "qapi/error.h"
> +#include "qemu/error-report.h"
>  #include "9p-util.h"
> 
>  ssize_t fgetxattrat_nofollow(int dirfd, const char *filename, const char
> *name, @@ -62,3 +64,34 @@ int fsetxattrat_nofollow(int dirfd, const char
> *filename, const char *name, close_preserve_errno(fd);
>      return ret;
>  }
> +
> +/*
> + * As long as mknodat is not available on macOS, this workaround
> + * using pthread_fchdir_np is needed.
> + *
> + * Radar filed with Apple for implementing mknodat:
> + * rdar://FB9862426 (https://openradar.appspot.com/FB9862426)
> + */
> +#if defined CONFIG_PTHREAD_FCHDIR_NP
> +
> +int qemu_mknodat(int dirfd, const char *filename, mode_t mode, dev_t dev)
> +{
> +    int preserved_errno, err;
> +    if (!pthread_fchdir_np) {
> +        error_report_once("pthread_fchdir_np() not available on this
> version of macOS"); +        return -ENOTSUP;
> +    }
> +    if (pthread_fchdir_np(dirfd) < 0) {
> +        return -1;
> +    }
> +    err = mknod(filename, mode, dev);

I just tested this on macOS Monterey and realized mknod() seems to require 
admin privileges on macOS to work. So if you run QEMU as ordinary user on 
macOS then mknod() would fail with errno=1 (Operation not permitted).

That means a lot of stuff would simply not work on macOS, unless you really 
want to run QEMU with super user privileges, which does not sound appealing to 
me. :/

Should we introduce another fake behaviour here, i.e. remapping this on macOS 
hosts as regular file and make guest believe it would create a device, similar 
as we already do for mapped links?

> +    preserved_errno = errno;
> +    /* Stop using the thread-local cwd */
> +    pthread_fchdir_np(-1);
> +    if (err < 0) {
> +        errno = preserved_errno;
> +    }
> +    return err;
> +}
> +
> +#endif



