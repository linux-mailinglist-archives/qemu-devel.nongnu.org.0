Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1210B1E1ABE
	for <lists+qemu-devel@lfdr.de>; Tue, 26 May 2020 07:41:35 +0200 (CEST)
Received: from localhost ([::1]:36312 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jdSLG-0002N8-3n
	for lists+qemu-devel@lfdr.de; Tue, 26 May 2020 01:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdSJy-0001Xg-3U
 for qemu-devel@nongnu.org; Tue, 26 May 2020 01:40:14 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:38867
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1jdSJw-0003i8-DM
 for qemu-devel@nongnu.org; Tue, 26 May 2020 01:40:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1590471610;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:openpgp:openpgp;
 bh=Hgj6S5o4q6p9Ub2BrBKfxqvCHDI16c2kJzICs4jojNg=;
 b=bBnPKqRAB34Hve7/IfHKiCmNxmHb7MsV/zbbTDbnKmWgdXl/+oNW6dh9TsITBL/PeV2acD
 FQN80ikvrgZ/xrAPP9mAoY//r9Gl+/IWiCjg2rmoGebhGu/Gcfk1J5ASLCPYmzY8VlUEQa
 svQAqAa8vqag47skW0zkXRrIqUv5xc4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-64-b3-vN7WtOReT5I0QZN2TfQ-1; Tue, 26 May 2020 01:40:07 -0400
X-MC-Unique: b3-vN7WtOReT5I0QZN2TfQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C350EC1A4;
 Tue, 26 May 2020 05:40:05 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-138.ams2.redhat.com [10.36.112.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 805F75C1BE;
 Tue, 26 May 2020 05:40:03 +0000 (UTC)
Subject: Re: [PATCH 1/1] util/oslib: Returns real thread identifier on FreeBSD
 and NetBSD
To: David CARLIER <devnexen@gmail.com>, qemu-devel@nongnu.org,
 bauerchen@tencent.com
References: <CA+XhMqwMsmoYwNtkrvAEG_j_-8L=+PYcXSz--1Qg622szArkRQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <f9ebb603-0a0e-8775-8405-dd8de2493a3f@redhat.com>
Date: Tue, 26 May 2020 07:40:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CA+XhMqwMsmoYwNtkrvAEG_j_-8L=+PYcXSz--1Qg622szArkRQ@mail.gmail.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/26 01:14:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Kamil Rytarowski <kamil@netbsd.org>, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/05/2020 09.23, David CARLIER wrote:
> Hi this is my first contribution hope it s useful . Regards.

 Hi!

Thanks for your contribution. Some hints for getting your patch included:

- Please make sure to CC: the corresponding maintainers, otherwise your
patch might get lost in the high traffic of the mailing list. See the
MAINTAINERS file for more information.

- For simple patches like this one, it might also be helpful to CC:
qemu-trivial@nongnu.org so that the patch could get picked up via the
trivial queue

> From ca7fcd85e0453f7173ce73732905463bc259ee32 Mon Sep 17 00:00:00 2001
> From: David Carlier <devnexen@gmail.com>
> Date: Sat, 23 May 2020 08:17:51 +0100
> Subject: [PATCH] util/oslib: returns real thread identifier on FreeBSD and
>  NetBSD

The body of the mail should only contain a proper patch description, not
these head lines anymore, so that the patch can directly applied via
"git am". Please also add a proper description, e.g. saying what's the
effect of your patch. Is it just a cosmetic thing? Does it fix a real
bug that you've hit?

> Signed-off-by: David Carlier <devnexen@gmail.com>
> ---
>  util/oslib-posix.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> index 062236a1ab..4d28dfd8f5 100644
> --- a/util/oslib-posix.c
> +++ b/util/oslib-posix.c
> @@ -48,11 +48,13 @@
>  #ifdef __FreeBSD__
>  #include <sys/sysctl.h>
>  #include <sys/user.h>
> +#include <sys/thr.h>
>  #include <libutil.h>
>  #endif
> 
>  #ifdef __NetBSD__
>  #include <sys/sysctl.h>
> +#include <lwp.h>
>  #endif
> 
>  #include "qemu/mmap-alloc.h"
> @@ -84,6 +86,13 @@ int qemu_get_thread_id(void)
>  {
>  #if defined(__linux__)
>      return syscall(SYS_gettid);
> +#elif defined(__FreeBSD__)
> +    // thread id is up to INT_MAX

QEMU coding style only used /* ... */ comments, see the CODING_STYLE.rst
file.

> +    long tid;
> +    thr_self(&tid);
> +    return (int)tid;
> +#elif defined(__NetBSD__)
> +    return _lwp_self();
>  #else
>      return getpid();
>  #endif
> 

 HTH,
  Thomas


