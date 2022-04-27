Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DF035114E6
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Apr 2022 12:38:53 +0200 (CEST)
Received: from localhost ([::1]:35990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njf4O-00009n-D3
	for lists+qemu-devel@lfdr.de; Wed, 27 Apr 2022 06:38:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1njekk-0004rg-EZ
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 06:18:34 -0400
Received: from us-smtp-delivery-44.mimecast.com ([205.139.111.44]:36070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1njeki-0005YS-K5
 for qemu-devel@nongnu.org; Wed, 27 Apr 2022 06:18:33 -0400
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-148-venGHAzNO3iXELUbMhSTcQ-1; Wed, 27 Apr 2022 06:18:19 -0400
X-MC-Unique: venGHAzNO3iXELUbMhSTcQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id ED5DC811E83;
 Wed, 27 Apr 2022 10:18:18 +0000 (UTC)
Received: from bahia (unknown [10.39.195.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF7B09E61;
 Wed, 27 Apr 2022 10:18:16 +0000 (UTC)
Date: Wed, 27 Apr 2022 12:18:10 +0200
From: Greg Kurz <groug@kaod.org>
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Subject: Re: [PATCH v2 2/5] 9pfs: fix qemu_mknodat(S_IFSOCK) on macOS
Message-ID: <20220427121810.15783101@bahia>
In-Reply-To: <26d489bd-90c5-5b92-309b-4e07c83ec778@gmail.com>
References: <cover.1650553693.git.qemu_oss@crudebyte.com>
 <1750044.XWheshbc2e@silver>
 <eafd4bbf-dbff-323a-179f-8f29905701e1@gmail.com>
 <3849551.ofAv5PygDX@silver>
 <94dfcb65-6901-6a56-d527-581b9b088d2c@gmail.com>
 <20220426143857.716b9f33@bahia>
 <26d489bd-90c5-5b92-309b-4e07c83ec778@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: softfail client-ip=205.139.111.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Michael Roitzsch <reactorcontrol@icloud.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 qemu-stable@nongnu.org, Keno Fischer <keno@juliacomputing.com>,
 Will Cohen <wwcohen@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Apr 2022 11:27:28 +0900
Akihiko Odaki <akihiko.odaki@gmail.com> wrote:

> On 2022/04/26 21:38, Greg Kurz wrote:

[..skip..]

> > 
> > I think Christian's explanation is clear enough. We don't guarantee
> > that v9fs_co_foo() calls run atomically. As a consequence, the client
> > might see transient states or be able to interact with an ongoing
> > request. And to answer your question, we have no specific rationale
> > on security with that.
> > 
> > I'm not sure what the concerns are but unless you come up with a
> > valid scenario [*] I don't see any reason to prevent this patch
> > to go forward.
> > 
> > [*] things like:
> >      - client escaping the shared directory
> >      - QEMU crashing
> >      - QEMU hogging host resources
> >      - client-side unprivileged user gaining elevated privleges
> >        in the guest
> 
> I was just not sure if such transient states are safe. The past 
> discussion was about the length of the non-atomic time window where a 
> path name is used to identify a particular file, but if such states are 
> not considered problematic, the length does not matter all and we can 
> confidently say the sequence of bind() and chmod() is safe.
> 
> Considering the transient states are tolerated in 9pfs, we need to 
> design this function to be tolerant with transient states as well. The 
> use of chmod() is not safe when we consider about transient states. A 
> malicious actor may replace the file at the path with a symlink which 
> may escape the shared directory and chmod() will naively follow it. 

You get a point here. Thanks for your tenacity ! :-)

> chmod() should be replaced with fchmodat_nofollow() or something similar.
> 

On a GNU/Linux system, this could be achieved by calling fchmod() on
the socket fd *before* calling bind() but I'm afraid this hack might
not work with a BSDish OS.

Replacing chmod() with fchmodat_nofollow(dirfd, addr.sun_path, mode)
won't make things atomic as above but at least it won't follow a
malicious symbolic link : mknod() on the client will fail with
ELOOP, which is fine when it comes to not breaking out of the shared
directory.

This brings up a new problem I hadn't realized before : the
fchmodat_nofollow() implementation in 9p-local.c is really
a linux only thing to cope with AT_SYMLINK_NOFOLLOW not being
supported with fchmodat(). It looks that this should move to
9p-util-linux.c and a proper version should be added for macOS
in 9p-util-darwin.c

Cheers,

--
Greg

> Regards,
> Akihiko Odaki
> 
> > 
> > Cheers,
> > 
> > --
> > Greg
> > 
> >> Regards,
> >> Akihiko Odaki
> > 
> 


