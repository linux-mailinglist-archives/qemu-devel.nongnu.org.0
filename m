Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 083EE5C00D8
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 17:14:46 +0200 (CEST)
Received: from localhost ([::1]:54436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob1Qy-0004mW-Eo
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 11:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ob1NX-0007H8-B3
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:11:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:53899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1ob1NU-00081k-3s
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 11:11:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663773067;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=E9tb5K0ATjyE5IMNLpugAdTFo+8PR9GChQYy7CO3LbM=;
 b=i/EZ7Ln+E2Cu+9k+/v5sQ2azIH3dJFsfXwmqcBq07u43vozE0L+bTjs/u9AqTB9ehvJ64r
 +Nk86YoW+SQdGCR5Jbln0H/g5ZYOIqSsi+vVnoJx+qHbmnYP2BDdbxsfM32bSjliEERaq2
 IaWK7YByibWzrHtHpwmEr0KlhSpuH/U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-x1bE_8J3MriBWaJdVBohDQ-1; Wed, 21 Sep 2022 11:11:05 -0400
X-MC-Unique: x1bE_8J3MriBWaJdVBohDQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5CDAD803912;
 Wed, 21 Sep 2022 15:11:05 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.192.163])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 12043C4C9D6;
 Wed, 21 Sep 2022 15:11:05 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id B568621E6900; Wed, 21 Sep 2022 17:11:03 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Dongli Zhang <dongli.zhang@oracle.com>
Cc: Markus Armbruster <armbru@redhat.com>,  qemu-devel@nongnu.org,
 qemu-trivial@nongnu.org,  dgilbert@redhat.com,  joe.jin@oracle.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: Re: [PATCH v3 1/1] monitor/hmp: print trace as option in help for
 log command
References: <20220831213943.8155-1-dongli.zhang@oracle.com>
 <87h71qrmkh.fsf@pond.sub.org>
 <d4ed9983-586e-ea44-90ad-0fc0f259acfc@amsat.org>
 <4c0425d5-65fa-72e8-5950-abcee7a3a8ce@oracle.com>
Date: Wed, 21 Sep 2022 17:11:03 +0200
In-Reply-To: <4c0425d5-65fa-72e8-5950-abcee7a3a8ce@oracle.com> (Dongli Zhang's
 message of "Sun, 18 Sep 2022 23:49:25 -0700")
Message-ID: <87edw4ahko.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Dongli Zhang <dongli.zhang@oracle.com> writes:

> Hi Markus,
>
> On 9/17/22 2:44 PM, Philippe Mathieu-Daud=C3=A9 via wrote:
>> Hi Markus,
>>=20
>> On 2/9/22 14:24, Markus Armbruster wrote:
>>> Dongli Zhang <dongli.zhang@oracle.com> writes:
>>>
>>>> The below is printed when printing help information in qemu-system-x86=
_64
>>>> command line, and when CONFIG_TRACE_LOG is enabled:
>>>>
>>>> ----------------------------
>>>> $ qemu-system-x86_64 -d help
>>>> ... ...
>>>> trace:PATTERN=C2=A0=C2=A0 enable trace events
>>>>
>>>> Use "-d trace:help" to get a list of trace events.
>>>> ----------------------------
>>>>
>>>> However, the options of "trace:PATTERN" are only printed by
>>>> "qemu-system-x86_64 -d help", but missing in hmp "help log" command.
>>>>
>>>> Fixes: c84ea00dc2 ("log: add "-d trace:PATTERN"")
>>>> Cc: Joe Jin <joe.jin@oracle.com>
>>>> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
>>>> ---
>>>> Changed since v1:
>>>> - change format for "none" as well.
>>>> Changed since v2:
>>>> - use "log trace:help" in help message.
>>>> - add more clarification in commit message.
>>>> - add 'Fixes' tag.
>>>> ---
>>>> =C2=A0 monitor/hmp.c | 9 +++++++--
>>>> =C2=A0 1 file changed, 7 insertions(+), 2 deletions(-)
>>=20
>>> Not this patch's fault:
>>>
>>> 1. "-d help" terminates with exit status 1, "-d trace:help" with 0.=C2=
=A0 The
>>> =C2=A0=C2=A0=C2=A0 former is wrong.
>
> May I assume it is expected to have exit status 1 when "-d help"?

Non-zero exit status means error.  Asking for and receiving help is not
an error.  Therefore, "-d help" should exit with status 0, just like
"-help", "-device help", "-machine help", ...

> According to the output of "-d", there is even not a "help" option, but o=
nly a
> "-d trace:help" option. That is, "-d help" is not officially supported.

It *is* documented:

    $ qemu-system-x86_64 -help | grep -- '^-d '
    -d item1,...    enable logging of specified items (use '-d help' for a =
list of log items)

> The below example use "-d hellworld" but not "help".
>
> # qemu-system-x86_64 -d helloworld
> Log items (comma separated):
> out_asm         show generated host assembly code for each compiled TB
> in_asm          show target assembly code for each compiled TB
> op              show micro ops for each compiled TB
> op_opt          show micro ops after optimization
> op_ind          show micro ops before indirect lowering
> int             show interrupts/exceptions in short format
> exec            show trace before each executed TB (lots of logs)
> cpu             show CPU registers before entering a TB (lots of logs)
> fpu             include FPU registers in the 'cpu' logging
> mmu             log MMU-related activities
> pcall           x86 only: show protected mode far calls/returns/exceptions
> cpu_reset       show CPU state before CPU resets
> unimp           log unimplemented functionality
> guest_errors    log when the guest OS does something invalid (eg accessin=
g a
> non-existent register)
> page            dump pages at beginning of user mode emulation
> nochain         do not chain compiled TBs so that "exec" and "cpu" show
> complete traces
> plugin          output from TCG plugins
>
> strace          log every user-mode syscall, its input, and its result
> tid             open a separate log file per thread; filename must contai=
n '%d'
> trace:PATTERN   enable trace events
>
> Use "-d trace:help" to get a list of trace events.
>
>
> According to the source code, the qemu_str_to_log_mask() expects either l=
og
> items or "trace". For any other inputs (e.g., "help" or "helloworld"),
> qemu_str_to_log_mask() returns 0 (no bit set in the mask).

You're right.

>                                                            That indicates=
 the
> input (e.g., "help") is not an expected input.

No, it indicates laziness :)

> Therefore, can I assume this is not a bug? I do not think something like =
below
> is very helpful.
>
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index 263f029a8e..54c8e624bf 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -2389,6 +2389,8 @@ static void qemu_process_early_options(void)
>              mask =3D qemu_str_to_log_mask(log_mask);
>              if (!mask) {
>                  qemu_print_log_usage(stdout);
> +                if (g_str_equal(log_mask, "help"))
> +                    exit(0)
>                  exit(1);
>              }
>          }

Let's make "-d help" print help to stdout and terminate successfully,
and "-d crap" report an error and terminate unsuccessfully.  Just like
other options, such as -device and -machine.

> Thank you very much!

You're welcome!


