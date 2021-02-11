Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E75C319251
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 19:33:26 +0100 (CET)
Received: from localhost ([::1]:47358 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAGmL-00046R-27
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 13:33:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lAGjw-000210-2q
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:30:57 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42458)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1lAGjr-0001lH-G6
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 13:30:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613068246;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8BmbDylXpulR065GTvUD0L3UXfsBD/8ENrEnNbMjj6A=;
 b=R77Y4kmBgjjkkGqYvUlJEg82gBzO1Vb7dko596m24r8PszYUVCSCWDOMoTHBKkcTQpElm9
 eUhzjJnkXgvH7OqtnJkaa3M+8pJkmi7TRrbFqtOGfp/URNjGhqyEZPS/mlebzSpivqfEwU
 IwOl175BNvbCnsphPJZ+49e0YidgoZ8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-347-rckcBxGTPJO7WUMzifxtvA-1; Thu, 11 Feb 2021 13:30:44 -0500
X-MC-Unique: rckcBxGTPJO7WUMzifxtvA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BC5458030B7
 for <qemu-devel@nongnu.org>; Thu, 11 Feb 2021 18:30:43 +0000 (UTC)
Received: from horse.redhat.com (ovpn-115-229.rdu2.redhat.com [10.10.115.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0A9710016F6;
 Thu, 11 Feb 2021 18:30:20 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 370BC220BCF; Thu, 11 Feb 2021 13:30:20 -0500 (EST)
Date: Thu, 11 Feb 2021 13:30:20 -0500
From: Vivek Goyal <vgoyal@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH 10/24] DAX: virtiofsd: Add setup/remove mappings fuse
 commands
Message-ID: <20210211183020.GA29443@redhat.com>
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-11-dgilbert@redhat.com>
 <20210211123738.GK247031@stefanha-x1.localdomain>
 <YCVduoTmMuV4sOZF@work-vm>
MIME-Version: 1.0
In-Reply-To: <YCVduoTmMuV4sOZF@work-vm>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=vgoyal@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=vgoyal@redhat.com;
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
 Stefan Hajnoczi <stefanha@redhat.com>, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 04:39:22PM +0000, Dr. David Alan Gilbert wrote:
> * Stefan Hajnoczi (stefanha@redhat.com) wrote:
> > On Tue, Feb 09, 2021 at 07:02:10PM +0000, Dr. David Alan Gilbert (git) wrote:
> > > +static void do_removemapping(fuse_req_t req, fuse_ino_t nodeid,
> > > +                             struct fuse_mbuf_iter *iter)
> > > +{
> > > +    struct fuse_removemapping_in *arg;
> > > +    struct fuse_removemapping_one *one;
> > > +
> > > +    arg = fuse_mbuf_iter_advance(iter, sizeof(*arg));
> > > +    if (!arg || arg->count <= 0) {
> > 
> > arg->count is unsigned so < is tautologous.
> > 
> > > +        fuse_log(FUSE_LOG_ERR, "do_removemapping: invalid arg %p\n", arg);
> > > +        fuse_reply_err(req, EINVAL);
> > > +        return;
> > > +    }
> > > +
> > > +    one = fuse_mbuf_iter_advance(iter, arg->count * sizeof(*one));
> > 
> > arg->count * sizeof(*one) is an integer overflow on 32-bit hosts. I
> > think we should be more defensive here since this input comes from the
> > guest.
> 
> OK, so I've gone with:
> 
>     if (!arg || !arg->count || 
>         (uint64_t)arg->count * sizeof(*one) >= SIZE_MAX) {
>         fuse_log(FUSE_LOG_ERR, "do_removemapping: invalid arg %p\n", arg);
>         fuse_reply_err(req, EINVAL);
>         return;

If we did not want to get into unit64_t business, can we alternatively do.
     if (!arg || !arg->count || arg->count > SIZE_MAX/sizeof(*one)) {
     }

Vivek


