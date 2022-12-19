Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BAC43650CDB
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 14:51:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7GWc-0002wQ-JH; Mon, 19 Dec 2022 08:49:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7GWa-0002wH-8L
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:49:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1p7GWX-0000lA-Pp
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 08:49:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671457784;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JxuBPIp2QTXEtzON/CHJaARjdQVs5WW7t8FAr9IxzMA=;
 b=H6BgNmX2aupJ5429R3t3Gv0he1M7YGPcMYMQESNZhGBbutVBOrEd7jbCZbppV5ouoU3baY
 L2hNwwKkfXY9BHIqLwQZwaiA9MPSnqdwWQzkWBNIXivIfa4ENN84ZyesGcLLcgbqxlg2Ex
 PVyKbjylNbPTPg2hI3YqqG3zvd/3C+I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-327-AyRGyXhBOEiedE1GXcqqhg-1; Mon, 19 Dec 2022 08:49:41 -0500
X-MC-Unique: AyRGyXhBOEiedE1GXcqqhg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C0349101B42B;
 Mon, 19 Dec 2022 13:49:40 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.198])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id C501014152F4;
 Mon, 19 Dec 2022 13:49:39 +0000 (UTC)
Date: Mon, 19 Dec 2022 13:49:37 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Shreesh Adiga <16567adigashreesh@gmail.com>
Cc: qemu-devel@nongnu.org, jasowang@redhat.com, andrew@daynix.com,
 yuri.benditovich@daynix.com
Subject: Re: [PATCH] ebpf: fix compatibility with libbpf 1.0+
Message-ID: <Y6Br8RW4dwdMohCN@redhat.com>
References: <20221218143927.597975-1-16567adigashreesh@gmail.com>
 <Y6BDeYCy309Ug4G5@redhat.com> <Y6Bq1nQwu6DitPLY@arch.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y6Bq1nQwu6DitPLY@arch.localdomain>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
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

On Mon, Dec 19, 2022 at 07:14:54PM +0530, Shreesh Adiga wrote:
> Hi Daniel,
> 
> On Mon, Dec 19, 2022 at 10:56:57AM +0000, Daniel P. Berrangé wrote:
> > On Sun, Dec 18, 2022 at 08:09:27PM +0530, Shreesh Adiga wrote:
> > > The current implementation fails to load on a system with
> > > libbpf 1.0 and reports that legacy map definitions in 'maps'
> > > section are not supported by libbpf v1.0+. This commit updates
> > > the Makefile to add BTF (-g flag) and appropriately updates
> > > the maps in rss.bpf.c and update the skeleton file in repo.
> >
> > Can you split this into two pieces - one updating the build
> > system for new compiler usage, and one updating the program
> > to remove the legacy map defs.
> >
> If I just update the Makefile first, rss.bpf.c doesn't compile
> and throws error:
> rss.bpf.c:80:1: error: variable has incomplete type 'struct bpf_map_def'
> 
> Similarly if first rss.bpf.c only is updated, then error is thrown:
> libbpf: BTF is required, but is missing or corrupted
> Hence, it would seem logical to update both of them together in same
> commit.
> 
> Do you mean first commit should update the Makefile and rss.bpf.c
> together and second commit should be updating the rss.bpf.skeleton.h
> file? I was under the impression that every commit should result in
> compilable sources, hence wanted to clarify this.

Yes, it must be compilable. I was under the impression from the
commit that these were independant changes, but I was wrong.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


