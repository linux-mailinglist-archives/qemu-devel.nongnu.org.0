Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3355B2B9A38
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 18:58:25 +0100 (CET)
Received: from localhost ([::1]:43118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfoCO-0004x1-9a
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 12:58:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfoAi-00046q-II
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:56:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:20439)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kfoAg-0001du-RD
 for qemu-devel@nongnu.org; Thu, 19 Nov 2020 12:56:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605808598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QeZ4DrtHRD/A07CCHbBKDmZlClDgqW9SJYkEvbRLbnY=;
 b=a0HNFvJgMRbnbyvfi7Y1vLiAddL0NwreXNgJpezeDpZMigmOS94HFXwF3TE6k2u2DLbTkc
 pzw8gJMhYzGOyt3SjjOcQVgcP+W0Lk+aCRmbg1lR8OSGOGcc8PavIiZbJyJ3o2Ku7B/lG3
 IfzpTD6wjkQI0CGlzfaz8QRLeKk9gl8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-177-WmwFJRjdPku8pcZj8SMBQw-1; Thu, 19 Nov 2020 12:56:35 -0500
X-MC-Unique: WmwFJRjdPku8pcZj8SMBQw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75405801B14
 for <qemu-devel@nongnu.org>; Thu, 19 Nov 2020 17:56:34 +0000 (UTC)
Received: from localhost (ovpn-115-101.rdu2.redhat.com [10.10.115.101])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 383375C1D1;
 Thu, 19 Nov 2020 17:56:34 +0000 (UTC)
Date: Thu, 19 Nov 2020 12:56:33 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 6/8] qlit: qlit_type() function
Message-ID: <20201119175633.GV1509407@habkost.net>
References: <20201116224143.1284278-1-ehabkost@redhat.com>
 <20201116224143.1284278-7-ehabkost@redhat.com>
 <877dqhd3y6.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <877dqhd3y6.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 19, 2020 at 11:41:05AM +0100, Markus Armbruster wrote:
> Eduardo Habkost <ehabkost@redhat.com> writes:
> 
> > Useful function where we need to check for the qlit type before
> > converting it to an actual QObject.
> >
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> >  include/qapi/qmp/qlit.h | 5 +++++
> >  1 file changed, 5 insertions(+)
> >
> > diff --git a/include/qapi/qmp/qlit.h b/include/qapi/qmp/qlit.h
> > index f9e356d31e..acddb80831 100644
> > --- a/include/qapi/qmp/qlit.h
> > +++ b/include/qapi/qmp/qlit.h
> > @@ -59,4 +59,9 @@ bool qlit_equal_qobject(const QLitObject *lhs, const QObject *rhs);
> >  
> >  QObject *qobject_from_qlit(const QLitObject *qlit);
> >  
> > +static inline QType qlit_type(const QLitObject *qlit)
> > +{
> > +    return qlit->type;
> > +}
> > +
> >  #endif /* QLIT_H */
> 
> Hiding qlit->type behind a function makes sense only when the structure
> of QLitObject is an implementation secret.  It don't think it is.

I thought all QLitObject fields were considered private.  If they
are not, I can happily get rid of that function.

-- 
Eduardo


