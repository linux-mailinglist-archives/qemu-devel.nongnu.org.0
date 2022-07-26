Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 585BF5816AA
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:43:20 +0200 (CEST)
Received: from localhost ([::1]:43488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGMiM-0006up-S6
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55784)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1oGMcO-0002BA-Do
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:37:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:50096)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vgoyal@redhat.com>) id 1oGMcJ-0000Th-HQ
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:37:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658849822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SJndovZPy/JFJWEimOi4Y+YPrT7SwzS9+xq8fGGkeUQ=;
 b=HnxwY0LCQgmdBf+fiRrFnBNzXoEXxNhC7/WCeXl4OyyW9iTGhP2TY5OFqRBgVuSvGEjc2R
 YzPy2XMR4eeDN0/xedeickxbGsD17IIU9+IOBR7RONItBG8k7gLhvy07LwN00imFcqj8KO
 UhAnv3vDtqjDf4J1rezUkpQPKvaMWyM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-104-uZJ4vTMlMcm_vGPxQqHwGg-1; Tue, 26 Jul 2022 11:37:01 -0400
X-MC-Unique: uZJ4vTMlMcm_vGPxQqHwGg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 814D7805B9A;
 Tue, 26 Jul 2022 15:37:00 +0000 (UTC)
Received: from horse.redhat.com (unknown [10.18.25.21])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7198B2166B26;
 Tue, 26 Jul 2022 15:37:00 +0000 (UTC)
Received: by horse.redhat.com (Postfix, from userid 10451)
 id 50CCD22341E; Tue, 26 Jul 2022 11:37:00 -0400 (EDT)
Date: Tue, 26 Jul 2022 11:37:00 -0400
From: Vivek Goyal <vgoyal@redhat.com>
To: Hao Xu <hao.xu@linux.dev>
Cc: Stefan Hajnoczi <stefanha@gmail.com>,
 qemu-devel <qemu-devel@nongnu.org>, virtio-fs@redhat.com
Subject: Re: Question about performance comparison between virtio-fs and
 virtio-blk
Message-ID: <YuAKHEtZBXQmnbK8@redhat.com>
References: <4f2c71a4-609e-6880-04d0-2eb127c55023@linux.dev>
 <CAJSP0QUzd7GXK0XN7YBBfEqO6abQSZMdJzW8pEHnz-ZnGetUWA@mail.gmail.com>
 <Yt/pVXilvkiLgowx@redhat.com>
 <1d1f7854-209a-a985-e266-633ca14609da@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d1f7854-209a-a985-e266-633ca14609da@linux.dev>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=vgoyal@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Jul 26, 2022 at 10:41:23PM +0800, Hao Xu wrote:
> On 7/26/22 21:17, Vivek Goyal wrote:
> > On Tue, Jul 26, 2022 at 08:55:38AM -0400, Stefan Hajnoczi wrote:
> > > On Tue, 26 Jul 2022 at 08:24, Hao Xu <hao.xu@linux.dev> wrote:
> > > > I watched your presentation about virtiofs in 2020,
> > > > 
> > > > https://www.youtube.com/watch?v=EIVOzTsGMMI&t=232s
> > > > 
> > > > which is really helpful to me, but I have a question about the graph at
> > > > 3:53, could you give
> > > > 
> > > > me more info about the test, like what tool you use for the test, if
> > > > it's fio, what is the parameters.
> > > > 
> > > > I used fio to do randread test in a qemu box, but turns out the iops of
> > > > virtio-blk and virtio-fs are similar.
> > > 
> > 
> > Hi Hao,
> > 
> > My impression in general is that virtio-blk is much faster than virtiofs.
> 
> When testing virtio-blk, did you use the device directly or mount it and
> test against a file.

Frankly speaking, I don't recall any of the details right now. If do
remember that I ran some kernel compilation tests on virtio-blk and
that ofcourse needed mounting filesystem on virtio-blk.

> 
> > A simple macro test is do a kernel compilation and compare time taken
> > between the two.
> 
> Good idea, I just tested with single file.

single file using fio is good as micro benchmark which primarily
excercises the data operations. But kernel compilation is a good
macro benchmark sort of workload which stresses filesystem both for
data and metadata operations.

Thanks
Vivek

> 
> Thanks,
> Hao
> 
> > 
> > > I have CCed Vivek Goyal, who has done more virtiofs benchmarking and
> > > might have ideas to share.
> > > 
> > > The benchmarking tool was fio with the stated blocksize and I/O
> > > pattern. The benchmark was probably run with direct=1. Based on the
> > > virtio-blk numbers I think iodepth was greater than 1 but I don't have
> > > the exact fio job parameters.
> > 
> > I had basically used fio jobs. I wrote some simple wrapper scripts to
> > run fio and parse and report numbers.
> > 
> > https://github.com/rhvgoyal/virtiofs-tests
> > 
> > I don't have data for virtio-blk but I do seem to have some comparison
> > numbers of virtiofs and virtio-9p.
> > 
> > https://github.com/rhvgoyal/virtiofs-tests/tree/master/performance-results/feb-23-2021
> > 
> > Thanks
> > Vivek
> > 
> > 
> 


