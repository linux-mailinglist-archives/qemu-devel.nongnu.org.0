Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDFE533431D
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Mar 2021 17:34:08 +0100 (CET)
Received: from localhost ([::1]:36600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lK1mh-0001eo-Ej
	for lists+qemu-devel@lfdr.de; Wed, 10 Mar 2021 11:34:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lK1fZ-0005v4-NI
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:26:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37888)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lK1fW-0003gz-TA
 for qemu-devel@nongnu.org; Wed, 10 Mar 2021 11:26:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615393601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XVPeJgD6SyfoB0Nmgl9JYCdMozxIBOfM3nQu15bFNvY=;
 b=ImlYVf1F4S6uTXdjiTH9fmJfjAvwv0k+3Jd1YdCMyHE7PrV4Ot4gQoxXblIHKe4TJeKv28
 O24BLGpo2sXVmVR5xWNzbtDQ7JP+sgry+pAMUKRimEuC2oGSNyyWNHevLsEYt05VYYmnQ8
 J97P0QObXtw4FGUqAYXZzBHfCau3Jgw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-spX7rP0lNRSgesMXhwdkcQ-1; Wed, 10 Mar 2021 11:26:39 -0500
X-MC-Unique: spX7rP0lNRSgesMXhwdkcQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CC5391018F74;
 Wed, 10 Mar 2021 16:26:37 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-114-29.ams2.redhat.com [10.36.114.29])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 782135945D;
 Wed, 10 Mar 2021 16:26:29 +0000 (UTC)
Date: Wed, 10 Mar 2021 17:26:27 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v2 00/12] block/export: vhost-user-blk server tests and
 input validation
Message-ID: <20210310162627.GE6076@merkur.fritz.box>
References: <20201207172030.251905-1-stefanha@redhat.com>
 <20210215104120.GE7226@merkur.fritz.box>
 <CAFEAcA-Urs8JYHmAC1mbtbSNWhTsKyer=8i9zdSpnsa2eH4i2Q@mail.gmail.com>
 <CAFEAcA_yd6KydPA_Szdt6-_xjiaQOzXkCPEXxZ80hEatM5grWA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_yd6KydPA_Szdt6-_xjiaQOzXkCPEXxZ80hEatM5grWA@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Coiby Xu <coiby.xu@gmail.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 10.03.2021 um 16:51 hat Peter Maydell geschrieben:
> On Fri, 19 Feb 2021 at 22:38, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Mon, 15 Feb 2021 at 10:41, Kevin Wolf <kwolf@redhat.com> wrote:
> > >
> > > Am 07.12.2020 um 18:20 hat Stefan Hajnoczi geschrieben:
> > > > v2:
> > > >  * Add abrt handler that terminates qemu-storage-daemon to
> > > >    vhost-user-blk-test. No more orphaned processes on test failure. [Peter]
> > > >  * Fix sector number calculation in vhost-user-blk-server.c
> > > >  * Introduce VIRTIO_BLK_SECTOR_BITS/SIZE to make code clearer [Max]
> > > >  * Fix vhost-user-blk-server.c blk_size double byteswap
> > > >  * Fix vhost-user-blk blkcfg->num_queues endianness [Peter]
> > > >  * Squashed cleanups into Coiby vhost-user-blk-test commit so the code is
> > > >    easier to review
> > > >
> > > > The vhost-user-blk server test was already in Michael Tsirkin's recent vhost
> > > > pull request, but was dropped because it exposed vhost-user regressions
> > > > (b7c1bd9d7848 and the Based-on tag below). Now that the vhost-user regressions
> > > > are fixed we can re-introduce the test case.
> > > >
> > > > This series adds missing input validation that led to a Coverity report. The
> > > > virtio-blk read, write, discard, and write zeroes commands need to check
> > > > sector/byte ranges and other inputs. This solves the issue Peter Maydell raised
> > > > in "[PATCH for-5.2] block/export/vhost-user-blk-server.c: Avoid potential
> > > > integer overflow".
> > > >
> > > > Merging just the input validation patches would be possible too, but I prefer
> > > > to merge the corresponding tests so the code is exercised by the CI.
> > >
> > > Is this series still open? I don't see it in master.
> >
> > The Coverity issue is still unfixed, at any rate...
> 
> Ping^2 ! I'd like to get us down to no outstanding Coverity issues for the
> 6.0 release, and this (CID 1435956) is one of the handful still unfixed.

You pulled a newer version of this series (minus the tests that caused CI
failures on some older OSes) earlier today, so I assume this is fixed
now.

Kevin


