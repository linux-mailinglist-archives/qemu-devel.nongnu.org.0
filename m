Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51DF44F293C
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Apr 2022 10:55:07 +0200 (CEST)
Received: from localhost ([::1]:46748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbext-0007e0-VQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Apr 2022 04:55:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nbeu6-0005hX-I0
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 04:51:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38165)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kchamart@redhat.com>)
 id 1nbetz-0005F5-6L
 for qemu-devel@nongnu.org; Tue, 05 Apr 2022 04:51:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649148661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eTeDy2QhGYLKXrx6++aPAoJ1uEr69LKxPN2uWNartDU=;
 b=GvZe35x55Y21ixyAzd2tH3DXXJYJ197PakkOwvSASuiHYbtAWMt8kSAuc7cvz0YUwAiVdX
 Q7IbhAFBIRTePAOM28A4Nci4DU603tvXxw2GHZkDFXWf7I3rWxmoZgpVKe2Mc4IbBQemUr
 XSIzr+oUBYtINE3Q69bRliwbuJj8g8A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-442-VD_hvBHmPMqzOxBRCEATZw-1; Tue, 05 Apr 2022 04:51:00 -0400
X-MC-Unique: VD_hvBHmPMqzOxBRCEATZw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 32821899EC2
 for <qemu-devel@nongnu.org>; Tue,  5 Apr 2022 08:51:00 +0000 (UTC)
Received: from paraplu (unknown [10.39.195.40])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 080D3C54189;
 Tue,  5 Apr 2022 08:50:58 +0000 (UTC)
Date: Tue, 5 Apr 2022 10:50:56 +0200
From: Kashyap Chamarthy <kchamart@redhat.com>
To: John Snow <jsnow@redhat.com>
Subject: Re: [qemu.qmp PATCH 02/13] fork qemu.qmp from qemu.git
Message-ID: <YkwC8Hg6bs+PVpQk@paraplu>
References: <20220330182424.3438872-1-jsnow@redhat.com>
 <20220330182424.3438872-3-jsnow@redhat.com>
 <YkcwzP2lu8B8dYNu@paraplu>
 <CAFn=p-ZZxDNhvYuOqO4XZ1H72ED4R3te2fikoV+mF6UZ7+pqRA@mail.gmail.com>
 <CAFn=p-ZQvyyStRPo_6mgTKm7X1w9fu0KqfhmUHK7cYTCC_mmyw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFn=p-ZQvyyStRPo_6mgTKm7X1w9fu0KqfhmUHK7cYTCC_mmyw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kchamart@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kchamart@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Daniel Berrange <berrange@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Apr 04, 2022 at 02:56:10PM -0400, John Snow wrote:
> On Mon, Apr 4, 2022 at 2:54 PM John Snow <jsnow@redhat.com> wrote:

[...]

> > > >  .gitignore |  2 +-
> > > >  Makefile   | 16 ++++++++--------
> > > >  setup.cfg  | 24 +-----------------------
> > > >  setup.py   |  2 +-
> > > >  4 files changed, 11 insertions(+), 33 deletions(-)
> > >
> > > The changes here look fine to me (and thanks for making it a "micro
> > > change").  I'll let sharper eyes than mine to give a closer look at the
> > > `git filter-repo` surgery.  Although, that looks fine to me too.
> > >
> > > [...]
> > >
> > > >  .PHONY: distclean
> > > >  distclean: clean
> > > > -     rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
> > > > +     rm -rf qemu.qmp.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
> > > >       rm -f .coverage .coverage.*
> > > >       rm -rf htmlcov/
> > > > diff --git a/setup.cfg b/setup.cfg
> > > > index e877ea5..4ffab73 100644
> > > > --- a/setup.cfg
> > > > +++ b/setup.cfg
> > > > @@ -1,5 +1,5 @@
> > > >  [metadata]
> > > > -name = qemu
> > > > +name = qemu.qmp
> > > >  version = file:VERSION
> > > >  maintainer = QEMU Developer Team
> > >
> > > In the spirit of patch 04 ("update maintainer metadata"), do you also
> > > want to update here too? s/QEMU Developer Team/QEMU Project?
> > >
> >
> > Good spot.
> 
> ...Or, uh. That's exactly what I update in patch 04. Are you asking me
> to fold in that change earlier? I'm confused now.

Oops, perils of reviewing late in the day.  I missed to notice it's the
same file.  You're right; please ignore my remark.  Sorry for the noise.
 

-- 
/kashyap


