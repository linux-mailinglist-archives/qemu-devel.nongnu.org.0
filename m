Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7A5381ADE
	for <lists+qemu-devel@lfdr.de>; Sat, 15 May 2021 21:53:04 +0200 (CEST)
Received: from localhost ([::1]:42056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1li0LP-0007XX-64
	for lists+qemu-devel@lfdr.de; Sat, 15 May 2021 15:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1li0Jn-0006iY-G9; Sat, 15 May 2021 15:51:23 -0400
Received: from mout.kundenserver.de ([212.227.126.130]:34123)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1li0Jl-0006aD-On; Sat, 15 May 2021 15:51:23 -0400
Received: from [192.168.100.1] ([82.142.12.230]) by mrelayeu.kundenserver.de
 (mreue011 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MxE5Y-1lXEnM2QES-00xYVF; Sat, 15 May 2021 21:51:08 +0200
Subject: Re: [PATCH 6/7] linux-user: use GDateTime for formatting timestamp
 for core file
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210505103702.521457-1-berrange@redhat.com>
 <20210505103702.521457-7-berrange@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <adc01acf-b473-b16b-2b1e-99a8e498ccb5@vivier.eu>
Date: Sat, 15 May 2021 21:51:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210505103702.521457-7-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:X9mnNyx3+4PtNowBP4PkYImHL9TZTApSNlBf60rP3D5pOkDhjlM
 na07Qq7r8h2JjCZyS/Gh6PaJ/EFHySA47hlLor/g77Uq26cEBWew310N27nt73gBobnEU9p
 p/bszVeqX6Xe2BD3KDajUxLl+TcNW78KV+lhydP/7Q7J4BIzJv1zZqklH0lk62R06t7F5p9
 6Av3RyLqXdmGCtwix1DWQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fU9AquElHto=:VCLzAY8hKZO5bk+YIzgQgX
 xRC2cfCb9u+rNoXxTKTSHLfokEyT1FmllpU6SnR7cEkVtXC02rVdlc/C9EKfK36XyTV/v94mq
 hUeIpK5NsVv+ACFUAT3T8kus48u83+1iIk62TOR1qtsGII7BJrCGfOCZHiIrFm4B72I8vEe24
 DWsze9BifS74wWyQG0sK/nBEXipoFpdSdcyfdFxZm+yh46AzFGPqGYlThU0oLoecthvI8hGYl
 5WD+A3QAne3hxhZQxRLqcccaE8hivH/tqf1XkbHrXhdgVXWiXsUbBz8em3rjT9MEd8q/55vbT
 o9EU6BzVrfB3plWRL0Z36h5bYNx7x7Gmn03D2eRIxbAO2m0qK16mUaRlIQ3b3i6/IAMm2WsN0
 vDMQ413bRqfw6O6d1NVZL7xpVz82NFtxF+0ZiePLks/wz3gW5471JrYYAYRKBkRIH+8GMm7lO
 FN/mH8cGaWU1krzUvcmIEa1h1r8PQpOZNCxnmTMFeDSKqGceBsVdhTk8HuysANfWkxCoEZ46T
 dwJMn2tpDcFHhJD2jvBwRs=
Received-SPF: none client-ip=212.227.126.130; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, virtio-fs@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 05/05/2021 à 12:37, Daniel P. Berrangé a écrit :
> The GDateTime APIs provided by GLib avoid portability pitfalls, such
> as some platforms where 'struct timeval.tv_sec' field is still 'long'
> instead of 'time_t'. When combined with automatic cleanup, GDateTime
> often results in simpler code too.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  linux-user/elfload.c | 36 +++++++++---------------------------
>  1 file changed, 9 insertions(+), 27 deletions(-)
> 
> diff --git a/linux-user/elfload.c b/linux-user/elfload.c
> index c6731013fd..c38b7b4d37 100644
> --- a/linux-user/elfload.c
> +++ b/linux-user/elfload.c
> @@ -3386,7 +3386,6 @@ static size_t note_size(const struct memelfnote *);
>  static void free_note_info(struct elf_note_info *);
>  static int fill_note_info(struct elf_note_info *, long, const CPUArchState *);
>  static void fill_thread_info(struct elf_note_info *, const CPUArchState *);
> -static int core_dump_filename(const TaskState *, char *, size_t);
>  
>  static int dump_write(int, const void *, size_t);
>  static int write_note(struct memelfnote *, int);
> @@ -3685,32 +3684,16 @@ static void fill_auxv_note(struct memelfnote *note, const TaskState *ts)
>   * for the name:
>   *     qemu_<basename-of-target-binary>_<date>-<time>_<pid>.core
>   *
> - * Returns 0 in case of success, -1 otherwise (errno is set).
> + * Returns the filename
>   */
> -static int core_dump_filename(const TaskState *ts, char *buf,
> -                              size_t bufsize)
> +static char *core_dump_filename(const TaskState *ts)
>  {
> -    char timestamp[64];
> -    char *base_filename = NULL;
> -    struct timeval tv;
> -    struct tm tm;
> +    g_autoptr(GDateTime) now = g_date_time_new_now_local();
> +    g_autofree char *nowstr = g_date_time_format(now, "%Y%m%d-%H%M%S");
> +    g_autofree char *base_filename = g_path_get_basename(ts->bprm->filename);
>  
> -    assert(bufsize >= PATH_MAX);
> -
> -    if (gettimeofday(&tv, NULL) < 0) {
> -        (void) fprintf(stderr, "unable to get current timestamp: %s",
> -                       strerror(errno));
> -        return (-1);
> -    }
> -
> -    base_filename = g_path_get_basename(ts->bprm->filename);
> -    (void) strftime(timestamp, sizeof (timestamp), "%Y%m%d-%H%M%S",
> -                    localtime_r(&tv.tv_sec, &tm));
> -    (void) snprintf(buf, bufsize, "qemu_%s_%s_%d.core",
> -                    base_filename, timestamp, (int)getpid());
> -    g_free(base_filename);
> -
> -    return (0);
> +    return g_strdup_printf("qemu_%s_%s_%d.core",
> +                           base_filename, nowstr, (int)getpid());
>  }
>  
>  static int dump_write(int fd, const void *ptr, size_t size)
> @@ -3938,7 +3921,7 @@ static int elf_core_dump(int signr, const CPUArchState *env)
>      const CPUState *cpu = env_cpu((CPUArchState *)env);
>      const TaskState *ts = (const TaskState *)cpu->opaque;
>      struct vm_area_struct *vma = NULL;
> -    char corefile[PATH_MAX];
> +    g_autofree char *corefile = NULL;
>      struct elf_note_info info;
>      struct elfhdr elf;
>      struct elf_phdr phdr;
> @@ -3955,8 +3938,7 @@ static int elf_core_dump(int signr, const CPUArchState *env)
>      if (dumpsize.rlim_cur == 0)
>          return 0;
>  
> -    if (core_dump_filename(ts, corefile, sizeof (corefile)) < 0)
> -        return (-errno);
> +    corefile = core_dump_filename(ts);
>  
>      if ((fd = open(corefile, O_WRONLY | O_CREAT,
>                     S_IRUSR|S_IWUSR|S_IRGRP|S_IROTH)) < 0)
> 

Applied to my linux-user-for-6.1 branch.

Thanks,
Laurent



