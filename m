Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5171D2687E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 May 2019 18:41:51 +0200 (CEST)
Received: from localhost ([127.0.0.1]:47731 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTUJK-0006vh-6I
	for lists+qemu-devel@lfdr.de; Wed, 22 May 2019 12:41:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37162)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTUIL-0006a1-6Y
	for qemu-devel@nongnu.org; Wed, 22 May 2019 12:40:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <armbru@redhat.com>) id 1hTUIJ-00011x-Rr
	for qemu-devel@nongnu.org; Wed, 22 May 2019 12:40:49 -0400
Received: from mx1.redhat.com ([209.132.183.28]:60054)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <armbru@redhat.com>) id 1hTUIJ-0000zO-IP
	for qemu-devel@nongnu.org; Wed, 22 May 2019 12:40:47 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9A760307DA31;
	Wed, 22 May 2019 16:40:40 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-116-28.ams2.redhat.com
	[10.36.116.28])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E45565B2CF;
	Wed, 22 May 2019 16:40:38 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
	id 6110E1138648; Wed, 22 May 2019 18:40:37 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Yury Kotov <yury-kotov@yandex-team.ru>
References: <20190514151848.5677-1-yury-kotov@yandex-team.ru>
Date: Wed, 22 May 2019 18:40:37 +0200
In-Reply-To: <20190514151848.5677-1-yury-kotov@yandex-team.ru> (Yury Kotov's
	message of "Tue, 14 May 2019 18:18:48 +0300")
Message-ID: <87r28qjvcq.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Wed, 22 May 2019 16:40:45 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2] monitor: Fix fdset_id & fd types for
 corresponding QMP commands
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	"Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yury Kotov <yury-kotov@yandex-team.ru> writes:

