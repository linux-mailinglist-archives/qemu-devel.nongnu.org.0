Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0C4B4AD549
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 11:06:27 +0100 (CET)
Received: from localhost ([::1]:46370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHNOE-0006u8-Er
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 05:06:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHMIo-0005tK-JI
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:56:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:52015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nHMIg-0007a8-QM
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 03:56:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644310597;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UIdu2rFqTmIna59T4pFTHc5wKJrXdJy2XvzVTsxvnvw=;
 b=c4xB/CbQeIAavhtgWJIJAmVgSOhVsJIpdtgE5ZTkdAlvZRMizaPASbIMLPmqFDqoRnXOJx
 v0sk//gNKeinQ+3cMqvKLiKdMmVYVgrxEYLzleQxbI4/fNC2o77nkmXTqj1AHjzT5vQBOY
 8Rwzdsb31igSK2P2v2XCTfXOsQdGfLo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-671-3Uu4kXyMPdG_9DyIWTiA2Q-1; Tue, 08 Feb 2022 03:56:30 -0500
X-MC-Unique: 3Uu4kXyMPdG_9DyIWTiA2Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8DFA01091DA0;
 Tue,  8 Feb 2022 08:56:29 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.138])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1AA9F7B6C0;
 Tue,  8 Feb 2022 08:56:27 +0000 (UTC)
Date: Tue, 8 Feb 2022 08:56:25 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [PATCH v3 0/2] python: a few improvements to qmp-shell
Message-ID: <YgIwObmUKckefAOR@redhat.com>
References: <20220128161157.36261-1-berrange@redhat.com>
 <CAFn=p-btgUv5WKGOj0GyyU17vsOWkBT4_Xu=vzxsL7FH1dbjhw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-btgUv5WKGOj0GyyU17vsOWkBT4_Xu=vzxsL7FH1dbjhw@mail.gmail.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 07, 2022 at 04:05:47PM -0500, John Snow wrote:
> On Fri, Jan 28, 2022 at 11:12 AM Daniel P. Berrangé <berrange@redhat.com> wrote:
> >
> > This makes the qmp-shell program a little more pleasant to use when you
> > are just trying to spawn a throw-away QEMU process to query some info
> > from.
> >
> > First it introduces a 'qmp-shell-wrap' command that takes a QEMU command
> > line instead of QMP socket, and spawns QEMU automatically, so its life
> > is tied to that of the shell.
> >
> > Second it adds ability to log QMP commands/responses to a file that can
> > be queried with 'jq' to extract information. This is good for commands
> > which return huge JSON docs.
> >
> > In v3:
> >
> >  - Add qmp-shell-wrap to setup.cfg entry points
> >
> > In v2:
> >
> >  - Unlink unix socket path on exit
> >  - Fix default command name
> >  - Deal with flake8/pylint warnings
> >
> > Daniel P. Berrangé (2):
> >   python: introduce qmp-shell-wrap convenience tool
> >   python: support recording QMP session to a file
> >
> >  python/qemu/aqmp/qmp_shell.py | 88 ++++++++++++++++++++++++++++++++---
> >  python/setup.cfg              |  4 ++
> >  scripts/qmp/qmp-shell-wrap    | 11 +++++
> >  3 files changed, 96 insertions(+), 7 deletions(-)
> >  create mode 100755 scripts/qmp/qmp-shell-wrap
> >
> > --
> > 2.34.1
> >
> >
> 
> Great, thanks! I rebased patch 1/2 myself as a courtesy and have staged these.
> 
> --js
> 
> (fwiw: using pip, it seems like the wrapper script works just fine. it
> appears as though using 'python3 setup.py install' does indeed cause
> issues here. I have a patch I'll send soon that discourages the direct
> setup.py invocation to avoid frustration in the future.)

I've only ever used  pip to install from pypi or remote git archives.
How do you use it to install from your local git checkout

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


