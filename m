Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4C6262B1D
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Sep 2020 10:58:50 +0200 (CEST)
Received: from localhost ([::1]:36218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFvwG-00079Q-MN
	for lists+qemu-devel@lfdr.de; Wed, 09 Sep 2020 04:58:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFvvY-0006fl-87
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 04:58:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:30023
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1kFvvW-0001jw-6T
 for qemu-devel@nongnu.org; Wed, 09 Sep 2020 04:58:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599641880;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=shwlSE+pR39ge4sO/ry+zyS8jVrcn6tmBA4RPr2JVeQ=;
 b=IuPxgyKA2JBA2OIzSkBaVN29zabqiZDARRAY1LYNk50OofE7ALprvKh8p6fTs280LjX1EB
 zwY1Hc4ImeAmx0foQ5nd0j9gBL++G1wJjmXI98rlbIDiPTaP7i0D2+o5wIdgtfWI5JxVmg
 IhYUvoWw0CU1k7XrLKBY2wLR9HurCvA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-457-IWTiyf2wMw23id9tqMFRXw-1; Wed, 09 Sep 2020 04:57:57 -0400
X-MC-Unique: IWTiyf2wMw23id9tqMFRXw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 471231DDFA;
 Wed,  9 Sep 2020 08:57:55 +0000 (UTC)
Received: from linux.fritz.box (ovpn-113-221.ams2.redhat.com [10.36.113.221])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BD1D97EED4;
 Wed,  9 Sep 2020 08:57:49 +0000 (UTC)
Date: Wed, 9 Sep 2020 10:57:48 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: =?utf-8?B?572X5YuH5YiaKFlvbmdnYW5nIEx1byk=?= <luoyonggang@gmail.com>
Subject: Re: [PATCH 08/16] block: get file-win32.c handle locking option
 consistence with file-posix.c
Message-ID: <20200909085748.GD5219@linux.fritz.box>
References: <20200908194820.702-1-luoyonggang@gmail.com>
 <20200908194820.702-9-luoyonggang@gmail.com>
 <20200909081931.GC5219@linux.fritz.box>
 <CAE2XoE-g=jw_=j8RbZ29FBrERt6mj8WHbR2Pt9LQ0PaC2tg96g@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAE2XoE-g=jw_=j8RbZ29FBrERt6mj8WHbR2Pt9LQ0PaC2tg96g@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/09 03:05:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Lieven <pl@kamp.de>, Ed Maste <emaste@freebsd.org>,
 Michael Roth <mdroth@linux.vnet.ibm.com>, Qemu-block <qemu-block@nongnu.org>,
 Stefan Weil <sw@weilnetz.de>, Xie Changlong <xiechanglong.d@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-level <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Wen Congyang <wencongyang2@huawei.com>,
 Li-Wen Hsu <lwhsu@freebsd.org>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 09.09.2020 um 10:41 hat 罗勇刚(Yonggang Luo) geschrieben:
> On Wed, Sep 9, 2020 at 4:19 PM Kevin Wolf <kwolf@redhat.com> wrote:
> 
> > Am 08.09.2020 um 21:48 hat Yonggang Luo geschrieben:
> > > Signed-off-by: Yonggang Luo <luoyonggang@gmail.com>
> > > ---
> > >  block/file-win32.c | 23 +++++++++++++++++++++--
> > >  1 file changed, 21 insertions(+), 2 deletions(-)
> >
> > This is almost the same as my separately posted 'file-win32: Fix
> > "locking" option', except that you changed the order of variable
> > definitions which will cause a merge conflict.
> >
> > When you take patches from other people, you should correctly attribute
> > them and not make them look as if they were your own.
> >
> > Commit messages should not be empty, but explain the motivation for the
> > change.
> >
> I know someone else have already have fixes for it, so I didn't detail
> it much, Ineed I wanna skip it when sending patches, but
> git-publish.py didn't handle it well under Win32 yet
> 
> >
> > In this case, dropping the patch is easiest because my patch is already
> > in a pull request and will probably be merged soon.
>
> I am waiting it to merged, at the current stage, if I don't include
> this patch the test runner will fail.

I see. This is not obvious to others and it will look like you want to
get the patch included as you sent it.

What I do in situations like this is that I put any patches from other
series first in my branch and then send out only what is on top of them,
noting the dependency in the cover letter.

Kevin


