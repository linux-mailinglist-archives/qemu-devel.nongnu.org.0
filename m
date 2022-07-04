Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 151A2564F7C
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 10:15:16 +0200 (CEST)
Received: from localhost ([::1]:51340 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8HEh-00084d-5H
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 04:15:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o8H5D-0008OU-04
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:05:29 -0400
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033]:41660)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1o8H56-0000HM-OO
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 04:05:23 -0400
Received: by mail-pj1-x1033.google.com with SMTP id
 o31-20020a17090a0a2200b001ef7bd037bbso3478927pjo.0
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 01:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=h9C9vTXvGKCGC7R8i25ZjYQt7KhTUL+Vbn9CmrrhAaw=;
 b=0cP81kvo18ITrrJLf8rNWO2baHqY0hxUJ3K5YTgLZAAus8qKL3++Fov2JyfIDkg0/p
 x3weKuFc6RUhMvJLIkqkRNSXUfZNUQ38Cq45DorFKg2bEerCX4hNKCmu9e3833gxyDzG
 FOqO0tFeNTfX7R5IJTRsw4f1IjdIdAE5aQZ7gGyyt+5e7prolLVospFYowUMWGdNwsAt
 3DO2iLqk9Msf9fd+gyWa9z91iQRPNOoodcTVB0QeEIdq2Ioxi9QK6lttyzyIWgAnIveQ
 A8PmFioC0H5/A7GGA6dxK4oL/1x7fZhTu8UEC/42u4SJubDwWs/R+l56PJQpD+diTqnZ
 RAfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=h9C9vTXvGKCGC7R8i25ZjYQt7KhTUL+Vbn9CmrrhAaw=;
 b=jv9spMcrbxavhfMWfivVqizU+tkhASMFWM0stBf9UiNPLydyi/srAreIfPYyDdlXPC
 bhULO+z7P/8QIVVQ9HNx9n9hErqPZMBptqiBmvnbuvmCPsypH9LF14DAeblzXt6wvTUg
 1NgyejeKVUDwXU9lmHxwbpNb8k4HANbY1bC+cg7UkBGyDs1oW/wIczgVEk2M+0XXgzsi
 L+9I9iGyrwFFIRs/Sg3aNlsKn6nnlonsW+Vq7vVZLNJbgktqtROFv/oOoSEtjRVbZh8p
 S7OCLvlKzpwZC1lnkG2g+h33MrzZy3YUgwzncEzwSy0QRk3QltNeNInF98fgu5rAq4Vm
 Z57A==
X-Gm-Message-State: AJIora8l7IEugxG1pCLrmbxqL1+dC6/uE6qTsFX5Jo7APwdHx3kY3cp1
 7Pb116oHfg6tO2PvTryu9aNw2w==
X-Google-Smtp-Source: AGRyM1sl2/kycTvocIvbsWo8ziFcWbGzD7WfhJN5Oj7XmLyxgunKqRmP+3IeLoga3LfENtbp3C5/NA==
X-Received: by 2002:a17:902:d50b:b0:16a:2cb3:74f7 with SMTP id
 b11-20020a170902d50b00b0016a2cb374f7mr34758061plg.6.1656921918431; 
 Mon, 04 Jul 2022 01:05:18 -0700 (PDT)
Received: from [10.76.15.169] ([61.120.150.70])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a63ee11000000b004119deff40dsm8326863pgi.23.2022.07.04.01.05.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 01:05:17 -0700 (PDT)
Message-ID: <1b3f926b-9fe6-a3ec-b697-6fa8471510ad@bytedance.com>
Date: Mon, 4 Jul 2022 16:00:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: Re: [PATCH v2 1/1] qga: add command 'guest-get-cpustats'
Content-Language: en-US
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Markus Armbruster <armbru@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>,
 Konstantin Kostiuk <kkostiuk@redhat.com>, QEMU <qemu-devel@nongnu.org>
References: <20220704023618.626849-1-pizhenwei@bytedance.com>
 <20220704023618.626849-2-pizhenwei@bytedance.com>
 <CAJ+F1CKvsDdJsurivOToZue=HsyrXbuRK2hNxA0UjJsKwhCkZA@mail.gmail.com>
From: zhenwei pi <pizhenwei@bytedance.com>
In-Reply-To: <CAJ+F1CKvsDdJsurivOToZue=HsyrXbuRK2hNxA0UjJsKwhCkZA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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



