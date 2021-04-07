Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF56D35726C
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Apr 2021 18:53:54 +0200 (CEST)
Received: from localhost ([::1]:52682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUBRB-0003ec-Tk
	for lists+qemu-devel@lfdr.de; Wed, 07 Apr 2021 12:53:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60194)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUBO6-00019g-IQ
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 12:50:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25219)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1lUBO1-0005Qq-Hp
 for qemu-devel@nongnu.org; Wed, 07 Apr 2021 12:50:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617814235;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Jeju0KzS5MfT3n0bw+EhT80TCwFbJIfbE+5imbHApXI=;
 b=gwH6Z8+zkrxYvs6yAmKWelnCBjGspHZ2SvuZJnFznnxpk7zq6LPIH0HkDEUU+3aFBTbWMP
 hUY0Y3Td/NHwVGVohTBToC2aBDgXJO++tZwmyogXQ/+Mkg1w4GeNiPZSZv3WpQz5oy+7iz
 yCQChemZ4Ofr6NREBiSVbZ4BPJQbnGk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-289-_qKrM-EVPW2gapRio_Y-Zg-1; Wed, 07 Apr 2021 12:50:34 -0400
X-MC-Unique: _qKrM-EVPW2gapRio_Y-Zg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23410107ACCA;
 Wed,  7 Apr 2021 16:50:31 +0000 (UTC)
Received: from work-vm (ovpn-115-14.ams2.redhat.com [10.36.115.14])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 839CF2BFE7;
 Wed,  7 Apr 2021 16:50:29 +0000 (UTC)
Date: Wed, 7 Apr 2021 17:50:27 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/6] migration + virtiofsd queue
Message-ID: <YG3i0xBDon91EEbL@work-vm>
References: <20210407102021.95225-1-dgilbert@redhat.com>
 <CAFEAcA_cjGZUUYUzFygYS3NKXd02CwrtmK5U5fqF-oz5wAddGA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_cjGZUUYUzFygYS3NKXd02CwrtmK5U5fqF-oz5wAddGA@mail.gmail.com>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
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
Cc: huangy81@chinatelecom.cn, QEMU Developers <qemu-devel@nongnu.org>,
 andrey.gruzdev@virtuozzo.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Peter Maydell (peter.maydell@linaro.org) wrote:
> On Wed, 7 Apr 2021 at 11:22, Dr. David Alan Gilbert (git)
> <dgilbert@redhat.com> wrote:
> >
> > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> >
> > The following changes since commit d0d3dd401b70168a353450e031727affee828527:
> >
> >   Update version for v6.0.0-rc2 release (2021-04-06 18:34:34 +0100)
> >
> > are available in the Git repository at:
> >
> >   git://github.com/dagrh/qemu.git tags/pull-migration-20210407a
> >
> > for you to fetch changes up to c4e232bb57aca19ca60f692ee830023a76eca78e:
> >
> >   tests/migration: fix parameter of auto-converge migration (2021-04-06 18:56:02 +0100)
> >
> > ----------------------------------------------------------------
> > migration+virtiofs fixes pull 2021-04-07
> >
> > A seg fix in virtiofsd, a bunch of fixes for background snapshots, and
> > a migration test fix.
> >
> > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> > ----------------------------------------------------------------
> 
> Fails to link on non-Linux hosts:
> 
> Undefined symbols for architecture x86_64:
>   "_ram_write_tracking_prepare", referenced from:
>       _bg_migration_thread in migration_migration.c.o
> ld: symbol(s) not found for architecture x86_64
> 
> The definition of ram_write_tracking_prepare() is inside an
> #if defined(__linux__), but the callsite is not, I think.

OK, reproduced here.  Let me see.

Dave

> thanks
> -- PMM
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


