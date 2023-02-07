Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBCE68D997
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 14:42:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPOER-0001h9-Oj; Tue, 07 Feb 2023 08:41:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pPOEP-0001gT-V1
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:41:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1pPOEO-0006R3-6p
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 08:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675777314;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fGVfoSzz2+QTaanVQJqSYCoDz2VgxlcJl8Bl9/GxFSQ=;
 b=gj2sr6X2qQQhl1CKyrqzPkxUTN9pc7SGkvSAPIlYrQ5kYz00ErLhXqF1Ui0PhSxXuHSusx
 CcDxkYFEtoOjLQ+2qTxQDrC6oPRYoDWqX3xD3PGpb0qd7+tcl1eGeZpvubvt1lowaml/5I
 1TyjizbZF+DLxjWhRsUE5bD+q/NH7D0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-302-EmlvgQekM8yrW1yewiZKBQ-1; Tue, 07 Feb 2023 08:41:53 -0500
X-MC-Unique: EmlvgQekM8yrW1yewiZKBQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 u10-20020a5d6daa000000b002bfc2f61048so2088856wrs.23
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 05:41:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=user-agent:in-reply-to:content-transfer-encoding
 :content-disposition:mime-version:references:message-id:subject:cc
 :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fGVfoSzz2+QTaanVQJqSYCoDz2VgxlcJl8Bl9/GxFSQ=;
 b=HknuiIWP7yLFHvGzJKzgf32cUUtXh/sqfGiTfoDhkkzvxpf+WFL533IEKlw3mXvNzE
 SjdqbtncnXY6pzOmP46im6dW1+LDo2rPwb12G3zR/yE7ueWK6pOMICWX0/j+CJmWBtql
 BBU045QXtl1IoKR5nRDKeOAFDC1zDT1awRI/zf+IXmTWZ5LNyg3koKBynzE8B+PLXrgk
 1wPoS3nLLVlRHyDuGccNIGN44k6G1HakEjFKJSrLwdnYPssBEWIISjXyItrnp/tN/jPP
 k/gCOCKGmIdS5PIKhiZlZeCf/SjG9CY0UBI4w9Je8U9QulhxQXf5ogoYrbw8O65ZOwpf
 FPtw==
X-Gm-Message-State: AO0yUKXLlIl3eIqrcvMXQL0/KBUsCWHMJStJV8npPIQEtPe1tGLqw1CZ
 27SClGjsDux7e55L2OC6OGcU2bXUnWTqZIBiFV9lLpAYd+T4low0uf5/Nm+wBORUTHop5DT2eA2
 DOAGrcdfq0i655yo=
X-Received: by 2002:adf:dc04:0:b0:2c3:ea92:3494 with SMTP id
 t4-20020adfdc04000000b002c3ea923494mr2461475wri.55.1675777312422; 
 Tue, 07 Feb 2023 05:41:52 -0800 (PST)
X-Google-Smtp-Source: AK7set/BWknnu9ke2W4zFXqvSeCRXlaOZsQi4t2eijuYAO1TksI8fOJo7XK3tR1QhrtAdAgBiADadQ==
X-Received: by 2002:adf:dc04:0:b0:2c3:ea92:3494 with SMTP id
 t4-20020adfdc04000000b002c3ea923494mr2461449wri.55.1675777312176; 
 Tue, 07 Feb 2023 05:41:52 -0800 (PST)
Received: from work-vm (92.40.213.37.threembb.co.uk. [92.40.213.37])
 by smtp.gmail.com with ESMTPSA id
 i11-20020a5d630b000000b0029a06f11022sm11175076wru.112.2023.02.07.05.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 05:41:51 -0800 (PST)
Date: Tue, 7 Feb 2023 13:41:49 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Cc: peterx@redhat.com, qemu-devel@nongnu.org, zhengchuan@huawei.com,
 dovmurik@linux.vnet.ibm.com, hgcoin@gmail.com,
 zhangjiachen.jaycee@bytedance.com, lvivier@redhat.com,
 stefanha@redhat.com, vgoyal@redhat.com, jinyan12@huawei.com,
 ann.zhuangyanying@huawei.com, quintela@redhat.com
Subject: Re: [PULL 23/26] monitor: Use LOCK_GUARD macros
Message-ID: <Y+JVHUrYY2rFbBes@work-vm>
References: <20200925120655.295142-1-dgilbert@redhat.com>
 <20200925120655.295142-24-dgilbert@redhat.com>
 <CAJ+F1C+6zPmeTjByKMaDZaFND5qr3Y4i9vJpyFJc2UFkgHWOjQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1C+6zPmeTjByKMaDZaFND5qr3Y4i9vJpyFJc2UFkgHWOjQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

