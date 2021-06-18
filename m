Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0DD53AC095
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Jun 2021 03:41:46 +0200 (CEST)
Received: from localhost ([::1]:37100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lu3Vx-0003YK-Py
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 21:41:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lu3Uh-0002nH-9n
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 21:40:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37938)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lu3Ud-0000D9-2R
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 21:40:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623980421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iDugXN3b3s4sc5QxCRs0sbFZFIYzheDaodxuufrf52w=;
 b=Zmv/rkOfskpgkcUVQavDSnKozFGdr55dBHT3XczshhPR8drb6e5W9PcK3+3jNavTYuhHQP
 teWCoPW85xL7Ds6ljzfbfJAmEhGm47zEpqICiOt4eKy/ZDD07muLszfmsqGls6liALr09a
 p7E7Q0mCfdDTS5EACPbfvNUZ/2ILyy0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-NSRdSLvOMsCOCFaZveQ-Mw-1; Thu, 17 Jun 2021 21:40:20 -0400
X-MC-Unique: NSRdSLvOMsCOCFaZveQ-Mw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E740100B381;
 Fri, 18 Jun 2021 01:40:18 +0000 (UTC)
Received: from horse.redhat.com (ovpn-116-162.rdu2.redhat.com [10.10.116.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B793910016F4;
 Fri, 18 Jun 2021 01:40:07 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 4BB98220BCF; Thu, 17 Jun 2021 21:40:07 -0400 (EDT)
Date: Thu, 17 Jun 2021 21:40:07 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH] virtiofsd: Don't allow file creation with FUSE_OPEN
Message-ID: <20210618014007.GA1219970@redhat.com>
References: <20210617141518.304659-1-groug@kaod.org>
MIME-Version: 1.0
In-Reply-To: <20210617141518.304659-1-groug@kaod.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: virtio-fs@redhat.com, Miklos Szeredi <miklos@szeredi.hu>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 04:15:18PM +0200, Greg Kurz wrote:
> A well behaved FUSE client uses FUSE_CREATE to create files. It isn't
> supposed to pass O_CREAT along a FUSE_OPEN request, as documented in
> the "fuse_lowlevel.h" header :
> 
>     /**
>      * Open a file
>      *
>      * Open flags are available in fi->flags. The following rules
>      * apply.
>      *
>      *  - Creation (O_CREAT, O_EXCL, O_NOCTTY) flags will be
>      *    filtered out / handled by the kernel.
> 
> But if it does anyway, virtiofsd crashes with:
> 
> *** invalid openat64 call: O_CREAT or O_TMPFILE without mode ***: terminated

So did you hit this error with current fuse client. If yes, that means
client needs fixing as well?

Or you are doing this fix based on comment in fuse_lowlevel.h.

I am wondering why this protocl restriction is there that open()
path should not be able to honor O_CREAT.

Vivek

> 
> This is because virtiofsd ends up passing this flag to openat() without
> passing a mode_t 4th argument which is mandatory with O_CREAT, and glibc
> aborts.
> 
> The offending path is:
> 
> lo_open()
>     lo_do_open()
>         lo_inode_open()
> 
> Other callers of lo_inode_open() only pass O_RDWR and lo_create()
> passes a valid fd to lo_do_open() which thus doesn't even call
> lo_inode_open() in this case.
> 
> Specifying O_CREAT with FUSE_OPEN is a protocol violation. Check this
> in lo_open() and return an error to the client : EINVAL since this is
> already what glibc returns with other illegal flag combinations.
> 
> The FUSE filesystem doesn't currently support O_TMPFILE, but the very
> same would happen if O_TMPFILE was passed in a FUSE_OPEN request. Check
> that as well.
> 
> Signed-off-by: Greg Kurz <groug@kaod.org>
> ---
>  tools/virtiofsd/passthrough_ll.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index 49c21fd85570..14f62133131c 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -2145,6 +2145,12 @@ static void lo_open(fuse_req_t req, fuse_ino_t ino, struct fuse_file_info *fi)
>          return;
>      }
>  
> +    /* File creation is handled by lo_create() */
> +    if (fi->flags & (O_CREAT | O_TMPFILE)) {
> +        fuse_reply_err(req, EINVAL);
> +        return;
> +    }
> +
>      err = lo_do_open(lo, inode, -1, fi);
>      lo_inode_put(lo, &inode);
>      if (err) {
> -- 
> 2.31.1
> 


