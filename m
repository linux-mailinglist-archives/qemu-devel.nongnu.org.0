Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 767DF22AFF6
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jul 2020 15:10:21 +0200 (CEST)
Received: from localhost ([::1]:41276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jyazM-0006ia-Hp
	for lists+qemu-devel@lfdr.de; Thu, 23 Jul 2020 09:10:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jyayG-0005lO-HB
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 09:09:12 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:38112
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jyayE-00025G-S7
 for qemu-devel@nongnu.org; Thu, 23 Jul 2020 09:09:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595509750;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=enNkGzHiE3Cu/yUcvfbbEBt8oFR1XU5ocSYs5XM7SEs=;
 b=FgoLGSIjUfvmEQNljZ3j98WGhgRVKvMi8kAhWbK+5AZ33aGN2IlCLFvrcVW85aouJ4jmcJ
 b3H6opOqbmQV6mQ7/0LrMSmYNme9kDt7R9acbXrXN9zKlNeFt1Bndv5HWx9iU3EqMr7loj
 ljFBVl9aGB2R+8mNqqNpOIxuhYs/fxs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-218-jdT1jZEFOUeB3IfnZIOAtg-1; Thu, 23 Jul 2020 09:09:08 -0400
X-MC-Unique: jdT1jZEFOUeB3IfnZIOAtg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 17ACA58;
 Thu, 23 Jul 2020 13:09:07 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B701A5FC3B;
 Thu, 23 Jul 2020 13:09:06 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 40B20111CA26; Thu, 23 Jul 2020 15:09:05 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.1?] qapi/error: Check format string argument in
 error_propagate_prepend()
References: <20200723091309.18690-1-philmd@redhat.com>
Date: Thu, 23 Jul 2020 15:09:05 +0200
In-Reply-To: <20200723091309.18690-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 23 Jul 2020 11:13:09
 +0200")
Message-ID: <87o8o6fkem.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/23 06:04:25
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> writes:

> error_propagate_prepend() "behaves like error_prepend()", and
> error_prepend() uses "formatting @fmt, ... like printf()".
> error_prepend() checks its format string argument, but
> error_propagate_prepend() does not. Fix that.
>
> This would have catched the invalid format introduced in commit

s/catched/caught/

> b98e8d1230f:
>
>     CC      hw/sd/milkymist-memcard.o
>   hw/sd/milkymist-memcard.c: In function =E2=80=98milkymist_memcard_reali=
ze=E2=80=99:
>   hw/sd/milkymist-memcard.c:284:70: error: format =E2=80=98%s=E2=80=99 ex=
pects a matching =E2=80=98char *=E2=80=99 argument [-Werror=3Dformat=3D]
>     284 |         error_propagate_prepend(errp, err, "failed to init SD c=
ard: %s");
>         |                                                                =
     ~^
>         |                                                                =
      |
>         |                                                                =
      char *

Suggest to shorten to

  This would have caught the bug fixed in the previous commit.

and make sure Stefan's fix actually becomes the previous commit.

> Fixes: 4b5766488f ("Fix use of error_prepend() with &error_fatal, &error_=
abort")

Kind of.  Omitting the attritbute isn't wrong, just foolish / careless.

I'd write

  Missed in commit 4b5766488f "error: Fix use of error_prepend() with
  &error_fatal, &error_abort".

> Inspired-by: Stefan Weil <sw@weilnetz.de>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

If you like my tweaks, I can apply them in my tree.

> ---
>  include/qapi/error.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/include/qapi/error.h b/include/qapi/error.h
> index 7932594dce..eeeef1a34d 100644
> --- a/include/qapi/error.h
> +++ b/include/qapi/error.h
> @@ -381,6 +381,7 @@ void error_propagate(Error **dst_errp, Error *local_e=
rr);
>   *     error_propagate(dst_errp, local_err);
>   * Please use ERRP_GUARD() and error_prepend() instead when possible.
>   */
> +GCC_FMT_ATTR(3, 4)
>  void error_propagate_prepend(Error **dst_errp, Error *local_err,
>                               const char *fmt, ...);

Reviewed-by: Markus Armbruster <armbru@redhat.com>


