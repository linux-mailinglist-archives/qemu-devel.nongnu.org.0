Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CB6B5982F3
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 14:09:50 +0200 (CEST)
Received: from localhost ([::1]:36518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOeLN-0006qu-1v
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 08:09:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1oOeHz-0004Ib-Uj
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 08:06:21 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.226]:48235
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1oOeHw-0004bb-Qs
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 08:06:19 -0400
HMM_SOURCE_IP: 172.18.0.218:45666.1244462728
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id 95AE528008F;
 Thu, 18 Aug 2022 20:06:05 +0800 (CST)
X-189-SAVE-TO-SEND: tugy@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id 723e2aa2b8e54d4cb32139bbc766b21e for
 armbru@redhat.com; Thu, 18 Aug 2022 20:06:08 CST
X-Transaction-ID: 723e2aa2b8e54d4cb32139bbc766b21e
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <1442ced4-ab22-c379-76ee-5e1f1c17108a@chinatelecom.cn>
Date: Thu, 18 Aug 2022 20:06:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] osdep: Introduce qemu_get_fd() to wrap the common codes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
References: <f73d60dd-fbc7-2873-4ed1-d30df19ce661@chinatelecom.cn>
From: Guoyi Tu <tugy@chinatelecom.cn>
In-Reply-To: <f73d60dd-fbc7-2873-4ed1-d30df19ce661@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=42.123.76.226; envelope-from=tugy@chinatelecom.cn;
 helo=chinatelecom.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

Ping...

Any comments are welcome


On 8/12/22 19:01, Guoyi Tu wrote:
> socket_get_fd() have much the same codes as monitor_fd_param(),
> so qemu_get_fd() is introduced to implement the common logic.
> now socket_get_fd() and monitor_fd_param() directly call this
> function.
> 
> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
> ---
>   include/qemu/osdep.h |  1 +
>   monitor/misc.c       | 21 +--------------------
>   util/osdep.c         | 25 +++++++++++++++++++++++++
>   util/qemu-sockets.c  | 17 +++++------------
>   4 files changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index b1c161c035..b920f128a7 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -491,6 +491,7 @@ int qemu_open_old(const char *name, int flags, ...);
>   int qemu_open(const char *name, int flags, Error **errp);
>   int qemu_create(const char *name, int flags, mode_t mode, Error **errp);
>   int qemu_close(int fd);
> +int qemu_get_fd(Monitor *mon, const char *fdname, Error **errp);
>   int qemu_unlink(const char *name);
>   #ifndef _WIN32
>   int qemu_dup_flags(int fd, int flags);
> diff --git a/monitor/misc.c b/monitor/misc.c
> index 3d2312ba8d..0d3372cf2b 100644
> --- a/monitor/misc.c
> +++ b/monitor/misc.c
> @@ -1395,26 +1395,7 @@ void monitor_fdset_dup_fd_remove(int dup_fd)
> 
>   int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
>   {
> -    int fd;
> -    Error *local_err = NULL;
> -
> -    if (!qemu_isdigit(fdname[0]) && mon) {
> -        fd = monitor_get_fd(mon, fdname, &local_err);
> -    } else {
> -        fd = qemu_parse_fd(fdname);
> -        if (fd == -1) {
> -            error_setg(&local_err, "Invalid file descriptor number '%s'",
> -                       fdname);
> -        }
> -    }
> -    if (local_err) {
> -        error_propagate(errp, local_err);
> -        assert(fd == -1);
> -    } else {
> -        assert(fd != -1);
> -    }
> -
> -    return fd;
> +    return qemu_get_fd(mon, fdname, errp);
>   }
> 
>   /* Please update hmp-commands.hx when adding or changing commands */
> diff --git a/util/osdep.c b/util/osdep.c
> index 60fcbbaebe..c57551ca78 100644
> --- a/util/osdep.c
> +++ b/util/osdep.c
> @@ -23,6 +23,7 @@
>    */
>   #include "qemu/osdep.h"
>   #include "qapi/error.h"
> +#include "qemu/ctype.h"
>   #include "qemu/cutils.h"
>   #include "qemu/sockets.h"
>   #include "qemu/error-report.h"
> @@ -413,6 +414,30 @@ int qemu_close(int fd)
>       return close(fd);
>   }
> 
> +int qemu_get_fd(Monitor *mon, const char *fdname, Error **errp)
> +{
> +    int fd;
> +    Error *local_err = NULL;
> +
> +    if (!qemu_isdigit(fdname[0]) && mon) {
> +        fd = monitor_get_fd(mon, fdname, &local_err);
> +    } else {
> +        fd = qemu_parse_fd(fdname);
> +        if (fd == -1) {
> +            error_setg(&local_err, "Invalid file descriptor number '%s'",
> +                       fdname);
> +        }
> +    }
> +    if (local_err) {
> +        error_propagate(errp, local_err);
> +        assert(fd == -1);
> +    } else {
> +        assert(fd != -1);
> +    }
> +
> +    return fd;
> +}
> +
>   /*
>    * Delete a file from the filesystem, unless the filename is 
> /dev/fdset/...
>    *
> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> index 13b5b197f9..92960ee6eb 100644
> --- a/util/qemu-sockets.c
> +++ b/util/qemu-sockets.c
> @@ -1142,19 +1142,12 @@ static int socket_get_fd(const char *fdstr, 
> Error **errp)
>   {
>       Monitor *cur_mon = monitor_cur();
>       int fd;
> -    if (cur_mon) {
> -        fd = monitor_get_fd(cur_mon, fdstr, errp);
> -        if (fd < 0) {
> -            return -1;
> -        }
> -    } else {
> -        if (qemu_strtoi(fdstr, NULL, 10, &fd) < 0) {
> -            error_setg_errno(errp, errno,
> -                             "Unable to parse FD number %s",
> -                             fdstr);
> -            return -1;
> -        }
> +
> +    fd = qemu_get_fd(cur_mon, fdstr, errp);
> +    if (fd < 0) {
> +        return -1;
>       }
> +
>       if (!fd_is_socket(fd)) {
>           error_setg(errp, "File descriptor '%s' is not a socket", fdstr);
>           close(fd);

