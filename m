Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DB7B4576BB
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:52:07 +0100 (CET)
Received: from localhost ([::1]:58218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8zW-0002eF-1D
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:52:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mo8uJ-0006eu-VH
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:46:46 -0500
Received: from zero.eik.bme.hu ([152.66.115.2]:19669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mo8uH-0003qk-MJ
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 13:46:43 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id AA208755F74;
 Fri, 19 Nov 2021 19:46:39 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 87927748F54; Fri, 19 Nov 2021 19:46:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 86091746353;
 Fri, 19 Nov 2021 19:46:39 +0100 (CET)
Date: Fri, 19 Nov 2021 19:46:39 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [RFC PATCH-for-6.2 v3] qdev-monitor: Only allow full --global
 <driver>.<property>=<val> option
In-Reply-To: <20211119182644.480115-1-philmd@redhat.com>
Message-ID: <a83d167f-60b8-6991-2f5-ab6ab8a6beac@eik.bme.hu>
References: <20211119182644.480115-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-1480844191-1637347599=:35384"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-1480844191-1637347599=:35384
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 19 Nov 2021, Philippe Mathieu-Daudé wrote:
> When not all fields of the --global option are provided,
> QEMU might crash:
>
>  $ qemu-system-x86_64 -global driver=isa-fdc
>  qemu-system-x86_64: ../../devel/qemu/qapi/string-input-visitor.c:394:
>  string_input_visitor_new: Assertion `str' failed.
>  Aborted (core dumped)
>
> Fix by only allowing --global with all 3 fields:
>
>  $ qemu-system-x86_64 -global driver=isa-fdc
>  Invalid 'global' option format. It must be provided as:
>    --global <driver>.<property>=<value>
>
> Reported-by: Thomas Huth <thuth@redhat.com>
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/604
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v3: Change qemu_global_option (Markus)
>
> Supersedes: <20211119122911.365036-1-philmd@redhat.com>
> ---
> softmmu/qdev-monitor.c | 9 +++------
> 1 file changed, 3 insertions(+), 6 deletions(-)
>
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index 01f3834db57..558272b147c 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -1029,13 +1029,10 @@ int qemu_global_option(const char *str)
>         qemu_opt_set(opts, "value", str + offset + 1, &error_abort);
>         return 0;
>     }
> +    printf("Invalid 'global' option format. It must be provided as:\n");
> +    printf("  --global <driver>.<property>=<value>\n");

Should these be something else tnan plain printf? (Such as qemu_prinf or 
qdev_printf or similar? Not sure how these work but plain printf in QEMU 
is usually not what's meant.)

Regards,
BALATON Zoltan

> -    opts = qemu_opts_parse_noisily(&qemu_global_opts, str, false);
> -    if (!opts) {
> -        return -1;
> -    }
> -
> -    return 0;
> +    return -1;
> }
>
> bool qmp_command_available(const QmpCommand *cmd, Error **errp)
>
--3866299591-1480844191-1637347599=:35384--

