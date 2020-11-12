Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF0862B08AB
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Nov 2020 16:43:28 +0100 (CET)
Received: from localhost ([::1]:38962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kdEkx-0000UO-Qz
	for lists+qemu-devel@lfdr.de; Thu, 12 Nov 2020 10:43:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdEjV-0007hP-HW
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:41:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1kdEjT-0001L1-NU
 for qemu-devel@nongnu.org; Thu, 12 Nov 2020 10:41:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605195715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=u/DjOPOmW46XQLZEQJgI6XiF20fgQ4KISseKPtePQiM=;
 b=VQ1Cp4VCmtBLUtboAjKyfhWoAPZGPFWXVvg8uLpjbQ8lx9VkJVWenEWAGALQDabotwHu/h
 pDOOI1yS3FM32DRZkxyhevWVvEiIFZddX0geQ0h19RrIa+36C7cnG4xrXPdjvY1Czfx91e
 N5gx0tEqtjg0MDvI0diNY2Ry8SbM/UA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-iOrI9S72M2eFJpEqNaBZqg-1; Thu, 12 Nov 2020 10:41:53 -0500
X-MC-Unique: iOrI9S72M2eFJpEqNaBZqg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1C9821891E8A
 for <qemu-devel@nongnu.org>; Thu, 12 Nov 2020 15:41:52 +0000 (UTC)
Received: from work-vm (ovpn-115-60.ams2.redhat.com [10.36.115.60])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CD96319C66;
 Thu, 12 Nov 2020 15:41:44 +0000 (UTC)
Date: Thu, 12 Nov 2020 15:41:42 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PATCH for-5.2] virtiofsd: Announce submounts even without statx()
Message-ID: <20201112154142.GG13424@work-vm>
References: <20201103164135.169325-1-mreitz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201103164135.169325-1-mreitz@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/12 08:00:44
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
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
Cc: virtio-fs@redhat.com, Miklos Szeredi <mszeredi@redhat.com>,
 qemu-devel@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Max Reitz (mreitz@redhat.com) wrote:
> Contrary to what the check (and warning) in lo_init() claims, we can
> announce submounts just fine even without statx() -- the check is based
> on comparing both the mount ID and st_dev of parent and child.  Without
> statx(), we will not have the mount ID; but we always have st_dev.
> 
> The only problems we have (without statx() and its mount ID) are:
> 
> (1) Mounting the same device twice may lead to both trees being treated
>     as exactly the same tree by virtiofsd.  But that is a problem that
>     is completely independent of mirroring host submounts in the guest.
>     Both submount roots will still show the FUSE_SUBMOUNT flag, because
>     their st_dev still differs from their respective parent.
> 
> (2) There is only one exception to (1), and that is if you mount a
>     device inside a mount of itself: Then, its st_dev will be the same
>     as that of its parent, and so without a mount ID, virtiofsd will not
>     be able to recognize the nested mount's root as a submount.
>     However, thanks to virtiofsd then treating both trees as exactly the
>     same tree, it will be caught up in a loop when the guest tries to
>     examine the nested submount, so the guest will always see nothing
>     but an ELOOP there.  Therefore, this case is just fully broken
>     without statx(), whether we check for submounts (based on st_dev) or
>     not.
> 
> All in all, checking for submounts works well even without comparing the
> mount ID (i.e., without statx()).  The only concern is an edge case
> that, without statx() mount IDs, is utterly broken anyway.
> 
> Thus, drop said check in lo_init().
> 
> Reported-by: Miklos Szeredi <mszeredi@redhat.com>
> Signed-off-by: Max Reitz <mreitz@redhat.com>

Queued

> ---
>  tools/virtiofsd/passthrough_ll.c | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> index ec1008bceb..6c64b03f1a 100644
> --- a/tools/virtiofsd/passthrough_ll.c
> +++ b/tools/virtiofsd/passthrough_ll.c
> @@ -610,14 +610,6 @@ static void lo_init(void *userdata, struct fuse_conn_info *conn)
>                   "does not support it\n");
>          lo->announce_submounts = false;
>      }
> -
> -#ifndef CONFIG_STATX
> -    if (lo->announce_submounts) {
> -        fuse_log(FUSE_LOG_WARNING, "lo_init: Cannot announce submounts, there "
> -                 "is no statx()\n");
> -        lo->announce_submounts = false;
> -    }
> -#endif
>  }
>  
>  static void lo_getattr(fuse_req_t req, fuse_ino_t ino,
> -- 
> 2.26.2
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


