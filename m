Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 981D2568651
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 13:03:22 +0200 (CEST)
Received: from localhost ([::1]:49466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o92oT-00025W-La
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 07:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1o92kj-00013e-7C
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 06:59:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49852)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1o92ke-0004aB-Tp
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 06:59:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657105163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3tlZ/+9ZYIeHJASqIf2x8+LpZieF5PNuSnOPpiogf4c=;
 b=KGGWbTkX7iSvK4JSnBwFkK3xzg3lhqjN4bz+fe/COy33cti2vmRW77pLs5s3ywuYR8Vmq+
 ByxF3Or41o98hZngCkX2fKgXamn5oK++MMesyE60MypTPjEJXE1tQe0NGa3PqR1Kux0P8G
 SpaYjyZ2vLBransWKDD/K+2NV6r1wpE=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-IJNleuzIPeKGyj9DfDhIfA-1; Wed, 06 Jul 2022 06:59:16 -0400
X-MC-Unique: IJNleuzIPeKGyj9DfDhIfA-1
Received: by mail-oi1-f200.google.com with SMTP id
 bk19-20020a0568081a1300b00337980403e5so5878361oib.13
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 03:59:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3tlZ/+9ZYIeHJASqIf2x8+LpZieF5PNuSnOPpiogf4c=;
 b=ldNOedRGjr/pOsL1Lmtk3znOO2Ch1ghrEivDCM7ZBmn4Y44lH9fZ3OQezE6z0skIUz
 cOHwnJVWDg9QVlUFiXJPICuCLkC0u/lfu8/Lkc/190KOR2nIawuWSnDYh5xamLgId61v
 6tDhfrzxAL6OjFLQI7zmd1DG98E2NDo0eWdocPYB5Q6N4BWfAWXwEgnL4j5dVKivQGka
 sTAzv3bw0Cwxreyde0km0X+qMpVv6Z/sX4lU0ulTvFlCaUNPaKph8dUdfd6/mFthIcfT
 QR4DY9oGBwGoLrT2Pho0lRTALuG5UQG/AhUB0VSR4j8F9hEC1WWnAgTokftkVgsmvKhl
 fqgQ==
X-Gm-Message-State: AJIora+FfroaPor5DPeUPKGOkru0nmcdY5sNRXBlm2R2AG0BHzrKqCEN
 CRVXJ8vkJa97Du205ZfgGhRJ2T5GvjbEV+Ne5YzVqkDf3sjWGzn16UvlbHBEAfTjvwMf3EBP3eN
 K+FZKe+9qViBWW3nC20JwCfseTOfKFYE=
X-Received: by 2002:a05:6870:960a:b0:10a:9ebc:70fc with SMTP id
 d10-20020a056870960a00b0010a9ebc70fcmr25619223oaq.205.1657105156036; 
 Wed, 06 Jul 2022 03:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t33JBxEsbnzgJyIrJmIfMtHvscNv9HhQe1JOrkcDs+CkKaijBcqYsmJvSgudO6PKqrJRZQwk0t4isPb5tQ6J8=
X-Received: by 2002:a05:6870:960a:b0:10a:9ebc:70fc with SMTP id
 d10-20020a056870960a00b0010a9ebc70fcmr25619205oaq.205.1657105155815; Wed, 06
 Jul 2022 03:59:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220706095111.686295-1-pizhenwei@bytedance.com>
 <20220706095111.686295-2-pizhenwei@bytedance.com>
In-Reply-To: <20220706095111.686295-2-pizhenwei@bytedance.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 6 Jul 2022 14:59:04 +0400
Message-ID: <CAMxuvayE_zn_ZckKyjra6F7jfg9mm0r8V0t_qO2_wV82oJ7xCA@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] qga: add command 'guest-get-cpustats'
To: zhenwei pi <pizhenwei@bytedance.com>, "Armbruster,
 Markus" <armbru@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, 
 qemu-devel <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi

On Wed, Jul 6, 2022 at 1:56 PM zhenwei pi <pizhenwei@bytedance.com> wrote:
>
> A vCPU thread always reaches 100% utilization when:
> - guest uses idle=3Dpoll
> - disable HLT vm-exit
> - enable MWAIT
>
> Add new guest agent command 'guest-get-cpustats' to get guest CPU
> statistics, we can know the guest workload and how busy the CPU is.
>
> To avoid compiling error like:
> qga/qga-qapi-types.h:948:28: error: expected member name or ';'
>  after declaration specifiers
>         GuestLinuxCpuStats linux;
>         ~~~~~~~~~~~~~~~~~~ ^
> <built-in>:336:15: note: expanded from here
>
> Also add 'linux' into polluted_words.

