Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B83CD49C820
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Jan 2022 11:56:19 +0100 (CET)
Received: from localhost ([::1]:36210 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCfyM-0002ft-SO
	for lists+qemu-devel@lfdr.de; Wed, 26 Jan 2022 05:56:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nCfuN-0006fX-Vg
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 05:52:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:22150)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1nCfuD-0004iH-Co
 for qemu-devel@nongnu.org; Wed, 26 Jan 2022 05:52:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643194318;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uM7gJp01W+mMFl4Fen6rmEvyAcfEhrMBa01ZnyUDFog=;
 b=G7Qt2yKgPYIweDFLjEtZUKUgWbGgT6v7LhGrDMJqE5nw3wNFyNIKc+J/kdOO76Euo1gUF2
 IZQfmbs+fgvrHJTFxoehPAvasXGyXm+Nj9vJ9gGZSXNNti9/cNuCwjgCrtGFfj8Fw5m9YD
 P9LmUoxcQC6sTGauwe8Wwdk4XPZFQIA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-376-Tars4pPEMEerd2VHaJ0F4w-1; Wed, 26 Jan 2022 05:51:54 -0500
X-MC-Unique: Tars4pPEMEerd2VHaJ0F4w-1
Received: by mail-wr1-f72.google.com with SMTP id
 v28-20020adfa1dc000000b001dd1cb24081so1699814wrv.10
 for <qemu-devel@nongnu.org>; Wed, 26 Jan 2022 02:51:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=uM7gJp01W+mMFl4Fen6rmEvyAcfEhrMBa01ZnyUDFog=;
 b=Pu5X40rkyiGtYdKQsm/6nxWrIDrZhz3h7anMzFAuUw2yyDa1NGdoq7LN7lbtGsEMG4
 Kr28EW05rINmCd6fj9f1df5n4lSaD8KbwMtAJ3eRZqQT42wtcF0ypVfmjomlT2BXyzBf
 oOHgVpK0M+VC5hQJeDOnXGlUKSLI3H8PhSeUKyV1Ww5LzVXcfLUC1yhJnp/DqiQL9dX0
 dhu+cHXnRkPgUngw8Yo6uzwJ7DFNbulpRN/ZHcdPmp6/kMV1869be9DhVD4DystEsqCO
 qWHeGlhm0wxMpoY//o/n5ib2qRWB4maX6RiZlVyCUeU5KWRCAGMYwOUiR3fzzSL+qj9E
 l9sw==
X-Gm-Message-State: AOAM530ILC1OnT+om07jEobfRSKhxU132ildE4Vtygxc6YIZZMrLDKtx
 YUzF3SmmS1MuufcyTLAPhe1SmE3/efIMK3INBUjvpwpS0rYNIhBCRkNes3RE5qEsDADNPcXjiDW
 /sahcTRM9uQcPIQc=
X-Received: by 2002:a5d:624f:: with SMTP id m15mr21205227wrv.13.1643194313636; 
 Wed, 26 Jan 2022 02:51:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+lMsWau9S4njWmSsXjg9o6akked6496KLr8EO5mFYbxBPefDtjftZu6We89RYT+M7IiL9pw==
X-Received: by 2002:a5d:624f:: with SMTP id m15mr21205214wrv.13.1643194313449; 
 Wed, 26 Jan 2022 02:51:53 -0800 (PST)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225])
 by smtp.gmail.com with ESMTPSA id c8sm3637721wmq.34.2022.01.26.02.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 02:51:52 -0800 (PST)
Date: Wed, 26 Jan 2022 10:51:50 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH] virtiofsd: Drop membership of all supplementary groups
 (CVE-2022-0358)
Message-ID: <YfEnxhFIW9Y0A7O6@work-vm>
References: <YfBGoriS38eBQrAb@redhat.com>
 <YfEcdsTdIBc9nIdN@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <YfEcdsTdIBc9nIdN@stefanha-x1.localdomain>