On 7/4/22 15:28, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Jul 4, 2022 at 6:42 AM zhenwei pi <pizhenwei@bytedance.com 
> <mailto:pizhenwei@bytedance.com>> wrote:
> 
>     A vCPU thread always reaches 100% utilization when:
>     - guest uses idle=poll
>     - disable HLT vm-exit
>     - enable MWAIT
> 
>     Add new guest agent command 'guest-get-cpustats' to get guest CPU
>     statistics, we can know the guest workload and how busy the CPU is.
> 
>     Signed-off-by: zhenwei pi <pizhenwei@bytedance.com
>     <mailto:pizhenwei@bytedance.com>>
>     ---
>       qga/commands-posix.c | 89 ++++++++++++++++++++++++++++++++++++++++++++
>       qga/commands-win32.c |  6 +++
>       qga/qapi-schema.json | 81 ++++++++++++++++++++++++++++++++++++++++
>       3 files changed, 176 insertions(+)
> 
>     diff --git a/qga/commands-posix.c b/qga/commands-posix.c
>     index 0469dc409d..e51f4c8f03 100644
>     --- a/qga/commands-posix.c
>     +++ b/qga/commands-posix.c
>     @@ -2893,6 +2893,90 @@ GuestDiskStatsInfoList
>     *qmp_guest_get_diskstats(Error **errp)
>           return guest_get_diskstats(errp);
>       }
> 
>     +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
>     +{
>     +    GuestCpuStatsList *head = NULL, **tail = &head;
>     +    const char *cpustats = "/proc/stat";
>     +    int clk_tck = sysconf(_SC_CLK_TCK);
>     +    FILE *fp;
>     +    size_t n;
>     +    char *line = NULL;
>     +
>     +    fp = fopen(cpustats, "r");
>     +    if (fp  == NULL) {
>     +        error_setg_errno(errp, errno, "open(\"%s\")", cpustats);
>     +        return NULL;
>     +    }
>     +
>     +    while (getline(&line, &n, fp) != -1) {
>     +        GuestCpuStats *cpustat = NULL;
>     +        GuestLinuxCpuStats *linuxcpustat;
>     +        int i;
>     +        unsigned long user, system, idle, iowait, irq, softirq,
>     steal, guest;
>     +        unsigned long nice, guest_nice;
>     +        char name[64];
>     +
>     +        i = sscanf(line, "%s %lu %lu %lu %lu %lu %lu %lu %lu %lu %lu",
>     +                   name, &user, &nice, &system, &idle, &iowait,
>     &irq, &softirq,
>     +                   &steal, &guest, &guest_nice);
>     +
>     +        /* drop "cpu 1 2 3 ...", get "cpuX 1 2 3 ..." only */
>     +        if ((i == EOF) || strncmp(name, "cpu", 3) || (name[3] ==
>     '\0')) {
>     +            continue;
>     +        }
>     +
>     +        if (i < 5) {
>     +            slog("Parsing cpu stat from %s failed, see \"man
>     proc\"", cpustats);
>     +            break;
>     +        }
>     +
>     +        cpustat = g_new0(GuestCpuStats, 1);
>     +        cpustat->type = GUEST_OS_TYPE_LINUXOS;
>     +
>     +        linuxcpustat = &cpustat->u.linuxos;
>     +        linuxcpustat->cpu = atoi(&name[3]);
>     +        linuxcpustat->user = user * 1000 / clk_tck;
>     +        linuxcpustat->nice = nice * 1000 / clk_tck;
>     +        linuxcpustat->system = system * 1000 / clk_tck;
>     +        linuxcpustat->idle = idle * 1000 / clk_tck;
>     +
>     +        if (i > 5) {
>     +            linuxcpustat->has_iowait = true;
>     +            linuxcpustat->iowait = iowait * 1000 / clk_tck;
>     +        }
>     +
>     +        if (i > 6) {
>     +            linuxcpustat->has_irq = true;
>     +            linuxcpustat->irq = irq * 1000 / clk_tck;
>     +            linuxcpustat->has_softirq = true;
>     +            linuxcpustat->softirq = softirq * 1000 / clk_tck;
>     +        }
>     +
>     +        if (i > 8) {
>     +            linuxcpustat->has_steal = true;
>     +            linuxcpustat->steal = steal * 1000 / clk_tck;
>     +        }
>     +
>     +        if (i > 9) {
>     +            linuxcpustat->has_guest = true;
>     +            linuxcpustat->guest = guest * 1000 / clk_tck;
>     +        }
>     +
>     +        if (i > 10) {
>     +            linuxcpustat->has_guest = true;
>     +            linuxcpustat->guest = guest * 1000 / clk_tck;
>     +            linuxcpustat->has_guestnice = true;
>     +            linuxcpustat->guestnice = guest_nice * 1000 / clk_tck;
>     +        }
>     +
>     +        QAPI_LIST_APPEND(tail, cpustat);
>     +    }
>     +
>     +    free(line);
>     +    fclose(fp);
>     +    return head;
>     +}
>     +
>       #else /* defined(__linux__) */
> 
>       void qmp_guest_suspend_disk(Error **errp)
>     @@ -3247,6 +3331,11 @@ GuestDiskStatsInfoList
>     *qmp_guest_get_diskstats(Error **errp)
>           return NULL;
>       }
> 
>     +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return NULL;
>     +}
> 
>       #endif /* CONFIG_FSFREEZE */
> 
>     diff --git a/qga/commands-win32.c b/qga/commands-win32.c
>     index 36f94c0f9c..7ed7664715 100644
>     --- a/qga/commands-win32.c
>     +++ b/qga/commands-win32.c
>     @@ -2543,3 +2543,9 @@ GuestDiskStatsInfoList
>     *qmp_guest_get_diskstats(Error **errp)
>           error_setg(errp, QERR_UNSUPPORTED);
>           return NULL;
>       }
>     +
>     +GuestCpuStatsList *qmp_guest_get_cpustats(Error **errp)
>     +{
>     +    error_setg(errp, QERR_UNSUPPORTED);
>     +    return NULL;
>     +}
>     diff --git a/qga/qapi-schema.json b/qga/qapi-schema.json
>     index 9fa20e791b..3b795222e9 100644
>     --- a/qga/qapi-schema.json
>     +++ b/qga/qapi-schema.json
>     @@ -1576,3 +1576,84 @@
>       { 'command': 'guest-get-diskstats',
>         'returns': ['GuestDiskStatsInfo']
>       }
>     +
>     +##
>     +# @GuestOsType:
>     +#
>     +# An enumeration of OS type
>     +#
>     +# Since: 7.1
>     +##
>     +{ 'enum': 'GuestOsType',
>     +  'data': [ 'linuxos', 'windowsos' ] }
> 
> 
> I would rather keep this enum specific to GuestCpuStats, 
> "GuestLinuxCpuStatsType"?
> 