> Now, fdset_id is int64, but in some places we work with it as int.
> It seems that there is no sense to use int64 for fdset_id, so it's
> better to fix inconsistency by changing fdset_id type to int and by
> fixing the reference of corresponding QMP commands: add-fd, remove-fd,
> query-fdsets.
>
> Signed-off-by: Yury Kotov <yury-kotov@yandex-team.ru>
> ---
>  include/monitor/monitor.h |  6 +++---
>  monitor.c                 | 18 +++++++++---------
>  qapi/misc.json            | 10 +++++-----
>  stubs/fdset.c             |  4 ++--
>  util/osdep.c              |  4 ++--
>  vl.c                      |  2 +-
>  6 files changed, 22 insertions(+), 22 deletions(-)
>
> diff --git a/include/monitor/monitor.h b/include/monitor/monitor.h
> index 86656297f1..06f9b6c217 100644
> --- a/include/monitor/monitor.h
> +++ b/include/monitor/monitor.h
> @@ -39,11 +39,11 @@ void monitor_read_command(Monitor *mon, int show_prompt);
>  int monitor_read_password(Monitor *mon, ReadLineFunc *readline_func,
>                            void *opaque);
>  
> -AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
> +AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int fdset_id,
>                                  bool has_opaque, const char *opaque,
>                                  Error **errp);
> -int monitor_fdset_get_fd(int64_t fdset_id, int flags);
> -int monitor_fdset_dup_fd_add(int64_t fdset_id, int dup_fd);
> +int monitor_fdset_get_fd(int fdset_id, int flags);
> +int monitor_fdset_dup_fd_add(int fdset_id, int dup_fd);
>  void monitor_fdset_dup_fd_remove(int dup_fd);
>  int monitor_fdset_dup_fd_find(int dup_fd);
>  
> diff --git a/monitor.c b/monitor.c
> index bb48997913..b71ce816bc 100644
> --- a/monitor.c
> +++ b/monitor.c
> @@ -160,7 +160,7 @@ struct MonFdsetFd {
>  /* file descriptor set containing fds passed via SCM_RIGHTS */
>  typedef struct MonFdset MonFdset;
>  struct MonFdset {
> -    int64_t id;
> +    int id;

In C, you use int instead of int64_t for fdset IDs.


>      QLIST_HEAD(, MonFdsetFd) fds;
>      QLIST_HEAD(, MonFdsetFd) dup_fds;
>      QLIST_ENTRY(MonFdset) next;
> @@ -2346,7 +2346,7 @@ static void monitor_fdsets_cleanup(void)
>      qemu_mutex_unlock(&mon_fdsets_lock);
>  }
>  
> -AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id, bool has_opaque,
> +AddfdInfo *qmp_add_fd(bool has_fdset_id, int32_t fdset_id, bool has_opaque,
>                        const char *opaque, Error **errp)
>  {
>      int fd;
> @@ -2372,7 +2372,7 @@ error:
>      return NULL;
>  }
>  
> -void qmp_remove_fd(int64_t fdset_id, bool has_fd, int64_t fd, Error **errp)
> +void qmp_remove_fd(int32_t fdset_id, bool has_fd, int fd, Error **errp)
>  {
>      MonFdset *mon_fdset;
>      MonFdsetFd *mon_fdset_fd;
> @@ -2405,10 +2405,10 @@ void qmp_remove_fd(int64_t fdset_id, bool has_fd, int64_t fd, Error **errp)
>  error:
>      qemu_mutex_unlock(&mon_fdsets_lock);
>      if (has_fd) {
> -        snprintf(fd_str, sizeof(fd_str), "fdset-id:%" PRId64 ", fd:%" PRId64,
> +        snprintf(fd_str, sizeof(fd_str), "fdset-id:%" PRId32 ", fd:%" PRId32,
>                   fdset_id, fd);
>      } else {
> -        snprintf(fd_str, sizeof(fd_str), "fdset-id:%" PRId64, fdset_id);
> +        snprintf(fd_str, sizeof(fd_str), "fdset-id:%" PRId32, fdset_id);
>      }
>      error_setg(errp, QERR_FD_NOT_FOUND, fd_str);
>  }
> @@ -2454,7 +2454,7 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)
>      return fdset_list;
>  }
>  
> -AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
> +AddfdInfo *monitor_fdset_add_fd(int32_t fd, bool has_fdset_id, int32_t fdset_id,
>                                  bool has_opaque, const char *opaque,
>                                  Error **errp)
>  {
> @@ -2476,7 +2476,7 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
>      }
>  
>      if (mon_fdset == NULL) {
> -        int64_t fdset_id_prev = -1;
> +        int fdset_id_prev = -1;
>          MonFdset *mon_fdset_cur = QLIST_FIRST(&mon_fdsets);
>  
>          if (has_fdset_id) {
> @@ -2538,7 +2538,7 @@ AddfdInfo *monitor_fdset_add_fd(int fd, bool has_fdset_id, int64_t fdset_id,
>      return fdinfo;
>  }
>  
> -int monitor_fdset_get_fd(int64_t fdset_id, int flags)
> +int monitor_fdset_get_fd(int fdset_id, int flags)
>  {
>  #ifdef _WIN32
>      return -ENOENT;
> @@ -2576,7 +2576,7 @@ out:
>  #endif
>  }
>  
> -int monitor_fdset_dup_fd_add(int64_t fdset_id, int dup_fd)
> +int monitor_fdset_dup_fd_add(int fdset_id, int dup_fd)
>  {
>      MonFdset *mon_fdset;
>      MonFdsetFd *mon_fdset_fd_dup;
> diff --git a/qapi/misc.json b/qapi/misc.json
> index 8b3ca4fdd3..b345e1458b 100644
> --- a/qapi/misc.json
> +++ b/qapi/misc.json
> @@ -2179,7 +2179,7 @@
>  #
>  # Since: 1.2.0
>  ##
> -{ 'struct': 'AddfdInfo', 'data': {'fdset-id': 'int', 'fd': 'int'} }
> +{ 'struct': 'AddfdInfo', 'data': {'fdset-id': 'int32', 'fd': 'int32'} }
>  
>  ##
>  # @add-fd:
> @@ -2209,7 +2209,7 @@
>  #
>  ##
>  { 'command': 'add-fd',
> -  'data': { '*fdset-id': 'int',
> +  'data': { '*fdset-id': 'int32',
>              '*opaque': 'str' },
>    'returns': 'AddfdInfo' }
>  
> @@ -2238,7 +2238,7 @@
>  # <- { "return": {} }
>  #
>  ##
> -{ 'command': 'remove-fd', 'data': {'fdset-id': 'int', '*fd': 'int'} }
> +{ 'command': 'remove-fd', 'data': {'fdset-id': 'int32', '*fd': 'int32'} }
>  
>  ##
>  # @FdsetFdInfo:
> @@ -2252,7 +2252,7 @@
>  # Since: 1.2.0
>  ##
>  { 'struct': 'FdsetFdInfo',
> -  'data': {'fd': 'int', '*opaque': 'str'} }
> +  'data': {'fd': 'int32', '*opaque': 'str'} }
>  
>  ##
>  # @FdsetInfo:
> @@ -2266,7 +2266,7 @@
>  # Since: 1.2.0
>  ##
>  { 'struct': 'FdsetInfo',
> -  'data': {'fdset-id': 'int', 'fds': ['FdsetFdInfo']} }
> +  'data': {'fdset-id': 'int32', 'fds': ['FdsetFdInfo']} }
>  
>  ##
>  # @query-fdsets:

In the schema, you use QAPI type 'int32' instead of 'int'.

Before the patch, the two are consistent (except for the bugs you fixed
in v1 of this patch): QAPI 'int' is C int64_t.

After the patch, the two are inconsistent: QAPI 'int32' is C int32_t,
not int.  They're usually the same, but it unclean.

Two ways forward:

1. Revise this patch to use int32_t instead of int.

2. Revise v1 to address the few minor review comments I had.  Smaller
   patch, easier to review.

Your choice.  I'd choose 2.

[...]

