Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7137251C4EC
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 18:12:18 +0200 (CEST)
Received: from localhost ([::1]:45682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nme5P-00016P-BM
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 12:12:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmdrE-0008Gn-Sl
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:57:36 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.129.74]:58647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmdrD-00008P-5l
 for qemu-devel@nongnu.org; Thu, 05 May 2022 11:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651766254;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=lFJkSxG07rEAO3SYWPhb9P8Q6kNDq5EW2/ae74PjgZo=;
 b=aG/f2iGCLX0O2TESkCC4qyoYn30us6cvTlszV9FjFopJi90mdOiVV0A7v5rwJBbTIIke28
 /Wyo0CQNGag5QhUIeaNn98AfAtpAQKFRB6c9f2ax2Ngnc0sS3o9QYhYcbl6re6E1SVu5mn
 95SW5KrD3WZnTt+3ARJ3KvyXBAD1sWc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-509-G0s0Wt69MTOSFB5ChTZJfw-1; Thu, 05 May 2022 11:57:31 -0400
X-MC-Unique: G0s0Wt69MTOSFB5ChTZJfw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id F2CC018A0161;
 Thu,  5 May 2022 15:57:30 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7E05F14E0420;
 Thu,  5 May 2022 15:57:28 +0000 (UTC)
Date: Thu, 5 May 2022 16:57:24 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: John Snow <jsnow@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Kevin Wolf <kwolf@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Cleber Rosa <crosa@redhat.com>
Subject: Re: iotests and python dependencies
Message-ID: <YnPz5NMDZkeKaaV+@redhat.com>
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
 <YnOGJ+rUIn2S8ZOD@redhat.com>
 <CAFn=p-bBCbokmZ8FeHon6FBGxp38_z4=vmDNMi5vKKF_1KjQLQ@mail.gmail.com>
 <YnPEGrwa9KVyup6T@redhat.com>
 <CAFn=p-ZpoJvoZSnk9gN+uiaas=h-tvZqBCZw2kJf88=rq_5LYQ@mail.gmail.com>
 <07a829c2-4eb8-01e3-0c8c-691c1420f51a@redhat.com>
 <CAFn=p-Zfonw462fKT=TBKCRLbZ2xPUwsK-SeRJhgfxYwNRJEsg@mail.gmail.com>
 <ca23e571-354e-1251-412d-5cae1741aa61@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ca23e571-354e-1251-412d-5cae1741aa61@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.74; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On Thu, May 05, 2022 at 05:50:00PM +0200, Paolo Bonzini wrote:
> On 5/5/22 16:13, John Snow wrote:
> > 
> >     I would rather keep python/qemu/qmp as a submodule for a longer time,
> >     and still go through a virtual environment that installs it together
> >     with its pip dependencies.
> > 
> > 
> > A small headache relating fixes to both locations, but if you'd like to
> > see it to prove that the installation mechanism works in general, then
> > OK. I'm willing to deal with the pain until the next release to let us
> > go through a testing cycle. Reluctantly. Maybe.
> > 
> > I'm assuming you mean as a subpackage and not a [git] submodule. If you
> > do mean git, then ... uh. That might be messy.
> 
> Yeah, I meant a git submodule in qemu.git...  It would also be the easiest
> way to build a subpackage in Fedora, since it would be part of the QEMU
> tarballs.

When qemu.qmp is uploaded to PyPi, then Fedora packaging guidelines on
unbundling will expect us to create a dedicated python-qemu.qmp src.rpm,
and use that, not anything QEMU might bundle.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