Hi,

'GuestOsType' may be re-used in the future, not only for the CPU 
statistics case.

> I would also drop the "os" suffix
> 
I'm afraid we can not drop "os" suffix, build this without "os" suffix:
qga/qga-qapi-types.h:948:28: error: expected member name or ';' after 
declaration specifiers
         GuestLinuxCpuStats linux;
         ~~~~~~~~~~~~~~~~~~ ^
<built-in>:336:15: note: expanded from here
#define linux 1

>     +
>     +
>     +##
>     +# @GuestLinuxCpuStats:
>     +#
>     +# CPU statistics of Linux
>     +#
>     +# @cpu: CPU index in guest OS
>     +#
>     +# @user: Time spent in user mode
>     +#
>     +# @nice: Time spent in user mode with low priority (nice)
>     +#
>     +# @system: Time spent in system mode
>     +#
>     +# @idle: Time spent in the idle task
>     +#
>     +# @iowait: Time waiting for I/O to complete (since Linux 2.5.41)
>     +#
>     +# @irq: Time servicing interrupts (since Linux 2.6.0-test4)
>     +#
>     +# @softirq: Time servicing softirqs (since Linux 2.6.0-test4)
>     +#
>     +# @steal: Stolen time by host (since Linux 2.6.11)
>     +#
>     +# @guest: ime spent running a virtual CPU for guest operating
>     systems under
>     +#         the  control of the Linux kernel (since Linux 2.6.24)
>     +#
>     +# @guestnice: Time spent running a niced guest (since Linux 2.6.33)
>     +#
>     +# Since: 7.1
>     +##
>     +{ 'struct': 'GuestLinuxCpuStats',
>     +  'data': {'cpu': 'int',
>     +           'user': 'uint64',
>     +           'nice': 'uint64',
>     +           'system': 'uint64',
>     +           'idle': 'uint64',
>     +           '*iowait': 'uint64',
>     +           '*irq': 'uint64',
>     +           '*softirq': 'uint64',
>     +           '*steal': 'uint64',
>     +           '*guest': 'uint64',
>     +           '*guestnice': 'uint64'
>     +           } }
>     +
>     +##
>     +# @GuestCpuStats:
>     +#
>     +# Get statistics of each CPU in millisecond.
>     +#
>     +# - @linux: Linux style CPU statistics
>     +#
>     +# Since: 7.1
>     +##
>     +{ 'union': 'GuestCpuStats',
>     +  'base': { 'type': 'GuestOsType' },
>     +  'discriminator': 'type',
>     +  'data': { 'linuxos': 'GuestLinuxCpuStats' } }
>     +
>     +##
>     +# @guest-get-cpustats:
>     +#
>     +# Retrieve information about CPU stats.
>     +# Returns: List of CPU stats of guest.
>     +#
>     +# Since: 7.1
>     +##
>     +{ 'command': 'guest-get-cpustats',
>     +  'returns': ['GuestCpuStats']
>     +}
>     -- 
>     2.20.1
> 
> 
> 
> Looks good to me otherwise.
> thanks
> 
> -- 
> Marc-André Lureau

-- 
zhenwei pi

