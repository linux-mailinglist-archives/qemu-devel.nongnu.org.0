Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF475A7977
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 10:52:53 +0200 (CEST)
Received: from localhost ([::1]:41122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTJSu-0004ED-U9
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 04:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tugy@chinatelecom.cn>)
 id 1oTJOF-0007oi-V2
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:48:10 -0400
Received: from prt-mail.chinatelecom.cn ([42.123.76.228]:47416
 helo=chinatelecom.cn) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <tugy@chinatelecom.cn>) id 1oTJOC-00008q-Ps
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 04:48:03 -0400
HMM_SOURCE_IP: 172.18.0.218:54632.1118712417
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-36.111.64.85 (unknown [172.18.0.218])
 by chinatelecom.cn (HERMES) with SMTP id B23472800FE;
 Wed, 31 Aug 2022 16:47:39 +0800 (CST)
X-189-SAVE-TO-SEND: +tugy@chinatelecom.cn
Received: from  ([172.18.0.218])
 by app0025 with ESMTP id f7edb14bd7a24798a56b892943c07c92 for
 armbru@redhat.com; Wed, 31 Aug 2022 16:47:51 CST
X-Transaction-ID: f7edb14bd7a24798a56b892943c07c92
X-Real-From: tugy@chinatelecom.cn
X-Receive-IP: 172.18.0.218
X-MEDUSA-Status: 0
Message-ID: <23418b2a-54ab-17ef-2708-118befb925be@chinatelecom.cn>
Date: Wed, 31 Aug 2022 16:47:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Cc: tugy@chinatelecom.cn, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] osdep: Introduce qemu_get_fd() to wrap the common codes
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>
References: <f73d60dd-fbc7-2873-4ed1-d30df19ce661@chinatelecom.cn>
 <1442ced4-ab22-c379-76ee-5e1f1c17108a@chinatelecom.cn>
 <47453703.NBG3G7Ahn1@silver> <87mtbml12r.fsf@pond.sub.org>
From: Guoyi Tu <tugy@chinatelecom.cn>
In-Reply-To: <87mtbml12r.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=42.123.76.228; envelope-from=tugy@chinatelecom.cn;
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


On 8/30/22 14:03, Markus Armbruster wrote:
> Christian Schoenebeck <qemu_oss@crudebyte.com> writes:
> 
>> On Donnerstag, 18. August 2022 14:06:04 CEST Guoyi Tu wrote:
>>> Ping...
>>>
>>> Any comments are welcome
>>>
>>> On 8/12/22 19:01, Guoyi Tu wrote:
>>>> socket_get_fd() have much the same codes as monitor_fd_param(),
>>>> so qemu_get_fd() is introduced to implement the common logic.
>>>> now socket_get_fd() and monitor_fd_param() directly call this
>>>> function.
>>
>> s/have/has/, s/now/Now/, some proper rephrasing wouldn't hurt either.
>>
>>>> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
>>>> ---
>>>>
>>>>    include/qemu/osdep.h |  1 +
>>>>    monitor/misc.c       | 21 +--------------------
>>>>    util/osdep.c         | 25 +++++++++++++++++++++++++
>>>>    util/qemu-sockets.c  | 17 +++++------------
>>>>    4 files changed, 32 insertions(+), 32 deletions(-)
>>>>
>>>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>>>> index b1c161c035..b920f128a7 100644
>>>> --- a/include/qemu/osdep.h
>>>> +++ b/include/qemu/osdep.h
>>>> @@ -491,6 +491,7 @@ int qemu_open_old(const char *name, int flags, ...);
>>>>
>>>>    int qemu_open(const char *name, int flags, Error **errp);
>>>>    int qemu_create(const char *name, int flags, mode_t mode, Error **errp);
>>>>    int qemu_close(int fd);
>>>>
>>>> +int qemu_get_fd(Monitor *mon, const char *fdname, Error **errp);
>>>>
>>>>    int qemu_unlink(const char *name);
>>>>    #ifndef _WIN32
>>>>    int qemu_dup_flags(int fd, int flags);
>>>>
>>>> diff --git a/monitor/misc.c b/monitor/misc.c
>>>> index 3d2312ba8d..0d3372cf2b 100644
>>>> --- a/monitor/misc.c
>>>> +++ b/monitor/misc.c
>>>> @@ -1395,26 +1395,7 @@ void monitor_fdset_dup_fd_remove(int dup_fd)
>>>>
>>>>    int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
>>>>    {
>>>>
>>>> -    int fd;
>>>> -    Error *local_err = NULL;
>>>> -
>>>> -    if (!qemu_isdigit(fdname[0]) && mon) {
>>>> -        fd = monitor_get_fd(mon, fdname, &local_err);
>>>> -    } else {
>>>> -        fd = qemu_parse_fd(fdname);
>>>> -        if (fd == -1) {
>>>> -            error_setg(&local_err, "Invalid file descriptor number '%s'",
>>>> -                       fdname);
>>>> -        }
>>>> -    }
>>>> -    if (local_err) {
>>>> -        error_propagate(errp, local_err);
>>>> -        assert(fd == -1);
>>>> -    } else {
>>>> -        assert(fd != -1);
>>>> -    }
>>>> -
>>>> -    return fd;
>>>> +    return qemu_get_fd(mon, fdname, errp);
>>>>
>>>>    }
> 
> This becomes a trivial wrapper around qemu_get_fd().  Why do we need
> both functions?

