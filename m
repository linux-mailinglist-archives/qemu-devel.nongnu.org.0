Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 878265A9975
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 15:54:50 +0200 (CEST)
Received: from localhost ([::1]:35496 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTkef-0001ZQ-0O
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 09:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oTkOg-0007Yj-Kx
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 09:38:34 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:54579)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1oTkOe-0005fJ-3Q
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 09:38:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=x7oBIwvwu8SGD2ntYWZjTk1EJw+AiW/a3ARGbxRbG+A=; b=ODKm21gE8m/MwyWBuuvzsomR9O
 9LRUBh/ZYfRI6fimNp++UxbhfuEDHvq+eVhRT4pZo1Ko7LRzIkoB2a4mpbl25yo+PMtWGvtXvnLUW
 Uz1PacTnguKYTOr2DJWQZCoyfeeiCZ94C+o26Tvem2jLx4aaDnhMyAh/7lZQtC5L+aWq0XUbHKnLy
 g7Dp3zzcbNDE5+BXMxnx3Hm+8XLbPcX0E6KN8lNdTBepFS3HYuks18wAeY5MN1ywLCdTjNsJvSqGS
 Ljzp/fQZsA0+rojjPjo7Heo3CZUTUMXIW8zh+iSmHJpJHxvCvZ0JDixS8y5LFs6/pdxe/okFLf7Lz
 qzAMZXvzmn2Te/n4umFMVIsgY8a+feKBIvxRYdOVDVdhJsJo/tpE6dzxHWj9xquExwL82yaetm68E
 LXawg+1oe8U/L2EjoJ/F5NMbWf0B6fU6jtO8/13nUS4I+shpXtXSd2twUAfXdSjkphj/PvL4CTUF9
 68jJcwICMTODjB8LIOihHvffF/NlHVj8lazYhyjM/EfAreWvQwWMjh5ZUKD67qFGbWCkBeKudg/gb
 h37S0BGKKRY70Fl+0ro4MeGmM6B68+orFETJ6+ahY3Q5k/RQjRRIYwBsd63dMZ6FuHMRWlCG/8QM+
 YidzqRLmOYSFqTJUGXMR8khRAD1rMdXZZXI+oa/s8=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: Markus Armbruster <armbru@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>,
 =?ISO-8859-1?Q?Marc=2DAndr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel =?ISO-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Guoyi Tu <tugy@chinatelecom.cn>
Subject: Re: [PATCH] osdep: Introduce qemu_get_fd() to wrap the common codes
Date: Thu, 01 Sep 2022 15:38:07 +0200
Message-ID: <2182625.T0M0iX6UXG@silver>
In-Reply-To: <4d00eb30-73bc-25c3-4450-d4f8b1199063@chinatelecom.cn>
References: <f73d60dd-fbc7-2873-4ed1-d30df19ce661@chinatelecom.cn>
 <47453703.NBG3G7Ahn1@silver>
 <4d00eb30-73bc-25c3-4450-d4f8b1199063@chinatelecom.cn>
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

