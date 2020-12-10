Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96DA2D5FC3
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 16:33:34 +0100 (CET)
Received: from localhost ([::1]:45528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knNwj-0006LC-PD
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 10:33:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1knNt1-0005Ae-KG
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:29:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24777)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1knNsy-0003PA-Fe
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 10:29:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607614178;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lk1uwibabQPOTN1KXTEwzdps2CC3Y2Vsvb955Kl7Jyk=;
 b=IL40cMobXD1KonS2aqQyLyfMSX+0uuG3Vsuc+llKUPn6O5WHnTaJ6pUp+RLoIMhjktMDHw
 aNVW/fP9ohZJRU8UAt23FvMtAtjbd2tB8CX+qWrMvRYdraLiJfFYinsYUf1NnPYXBZdOJB
 RnoLAmtpouC2dvM9lTZyEW7/pYcoM40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-229-L7KGgI5tNliA6FGaN8gfuA-1; Thu, 10 Dec 2020 10:29:28 -0500
X-MC-Unique: L7KGgI5tNliA6FGaN8gfuA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 43000100C600;
 Thu, 10 Dec 2020 15:29:26 +0000 (UTC)
Received: from redhat.com (ovpn-115-31.ams2.redhat.com [10.36.115.31])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 25AA45B4D1;
 Thu, 10 Dec 2020 15:29:23 +0000 (UTC)
Date: Thu, 10 Dec 2020 15:29:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Li Feng <fengli@smartx.com>
Subject: Re: [PATCH] file-posix: detect the lock using the real file
Message-ID: <20201210152730.GK24855@redhat.com>
References: <1607432377-87084-1-git-send-email-fengli@smartx.com>
 <20201208143822.GA6392@merkur.fritz.box>
 <20201209093326.GD3214234@redhat.com>
 <20201209174338.GB6660@merkur.fritz.box>
 <CAHckoCxunkqV6=-KKwbcB9_hbY0HUV7k+syHnHvwKnqXx6FDtw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAHckoCxunkqV6=-KKwbcB9_hbY0HUV7k+syHnHvwKnqXx6FDtw@mail.gmail.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Feng Li <lifeng1519@gmail.com>,
 "open list:raw" <qemu-block@nongnu.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Max Reitz <mreitz@redhat.com>, Kyle Zhang <kyle@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Dec 10, 2020 at 10:56:59PM +0800, Li Feng wrote:
> Kevin Wolf <kwolf@redhat.com> 于2020年12月10日周四 上午1:43写道：
> >
> > Am 09.12.2020 um 10:33 hat Daniel P. Berrangé geschrieben:
> > > On Tue, Dec 08, 2020 at 03:38:22PM +0100, Kevin Wolf wrote:
> > > > Am 08.12.2020 um 13:59 hat Li Feng geschrieben:
> > > > > This patch addresses this issue:
> > > > > When accessing a volume on an NFS filesystem without supporting the file lock,
> > > > > tools, like qemu-img, will complain "Failed to lock byte 100".
> > > > >
> > > > > In the original code, the qemu_has_ofd_lock will test the lock on the
> > > > > "/dev/null" pseudo-file. Actually, the file.locking is per-drive property,
> > > > > which depends on the underlay filesystem.
> > > > >
> > > > > In this patch, make the 'qemu_has_ofd_lock' with a filename be more generic
> > > > > and reasonable.
> > > > >
> > > > > Signed-off-by: Li Feng <fengli@smartx.com>
> > > >
> > > > Do you know any way how I could configure either the NFS server or the
> > > > NFS client such that locking would fail? For any patch related to this,
> > > > it would be good if I could even test the scenario.
> > >
> > > One could write a qtest that uses an LD_PRELOAD to replace the standard
> > > glibc fcntl() function with one that returns an error for locking commands.
> >
> > Sounds a bit ugly, but for regression testing it could make sense.
> >
> > However, part of the testing would be to verify that we our checks
> > actually match the kernel code, which this approach couldn't solve.
> >
> Hi, Kevin and Daniel.
> 
> How about this patch? I think it's very straightforward.
> Except we need a mock syscall test case.

You don't seem to have attached any patch here.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


