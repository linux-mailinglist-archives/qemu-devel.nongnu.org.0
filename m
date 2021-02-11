Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A579331902F
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 17:41:48 +0100 (CET)
Received: from localhost ([::1]:38550 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAF2J-00047H-6d
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 11:41:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lAF0O-0003IG-6q
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:39:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:52519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lAF0J-00044x-DO
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 11:39:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613061581;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JNoPM2oIP/jQJbsyepeGXmEtSZX81mHS3T9lvrZmOp4=;
 b=OB+bU85ahGS4OBK8+XxAS9lRlE7+ReGMe2dHAigDVmmUTbarmMS7vFxb+IDRr9kBbtHUiW
 ZVQLvsI+b1fMOqmbZNYB+xwFre/o1j3MCozjpQk9PqIb6pQ19exxsii4i5R9MSLWu9Kznq
 J/PuaosrPg3bSms2/ljOHUunWhYREj8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-587-zICimbCwNBqnDFarXA1lAQ-1; Thu, 11 Feb 2021 11:39:39 -0500
X-MC-Unique: zICimbCwNBqnDFarXA1lAQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCD35100AA26
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 16:39:38 +0000 (UTC)
Received: from work-vm (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5109C5D74A;
 Thu, 11 Feb 2021 16:39:25 +0000 (UTC)
Date: Thu, 11 Feb 2021 16:39:22 +0000
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Subject: Re: [PATCH 10/24] DAX: virtiofsd: Add setup/remove mappings fuse
 commands
Message-ID: <YCVduoTmMuV4sOZF@work-vm>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-11-dgilbert@redhat.com>
 <20210211123738.GK247031@stefanha-x1.localdomain>
MIME-Version: 1.0
In-Reply-To: <20210211123738.GK247031@stefanha-x1.localdomain>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: virtio-fs@redhat.com, marcandre.lureau@redhat.com, qemu-devel@nongnu.org,
 vgoyal@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Stefan Hajnoczi (stefanha@redhat.com) wrote:
> On Tue, Feb 09, 2021 at 07:02:10PM +0000, Dr. David Alan Gilbert (git) wrote:
> > +static void do_removemapping(fuse_req_t req, fuse_ino_t nodeid,
> > +                             struct fuse_mbuf_iter *iter)
> > +{
> > +    struct fuse_removemapping_in *arg;
> > +    struct fuse_removemapping_one *one;
> > +
> > +    arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
> > +    if (!arg || arg->count <= 0) {
> 
> arg->count is unsigned so < is tautologous.
> 
> > +        fuse_log(FUSE_LOG_ERR, "do_removemapping: invalid arg %p\n", arg);
> > +        fuse_reply_err(req, EINVAL);
> > +        return;
> > +    }
> > +
> > +    one = fuse_mbuf_iter_advance(iter, arg->count * sizeof(*one));
> 
> arg->count * sizeof(*one) is an integer overflow on 32-bit hosts. I
> think we should be more defensive here since this input comes from the
> guest.

OK, so I've gone with:

    if (!arg || !arg->count || 
        (uint64_t)arg->count * sizeof(*one) >= SIZE_MAX) {
        fuse_log(FUSE_LOG_ERR, "do_removemapping: invalid arg %p\n", arg);
        fuse_reply_err(req, EINVAL);
        return;
    }

to fix both of those (the compiler likes to moan on 64bit about
that comparison being always false in the simpler ways I tried it).

Dave

-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


