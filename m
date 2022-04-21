Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA0B50A68C
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 19:06:07 +0200 (CEST)
Received: from localhost ([::1]:54302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhaFq-0001fN-KF
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 13:06:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34888)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nhZqZ-00077u-TR
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:40:00 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:44827)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1nhZqO-0002gZ-4D
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 12:39:49 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-BYCwZ-a1M0On5axwtwNxJg-1; Thu, 21 Apr 2022 12:39:40 -0400
X-MC-Unique: BYCwZ-a1M0On5axwtwNxJg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A4251833960;
 Thu, 21 Apr 2022 16:39:39 +0000 (UTC)
Received: from bahia (unknown [10.39.192.169])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8126154FB82;
 Thu, 21 Apr 2022 16:39:38 +0000 (UTC)
Date: Thu, 21 Apr 2022 18:39:37 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 4/5] 9pfs: fix wrong errno being sent to Linux client
 on macOS host
Message-ID: <20220421183937.21531b9a@bahia>
In-Reply-To: <eee249e308d99bb72ede83fef7bb7dc5a54ec43e.1650553693.git.qemu_oss@crudebyte.com>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <eee249e308d99bb72ede83fef7bb7dc5a54ec43e.1650553693.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org, qemu-stable@nongnu.org,
 Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 21 Apr 2022 17:07:49 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Linux and macOS only share some errno definitions with equal macro
> name and value. In fact most mappings for errno are completely
> different on the two systems.
> 
> This patch converts some important errno values from macOS host to
> corresponding Linux errno values before eventually sending such error
> codes along with 'Rlerror' replies (if 9p2000.L is used that is). Not
> having translated errnos before violated the 9p2000.L protocol spec,
> which says:
> 
>   "
>   size[4] Rlerror tag[2] ecode[4]
> 
>   ... ecode is a numerical Linux errno.
>   "
> 
>   https://github.com/chaos/diod/wiki/protocol#lerror----return-error-code
> 
> This patch fixes a bunch of misbehaviours when running a Linux client
> on macOS host. For instance this patch fixes:
> 
>   mount -t 9p -o posixacl ...
> 
> on Linux guest if security_mode=mapped was used for 9p server, which
> refused to mount successfully, because macOS returned ENOATTR==93
> when client tried to retrieve POSIX ACL xattrs, because errno 93
> is defined as EPROTONOSUPPORT==93 on Linux, so Linux client believed
> that xattrs were not supported by filesystem on host in general.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> Link: https://lore.kernel.org/qemu-devel/20220421124835.3e664669@bahia/
> ---

Reviewed-by: Greg Kurz <groug@kaod.org>

>  hw/9pfs/9p-util.h | 30 ++++++++++++++++++++++++++++++
>  hw/9pfs/9p.c      |  2 ++
>  2 files changed, 32 insertions(+)
> 
> diff --git a/hw/9pfs/9p-util.h b/hw/9pfs/9p-util.h
> index 2cc9a5dbfb..c3526144c9 100644
> --- a/hw/9pfs/9p-util.h
> +++ b/hw/9pfs/9p-util.h
> @@ -58,6 +58,36 @@ static inline uint64_t host_dev_to_dotl_dev(dev_t dev)
>  #endif
>  }
>  
> +/* Translates errno from host -> Linux if needed */
> +static inline int errno_to_dotl(int err) {
> +#if defined(CONFIG_LINUX)
> +    /* nothing to translate (Linux -> Linux) */
> +#elif defined(CONFIG_DARWIN)
> +    /*
> +     * translation mandatory for macOS hosts
> +     *
> +     * FIXME: Only most important errnos translated here yet, this should be
> +     * extended to as many errnos being translated as possible in future.
> +     */
> +    if (err == ENAMETOOLONG) {
> +        err = 36; /* ==ENAMETOOLONG on Linux */
> +    } else if (err == ENOTEMPTY) {
> +        err = 39; /* ==ENOTEMPTY on Linux */
> +    } else if (err == ELOOP) {
> +        err = 40; /* ==ELOOP on Linux */
> +    } else if (err == ENOATTR) {
> +        err = 61; /* ==ENODATA on Linux */
> +    } else if (err == ENOTSUP) {
> +        err = 95; /* ==EOPNOTSUPP on Linux */
> +    } else if (err == EOPNOTSUPP) {
> +        err = 95; /* ==EOPNOTSUPP on Linux */
> +    }
> +#else
> +#error Missing errno translation to Linux for this host system
> +#endif
> +    return err;
> +}
> +
>  #ifdef CONFIG_DARWIN
>  #define qemu_fgetxattr(...) fgetxattr(__VA_ARGS__, 0, 0)
>  #define qemu_lgetxattr(...) getxattr(__VA_ARGS__, 0, XATTR_NOFOLLOW)
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index 4a296a0b94..0cd0c14c2a 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -1054,6 +1054,8 @@ static void coroutine_fn pdu_complete(V9fsPDU *pdu, ssize_t len)
>              }
>              len += ret;
>              id = P9_RERROR;
> +        } else {
> +            err = errno_to_dotl(err);
>          }
>  
>          ret = pdu_marshal(pdu, len, "d", err);


