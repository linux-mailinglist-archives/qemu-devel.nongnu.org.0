Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B02BF476496
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 22:31:51 +0100 (CET)
Received: from localhost ([::1]:56726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxbsM-0007PB-MV
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 16:31:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mxbfH-0005N2-NP
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:18:21 -0500
Received: from [2001:41c9:1:41f::167] (port=45856
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mxbfF-0008Hr-PW
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 16:18:19 -0500
Received: from [2a00:23c4:8b9f:c400:72e2:646b:9043:c91d]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1mxbet-000BvI-0Q; Wed, 15 Dec 2021 21:17:59 +0000
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20211215140454.1725364-1-alex.bennee@linaro.org>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-ID: <ca69a722-f992-eaa6-b963-cbc535594bf8@ilande.co.uk>
Date: Wed, 15 Dec 2021 21:18:05 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211215140454.1725364-1-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a00:23c4:8b9f:c400:72e2:646b:9043:c91d
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3] monitor: move x-query-profile into accel/tcg to fix
 build
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.64,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/12/2021 14:04, Alex Bennée wrote:

> As --enable-profiler isn't defended in CI we missed this breakage.
> Move the qmp handler into accel/tcg so we have access to the helpers
> we need. While we are at it ensure we gate the feature on CONFIG_TCG.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> Reported-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> Fixes: 37087fde0e ("qapi: introduce x-query-profile QMP command")
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/773
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Message-Id: <20211214195048.1438209-1-alex.bennee@linaro.org>
> 
> ---
> v3
>    - also add #ifdef CONFIG_TCG to hmp-commands-info.hx
> ---
>   qapi/machine.json    |  1 +
>   accel/tcg/cpu-exec.c | 31 +++++++++++++++++++++++++++++++
>   monitor/qmp-cmds.c   | 31 -------------------------------
>   hmp-commands-info.hx |  2 ++
>   4 files changed, 34 insertions(+), 31 deletions(-)
> 
> diff --git a/qapi/machine.json b/qapi/machine.json
> index 067e3f5378..0c9f24a712 100644
> --- a/qapi/machine.json
> +++ b/qapi/machine.json
> @@ -1492,6 +1492,7 @@
>   ##
>   { 'command': 'x-query-profile',
>     'returns': 'HumanReadableText',
> +  'if': 'CONFIG_TCG',
>     'features': [ 'unstable' ] }
>   
>   ##
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 409ec8c38c..8b4cd6c59d 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -1090,4 +1090,35 @@ HumanReadableText *qmp_x_query_opcount(Error **errp)
>       return human_readable_text_from_str(buf);
>   }
>   
> +#ifdef CONFIG_PROFILER
> +
> +int64_t dev_time;
> +
> +HumanReadableText *qmp_x_query_profile(Error **errp)
> +{
> +    g_autoptr(GString) buf = g_string_new("");
> +    static int64_t last_cpu_exec_time;
> +    int64_t cpu_exec_time;
> +    int64_t delta;
> +
> +    cpu_exec_time = tcg_cpu_exec_time();
> +    delta = cpu_exec_time - last_cpu_exec_time;
> +
> +    g_string_append_printf(buf, "async time  %" PRId64 " (%0.3f)\n",
> +                           dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
> +    g_string_append_printf(buf, "qemu time   %" PRId64 " (%0.3f)\n",
> +                           delta, delta / (double)NANOSECONDS_PER_SECOND);
> +    last_cpu_exec_time = cpu_exec_time;
> +    dev_time = 0;
> +
> +    return human_readable_text_from_str(buf);
> +}
> +#else
> +HumanReadableText *qmp_x_query_profile(Error **errp)
> +{
> +    error_setg(errp, "Internal profiler not compiled");
> +    return NULL;
> +}
> +#endif
> +
>   #endif /* !CONFIG_USER_ONLY */
> diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
> index 343353e27a..be5e44c569 100644
> --- a/monitor/qmp-cmds.c
> +++ b/monitor/qmp-cmds.c
> @@ -355,37 +355,6 @@ void qmp_display_reload(DisplayReloadOptions *arg, Error **errp)
>       }
>   }
>   
> -#ifdef CONFIG_PROFILER
> -
> -int64_t dev_time;
> -
> -HumanReadableText *qmp_x_query_profile(Error **errp)
> -{
> -    g_autoptr(GString) buf = g_string_new("");
> -    static int64_t last_cpu_exec_time;
> -    int64_t cpu_exec_time;
> -    int64_t delta;
> -
> -    cpu_exec_time = tcg_cpu_exec_time();
> -    delta = cpu_exec_time - last_cpu_exec_time;
> -
> -    g_string_append_printf(buf, "async time  %" PRId64 " (%0.3f)\n",
> -                           dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
> -    g_string_append_printf(buf, "qemu time   %" PRId64 " (%0.3f)\n",
> -                           delta, delta / (double)NANOSECONDS_PER_SECOND);
> -    last_cpu_exec_time = cpu_exec_time;
> -    dev_time = 0;
> -
> -    return human_readable_text_from_str(buf);
> -}
> -#else
> -HumanReadableText *qmp_x_query_profile(Error **errp)
> -{
> -    error_setg(errp, "Internal profiler not compiled");
> -    return NULL;
> -}
> -#endif
> -
>   static int qmp_x_query_rdma_foreach(Object *obj, void *opaque)
>   {
>       RdmaProvider *rdma;
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index 407a1da800..e90f20a107 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -358,6 +358,7 @@ SRST
>       Show host USB devices.
>   ERST
>   
> +#if defined(CONFIG_TCG)
>       {
>           .name       = "profile",
>           .args_type  = "",
> @@ -365,6 +366,7 @@ ERST
>           .help       = "show profiling information",
>           .cmd_info_hrt = qmp_x_query_profile,
>       },
> +#endif
>   
>   SRST
>     ``info profile``

Thanks Alex, I can confirm that a build of git master with --enable-profiler now 
works for my test case with this patch applied:

Tested-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>


ATB,

Mark.

