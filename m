Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 882D122C06C
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Jul 2020 10:04:16 +0200 (CEST)
Received: from localhost ([::1]:52778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jysgh-0007rI-LG
	for lists+qemu-devel@lfdr.de; Fri, 24 Jul 2020 04:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jysfy-0007Pr-9z
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 04:03:30 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:35700
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1jysfw-0002vz-R8
 for qemu-devel@nongnu.org; Fri, 24 Jul 2020 04:03:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595577807;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Y876ob/vJvAsa7NDlct25LdWzmaYxpVakU5PST/fgE=;
 b=QrUgAWjf4AYzGHebVBQHofBTPmdMYF5vWdZp3vuh+rZzl7UNdB3A7mSbHDW5OtmowXMwLa
 2IW1mUGS4w0WUxA7YT+JKW1gjpdy+4D+8ukfb3DbGrpr20fvcvk4iTWl+bKb73C6lZq12U
 1a4kb/6OUg1BE8l5ZY7gScCgCDZZt1I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-kOTomrmbOFyLMEdABQEo4g-1; Fri, 24 Jul 2020 04:03:25 -0400
X-MC-Unique: kOTomrmbOFyLMEdABQEo4g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BF1D7107ACCA;
 Fri, 24 Jul 2020 08:03:24 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-143.ams2.redhat.com
 [10.36.112.143])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 75B6E69500;
 Fri, 24 Jul 2020 08:03:24 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 0D32C111CA26; Fri, 24 Jul 2020 10:03:23 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH-for-5.1? v2] qapi/error: Check format string argument in
 error_*prepend()
References: <20200723171205.14949-1-philmd@redhat.com>
Date: Fri, 24 Jul 2020 10:03:22 +0200
In-Reply-To: <20200723171205.14949-1-philmd@redhat.com> ("Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9=22's?= message of "Thu, 23 Jul 2020 19:12:05
 +0200")
Message-ID: <87o8o5cpbp.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=205.139.110.120; envelope-from=armbru@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/24 01:23:10
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
> error_propagate_prepend() does not. Fix by addint the format

s/addint/adding/

> attribute to error_propagate_prepend() and error_vprepend().
>
> This would have caught the bug fixed in the previous commit:
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

I see no need to repeat the details here.  If you agree, I'll drop them
in my tree.

> Missed in commit 4b5766488f "error: Fix use of error_prepend() with
> &error_fatal, &error_abort".
>
> Inspired-by: Stefan Weil <sw@weilnetz.de>
> Suggested-by: Eric Blake <eblake@redhat.com>
> Reviewed-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Markus Armbruster <armbru@redhat.com>


