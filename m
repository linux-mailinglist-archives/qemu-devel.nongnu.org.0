Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BD912D689B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 21:26:47 +0100 (CET)
Received: from localhost ([::1]:40456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knSWT-00060M-Lt
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 15:26:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40026)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1knSLI-000844-09
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 15:15:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1knSLE-0001BH-Va
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 15:15:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607631306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=qZ3ngZJnY5s2DCM5ZV8PdjhZHqXwOf9xM03yTWEb34k=;
 b=XwtnkPQGAmETwCIfrsnFBWG8AFdrWlduK19pJDUFLKkPR65hSYjp1kqMEWgxU+bWClnI4s
 tA1TOX15kcclX/HPlx/9+8P7rguZpl4jJBbRuid1RNjXER+A1/UT3slXeRtdmRgMrsGKuX
 x4nobNsx8pVvXiWKfQXe0LVvz0xeUlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-4Ozb2OmrO6-IS4c_Rgyw2w-1; Thu, 10 Dec 2020 15:15:04 -0500
X-MC-Unique: 4Ozb2OmrO6-IS4c_Rgyw2w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AA084BBEE1
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 20:15:03 +0000 (UTC)
Received: from work-vm (ovpn-113-66.ams2.redhat.com [10.36.113.66])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 46B436F130;
 Thu, 10 Dec 2020 20:14:55 +0000 (UTC)
Date: Thu, 10 Dec 2020 20:14:31 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [PATCH 3/3] virtiofsd: Check file type in lo_flush()
Message-ID: <20201210201431.GP3629@work-vm>
References: <20201207183021.22752-1-vgoyal@redhat.com>
 <20201207183021.22752-4-vgoyal@redhat.com>
 <20201210200303.GN3629@work-vm>
 <20201210200931.GA185111@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201210200931.GA185111@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, mszeredi@redhat.com, lersek@redhat.com,
 qemu-devel@nongnu.org, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> On Thu, Dec 10, 2020 at 08:03:03PM +0000, Dr. David Alan Gilbert wrote:
> > * Vivek Goyal (vgoyal@redhat.com) wrote:
> > > Currently lo_flush() is written in such a way that it expects to receive
> > > a FLUSH requests on a regular file (and not directories). For example,
> > > we call lo_fi_fd() which searches lo->fd_map. If we open directories
> > > using opendir(), we keep don't keep track of these in lo->fd_map instead
> > > we keep them in lo->dir_map. So we expect lo_flush() to be called on
> > > regular files only.
> > > 
> > > Even linux fuse client calls FLUSH only for regular files and not
> > > directories. So put a check for filetype and return EBADF if
> > > lo_flush() is called on a non-regular file.
> > > 
> > > Reported-by: Laszlo Ersek <lersek@redhat.com>
> > > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > > ---
> > >  tools/virtiofsd/passthrough_ll.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > > index 8ba79f503a..48a109d3f6 100644
> > > --- a/tools/virtiofsd/passthrough_ll.c
> > > +++ b/tools/virtiofsd/passthrough_ll.c
> > > @@ -1968,7 +1968,7 @@ static void lo_flush(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
> > >      struct lo_data *lo = lo_data(req);
> > >  
> > >      inode = lo_inode(req, ino);
> > > -    if (!inode) {
> > > +    if (!inode || !S_ISREG(inode->filetype)) {
> > >          fuse_reply_err(req, EBADF);
> > 
> > Does that need a lo_inode_put(lo, &inode) in the new case?
> 
> Good catch. Yes if inode is valid but file type is not regular, we need
> to put inode reference.
> 
> Do you want me to post a new patch or you will like to take care of
> it.

OK, so if we make this :

  if (!inode) {
      fuse_reply_err(req, EBADF);
      return;
  }

  if (!S_ISREG(inode->filetype)) {
      lo_inode_put(lo_data(req), &inode);
      fuse_reply_err(req, EBADF);
      return;
  }

(Untested)

Dave

> 
> Vivek
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


