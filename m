Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6096314117
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Feb 2021 21:59:01 +0100 (CET)
Received: from localhost ([::1]:57808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Dca-0000Qo-Rm
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 15:59:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l9A7D-0005et-Vx
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:14:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:31990)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1l99yU-0003hh-QO
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 12:05:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612803921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uH1Lof+Oo+kofscgo/Mc0xgLYxTSWwumLWHJoNsUQrc=;
 b=WLPERNmqCtrfx0Jz4/AFPqEEDfeDUn+PHKZw2eliaE27XhJC6SGXkqTQabWj7iND1DiuIq
 77Nso9bEnVo73KS/iQQ9d2Rs+f6TP/QZ7xRnKg7FQo7/8JotTP2KAiwKtjvA3yIOktNUO8
 jxFRkq5TEa/XG8U5Yfb5qd8lwmD/xO4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-p2f0OUR1OpuzFusLJY3HtQ-1; Mon, 08 Feb 2021 12:05:19 -0500
X-MC-Unique: p2f0OUR1OpuzFusLJY3HtQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CA9711084432
 for <qemu-devel@nongnu.org>; Mon,  8 Feb 2021 17:05:09 +0000 (UTC)
Received: from work-vm (ovpn-115-22.ams2.redhat.com [10.36.115.22])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9FAD47A392;
 Mon,  8 Feb 2021 17:05:08 +0000 (UTC)
Date: Mon, 8 Feb 2021 17:05:05 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Vivek Goyal <vgoyal@redhat.com>
Subject: Re: [Virtio-fs] [PATCH v2 1/2] virtiofsd: Save error code early at
 the failure callsite
Message-ID: <20210208170505.GD3033@work-vm>
References: <20201112182418.25395-1-vgoyal@redhat.com>
 <20201112182418.25395-2-vgoyal@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201112182418.25395-2-vgoyal@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.57,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Vivek Goyal (vgoyal@redhat.com) wrote:
> Change error code handling slightly in lo_setattr(). Right now we seem
> to jump to out_err and assume that "errno" is valid and use that to
> send reply.
> 
> But if caller has to do some other operations before jumping to out_err,
> then it does the dance of first saving errno to saverr and the restore
> errno before jumping to out_err. This makes it more confusing.
> 
> I am about to make more changes where caller will have to do some
> work after error before jumping to out_err. I found it easier to
> change the convention a bit. That is caller saves error in "saverr"
> before jumping to out_err. And out_err uses "saverr" to send error
> back and does not rely on "errno" having actual error.
> 
> Signed-off-by: Vivek Goyal <vgoyal@redhat.com>

Yes, that looks OK, so

Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

but please can you send a rebased version, Stefan's recent
security fix changes it around the openat.

Dave


> ---
>  tools/virtiofsd/passthrough_ll.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index ec1008bceb..6407b1a2e1 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -686,6 +686,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>              res = fchmodat(lo->proc_self_fd, procname, attr->st_mode, 0);
>          }
>          if (res == -1) {
> +            saverr = errno;
>              goto out_err;
>          }
>      }
> @@ -695,6 +696,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>  
>          res = fchownat(ifd, "", uid, gid, AT_EMPTY_PATH | AT_SYMLINK_NOFOLLOW);
>          if (res == -1) {
> +            saverr = errno;
>              goto out_err;
>          }
>      }
> @@ -707,15 +709,15 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>              sprintf(procname, "%i", ifd);
>              truncfd = openat(lo->proc_self_fd, procname, O_RDWR);
>              if (truncfd < 0) {
> +                saverr = errno;
>                  goto out_err;
>              }
>          }
>  
>          res = ftruncate(truncfd, attr->st_size);
> +        saverr = res == -1 ? errno : 0;
>          if (!fi) {
> -            saverr = errno;
>              close(truncfd);
> -            errno = saverr;
>          }
>          if (res == -1) {
>              goto out_err;
> @@ -748,6 +750,7 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>              res = utimensat(lo->proc_self_fd, procname, tv, 0);
>          }
>          if (res == -1) {
> +            saverr = errno;
>              goto out_err;
>          }
>      }
> @@ -756,7 +759,6 @@ static void lo_setattr(fuse_req_t req, fuse_ino_t ino, struct stat *attr,
>      return lo_getattr(req, ino, fi);
>  
>  out_err:
> -    saverr = errno;
>      lo_inode_put(lo, &inode);
>      fuse_reply_err(req, saverr);
>  }
> -- 
> 2.25.4
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


