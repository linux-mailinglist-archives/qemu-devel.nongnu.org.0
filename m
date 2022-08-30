Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD58B5A5B91
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 08:12:14 +0200 (CEST)
Received: from localhost ([::1]:53908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oSuTt-0001bT-60
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 02:12:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSuM7-0005fd-Qo
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 02:04:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50416)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1oSuM4-0006cz-Ar
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 02:04:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661839446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=UhV4adqdYb+67WpLNl1yzUcfwCU/AojXSDJv+4kzIJQ=;
 b=RWEEFgIblb3Nthn2YzDzcHEM2sLixGi1rzfImSIZBDzBFJtqHtcmB22FUD0E0eLl9YnPS6
 KUs+cdKC0ovaA//7QvRPqIrAEP1KtsqvD/UIN36kocsInXgMPXnfG0R09c+qwyUxaEMxYE
 nN+KjUhtF3yeL+nLn/p61lPlpzPgoAk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-178-ci6iC7KhO3Sd32c5sBspuw-1; Tue, 30 Aug 2022 02:04:00 -0400
X-MC-Unique: ci6iC7KhO3Sd32c5sBspuw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B367811E83;
 Tue, 30 Aug 2022 06:04:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.39.193.166])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 66A6D400EA8F;
 Tue, 30 Aug 2022 06:03:58 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id E0CE821E6900; Tue, 30 Aug 2022 08:03:56 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Maydell
 <peter.maydell@linaro.org>,  Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,  Richard
 Henderson
 <richard.henderson@linaro.org>,  Daniel P. =?utf-8?Q?Berrang=C3=A9?=
 <berrange@redhat.com>,
 qemu-devel@nongnu.org,  Guoyi Tu <tugy@chinatelecom.cn>
Subject: Re: [PATCH] osdep: Introduce qemu_get_fd() to wrap the common codes
References: <f73d60dd-fbc7-2873-4ed1-d30df19ce661@chinatelecom.cn>
 <1442ced4-ab22-c379-76ee-5e1f1c17108a@chinatelecom.cn>
 <47453703.NBG3G7Ahn1@silver>
Date: Tue, 30 Aug 2022 08:03:56 +0200
In-Reply-To: <47453703.NBG3G7Ahn1@silver> (Christian Schoenebeck's message of
 "Thu, 18 Aug 2022 14:58:33 +0200")
Message-ID: <87mtbml12r.fsf@pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

Christian Schoenebeck <qemu_oss@crudebyte.com> writes:

> On Donnerstag, 18. August 2022 14:06:04 CEST Guoyi Tu wrote:
>> Ping...
>> 
>> Any comments are welcome
>> 
>> On 8/12/22 19:01, Guoyi Tu wrote:
>> > socket_get_fd() have much the same codes as monitor_fd_param(),
>> > so qemu_get_fd() is introduced to implement the common logic.
>> > now socket_get_fd() and monitor_fd_param() directly call this
>> > function.
>
> s/have/has/, s/now/Now/, some proper rephrasing wouldn't hurt either.
>
>> > Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
>> > ---
>> > 
>> >   include/qemu/osdep.h |  1 +
>> >   monitor/misc.c       | 21 +--------------------
>> >   util/osdep.c         | 25 +++++++++++++++++++++++++
>> >   util/qemu-sockets.c  | 17 +++++------------
>> >   4 files changed, 32 insertions(+), 32 deletions(-)
>> > 
>> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
>> > index b1c161c035..b920f128a7 100644
>> > --- a/include/qemu/osdep.h
>> > +++ b/include/qemu/osdep.h
>> > @@ -491,6 +491,7 @@ int qemu_open_old(const char *name, int flags, ...);
>> > 
>> >   int qemu_open(const char *name, int flags, Error **errp);
>> >   int qemu_create(const char *name, int flags, mode_t mode, Error **errp);
>> >   int qemu_close(int fd);
>> > 
>> > +int qemu_get_fd(Monitor *mon, const char *fdname, Error **errp);
>> > 
>> >   int qemu_unlink(const char *name);
>> >   #ifndef _WIN32
>> >   int qemu_dup_flags(int fd, int flags);
>> > 
>> > diff --git a/monitor/misc.c b/monitor/misc.c
>> > index 3d2312ba8d..0d3372cf2b 100644
>> > --- a/monitor/misc.c
>> > +++ b/monitor/misc.c
>> > @@ -1395,26 +1395,7 @@ void monitor_fdset_dup_fd_remove(int dup_fd)
>> > 
>> >   int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
>> >   {
>> > 
>> > -    int fd;
>> > -    Error *local_err = NULL;
>> > -
>> > -    if (!qemu_isdigit(fdname[0]) && mon) {
>> > -        fd = monitor_get_fd(mon, fdname, &local_err);
>> > -    } else {
>> > -        fd = qemu_parse_fd(fdname);
>> > -        if (fd == -1) {
>> > -            error_setg(&local_err, "Invalid file descriptor number '%s'",
>> > -                       fdname);
>> > -        }
>> > -    }
>> > -    if (local_err) {
>> > -        error_propagate(errp, local_err);
>> > -        assert(fd == -1);
>> > -    } else {
>> > -        assert(fd != -1);
>> > -    }
>> > -
>> > -    return fd;
>> > +    return qemu_get_fd(mon, fdname, errp);
>> > 
>> >   }

