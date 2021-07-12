Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8998B3C6039
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 18:14:27 +0200 (CEST)
Received: from localhost ([::1]:54050 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2yZe-0007Iv-KR
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 12:14:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m2yYf-0006cR-88
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:13:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m2yYb-0000vj-5z
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 12:13:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626106399;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Pyes+qE6wYr6dCLVUi0138kwyzI9Ol2QkhRME9c2Rr8=;
 b=dxIzlEMIKBcK9uDJL+B6NjFUFfmHXSTYATMppkZ3OOffCc83Y2rO47daduWWFvyGLBJz6P
 RArHnDNyUxOGdsvhVMEc74s3egQkbOMrIy7d7G58xZdYBzNtd7RrPkrczYfj0TywJWCo9r
 nkMEVlYS5bSLCjOKnirX9vt8BR3WvMk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-482-YDRZufDEPxi1WX2KPLxShg-1; Mon, 12 Jul 2021 12:13:16 -0400
X-MC-Unique: YDRZufDEPxi1WX2KPLxShg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1383C8015C6;
 Mon, 12 Jul 2021 16:13:16 +0000 (UTC)
Received: from redhat.com (ovpn-113-49.phx2.redhat.com [10.3.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9300410023B0;
 Mon, 12 Jul 2021 16:13:15 +0000 (UTC)
Date: Mon, 12 Jul 2021 11:13:13 -0500
From: Eric Blake <eblake@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PULL 0/4] NBD patches for soft freeze, 2021-07-09
Message-ID: <20210712161313.n2v7gu2ud2wfmoyp@redhat.com>
References: <20210709140951.2775730-1-eblake@redhat.com>
 <CAFEAcA8Oe0Tk0y-JvrovHBnTMW0Dp4Zx9=uTUnO9QhooKxPEOA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8Oe0Tk0y-JvrovHBnTMW0Dp4Zx9=uTUnO9QhooKxPEOA@mail.gmail.com>
User-Agent: NeoMutt/20210205-569-37ed14
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Jul 11, 2021 at 01:09:08PM +0100, Peter Maydell wrote:
> On Fri, 9 Jul 2021 at 15:13, Eric Blake <eblake@redhat.com> wrote:
> >
> > The following changes since commit 9db3065c62a983286d06c207f4981408cf42184d:
> >
> >   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.1-pull-request' into staging (2021-07-08 16:30:18 +0100)
> >
> > are available in the Git repository at:
> >
> >   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-07-09
> >
> > for you to fetch changes up to 62967c9927ec4d733b923c70f9f5428dd1d2e0d7:
> >
> >   nbd: register yank function earlier (2021-07-09 08:27:33 -0500)
> >
> > ----------------------------------------------------------------
> > nbd patches for 2021-07-09
> >
> > - enhance 'qemu-img map --output=json' to make it easier to duplicate
> > backing chain allocation patterns
> > - fix a race in the 'yank' QMP command in relation to NBD requests
> >
> 
> This failed iotest 253 in the build-tcg-disabled gitlab CI:
> https://gitlab.com/qemu-project/qemu/-/jobs/1415082341

Also 146, 211, and 241 needed updating to match the new expected
output.  Will post a v2 pull request soon.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