* Marc-André Lureau (marcandre.lureau@gmail.com) wrote:
> Hi David
> 
> On Fri, Sep 25, 2020 at 4:27 PM Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > Use the lock guard macros in monitor/misc.c - saves
> > a lot of unlocks in error paths, and the occasional goto.
> >
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Message-Id: <20200922095741.101911-1-dgilbert@redhat.com>
> > Reviewed-by: Markus Armbruster <armbru@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > ---
> >  monitor/misc.c | 44 ++++++++++++++------------------------------
> >  1 file changed, 14 insertions(+), 30 deletions(-)
> >
> > diff --git a/monitor/misc.c b/monitor/misc.c
> > index 262f2bd951..6e0da0cb96 100644
> > --- a/monitor/misc.c
> > +++ b/monitor/misc.c
> > @@ -141,13 +141,13 @@ char *qmp_human_monitor_command(const char *command_line, bool has_cpu_index,
> >      handle_hmp_command(&hmp, command_line);
> >      cur_mon = old_mon;
> >
> > -    qemu_mutex_lock(&hmp.common.mon_lock);
> > -    if (qstring_get_length(hmp.common.outbuf) > 0) {
> > -        output = g_strdup(qstring_get_str(hmp.common.outbuf));
> > -    } else {
> > -        output = g_strdup("");
> > +    WITH_QEMU_LOCK_GUARD(&hmp.common.mon_lock) {
> > +        if (qstring_get_length(hmp.common.outbuf) > 0) {
> > +            output = g_strdup(qstring_get_str(hmp.common.outbuf));
> > +        } else {
> > +            output = g_strdup("");
> > +        }
> >      }
> > -    qemu_mutex_unlock(&hmp.common.mon_lock);
> >
> >  out:
> >      monitor_data_destroy(&hmp.common);
> > @@ -1248,7 +1248,7 @@ void qmp_getfd(const char *fdname, Error **errp)
> >          return;
> >      }
> >
> > -    qemu_mutex_lock(&cur_mon->mon_lock);
> > +    QEMU_LOCK_GUARD(&cur_mon->mon_lock);
> >      QLIST_FOREACH(monfd, &cur_mon->fds, next) {
> >          if (strcmp(monfd->name, fdname) != 0) {
> >              continue;
> > @@ -1256,7 +1256,6 @@ void qmp_getfd(const char *fdname, Error **errp)
> >
> >          tmp_fd = monfd->fd;
> >          monfd->fd = fd;
> > -        qemu_mutex_unlock(&cur_mon->mon_lock);
> >          /* Make sure close() is outside critical section */
> >          close(tmp_fd);
> 
> The comment doesn't look true after this patch, since the lock is
> released before returning. commit 9409fc05fe2 ("monitor: protect
> mon->fds with mon_lock") introduced the lock & comment. Apparently,
> you didn't convert qmp_closefd() to LOCK_GUARD, presumably because of
> the comment. But you did it in qmp_getfd. What's the reason for that
> though, avoiding syscalls while holding the lock or am I missing
> something?

No, I think you're right!
Yeh I think the reason was to avoid the (potentially blocking) syscall 
with the lock held.

Dave

> thanks
> 
> >          return;
> > @@ -1267,7 +1266,6 @@ void qmp_getfd(const char *fdname, Error **errp)
> >      monfd->fd = fd;
> >
> >      QLIST_INSERT_HEAD(&cur_mon->fds, monfd, next);
> > -    qemu_mutex_unlock(&cur_mon->mon_lock);
> >  }
> >
> >  void qmp_closefd(const char *fdname, Error **errp)
> > @@ -1299,7 +1297,7 @@ int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp)
> >  {
> >      mon_fd_t *monfd;
> >
> > -    qemu_mutex_lock(&mon->mon_lock);
> > +    QEMU_LOCK_GUARD(&mon->mon_lock);
> >      QLIST_FOREACH(monfd, &mon->fds, next) {
> >          int fd;
> >
> > @@ -1313,12 +1311,10 @@ int monitor_get_fd(Monitor *mon, const char *fdname, Error **errp)
> >          QLIST_REMOVE(monfd, next);
> >          g_free(monfd->name);
> >          g_free(monfd);
> > -        qemu_mutex_unlock(&mon->mon_lock);
> >
> >          return fd;
> >      }
> >
> > -    qemu_mutex_unlock(&mon->mon_lock);
> >      error_setg(errp, "File descriptor named '%s' has not been found", fdname);
> >      return -1;
> >  }
> > @@ -1350,11 +1346,10 @@ void monitor_fdsets_cleanup(void)
> >      MonFdset *mon_fdset;
> >      MonFdset *mon_fdset_next;
> >
> > -    qemu_mutex_lock(&mon_fdsets_lock);
> > +    QEMU_LOCK_GUARD(&mon_fdsets_lock);
> >      QLIST_FOREACH_SAFE(mon_fdset, &mon_fdsets, next, mon_fdset_next) {
> >          monitor_fdset_cleanup(mon_fdset);
> >      }
> > -    qemu_mutex_unlock(&mon_fdsets_lock);
> >  }
> >
> >  AddfdInfo *qmp_add_fd(bool has_fdset_id, int64_t fdset_id, bool has_opaque,
> > @@ -1389,7 +1384,7 @@ void qmp_remove_fd(int64_t fdset_id, bool has_fd, int64_t fd, Error **errp)
> >      MonFdsetFd *mon_fdset_fd;
> >      char fd_str[60];
> >
> > -    qemu_mutex_lock(&mon_fdsets_lock);
> > +    QEMU_LOCK_GUARD(&mon_fdsets_lock);
> >      QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
> >          if (mon_fdset->id != fdset_id) {
> >              continue;
> > @@ -1409,12 +1404,10 @@ void qmp_remove_fd(int64_t fdset_id, bool has_fd, int64_t fd, Error **errp)
> >              goto error;
> >          }
> >          monitor_fdset_cleanup(mon_fdset);
> > -        qemu_mutex_unlock(&mon_fdsets_lock);
> >          return;
> >      }
> >
> >  error:
> > -    qemu_mutex_unlock(&mon_fdsets_lock);
> >      if (has_fd) {
> >          snprintf(fd_str, sizeof(fd_str), "fdset-id:%" PRId64 ", fd:%" PRId64,
> >                   fdset_id, fd);
> > @@ -1430,7 +1423,7 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)
> >      MonFdsetFd *mon_fdset_fd;
> >      FdsetInfoList *fdset_list = NULL;
> >
> > -    qemu_mutex_lock(&mon_fdsets_lock);
> > +    QEMU_LOCK_GUARD(&mon_fdsets_lock);
> >      QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
> >          FdsetInfoList *fdset_info = g_malloc0(sizeof(*fdset_info));
> >          FdsetFdInfoList *fdsetfd_list = NULL;
> > @@ -1460,7 +1453,6 @@ FdsetInfoList *qmp_query_fdsets(Error **errp)
> >          fdset_info->next = fdset_list;
> >          fdset_list = fdset_info;
> >      }
> > -    qemu_mutex_unlock(&mon_fdsets_lock);
> >
> >      return fdset_list;
> >  }
> > @@ -1554,7 +1546,7 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags)
> >  #else
> >      MonFdset *mon_fdset;
> >
> > -    qemu_mutex_lock(&mon_fdsets_lock);
> > +    QEMU_LOCK_GUARD(&mon_fdsets_lock);
> >      QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
> >          MonFdsetFd *mon_fdset_fd;
> >          MonFdsetFd *mon_fdset_fd_dup;
> > @@ -1569,7 +1561,6 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags)
> >          QLIST_FOREACH(mon_fdset_fd, &mon_fdset->fds, next) {
> >              mon_fd_flags = fcntl(mon_fdset_fd->fd, F_GETFL);
> >              if (mon_fd_flags == -1) {
> > -                qemu_mutex_unlock(&mon_fdsets_lock);
> >                  return -1;
> >              }
> >
> > @@ -1580,25 +1571,21 @@ int monitor_fdset_dup_fd_add(int64_t fdset_id, int flags)
> >          }
> >
> >          if (fd == -1) {
> > -            qemu_mutex_unlock(&mon_fdsets_lock);
> >              errno = EACCES;
> >              return -1;
> >          }
> >
> >          dup_fd = qemu_dup_flags(fd, flags);
> >          if (dup_fd == -1) {
> > -            qemu_mutex_unlock(&mon_fdsets_lock);
> >              return -1;
> >          }
> >
> >          mon_fdset_fd_dup = g_malloc0(sizeof(*mon_fdset_fd_dup));
> >          mon_fdset_fd_dup->fd = dup_fd;
> >          QLIST_INSERT_HEAD(&mon_fdset->dup_fds, mon_fdset_fd_dup, next);
> > -        qemu_mutex_unlock(&mon_fdsets_lock);
> >          return dup_fd;
> >      }
> >
> > -    qemu_mutex_unlock(&mon_fdsets_lock);
> >      errno = ENOENT;
> >      return -1;
> >  #endif
> > @@ -1609,7 +1596,7 @@ static int64_t monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
> >      MonFdset *mon_fdset;
> >      MonFdsetFd *mon_fdset_fd_dup;
> >
> > -    qemu_mutex_lock(&mon_fdsets_lock);
> > +    QEMU_LOCK_GUARD(&mon_fdsets_lock);
> >      QLIST_FOREACH(mon_fdset, &mon_fdsets, next) {
> >          QLIST_FOREACH(mon_fdset_fd_dup, &mon_fdset->dup_fds, next) {
> >              if (mon_fdset_fd_dup->fd == dup_fd) {
> > @@ -1619,17 +1606,14 @@ static int64_t monitor_fdset_dup_fd_find_remove(int dup_fd, bool remove)
> >                      if (QLIST_EMPTY(&mon_fdset->dup_fds)) {
> >                          monitor_fdset_cleanup(mon_fdset);
> >                      }
> > -                    goto err;
> > +                    return -1;
> >                  } else {
> > -                    qemu_mutex_unlock(&mon_fdsets_lock);
> >                      return mon_fdset->id;
> >                  }
> >              }
> >          }
> >      }
> >
> > -err:
> > -    qemu_mutex_unlock(&mon_fdsets_lock);
> >      return -1;
> >  }
> >
> > --
> > 2.26.2
> >
> >
> 
> 
> -- 
> Marc-André Lureau
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