User-Agent: Mutt/2.1.5 (2021-12-30)
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.155,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: JIETAO XIAO <shawtao1125@gmail.com>,
 Mauro Matteo Cascella <mcascell@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Miklos Szeredi <mszeredi@redhat.com>, qemu-devel@nongnu.org,
 virtio-fs-list <virtio-fs@redhat.com>, P J P <pj.pandit@yahoo.co.in>,
 Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Tue, Jan 25, 2022 at 01:51:14PM -0500, Vivek Goyal wrote:
> > At the start, drop membership of all supplementary groups. This is
> > not required.
> > 
> > If we have membership of "root" supplementary group and when we switch
> > uid/gid using setresuid/setsgid, we still retain membership of existing
> > supplemntary groups. And that can allow some operations which are not
> > normally allowed.
> > 
> > For example, if root in guest creates a dir as follows.
> > 
> > $ mkdir -m 03777 test_dir
> > 
> > This sets SGID on dir as well as allows unprivileged users to write into
> > this dir. 
> > 
> > And now as unprivileged user open file as follows.
> > 
> > $ su test
> > $ fd = open("test_dir/priviledge_id", O_RDWR|O_CREAT|O_EXCL, 02755);
> > 
> > This will create SGID set executable in test_dir/.
> > 
> > And that's a problem because now an unpriviliged user can execute it,
> > get egid=0 and get access to resources owned by "root" group. This is
> > privilege escalation.
> > 
> > Fixes: https://bugzilla.redhat.com/show_bug.cgi?id=2044863
> > Fixes: CVE-2022-0358
> > Reported-by: JIETAO XIAO <shawtao1125@gmail.com>
> > Suggested-by: Miklos Szeredi <mszeredi@redhat.com>
> > Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> > Signed-off-by: Vivek Goyal <vgoyal@redhat.com>
> > ---
> >  tools/virtiofsd/passthrough_ll.c |   26 ++++++++++++++++++++++++++
> >  1 file changed, 26 insertions(+)
> > 
> > Index: rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c
> > ===================================================================
> > --- rhvgoyal-qemu.orig/tools/virtiofsd/passthrough_ll.c	2022-01-25 13:38:59.349534531 -0500
> > +++ rhvgoyal-qemu/tools/virtiofsd/passthrough_ll.c	2022-01-25 13:39:10.140177868 -0500
> > @@ -54,6 +54,7 @@
> >  #include <sys/wait.h>
> >  #include <sys/xattr.h>
> >  #include <syslog.h>
> > +#include <grp.h>
> >  
> >  #include "qemu/cutils.h"
> >  #include "passthrough_helpers.h"
> > @@ -1161,6 +1162,29 @@ static void lo_lookup(fuse_req_t req, fu
> >  #define OURSYS_setresuid SYS_setresuid
> >  #endif
> >  
> > +static void drop_supplementary_groups(void)
> > +{
> > +    int ret;
> > +
> > +    ret = getgroups(0, NULL);
> > +    if (ret == -1) {
> > +        fuse_log(FUSE_LOG_ERR, "getgroups() failed with error=%d:%s\n",
> > +                 errno, strerror(errno));
> > +        exit(1);
> > +    }
> > +
> > +    if (!ret)
> > +        return;
> > +
> > +    /* Drop all supplementary groups. We should not need it */
> > +    ret = setgroups(0, NULL);
> > +    if (ret == -1) {
> > +        fuse_log(FUSE_LOG_ERR, "setgroups() failed with error=%d:%s\n",
> > +                 errno, strerror(errno));
> > +        exit(1);
> > +    }
> > +}
> > +
> >  /*
> >   * Change to uid/gid of caller so that file is created with
> >   * ownership of caller.
> > @@ -3926,6 +3950,8 @@ int main(int argc, char *argv[])
> >  
> >      qemu_init_exec_dir(argv[0]);
> >  
> > +    drop_supplementary_groups();
> > +
> >      pthread_mutex_init(&lo.mutex, NULL);
> >      lo.inodes = g_hash_table_new(lo_key_hash, lo_key_equal);
> >      lo.root.fd = -1;
> > 
> 
> Thanks, applied to my block tree:
> https://gitlab.com/stefanha/qemu/commits/block

Actually, I just posted it as a separate pull by itself.

(I added {}'s around the if (!ret) { return; }  to meet Qemu
style guides).

Dave


> Stefan


-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


