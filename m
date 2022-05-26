Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82804534C8B
	for <lists+qemu-devel@lfdr.de>; Thu, 26 May 2022 11:33:06 +0200 (CEST)
Received: from localhost ([::1]:39904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nu9rb-0001tx-Ab
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 05:33:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nu9F2-0004MN-Nu
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:53:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30095)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nu9F0-0005X9-Vb
 for qemu-devel@nongnu.org; Thu, 26 May 2022 04:53:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1653555190;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=Ecoiadyb7M3IfIHJYSypOZQgCReeAiHt2k8Zp2FzWFo=;
 b=fZP11AJ1p2iL7cpuVjUhdNy9CiJ9W52PzW7fLvgXJWJKf71FfOQ3lQf9iuI9xAchjyBxT3
 xUrurs9l29LRmyTOoudFOemnonJm9JyhImMIbNPd/OKGJ5vtDFfuBvBdW+gp97OBFiDfB8
 i3B2Gi++b0XrvEbeRkMhclsGR+m2O60=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-e1kcpa4aNHqlBEjYlKHVSA-1; Thu, 26 May 2022 04:53:06 -0400
X-MC-Unique: e1kcpa4aNHqlBEjYlKHVSA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 65169101AA45;
 Thu, 26 May 2022 08:53:06 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.86])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4B900492C3B;
 Thu, 26 May 2022 08:53:03 +0000 (UTC)
Date: Thu, 26 May 2022 09:53:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: Alberto Faria <afaria@redhat.com>, qemu-devel@nongnu.org,
 "Denis V. Lunev" <den@openvz.org>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 qemu-block@nongnu.org, Kevin Wolf <kwolf@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Eric Blake <eblake@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jeff Cody <codyprime@gmail.com>, Fam Zheng <fam@euphon.net>,
 Ari Sundholm <ari@tuxera.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v3 03/10] block: Make bdrv_{pread,pwrite}() return 0 on
 success
Message-ID: <Yo8/7AKoxY3CJPQ0@redhat.com>
References: <20220519144841.784780-1-afaria@redhat.com>
 <20220519144841.784780-4-afaria@redhat.com>
 <Yo8+/7yXkXaWRlC2@stefanha-x1.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Yo8+/7yXkXaWRlC2@stefanha-x1.localdomain>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 26, 2022 at 09:49:03AM +0100, Stefan Hajnoczi wrote:
> On Thu, May 19, 2022 at 03:48:33PM +0100, Alberto Faria wrote:
> > diff --git a/block/qcow2.c b/block/qcow2.c
> > index 5493e6b847..d5a1e8bc43 100644
> > --- a/block/qcow2.c
> > +++ b/block/qcow2.c
> > @@ -113,7 +113,7 @@ static ssize_t qcow2_crypto_hdr_read_func(QCryptoBlock *block, size_t offset,
> >          error_setg_errno(errp, -ret, "Could not read encryption header");
> >          return -1;
> >      }
> > -    return ret;
> > +    return buflen;
> >  }
> >  
> >  
> > @@ -174,7 +174,7 @@ static ssize_t qcow2_crypto_hdr_write_func(QCryptoBlock *block, size_t offset,
> >          error_setg_errno(errp, -ret, "Could not read encryption header");
> >          return -1;
> >      }
> > -    return ret;
> > +    return buflen;
> >  }
> 
> I think block/crypto.c's read_func and write_func could be converted to
> 0 (success) and -errno (failure) in the same way. Callers don't handle
> cases where the return value != buflen or failure.

Yes, the callers expect a full buffer to be written, or for error to be
reported.  the 'ssize_t' return type should be converted to merely
'int' with 0 success/-1 error.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