That looks good to me, although you may want to split the scripts/qapi chan=
ge.

Markus, what do you think?

>
> Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  qga/commands-posix.c   | 89 ++++++++++++++++++++++++++++++++++++++++++
>  qga/commands-win32.c   |  6 +++
>  qga/qapi-schema.json   | 81 ++++++++++++++++++++++++++++++++++++++
>  scripts/qapi/common.py |  2 +-
>  4 files changed, 177 insertions(+), 1 deletion(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index 0469dc409d..f18530d85f 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2893,6 +2893,90 @@ GuestDiskStatsInfoList *qmp_guest_get_diskstats(Er=
ror **errp)
>      return guest_get_diskstats(errp);
>  }
>
> +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
> +{
> +    GuestCpuStatsList *head =3D NULL, **tail =3D &head;
> +    const char *cpustats =3D "/proc/stat";
> +    int clk_tck =3D sysconf(_SC_CLK_TCK);
> +    FILE *fp;
> +    size_t n;
> +    char *line =3D NULL;
> +
> +    fp =3D fopen(cpustats, "r");
> +    if (fp  =3D=3D NULL) {
> +        error_setg_errno(errp, errno, "open(\"%s\")", cpustats);
> +        return NULL;
> +    }
> +
> +    while (getline(&line, &n, fp) !=3D -1) {
> +        GuestCpuStats *cpustat =3D NULL;
> +        GuestLinuxCpuStats *linuxcpustat;
> +        int i;
> +        unsigned long user, system, idle, iowait, irq, softirq, steal, g=
uest;
> +        unsigned long nice, guest_nice;
> +        char name[64];
> +
> +        i =3D sscanf(line, "%s %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu",
> +                   name, &user, &nice, &system, &idle, &iowait, &irq, &s=
oftirq,
> +                   &steal, &guest, &guest_nice);
> +
> +        /* drop "cpu 1 2 3 ...", get "cpuX 1 2 3 ..." only */
> +        if ((i =3D=3D EOF) || strncmp(name, "cpu", 3) || (name[3] =3D=3D=
 '\0')) {
> +            continue;
> +        }
> +
> +        if (i < 5) {
> +            slog("Parsing cpu stat from %s failed, see \"man proc\"", cp=
ustats);
> +            break;
> +        }
> +
> +        cpustat =3D g_new0(GuestCpuStats, 1);
> +        cpustat->type =3D GUEST_CPU_STATS_TYPE_LINUX;
> +
> +        linuxcpustat =3D &cpustat->u.q_linux;
> +        linuxcpustat->cpu =3D atoi(&name[3]);
> +        linuxcpustat->user =3D user * 1000 / clk_tck;
> +        linuxcpustat->nice =3D nice * 1000 / clk_tck;
> +        linuxcpustat->system =3D system * 1000 / clk_tck;
> +        linuxcpustat->idle =3D idle * 1000 / clk_tck;
> +
> +        if (i > 5) {
> +            linuxcpustat->has_iowait =3D true;
> +            linuxcpustat->iowait =3D iowait * 1000 / clk_tck;
> +        }
> +
> +        if (i > 6) {
> +            linuxcpustat->has_irq =3D true;
> +            linuxcpustat->irq =3D irq * 1000 / clk_tck;
> +            linuxcpustat->has_softirq =3D true;
> +            linuxcpustat->softirq =3D softirq * 1000 / clk_tck;
> +        }
> +
> +        if (i > 8) {
> +            linuxcpustat->has_steal =3D true;
> +            linuxcpustat->steal =3D steal * 1000 / clk_tck;
> +        }
> +
> +        if (i > 9) {
> +            linuxcpustat->has_guest =3D true;
> +            linuxcpustat->guest =3D guest * 1000 / clk_tck;
> +        }
> +
> +        if (i > 10) {
> +            linuxcpustat->has_guest =3D true;
> +            linuxcpustat->guest =3D guest * 1000 / clk_tck;
> +            linuxcpustat->has_guestnice =3D true;
> +            linuxcpustat->guestnice =3D guest_nice * 1000 / clk_tck;
> +        }
> +
> +        QAPI_LIST_APPEND(tail, cpustat);
> +    }
> +
> +    free(line);
> +    fclose(fp);
> +    return head;
> +}
> +
>  #else /* defined(__linux__) */
>
>  void qmp_guest_suspend_disk(Error **errp)
> @@ -3247,6 +3331,11 @@ GuestDiskStatsInfoList *qmp_guest_get_diskstats(Er=
ror **errp)
>      return NULL;
>  }
>
> +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
>
>  #endif /* CONFIG_FSFREEZE */
>
> diff --git a/qga/commands-win32.c b/qga/commands-win32.c
> index 36f94c0f9c..7ed7664715 100644
> --- a/qga/commands-win32.c
> +++ b/qga/commands-win32.c
> @@ -2543,3 +2543,9 @@ GuestDiskStatsInfoList *qmp_guest_get_diskstats(Err=
or **errp)
>      error_setg(errp, QERR_UNSUPPORTED);
>      return NULL;
>  }
> +
> +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
> +{
> +    error_setg(errp, QERR_UNSUPPORTED);
> +    return NULL;
> +}
> diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
> index 9fa20e791b..869399ea1a 100644
> --- a/qga/qapi-schema.json
> +++ b/qga/qapi-schema.json
> @@ -1576,3 +1576,84 @@
>  { 'command': 'guest-get-diskstats',
>    'returns': ['GuestDiskStatsInfo']
>  }
> +
> +##
> +# @GuestCpuStatsType:
> +#
> +# An enumeration of OS type
> +#
> +# Since: 7.1
> +##
> +{ 'enum': 'GuestCpuStatsType',
> +  'data': [ 'linux' ] }
> +
> +
> +##
> +# @GuestLinuxCpuStats:
> +#
> +# CPU statistics of Linux
> +#
> +# @cpu: CPU index in guest OS
> +#
> +# @user: Time spent in user mode
> +#
> +# @nice: Time spent in user mode with low priority (nice)
> +#
> +# @system: Time spent in system mode
> +#
> +# @idle: Time spent in the idle task
> +#
> +# @iowait: Time waiting for I/O to complete (since Linux 2.5.41)
> +#
> +# @irq: Time servicing interrupts (since Linux 2.6.0-test4)
> +#
> +# @softirq: Time servicing softirqs (since Linux 2.6.0-test4)
> +#
> +# @steal: Stolen time by host (since Linux 2.6.11)
> +#
> +# @guest: ime spent running a virtual CPU for guest operating systems un=
der
> +#         the  control of the Linux kernel (since Linux 2.6.24)
> +#
> +# @guestnice: Time spent running a niced guest (since Linux 2.6.33)
> +#
> +# Since: 7.1
> +##
> +{ 'struct': 'GuestLinuxCpuStats',
> +  'data': {'cpu': 'int',
> +           'user': 'uint64',
> +           'nice': 'uint64',
> +           'system': 'uint64',
> +           'idle': 'uint64',
> +           '*iowait': 'uint64',
> +           '*irq': 'uint64',
> +           '*softirq': 'uint64',
> +           '*steal': 'uint64',
> +           '*guest': 'uint64',
> +           '*guestnice': 'uint64'
> +           } }
> +
> +##
> +# @GuestCpuStats:
> +#
> +# Get statistics of each CPU in millisecond.
> +#
> +# - @linux: Linux style CPU statistics
> +#
> +# Since: 7.1
> +##
> +{ 'union': 'GuestCpuStats',
> +  'base': { 'type': 'GuestCpuStatsType' },
> +  'discriminator': 'type',
> +  'data': { 'linux': 'GuestLinuxCpuStats' } }
> +
> +##
> +# @guest-get-cpustats:
> +#
> +# Retrieve information about CPU stats.
> +# Returns: List of CPU stats of guest.
> +#
> +# Since: 7.1
> +##
> +{ 'command': 'guest-get-cpustats',
> +  'returns': ['GuestCpuStats']
> +}
> diff --git a/scripts/qapi/common.py b/scripts/qapi/common.py
> index 489273574a..737b059e62 100644
> --- a/scripts/qapi/common.py
> +++ b/scripts/qapi/common.py
> @@ -114,7 +114,7 @@ def c_name(name: str, protect: bool =3D True) -> str:
>                       'and', 'and_eq', 'bitand', 'bitor', 'compl', 'not',
>                       'not_eq', 'or', 'or_eq', 'xor', 'xor_eq'])
>      # namespace pollution:
> -    polluted_words =3D set(['unix', 'errno', 'mips', 'sparc', 'i386'])
> +    polluted_words =3D set(['unix', 'errno', 'mips', 'sparc', 'i386', 'l=
inux'])
>      name =3D re.sub(r'[^A-Za-z0-9_]', '_', name)
>      if protect and (name in (c89_words | c99_words | c11_words | gcc_wor=
ds
>                               | cpp_words | polluted_words)
> --
> 2.20.1
>


