Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AC1379294
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 17:24:46 +0200 (CEST)
Received: from localhost ([::1]:34992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg7m0-0001hJ-Qb
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 11:24:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49126)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lg7k2-00085T-3U
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:22:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lg7jy-0003dM-5y
 for qemu-devel@nongnu.org; Mon, 10 May 2021 11:22:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620660157;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=6E1GgvwFRejZJeyuUiyYZy5Wb1WjBdx4ZNpHY30ETGE=;
 b=Ey+ZnI+ZHyMjxsNk5wEfvuc1GZ5e0vyN7h986nKD3IfNt8dNPqrbSwYhGf4YrD1+wzMBpB
 UDGGUGaA7mj/zw3MN19EDdOelu+w2zKppS63No85H4eaBK3x95dKGPcCMELzP70z6omLC+
 QeNQEu+Jd3I75jUmJWwAyAEH7XH9Bw4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-45-cNwwtqDINHmadhPp5qaPDw-1; Mon, 10 May 2021 11:22:30 -0400
X-MC-Unique: cNwwtqDINHmadhPp5qaPDw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED9BE81840D;
 Mon, 10 May 2021 15:22:28 +0000 (UTC)
Received: from redhat.com (ovpn-115-206.ams2.redhat.com [10.36.115.206])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6C1B46A97F;
 Mon, 10 May 2021 15:22:27 +0000 (UTC)
Date: Mon, 10 May 2021 16:22:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2] util: fix fd leak in qemu_write_pidfile()
Message-ID: <YJlPsMtX73z1L8Yt@redhat.com>
References: <20210510141148.3138904-1-wangjie88@huawei.com>
 <CAFEAcA9g8XWrvZGSOFdHQEkabGSDbcxQCnD8adfxR=0KLK=GeQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9g8XWrvZGSOFdHQEkabGSDbcxQCnD8adfxR=0KLK=GeQ@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: wangxinxin.wang@huawei.com, QEMU Developers <qemu-devel@nongnu.org>,
 Jie Wang <wangjie88@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 10, 2021 at 04:07:51PM +0100, Peter Maydell wrote:
> On Mon, 10 May 2021 at 15:15, Jie Wang <wangjie88@huawei.com> wrote:
> >
> > if execute qemu_open success, have no branch to free the fd,
> > so unlink it inadvance, let it free by process exit.
> >
> > Signed-off-by: Jie Wang <wangjie88@huawei.com>
> > ---
> >  util/oslib-posix.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/util/oslib-posix.c b/util/oslib-posix.c
> > index 36820fec16..fa881f2ee8 100644
> > --- a/util/oslib-posix.c
> > +++ b/util/oslib-posix.c
> > @@ -131,6 +131,7 @@ bool qemu_write_pidfile(const char *path, Error **errp)
> >              error_setg_errno(errp, errno, "Cannot open pid file");
> >              return false;
> >          }
> > +        unlink(path);
> >
> >          if (fstat(fd, &b) < 0) {
> >              error_setg_errno(errp, errno, "Cannot stat file");
> 
> This code change doesn't match the commit message -- the commit
> message says it's trying to free a filedescriptor, but the code
> change is unlinking a file.
> 
> Unlinking the file is definitely wrong, because the purpose of the
> pidfile is to comminucate the QEMU PID to other processes -- if we
> delete the file then those other processes can't find it. (The file
> gets deleted when QEMU exits -- see qemu_unlink_pidfile() and the code
> that calls it.)


We are also *intentionally* leaking the file descriptor. We have a lock
held on the FD and that lock must not be released until QEMU exits. We
thus leak the FD and rely on the OS to do cleanup when we exit.

We really ought to put a explicit comment in this method and people are
repeatedly trying to fix this non-bug.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


