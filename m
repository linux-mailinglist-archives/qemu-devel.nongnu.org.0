Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C1C5983C0
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Aug 2022 15:10:03 +0200 (CEST)
Received: from localhost ([::1]:54522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOfHe-0007L2-94
	for lists+qemu-devel@lfdr.de; Thu, 18 Aug 2022 09:10:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oOf6j-0000uz-Rg
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 08:58:46 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:47125)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oOf6h-0003zD-Nc
 for qemu-devel@nongnu.org; Thu, 18 Aug 2022 08:58:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Cc:
 Content-ID:Content-Description;
 bh=ZyNoFpwUlWwXRElZvgWmIZy8qXYXaNXhgo8j5okNzBI=; b=Zbug4JPHhDwUXObuPKpYLHRkJS
 cv9cGKkAM3nrpEjscwvh6wg2KFcv3BJR9V+JHP0lIMGLTPZL920NaNOfGnbvXFI9+TOHXaQXaiqpB
 AA6Z7TLVhGwVkFvn4zmkD1BGpAQS5KR+4Cn0q9GTbYuiIXoWof9c2EIdEiBCuqHDAdXCULQb4qw0n
 WId1zs7jjzG6LDFtQzYwVPruc3xhKEObhWptqEw8WuHCZZAtAd/0bud8au/ZpWaulIeY8XzvAdzFq
 N3oRaCwfKc2eIUlx5Vv979lp9w7BPkawhUohmprDMhlexaGRPpRW/HjHFNwFrP0NSyEXuMJuWLHDc
 HcPPHjApjeI49+lf1VTkrOgQPr7B2ZqKUrtuYTdPqpgmEfwHqWQHOF/Y3Bkxv2+rndJgIngRp0ZRp
 3WXP/dXST6zqM592Dd6eFUH5tvGRdyobUwvlGlC3SnL37ibG9iKGYdV11lrgvco4lMP2NAZas9uta
 rvw0ilZuCn3e6GknVcjmepQrrnmPAtvwKmmzH41QgHCAkvm/EPs07EN8Zpo9ZbEJlpQRnFxl2AkUe
 dErxzHoaX3LFOWSYF3l30qYw9sQ74IDaiw3xIIYZrS1jj3mf58iLAiq6Lfaui9aTi/b+9tbwyLPuj
 OWQU/y4zGbMVCN7cAiWA3TpId8Kd+HzlYW+dIA3zo=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Guoyi Tu <tugy@chinatelecom.cn>
Subject: Re: [PATCH] osdep: Introduce qemu_get_fd() to wrap the common codes
Date: Thu, 18 Aug 2022 14:58:33 +0200
Message-ID: <47453703.NBG3G7Ahn1@silver>
In-Reply-To: <1442ced4-ab22-c379-76ee-5e1f1c17108a@chinatelecom.cn>
References: <f73d60dd-fbc7-2873-4ed1-d30df19ce661@chinatelecom.cn>
 <1442ced4-ab22-c379-76ee-5e1f1c17108a@chinatelecom.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Donnerstag, 18. August 2022 14:06:04 CEST Guoyi Tu wrote:
> Ping...
> 
> Any comments are welcome
> 
> On 8/12/22 19:01, Guoyi Tu wrote:
> > socket_get_fd() have much the same codes as monitor_fd_param(),
> > so qemu_get_fd() is introduced to implement the common logic.
> > now socket_get_fd() and monitor_fd_param() directly call this
> > function.

s/have/has/, s/now/Now/, some proper rephrasing wouldn't hurt either.

> > Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
> > ---
> > 
> >   include/qemu/osdep.h |  1 +
> >   monitor/misc.c       | 21 +--------------------
> >   util/osdep.c         | 25 +++++++++++++++++++++++++
> >   util/qemu-sockets.c  | 17 +++++------------
> >   4 files changed, 32 insertions(+), 32 deletions(-)
> > 
> > diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> > index b1c161c035..b920f128a7 100644
> > --- a/include/qemu/osdep.h
> > +++ b/include/qemu/osdep.h
> > @@ -491,6 +491,7 @@ int qemu_open_old(const char *name, int flags, ...);
> > 
> >   int qemu_open(const char *name, int flags, Error **errp);
> >   int qemu_create(const char *name, int flags, mode_t mode, Error **errp);
> >   int qemu_close(int fd);
> > 
> > +int qemu_get_fd(Monitor *mon, const char *fdname, Error **errp);
> > 
> >   int qemu_unlink(const char *name);
> >   #ifndef _WIN32
> >   int qemu_dup_flags(int fd, int flags);
> > 
> > diff --git a/monitor/misc.c b/monitor/misc.c
> > index 3d2312ba8d..0d3372cf2b 100644
> > --- a/monitor/misc.c
> > +++ b/monitor/misc.c
> > @@ -1395,26 +1395,7 @@ void monitor_fdset_dup_fd_remove(int dup_fd)
> > 
> >   int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
> >   {
> > 
> > -    int fd;
> > -    Error *local_err = NULL;
> > -
> > -    if (!qemu_isdigit(fdname[0]) && mon) {
> > -        fd = monitor_get_fd(mon, fdname, &local_err);
> > -    } else {
> > -        fd = qemu_parse_fd(fdname);
> > -        if (fd == -1) {
> > -            error_setg(&local_err, "Invalid file descriptor number '%s'",
> > -                       fdname);
> > -        }
> > -    }
> > -    if (local_err) {
> > -        error_propagate(errp, local_err);
> > -        assert(fd == -1);
> > -    } else {
> > -        assert(fd != -1);
> > -    }
> > -
> > -    return fd;
> > +    return qemu_get_fd(mon, fdname, errp);
> > 
> >   }
> >  
> >   /* Please update hmp-commands.hx when adding or changing commands */
> > 
> > diff --git a/util/osdep.c b/util/osdep.c
> > index 60fcbbaebe..c57551ca78 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -23,6 +23,7 @@
> > 
> >    */
> >   #include "qemu/osdep.h"
> >   #include "qapi/error.h"
> > 
> > +#include "qemu/ctype.h"
> > 
> >   #include "qemu/cutils.h"
> >   #include "qemu/sockets.h"
> >   #include "qemu/error-report.h"
> > 
> > @@ -413,6 +414,30 @@ int qemu_close(int fd)
> > 
> >       return close(fd);
> >   }
> > 
> > +int qemu_get_fd(Monitor *mon, const char *fdname, Error **errp)
> > +{
> > +    int fd;
> > +    Error *local_err = NULL;
> > +
> > +    if (!qemu_isdigit(fdname[0]) && mon) {
> > +        fd = monitor_get_fd(mon, fdname, &local_err);
> > +    } else {
> > +        fd = qemu_parse_fd(fdname);
> > +        if (fd == -1) {
> > +            error_setg(&local_err, "Invalid file descriptor number '%s'",
> > +                       fdname);
> > +        }
> > +    }
> > +    if (local_err) {
> > +        error_propagate(errp, local_err);
> > +        assert(fd == -1);
> > +    } else {
> > +        assert(fd != -1);
> > +    }
> > +
> > +    return fd;
> > +}
> > +

Up to here you are basically just moving the code of monitor_fd_param() to a 
project wide shared new function qemu_get_fd(), but why? I mean you could 
simply call monitor_fd_param() in socket_get_fd() below, no?

> >   /*
> >    * Delete a file from the filesystem, unless the filename is
> > 
> > /dev/fdset/...
> > 
> >    *
> > 
> > diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> > index 13b5b197f9..92960ee6eb 100644
> > --- a/util/qemu-sockets.c
> > +++ b/util/qemu-sockets.c
> > @@ -1142,19 +1142,12 @@ static int socket_get_fd(const char *fdstr,
> > Error **errp)
> > 
> >   {
> >       Monitor *cur_mon = monitor_cur();
> >       int fd;
> > 
> > -    if (cur_mon) {
> > -        fd = monitor_get_fd(cur_mon, fdstr, errp);
> > -        if (fd < 0) {
> > -            return -1;
> > -        }
> > -    } else {
> > -        if (qemu_strtoi(fdstr, NULL, 10, &fd) < 0) {
> > -            error_setg_errno(errp, errno,
> > -                             "Unable to parse FD number %s",
> > -                             fdstr);
> > -            return -1;
> > -        }
> > +
> > +    fd = qemu_get_fd(cur_mon, fdstr, errp);
> > +    if (fd < 0) {
> > +        return -1;
> > 
> >       }

This part looks like behaviour change to me. Haven't looked into the details 
though whether it would be OK. Just saying.

> > 
> > +

Unintentional white line added?

> > 
> >       if (!fd_is_socket(fd)) {
> >           error_setg(errp, "File descriptor '%s' is not a socket", fdstr);
> >           close(fd);



