Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7134F19DB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 20:57:54 +0200 (CEST)
Received: from localhost ([::1]:58968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbRtg-0000wy-Si
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 14:57:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53364)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nbRsJ-000880-Bw
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 14:56:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nbRsH-0004uX-M1
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 14:56:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649098585;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Lrs16vHDrVAnAq/6hvI+0Z3QMSJu4DSue2ICIH3BZQs=;
 b=h/QDr71CMCdsApQOxnJvbV4pvx1TVXnbUJAvjhkjDxQstw/a96jjBYTFJQCV5dKgxHdOWd
 X/WR9t0tHK0NojEdL2s8ycf6ltozwYURh20xnTHO0JBIP7f0RqGcLtkf4Aro4HAKg88n5K
 HHzZ/wrpMy1xVce6HOmX/cqCjjgbYng=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563-iHOfmtT9Pv6_Bu0DwKEFRQ-1; Mon, 04 Apr 2022 14:56:22 -0400
X-MC-Unique: iHOfmtT9Pv6_Bu0DwKEFRQ-1
Received: by mail-ua1-f69.google.com with SMTP id
 p2-20020ab06242000000b0035cd628f285so970568uao.9
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 11:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lrs16vHDrVAnAq/6hvI+0Z3QMSJu4DSue2ICIH3BZQs=;
 b=0RWOiADtAWsaK15tfyPFKLgzRJVMXQkct+Tp9txRlVKguWN+YtZEBkoavD0v8MxC6b
 lG6lp64hsKnHJYK7zuFTETga/wnyJPVaPOEkpKirbQZKMPGVyqIoCBqJZf8r134fztt0
 2+SkadQdggOTcrKpIBIuodo1s097Mnb07c7obIP/43U6k6csVxKvD6W5z17afd9/iYUk
 FykLDDBiXv2qb1+hO0dEMCTAg3AWzQTsjez/ynFfYiqYkZX4zphoSgbGEN7F5dqALuT+
 KEj3pW4G7kVBxxkZ7cfAOB7s0yWXIPxGuuZMnzOJu2aRxJ0k/Zxg8PY7TvwDCmbC3r2M
 UHEQ==
X-Gm-Message-State: AOAM532ir2PNH/xx3fu0K4NlqDm4cjnp1lFCxHuPW5LWOIIQH+qP3miH
 wpatk/v0JQR7FZNpAj0dSepyauq7/SyRK8gU3RvxQN0b3egX10/kU4Z/8RhaItGk23BkDNsRZQN
 7pVwEjAHyog29WgOvhE8Gtf67+gEV3OY=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr481484vkf.35.1649098581467; 
 Mon, 04 Apr 2022 11:56:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoubzkiaONiJ5Vc0EbFSqwVucCS2VIDfpf3HkiZyvptoeGZLrENCvHtcZO453K5/MWYOyhzN3n0c1ju9EugDY=
X-Received: by 2002:a05:6122:887:b0:332:699e:7e67 with SMTP id
 7-20020a056122088700b00332699e7e67mr481476vkf.35.1649098581239; Mon, 04 Apr
 2022 11:56:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220330182424.3438872-1-jsnow@redhat.com>
 <20220330182424.3438872-3-jsnow@redhat.com>
 <YkcwzP2lu8B8dYNu@paraplu>
 <CAFn=p-ZZxDNhvYuOqO4XZ1H72ED4R3te2fikoV+mF6UZ7+pqRA@mail.gmail.com>
In-Reply-To: <CAFn=p-ZZxDNhvYuOqO4XZ1H72ED4R3te2fikoV+mF6UZ7+pqRA@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Mon, 4 Apr 2022 14:56:10 -0400
Message-ID: <CAFn=p-ZQvyyStRPo_6mgTKm7X1w9fu0KqfhmUHK7cYTCC_mmyw@mail.gmail.com>
Subject: Re: [qemu.qmp PATCH 02/13] fork qemu.qmp from qemu.git
To: Kashyap Chamarthy <kchamart@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Mon, Apr 4, 2022 at 2:54 PM John Snow <jsnow@redhat.com> wrote:
>
> On Fri, Apr 1, 2022 at 1:05 PM Kashyap Chamarthy <kchamart@redhat.com> wrote:
> >
> > On Wed, Mar 30, 2022 at 02:24:13PM -0400, John Snow wrote:
> > > Split python/ from qemu.git, using these commands:
> > >
> > > > git subtree split -P python/ -b python-split-v3
> > > > mkdir ~/src/tmp
> > > > cd ~/src/tmp
> > > > git clone --no-local --branch python-split-v3 --single-branch ~/src/qemu
> > > > cd qemu
> > > > git filter-repo --path qemu/machine/           \
> > >                   --path qemu/utils/             \
> > >                   --path tests/iotests-mypy.sh   \
> > >                   --path tests/iotests-pylint.sh \
> > >                   --invert-paths
> > >
> > > This commit, however, only performs some minimum cleanup to reflect the
> > > deletion of the other subpackages. It is not intended to be exhaustive,
> > > and further edits are made in forthcoming commits.
> > >
> > > These fixes are broken apart into micro-changes to facilitate mailing
> > > list review subject-by-subject. They *could* be squashed into a single
> > > larger commit on merge if desired, but due to the nature of the fork,
> > > bisectability across the fork boundary is going to be challenging
> > > anyway. It may be better value to just leave these initial commits
> > > as-is.
> > >
> > > Signed-off-by: John Snow <jsnow@redhat.com>
> > > ---
> > >  .gitignore |  2 +-
> > >  Makefile   | 16 ++++++++--------
> > >  setup.cfg  | 24 +-----------------------
> > >  setup.py   |  2 +-
> > >  4 files changed, 11 insertions(+), 33 deletions(-)
> >
> > The changes here look fine to me (and thanks for making it a "micro
> > change").  I'll let sharper eyes than mine to give a closer look at the
> > `git filter-repo` surgery.  Although, that looks fine to me too.
> >
> > [...]
> >
> > >  .PHONY: distclean
> > >  distclean: clean
> > > -     rm -rf qemu.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
> > > +     rm -rf qemu.qmp.egg-info/ .venv/ .tox/ $(QEMU_VENV_DIR) dist/
> > >       rm -f .coverage .coverage.*
> > >       rm -rf htmlcov/
> > > diff --git a/setup.cfg b/setup.cfg
> > > index e877ea5..4ffab73 100644
> > > --- a/setup.cfg
> > > +++ b/setup.cfg
> > > @@ -1,5 +1,5 @@
> > >  [metadata]
> > > -name = qemu
> > > +name = qemu.qmp
> > >  version = file:VERSION
> > >  maintainer = QEMU Developer Team
> >
> > In the spirit of patch 04 ("update maintainer metadata"), do you also
> > want to update here too? s/QEMU Developer Team/QEMU Project?
> >
>
> Good spot.

...Or, uh. That's exactly what I update in patch 04. Are you asking me
to fold in that change earlier? I'm confused now.

--js


