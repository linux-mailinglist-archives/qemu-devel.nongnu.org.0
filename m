Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94C051BA03
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 10:17:49 +0200 (CEST)
Received: from localhost ([::1]:56120 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmWgG-0006Tk-G5
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 04:17:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51590)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmWY5-0003K9-Ki
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:09:21 -0400
Received: from us-smtp-delivery-74.mimecast.com ([170.10.133.74]:51084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nmWY4-0006Ax-21
 for qemu-devel@nongnu.org; Thu, 05 May 2022 04:09:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651738159;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=X/gUIfGkB2si4L5oBHuk9PRbF9dG22JkEpUlz7McGko=;
 b=QDnXP3fBArz8msetz+yHuoHGUfW3ebCrJY9VvalwFZr7fl35m+8lM15b+pTW0QU1UKvq7a
 n+f1k2mUGYhhHQ+scMxjXEDDS7QQayMvOglkfehZH5kSFPMaYlm3r4QiGvoHPxHH9q1ajv
 EgvQkQSXzhPkCRthPCAIZDwgrS9Qga8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-362-DGT4nLB2MkOgjgDjgkE6Dg-1; Thu, 05 May 2022 04:09:16 -0400
X-MC-Unique: DGT4nLB2MkOgjgDjgkE6Dg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D746E80419C;
 Thu,  5 May 2022 08:09:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.128])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8137A40CF900;
 Thu,  5 May 2022 08:09:14 +0000 (UTC)
Date: Thu, 5 May 2022 09:09:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>
Subject: Re: iotests and python dependencies
Message-ID: <YnOGJ+rUIn2S8ZOD@redhat.com>
References: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFn=p-ZCF0VU=xrcbCnqmVvEndsMgiFSZOZv_Orm2EdX-Yk--A@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.74; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-74.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On Wed, May 04, 2022 at 03:38:45PM -0400, John Snow wrote:
> Howdy!
> 
> So, I want to finally delete python/qemu/qmp from qemu.git, and this
> creates a small problem -- namely, iotests needs access to it in order
> to run the python-based tests.
> 
> What I think needs to happen is that we create a virtual environment
> that installs python/qemu/. The reason this cannot be done with
> PYTHONPATH alone anymore is because the qmp package itself won't be
> there anymore, we need an installer like `pip` to actually fetch it
> for us and put it somewhere. (i.e., we need to process the
> dependencies of python/qemu now and can't treat it as a pre-installed
> location.)

Having pip fetch it on the fly creates a problem for RPM builds,
because the koji build env has no network access. We will, however,
have an RPM of python-qemu-qmp installed on the host system though.
IOW we need to be able to run iotests using system python and its
installed libs, not a virtual env.  So if we do anything with a
virtual env, it will need to be optional I believe.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


