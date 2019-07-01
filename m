Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E858250511
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 11:03:04 +0200 (CEST)
Received: from localhost ([::1]:48906 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfKsR-0004V5-Go
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 05:03:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48535)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <armbru@redhat.com>) id 1hfKrQ-0003hr-CO
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 05:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1hfKrJ-0000fa-NY
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 05:01:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:39668)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hfKrJ-0007Yp-A3
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 05:01:53 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 541E93082E57
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 09:01:27 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-117-169.ams2.redhat.com
 [10.36.117.169])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D41F5608E4;
 Mon, 24 Jun 2019 09:01:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id D8D8311386A0; Mon, 24 Jun 2019 10:17:33 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
References: <20190620114116.27254-1-imammedo@redhat.com>
Date: Mon, 24 Jun 2019 10:17:33 +0200
In-Reply-To: <20190620114116.27254-1-imammedo@redhat.com> (Igor Mammedov's
 message of "Thu, 20 Jun 2019 07:41:16 -0400")
Message-ID: <87blynv1lu.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.46]); Mon, 24 Jun 2019 09:01:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] deprecate -mem-path fallback to anonymous
 RAM
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
Cc: libvir-list@redhat.com, qemu-devel@nongnu.org, ehabkost@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Igor Mammedov <imammedo@redhat.com> writes:

> Fallback might affect guest or worse whole host performance
> or functionality if backing file were used to share guest RAM
> with another process.
>
> Patch deprecates fallback so that we could remove it in future
> and ensure that QEMU will provide expected behavior and fail if
> it can't use user provided backing file.
>
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> ---
> PS:
> Patch is written on top of
>   [PATCH v4 0/3] numa: deprecate '-numa node,  mem' and default memory distribution
> to avoid conflicts in qemu-deprecated.texi
>
>  numa.c               | 4 ++--
>  qemu-deprecated.texi | 8 ++++++++
>  2 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/numa.c b/numa.c
> index 91a29138a2..53d67b8ad9 100644
> --- a/numa.c
> +++ b/numa.c
> @@ -494,8 +494,8 @@ static void allocate_system_memory_nonnuma(MemoryRegion *mr, Object *owner,
>              if (mem_prealloc) {
>                  exit(1);
>              }
> -            error_report("falling back to regular RAM allocation.");
> -
> +            warn_report("falling back to regular RAM allocation. "
> +                        "Fallback to RAM allocation is deprecated.");

Can we give the user clues on how to avoid the deprecated fallback?

Warning message nitpick: the message should be a single phrase, with no
newline or trailing punctuation.  Suggest something like

               warn_report("falling back to regular RAM allocation");
               error_printf("This is deprecated.  <Advice on what\n"
                            "to do goes here>\n");

>              /* Legacy behavior: if allocation failed, fall back to
>               * regular RAM allocation.
>               */
> diff --git a/qemu-deprecated.texi b/qemu-deprecated.texi
> index 2fe9b72121..2193705644 100644
> --- a/qemu-deprecated.texi
> +++ b/qemu-deprecated.texi
> @@ -112,6 +112,14 @@ QEMU using implicit generic or board specific splitting rule.
>  Use @option{memdev} with @var{memory-backend-ram} backend or @option{mem} (if
>  it's supported by used machine type) to define mapping explictly instead.
>  
> +@subsection -mem-path fallback to RAM (since 4.1)
> +Currently if system memory allocation from file pointed by @option{mem-path}
> +fails, QEMU fallbacks to allocating from anonymous RAM. Which might result
> +in unpredictable behavior since provided backing file wasn't used.


Noch such verb "to fallback", obvious fix "QEMU falls back to"

Suggest "RAM, which might".

Better: "since the backing file specified by the user is ignored".

>                                                                     In future
> +QEMU will not fallback and fail to start up, so user could fix his/her QEMU/host
> +configuration or explicitly use -m without -mem-path if system memory allocated
> +from anonymous RAM suits usecase.

What's "system memory allocation"?

Perhaps: "In the future, QEMU will not fall back, but fail instead.
Adjust either the host configuration [FIXME how?] or the QEMU
configuration [FIXME how?]."

> +
>  @section QEMU Machine Protocol (QMP) commands
>  
>  @subsection block-dirty-bitmap-add "autoload" parameter (since 2.12.0)

