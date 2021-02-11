Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3DF318F19
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Feb 2021 16:49:34 +0100 (CET)
Received: from localhost ([::1]:52530 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lAEDl-0000PY-TY
	for lists+qemu-devel@lfdr.de; Thu, 11 Feb 2021 10:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lAEBW-0006U9-C3
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 10:47:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lAEBT-0006U4-Ie
 for qemu-devel@nongnu.org; Thu, 11 Feb 2021 10:47:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613058430;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3UgHYU0X9VArROfuASc3JkNJc1U70Q0IEhd8u/QPSI=;
 b=YgNepYN1UjolW8GhqFZ1H6M//aqskiNsmsntdFiFRBp7kPybPUsX96vh6itBJvmyMe5WVc
 NlfCSiVd5S8kgFwmVO4/G31D9CnIK5/8t2SYgo2+/mN5vmcBJ49vQlMvCh+b4WWM3ypGDz
 yrAE/SGtVLfcIxp3IxIs+TpF2PYPJyo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-100-jXakkWgnPAijtjUIvlDOVw-1; Thu, 11 Feb 2021 10:47:06 -0500
X-MC-Unique: jXakkWgnPAijtjUIvlDOVw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8E1D89126F;
 Thu, 11 Feb 2021 15:47:04 +0000 (UTC)
Received: from redhat.com (ovpn-114-239.ams2.redhat.com [10.36.114.239])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A1A076E505;
 Thu, 11 Feb 2021 15:46:50 +0000 (UTC)
Date: Thu, 11 Feb 2021 15:46:47 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Subject: Re: [PULL v4 14/27] io: add qio_channel_readv_full_all_eof &
 qio_channel_readv_full_all helpers
Message-ID: <20210211154647.GK1302824@redhat.com>
References: <20210210092628.193785-1-stefanha@redhat.com>
 <20210210092628.193785-15-stefanha@redhat.com>
 <7a12b897-3157-7a2b-115b-cb6b263b147d@redhat.com>
MIME-Version: 1.0
In-Reply-To: <7a12b897-3157-7a2b-115b-cb6b263b147d@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.569,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 thuth@redhat.com, Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 John G Johnson <john.g.johnson@oracle.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>, qemu-devel@nongnu.org,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Feb 11, 2021 at 04:34:40PM +0100, Max Reitz wrote:
> On 10.02.21 10:26, Stefan Hajnoczi wrote:
> > From: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > 
> > Adds qio_channel_readv_full_all_eof() and qio_channel_readv_full_all()
> > to read both data and FDs. Refactors existing code to use these helpers.
> > 
> > Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
> > Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
> > Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
> > Acked-by: Daniel P. Berrangé <berrange@redhat.com>
> > Message-id: b059c4cc0fb741e794d644c144cc21372cad877d.1611938319.git.jag.raman@oracle.com
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >   include/io/channel.h |  53 +++++++++++++++++++++++
> >   io/channel.c         | 101 ++++++++++++++++++++++++++++++++++---------
> >   2 files changed, 134 insertions(+), 20 deletions(-)
> 
> [...]
> 
> > diff --git a/io/channel.c b/io/channel.c
> > index 0d4b8b5160..4555021b62 100644
> > --- a/io/channel.c
> > +++ b/io/channel.c
> 
> [...]
> 
> > @@ -135,20 +193,23 @@ int qio_channel_readv_all_eof(QIOChannel *ioc,
> >       return ret;
> >   }
> > -int qio_channel_readv_all(QIOChannel *ioc,
> > -                          const struct iovec *iov,
> > -                          size_t niov,
> > -                          Error **errp)
> > +int qio_channel_readv_full_all(QIOChannel *ioc,
> > +                               const struct iovec *iov,
> > +                               size_t niov,
> > +                               int **fds, size_t *nfds,
> > +                               Error **errp)
> >   {
> > -    int ret = qio_channel_readv_all_eof(ioc, iov, niov, errp);
> > +    int ret = qio_channel_readv_full_all_eof(ioc, iov, niov, fds, nfds, errp);
> >       if (ret == 0) {
> > -        ret = -1;
> > -        error_setg(errp,
> > -                   "Unexpected end-of-file before all bytes were read");
> > -    } else if (ret == 1) {
> > -        ret = 0;
> > +        error_prepend(errp,
> > +                      "Unexpected end-of-file before all data were read.");
> > +        return -1;
> 
> This change breaks iotest 083 (i.e., it segfaults), because
> qio_channel_readv_full_all_eof() doesn’t set *errp when it returns 0, so
> there is no error to prepend.

Opps, yes, this needs to be error_setg() not error_prepend()


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


