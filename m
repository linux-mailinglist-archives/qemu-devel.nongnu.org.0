Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B7E8522FCB
	for <lists+qemu-devel@lfdr.de>; Wed, 11 May 2022 11:47:43 +0200 (CEST)
Received: from localhost ([::1]:53430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noiwY-0006k1-Gx
	for lists+qemu-devel@lfdr.de; Wed, 11 May 2022 05:47:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noikP-00042Q-GZ
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:35:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49225)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1noikM-0001Vt-8i
 for qemu-devel@nongnu.org; Wed, 11 May 2022 05:35:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652261705;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=TCUyWeoTAdznvjJTRmaU+kldP66AnHRMBIyYQ2kdEFM=;
 b=DXMhLnlo4GmZpROH/rgzsHO2Q5hhRDeVPRZocQbzEBRcfLGHQ/x8d2xis1MunA66qvoIrb
 a3vg/7EUbKyLPpps595Hivt5FD89v+tjNVXxvlMRfOpVmGay2H0uJyU4a7+kWW2s9uz8qj
 9Iqnh9rp5ZCTqDyl1oWma4sdMDiacN4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-643-6NCafCZJMAy1gQOh2ZjFlQ-1; Wed, 11 May 2022 05:35:04 -0400
X-MC-Unique: 6NCafCZJMAy1gQOh2ZjFlQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 00D4F185A794
 for <qemu-devel@nongnu.org>; Wed, 11 May 2022 09:35:04 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 58D817AF0;
 Wed, 11 May 2022 09:34:51 +0000 (UTC)
Date: Wed, 11 May 2022 10:34:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: David Hildenbrand <david@redhat.com>
Cc: Michal Privoznik <mprivozn@redhat.com>, qemu-devel@nongnu.org
Subject: Re: [PATCH] util: NUMA aware memory preallocation
Message-ID: <YnuDONrdbMcJT08p@redhat.com>
References: <ffdcd118d59b379ede2b64745144165a40f6a813.1652165704.git.mprivozn@redhat.com>
 <Ynt/v2SHmnO2afg4@redhat.com>
 <8a6b84ed-50bc-8f6e-4b71-7e15247c4ac0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <8a6b84ed-50bc-8f6e-4b71-7e15247c4ac0@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, May 11, 2022 at 11:31:23AM +0200, David Hildenbrand wrote:
> >> Long story short, management application has no way of learning
> >> TIDs of allocator threads so it can't make them run NUMA aware.
> > 
> > This feels like the key issue. The preallocation threads are
> > invisible to libvirt, regardless of whether we're doing coldplug
> > or hotplug of memory-backends. Indeed the threads are invisible
> > to all of QEMU, except the memory backend code.
> > 
> > Conceptually we need 1 or more explicit worker threads, that we
> > can assign CPU affinity to, and then QEMU can place jobs on them.
> > I/O threads serve this role, but limited to blockdev work. We
> > need a generalization of I/O threads, for arbitrary jobs that
> > QEMU might want to farm out to specific numa nodes.
> 
> At least the "-object iothread" thingy can already be used for actions
> outside of blockdev. virtio-balloon uses one for free page hinting.

Ah that's good to know, so my idea probably isn't so much work as
I thought it might be.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