This becomes a trivial wrapper around qemu_get_fd().  Why do we need
both functions?

>> >  
>> >   /* Please update hmp-commands.hx when adding or changing commands */
>> > 
>> > diff --git a/util/osdep.c b/util/osdep.c
>> > index 60fcbbaebe..c57551ca78 100644
>> > --- a/util/osdep.c
>> > +++ b/util/osdep.c
>> > @@ -23,6 +23,7 @@
>> > 
>> >    */
>> >   #include "qemu/osdep.h"
>> >   #include "qapi/error.h"
>> > 
>> > +#include "qemu/ctype.h"
>> > 
>> >   #include "qemu/cutils.h"
>> >   #include "qemu/sockets.h"
>> >   #include "qemu/error-report.h"
>> > 
>> > @@ -413,6 +414,30 @@ int qemu_close(int fd)
>> > 
>> >       return close(fd);
>> >   }
>> > 
>> > +int qemu_get_fd(Monitor *mon, const char *fdname, Error **errp)
>> > +{
>> > +    int fd;
>> > +    Error *local_err = NULL;
>> > +
>> > +    if (!qemu_isdigit(fdname[0]) && mon) {
>> > +        fd = monitor_get_fd(mon, fdname, &local_err);
>> > +    } else {
>> > +        fd = qemu_parse_fd(fdname);
>> > +        if (fd == -1) {
>> > +            error_setg(&local_err, "Invalid file descriptor number '%s'",
>> > +                       fdname);
>> > +        }
>> > +    }
>> > +    if (local_err) {
>> > +        error_propagate(errp, local_err);
>> > +        assert(fd == -1);
>> > +    } else {
>> > +        assert(fd != -1);
>> > +    }
>> > +
>> > +    return fd;
>> > +}
>> > +
>
> Up to here you are basically just moving the code of monitor_fd_param() to a 
> project wide shared new function qemu_get_fd(), but why? I mean you could 
> simply call monitor_fd_param() in socket_get_fd() below, no?

Point.

>> >   /*
>> >    * Delete a file from the filesystem, unless the filename is
>> > 
>> > /dev/fdset/...
>> > 
>> >    *
>> > 
>> > diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
>> > index 13b5b197f9..92960ee6eb 100644
>> > --- a/util/qemu-sockets.c
>> > +++ b/util/qemu-sockets.c
>> > @@ -1142,19 +1142,12 @@ static int socket_get_fd(const char *fdstr,
>> > Error **errp)
>> > 
>> >   {
>> >       Monitor *cur_mon = monitor_cur();
>> >       int fd;
>> > 
>> > -    if (cur_mon) {
>> > -        fd = monitor_get_fd(cur_mon, fdstr, errp);
>> > -        if (fd < 0) {
>> > -            return -1;
>> > -        }
>> > -    } else {
>> > -        if (qemu_strtoi(fdstr, NULL, 10, &fd) < 0) {
>> > -            error_setg_errno(errp, errno,
>> > -                             "Unable to parse FD number %s",
>> > -                             fdstr);
>> > -            return -1;
>> > -        }
>> > +
>> > +    fd = qemu_get_fd(cur_mon, fdstr, errp);
>> > +    if (fd < 0) {
>> > +        return -1;
>> > 
>> >       }
>
> This part looks like behaviour change to me. Haven't looked into the details 
> though whether it would be OK. Just saying.

When factoring out code that isn't obviously the same, it often makes
sense to first make it more obviously the same in-place, and only then
factor it out.

In this case: have PATCH 1/2 change socket_get_fd() in-place to make the
code obviously common, then de-duplicate it in PATCH 2/2.

>
>> > 
>> > +
>
> Unintentional white line added?
>
>> > 
>> >       if (!fd_is_socket(fd)) {
>> >           error_setg(errp, "File descriptor '%s' is not a socket", fdstr);
>> >           close(fd);


