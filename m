Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 765EC23E8BF
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Aug 2020 10:18:54 +0200 (CEST)
Received: from localhost ([::1]:40186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3xaX-0003BK-In
	for lists+qemu-devel@lfdr.de; Fri, 07 Aug 2020 04:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k3xWq-00074C-T2
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 04:15:04 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:41036
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1k3xWp-0002A8-4R
 for qemu-devel@nongnu.org; Fri, 07 Aug 2020 04:15:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596788102;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OmFvsq0k8m9ftuRQyGVdIFT/RmOC1l/lzFLRfLKnJ/c=;
 b=UxtjvYtfEsfG3yLfrWZCwiNjDGj2Jf4rTaoRobSEcRx5DWEBoM2uLyiqgGjkLGgfhhKdZj
 OdJSNnHp5twgUQ1GaOst7X0i7cwl4Ly/rzVhKb1WQukBMW8ow7YloPHcyV/lybEoq0n5V6
 xz/HOQDqc1Zl4CE6k7IptOpzL7xBvlw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-407-xYSwH10OPpiw5KcjMBmBcA-1; Fri, 07 Aug 2020 04:13:40 -0400
X-MC-Unique: xYSwH10OPpiw5KcjMBmBcA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D293B79EC0;
 Fri,  7 Aug 2020 08:13:38 +0000 (UTC)
Received: from linux.fritz.box (ovpn-112-58.ams2.redhat.com [10.36.112.58])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8B7C55C1D2;
 Fri,  7 Aug 2020 08:13:37 +0000 (UTC)
Date: Fri, 7 Aug 2020 10:13:35 +0200
From: Kevin Wolf <kwolf@redhat.com>
To: Ying Fang <fangying1@huawei.com>
Subject: Re: [PATCH] qcow2: flush qcow2 l2 meta for new allocated clusters
Message-ID: <20200807081335.GA4812@linux.fritz.box>
References: <20200805023826.184-1-fangying1@huawei.com>
 <20200806091326.GC17753@linux.fritz.box>
 <1c2447af-1265-c45c-6374-f20d482f51be@huawei.com>
MIME-Version: 1.0
In-Reply-To: <1c2447af-1265-c45c-6374-f20d482f51be@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.120; envelope-from=kwolf@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/07 02:21:37
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: alex.chen@huawei.com, zhang.zhanghailiang@huawei.com, qemu-devel@nongnu.org,
 qemu-block@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 07.08.2020 um 09:42 hat Ying Fang geschrieben:
> 
> 
> On 8/6/2020 5:13 PM, Kevin Wolf wrote:
> > Am 05.08.2020 um 04:38 hat Ying Fang geschrieben:
> > > From: fangying <fangying1@huawei.com>
> > > 
> > > When qemu or qemu-nbd process uses a qcow2 image and configured with
> > > 'cache = none', it will write to the qcow2 image with a cache to cache
> > > L2 tables, however the process will not use L2 tables without explicitly
> > > calling the flush command or closing the mirror flash into the disk.
> > > Which may cause the disk data inconsistent with the written data for
> > > a long time. If an abnormal process exit occurs here, the issued written
> > > data will be lost.
> > > 
> > > Therefore, in order to keep data consistency we need to flush the changes
> > > to the L2 entry to the disk in time for the newly allocated cluster.
> > > 
> > > Signed-off-by: Ying Fang <fangying1@huawei.com>
> > 
> > If you want to have data safely written to the disk after each write
> > request, you need to use cache=writethrough/directsync (in other words,
> > aliases that are equivalent to setting -device ...,write-cache=off).
> > Note that this will have a major impact on write performance.
> > 
> > cache=none means bypassing the kernel page cache (O_DIRECT), but not
> > flushing after each write request.
> 
> Well, IIUC, cache=none does not guarantee data safety and we should not
> expect that. Then this patch can be ignored.

Indeed, cache=none is a writeback cache mode with all of the
consequences. In practice, this is normally good enough because the
guest OS will send flush requests when needed (e.g. because a guest
application called fsync()), but if the guest doesn't do this, it may
suffer data loss. This behaviour is comparable to a volatile disk cache
on real hard disks and is a good default, but sometimes you need a
writethrough cache mode at the cost of a performance penalty.

Kevin