As Donnerstag said, the qemu_get_fd() in osdep.c is project wide 
function that is also needed by the test codes, such as 
test-unit-sockets.c and test-char.c. if direclty call monitor_fd_param() 
in socket_get_fd(), a stub version of monitor_fd_param() need to be 
defined for the test codes and adjust the overwritten api in test codes.


>>>>   
>>>>    /* Please update hmp-commands.hx when adding or changing commands */
>>>>
>>>> diff --git a/util/osdep.c b/util/osdep.c
>>>> index 60fcbbaebe..c57551ca78 100644
>>>> --- a/util/osdep.c
>>>> +++ b/util/osdep.c
>>>> @@ -23,6 +23,7 @@
>>>>
>>>>     */
>>>>    #include "qemu/osdep.h"
>>>>    #include "qapi/error.h"
>>>>
>>>> +#include "qemu/ctype.h"
>>>>
>>>>    #include "qemu/cutils.h"
>>>>    #include "qemu/sockets.h"
>>>>    #include "qemu/error-report.h"
>>>>
>>>> @@ -413,6 +414,30 @@ int qemu_close(int fd)
>>>>
>>>>        return close(fd);
>>>>    }
>>>>
>>>> +int qemu_get_fd(Monitor *mon, const char *fdname, Error **errp)
>>>> +{
>>>> +    int fd;
>>>> +    Error *local_err = NULL;
>>>> +
>>>> +    if (!qemu_isdigit(fdname[0]) && mon) {
>>>> +        fd = monitor_get_fd(mon, fdname, &local_err);
>>>> +    } else {
>>>> +        fd = qemu_parse_fd(fdname);
>>>> +        if (fd == -1) {
>>>> +            error_setg(&local_err, "Invalid file descriptor number '%s'",
>>>> +                       fdname);
>>>> +        }
>>>> +    }
>>>> +    if (local_err) {
>>>> +        error_propagate(errp, local_err);
>>>> +        assert(fd == -1);
>>>> +    } else {
>>>> +        assert(fd != -1);
>>>> +    }
>>>> +
>>>> +    return fd;
>>>> +}
>>>> +
>>
>> Up to here you are basically just moving the code of monitor_fd_param() to a
>> project wide shared new function qemu_get_fd(), but why? I mean you could
>> simply call monitor_fd_param() in socket_get_fd() below, no?
> 
> Point.
> 
>>>>    /*
>>>>     * Delete a file from the filesystem, unless the filename is
>>>>
>>>> /dev/fdset/...
>>>>
>>>>     *
>>>>
>>>> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
>>>> index 13b5b197f9..92960ee6eb 100644
>>>> --- a/util/qemu-sockets.c
>>>> +++ b/util/qemu-sockets.c
>>>> @@ -1142,19 +1142,12 @@ static int socket_get_fd(const char *fdstr,
>>>> Error **errp)
>>>>
>>>>    {
>>>>        Monitor *cur_mon = monitor_cur();
>>>>        int fd;
>>>>
>>>> -    if (cur_mon) {
>>>> -        fd = monitor_get_fd(cur_mon, fdstr, errp);
>>>> -        if (fd < 0) {
>>>> -            return -1;
>>>> -        }
>>>> -    } else {
>>>> -        if (qemu_strtoi(fdstr, NULL, 10, &fd) < 0) {
>>>> -            error_setg_errno(errp, errno,
>>>> -                             "Unable to parse FD number %s",
>>>> -                             fdstr);
>>>> -            return -1;
>>>> -        }
>>>> +
>>>> +    fd = qemu_get_fd(cur_mon, fdstr, errp);
>>>> +    if (fd < 0) {
>>>> +        return -1;
>>>>
>>>>        }
>>
>> This part looks like behaviour change to me. Haven't looked into the details
>> though whether it would be OK. Just saying.
> 
> When factoring out code that isn't obviously the same, it often makes
> sense to first make it more obviously the same in-place, and only then
> factor it out.
> 
> In this case: have PATCH 1/2 change socket_get_fd() in-place to make the
> code obviously common, then de-duplicate it in PATCH 2/2.
> 

Thanks for you advice,
If the codes is okay, i will send a patch set as suggested

Guoyi.


>>
>>>>
>>>> +
>>
>> Unintentional white line added?
>>
>>>>
>>>>        if (!fd_is_socket(fd)) {
>>>>            error_setg(errp, "File descriptor '%s' is not a socket", fdstr);
>>>>            close(fd);
> 
> 