On Mittwoch, 31. August 2022 10:25:27 CEST Guoyi Tu wrote:
> On 8/18/22 20:58, Christian Schoenebeck wrote:
> > On Donnerstag, 18. August 2022 14:06:04 CEST Guoyi Tu wrote:
> >> Ping...
> >> 
> >> Any comments are welcome
> >> 
> >> On 8/12/22 19:01, Guoyi Tu wrote:
> >>> socket_get_fd() have much the same codes as monitor_fd_param(),
> >>> so qemu_get_fd() is introduced to implement the common logic.
> >>> now socket_get_fd() and monitor_fd_param() directly call this
> >>> function.
> > 
> > s/have/has/, s/now/Now/, some proper rephrasing wouldn't hurt either.
> 
> will fix it.
> 
> >>> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
> >>> ---
> >>> 
> >>>    include/qemu/osdep.h |  1 +
> >>>    monitor/misc.c       | 21 +--------------------
> >>>    util/osdep.c         | 25 +++++++++++++++++++++++++
> >>>    util/qemu-sockets.c  | 17 +++++------------
> >>>    4 files changed, 32 insertions(+), 32 deletions(-)
> >>> 
> >>> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> >>> index b1c161c035..b920f128a7 100644
> >>> --- a/include/qemu/osdep.h
> >>> +++ b/include/qemu/osdep.h
> >>> @@ -491,6 +491,7 @@ int qemu_open_old(const char *name, int flags, ...);
> >>> 
> >>>    int qemu_open(const char *name, int flags, Error **errp);
> >>>    int qemu_create(const char *name, int flags, mode_t mode, Error
> >>>    **errp);
> >>>    int qemu_close(int fd);
> >>> 
> >>> +int qemu_get_fd(Monitor *mon, const char *fdname, Error **errp);
> >>> 
> >>>    int qemu_unlink(const char *name);
> >>>    #ifndef _WIN32
> >>>    int qemu_dup_flags(int fd, int flags);
> >>> 
> >>> diff --git a/monitor/misc.c b/monitor/misc.c
> >>> index 3d2312ba8d..0d3372cf2b 100644
> >>> --- a/monitor/misc.c
> >>> +++ b/monitor/misc.c
> >>> @@ -1395,26 +1395,7 @@ void monitor_fdset_dup_fd_remove(int dup_fd)
> >>> 
> >>>    int monitor_fd_param(Monitor *mon, const char *fdname, Error **errp)
> >>>    {
> >>> 
> >>> -    int fd;
> >>> -    Error *local_err = NULL;
> >>> -
> >>> -    if (!qemu_isdigit(fdname[0]) && mon) {
> >>> -        fd = monitor_get_fd(mon, fdname, &local_err);
> >>> -    } else {
> >>> -        fd = qemu_parse_fd(fdname);
> >>> -        if (fd == -1) {
> >>> -            error_setg(&local_err, "Invalid file descriptor number
> >>> '%s'",
> >>> -                       fdname);
> >>> -        }
> >>> -    }
> >>> -    if (local_err) {
> >>> -        error_propagate(errp, local_err);
> >>> -        assert(fd == -1);
> >>> -    } else {
> >>> -        assert(fd != -1);
> >>> -    }
> >>> -
> >>> -    return fd;
> >>> +    return qemu_get_fd(mon, fdname, errp);
> >>> 
> >>>    }
> >>>    
> >>>    /* Please update hmp-commands.hx when adding or changing commands */
> >>> 
> >>> diff --git a/util/osdep.c b/util/osdep.c
> >>> index 60fcbbaebe..c57551ca78 100644
> >>> --- a/util/osdep.c
> >>> +++ b/util/osdep.c
> >>> @@ -23,6 +23,7 @@
> >>> 
> >>>     */
> >>>    
> >>>    #include "qemu/osdep.h"
> >>>    #include "qapi/error.h"
> >>> 
> >>> +#include "qemu/ctype.h"
> >>> 
> >>>    #include "qemu/cutils.h"
> >>>    #include "qemu/sockets.h"
> >>>    #include "qemu/error-report.h"
> >>> 
> >>> @@ -413,6 +414,30 @@ int qemu_close(int fd)
> >>> 
> >>>        return close(fd);
> >>>    
> >>>    }
> >>> 
> >>> +int qemu_get_fd(Monitor *mon, const char *fdname, Error **errp)
> >>> +{
> >>> +    int fd;
> >>> +    Error *local_err = NULL;
> >>> +
> >>> +    if (!qemu_isdigit(fdname[0]) && mon) {
> >>> +        fd = monitor_get_fd(mon, fdname, &local_err);
> >>> +    } else {
> >>> +        fd = qemu_parse_fd(fdname);
> >>> +        if (fd == -1) {
> >>> +            error_setg(&local_err, "Invalid file descriptor number
> >>> '%s'",
> >>> +                       fdname);
> >>> +        }
> >>> +    }
> >>> +    if (local_err) {
> >>> +        error_propagate(errp, local_err);
> >>> +        assert(fd == -1);
> >>> +    } else {
> >>> +        assert(fd != -1);
> >>> +    }
> >>> +
> >>> +    return fd;
> >>> +}
> >>> +
> > 
> > Up to here you are basically just moving the code of monitor_fd_param() to
> > a project wide shared new function qemu_get_fd(), but why? I mean you
> > could simply call monitor_fd_param() in socket_get_fd() below, no?
> 
> monitor_fd_param() is implemented in misc.c which is not linkded when
> build the test codes that test the socket_connect() api, such as
> test-unit-sockets.c and test-char.c. If call monitor_fd_param() directly

I guess you mean tests/unit/test-util-sockets.c, but I understand.

The thing is though, as you can see from the header of osdep.h, only things 
should be added to osdep.h which are really needed project wide:

  (1) things which everybody needs
  (2) things without which code would work on most platforms but
      fail to compile or misbehave on a minority of host OSes

I don't have the impression that this function would fall into this 
definition, so it would be better to find another location for it.

> in socket_get_fd(), we need to implement a stub version of
> monitor_fd_param() which actually has the same codes according to the
> codes in test-unit-socket.c which overwrite the monitor_get_fd().
> 
> what about moving monitor_fd_param() to the osdep.c and calling
> monitor_fd_param() in socket_get_fd() ?
> 
> >>>    /*
> >>>    
> >>>     * Delete a file from the filesystem, unless the filename is
> >>> 
> >>> /dev/fdset/...
> >>> 
> >>>     *
> >>> 
> >>> diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
> >>> index 13b5b197f9..92960ee6eb 100644
> >>> --- a/util/qemu-sockets.c
> >>> +++ b/util/qemu-sockets.c
> >>> @@ -1142,19 +1142,12 @@ static int socket_get_fd(const char *fdstr,
> >>> Error **errp)
> >>> 
> >>>    {
> >>>    
> >>>        Monitor *cur_mon = monitor_cur();
> >>>        int fd;
> >>> 
> >>> -    if (cur_mon) {
> >>> -        fd = monitor_get_fd(cur_mon, fdstr, errp);
> >>> -        if (fd < 0) {
> >>> -            return -1;
> >>> -        }
> >>> -    } else {
> >>> -        if (qemu_strtoi(fdstr, NULL, 10, &fd) < 0) {
> >>> -            error_setg_errno(errp, errno,
> >>> -                             "Unable to parse FD number %s",
> >>> -                             fdstr);
> >>> -            return -1;
> >>> -        }
> >>> +
> >>> +    fd = qemu_get_fd(cur_mon, fdstr, errp);
> >>> +    if (fd < 0) {
> >>> +        return -1;
> >>> 
> >>>        }
> > 
> > This part looks like behaviour change to me. Haven't looked into the
> > details though whether it would be OK. Just saying.
> 
> In my opinion the logic is almost the same.
> 
> >>> +
> > 
> > Unintentional white line added?
> 
> will delete it.
> 
> Thanks for your coomments
> 
> >>>        if (!fd_is_socket(fd)) {
> >>>        
> >>>            error_setg(errp, "File descriptor '%s' is not a socket",
> >>>            fdstr);
> >>>            close(fd);



