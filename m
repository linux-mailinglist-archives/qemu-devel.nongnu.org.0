Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6CCB65225E
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:22:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7dFv-0008WI-Nw; Tue, 20 Dec 2022 09:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7dFm-0008UP-Nf
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:05:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7dFk-00034K-TR
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:05:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671545156;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6w90pvWOpeQ5eO4bauSZpNrNC3UU20KrPG9ksE9IsmA=;
 b=dhmwjeW11Bt+xGAFnUOViKLgfEFOYoT57smeLy+POzBohry6OzlbVoJz2lt/o7smjLOby+
 Y7Pur/o95y8vzx8Tf1B1djIxQDKHRDoxSm13ue78vp+T8LPwPAiHiTBaH6LPMDa4fl5ouo
 Tk4wZkBI0XMbp8dyuaMYfwff1pnNjgE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-244-nxPqbRP1PuKijNMQ9rNV5Q-1; Tue, 20 Dec 2022 09:05:54 -0500
X-MC-Unique: nxPqbRP1PuKijNMQ9rNV5Q-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44113802D19;
 Tue, 20 Dec 2022 14:05:54 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.87])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E0A3635458;
 Tue, 20 Dec 2022 14:05:52 +0000 (UTC)
Date: Tue, 20 Dec 2022 14:05:50 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Shreesh Adiga <16567adigashreesh@gmail.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, andrew@daynix.com,
 yuri.benditovich@daynix.com
Subject: Re: [PATCH] ebpf: fix compatibility with libbpf 1.0+
Message-ID: <Y6HBPkCnjDc5KEDS@redhat.com>
References: <20221218143927.597975-1-16567adigashreesh@gmail.com>
 <Y6BDeYCy309Ug4G5@redhat.com> <Y6Bq1nQwu6DitPLY@arch.localdomain>
 <Y6Br8RW4dwdMohCN@redhat.com> <Y6HAh5/u9N50wMah@arch.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y6HAh5/u9N50wMah@arch.localdomain>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Dec 20, 2022 at 07:32:47PM +0530, Shreesh Adiga wrote:
> On Mon, Dec 19, 2022 at 01:49:37PM +0000, Daniel P. Berrangé wrote:
> > On Mon, Dec 19, 2022 at 07:14:54PM +0530, Shreesh Adiga wrote:
> > > Hi Daniel,
> > >
> > > On Mon, Dec 19, 2022 at 10:56:57AM +0000, Daniel P. Berrangé wrote:
> > > > On Sun, Dec 18, 2022 at 08:09:27PM +0530, Shreesh Adiga wrote:
> > > > > The current implementation fails to load on a system with
> > > > > libbpf 1.0 and reports that legacy map definitions in 'maps'
> > > > > section are not supported by libbpf v1.0+. This commit updates
> > > > > the Makefile to add BTF (-g flag) and appropriately updates
> > > > > the maps in rss.bpf.c and update the skeleton file in repo.
> > > >
> > > > Can you split this into two pieces - one updating the build
> > > > system for new compiler usage, and one updating the program
> > > > to remove the legacy map defs.
> > > >
> > > If I just update the Makefile first, rss.bpf.c doesn't compile
> > > and throws error:
> > > rss.bpf.c:80:1: error: variable has incomplete type 'struct bpf_map_def'
> > >
> > > Similarly if first rss.bpf.c only is updated, then error is thrown:
> > > libbpf: BTF is required, but is missing or corrupted
> > > Hence, it would seem logical to update both of them together in same
> > > commit.
> > >
> > > Do you mean first commit should update the Makefile and rss.bpf.c
> > > together and second commit should be updating the rss.bpf.skeleton.h
> > > file? I was under the impression that every commit should result in
> > > compilable sources, hence wanted to clarify this.
> >
> > Yes, it must be compilable. I was under the impression from the
> > commit that these were independant changes, but I was wrong.
> >
> Could you please confirm if the current single patch is good enough for
> submission, or do I need to send a v2 series with changes split into
> two commits, one for Makefile + rss.bpf.c and second one for skeleton
> file update?

Fine as is.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


