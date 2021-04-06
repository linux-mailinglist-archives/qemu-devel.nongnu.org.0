Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5084235537B
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 14:18:28 +0200 (CEST)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTkf4-0007pM-RJ
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 08:18:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lTkd7-0007LN-Gl
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:16:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lTkd2-0000DG-9l
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 08:16:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617711378;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=/LUXCyQZo7GCiqs+p6jpeoAM8orGXhZe5yO/1GN64ac=;
 b=I4Ty9L2iXAi4vELgh03Ve8NML1o7YlM2h5/SamGRbRWFX5WYOd+FEbYAfnD4F2CswifdMQ
 pPBniiqhyS+eCptJI49VwN1gG0WTDPrON/lPyJbL/xh46T9qhTX5dXl5DfbA6/JtbIweZj
 713Yp6pA+p/b+CvcDVxlSglB2J5q/f0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-294-_kDW8ZnPOWOCGdSLPsW-pw-1; Tue, 06 Apr 2021 08:16:17 -0400
X-MC-Unique: _kDW8ZnPOWOCGdSLPsW-pw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5E86A1084D69
 for <qemu-devel@nongnu.org>; Tue,  6 Apr 2021 12:16:16 +0000 (UTC)
Received: from work-vm (ovpn-114-244.ams2.redhat.com [10.36.114.244])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D87305D9D0;
 Tue,  6 Apr 2021 12:16:08 +0000 (UTC)
Date: Tue, 6 Apr 2021 13:16:05 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Connor Kuehl <ckuehl@redhat.com>
Subject: Re: [Virtio-fs] [PATCH] virtiofsd: Fix security.capability comparison
Message-ID: <YGxRBQebSJJCX/46@work-vm>
References: <20210401145845.78445-1-dgilbert@redhat.com>
 <041f5453-cd97-e31f-2855-7083ba6614fc@redhat.com>
MIME-Version: 1.0
In-Reply-To: <041f5453-cd97-e31f-2855-7083ba6614fc@redhat.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: virtio-fs@redhat.com, qemu-devel@nongnu.org, stefanha@redhat.com,
 vgoyal@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Connor Kuehl (ckuehl@redhat.com) wrote:
> On 4/1/21 9:58 AM, Dr. David Alan Gilbert (git) wrote:
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > 
> > My security fix for the security.capability remap has a silly early
> > segfault in a simple case where there is an xattrmapping but it doesn't
> > remap the securty.capability.
> 
> s/securty/security

Queued, with that typo fixed

> > 
> > Fixes: e586edcb41054 ("virtiofs: drop remapped security.capability xattr as needed")
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> 
> Reviewed-by: Connor Kuehl <ckuehl@redhat.com>
> 
> > ---
> >   tools/virtiofsd/passthrough_ll.c | 3 ++-
> >   1 file changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index b144320e48..1553d2ef45 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -2636,7 +2636,8 @@ static void parse_xattrmap(struct lo_data *lo)
> >                   strerror(ret));
> >           exit(1);
> >       }
> > -    if (!strcmp(lo->xattr_security_capability, "security.capability")) {
> > +    if (!lo->xattr_security_capability ||
> > +        !strcmp(lo->xattr_security_capability, "security.capability")) {
> >           /* 1-1 mapping, don't need to do anything */
> >           free(lo->xattr_security_capability);
> >           lo->xattr_security_capability = NULL;
> > 
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


