Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E3D625919
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:09:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otRu3-0003J2-41; Fri, 11 Nov 2022 06:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otRty-0003IZ-FQ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:08:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otRtw-0006TP-Gr
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:08:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668164921;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=00NeJOjCGNjHTm3dxLS2lrs5R9blDdYuGal63PE7Ckk=;
 b=Kvog028NP7f+XNJ4KU1zTUJ0BCqcSMEN91PUgix8ABKAC+MAQQaxXUnK8e9DJlClTU3FVu
 yskqO1DXTYnLbB5zdmpfc9AYOOSCZCOLj3+mpYgC6uwk9i97mU1Yh581W5DqSC5lcEEXwV
 xHnnK6dAewVsEyxJrB6QjHC4+dofBrk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-LN0pBn4pOsaD4tJsXR7-nQ-1; Fri, 11 Nov 2022 06:08:40 -0500
X-MC-Unique: LN0pBn4pOsaD4tJsXR7-nQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DF3F73C0F446;
 Fri, 11 Nov 2022 11:08:39 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06D0F202322E;
 Fri, 11 Nov 2022 11:08:38 +0000 (UTC)
Date: Fri, 11 Nov 2022 12:08:36 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 nsoffer@redhat.com, qemu-block@nongnu.org
Subject: Re: [PATCH v2 1/2] file-posix: fix Linux alignment probing when EIO
 is returned
Message-ID: <Y24tNEQWKXVJ2Fls@redhat.com>
References: <20221103183609.363027-1-stefanha@redhat.com>
 <20221103183609.363027-2-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103183609.363027-2-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 03.11.2022 um 19:36 hat Stefan Hajnoczi geschrieben:
> Linux v6.0 dm-crypt returns errno EIO from unaligned O_DIRECT pread(2)
> calls. Alignment probing fails on dm-crypt devices because the code
> expects EINVAL. This is a kernel regression that is expected to be fixed
> upstream:
> https://lore.kernel.org/linux-block/20221103193837.3b5b4bac@xps.demsh.org/T/#t
> 
> Treating any errno as an "unaligned" indicator would be easy, but breaks
> commit 22d182e82b4b ("block/raw-posix: fix launching with failed
> disks"). Offline disks return EIO for correctly aligned requests and
> EINVAL for unaligned requests.
> 
> It's possible to make both v6.0 dm-crypt and offline disks work: look
> for the transition from EINVAL to EIO instead of for a single EINVAL
> value.
> 
> Buglink: https://gitlab.com/qemu-project/qemu/-/issues/1290
> Fixes: 22d182e82b4b ("block/raw-posix: fix launching with failed disks")
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

I haven't tested it myself, but from the comments in the bug tracker and
on the mailing this, I don't think this can actually distinguish the two
cases: AIUI, even with the buggy dm-crypt, you get a transition from
EINVAL to EIO because everything < 512 (such as our first probed value
1) will still return EINVAL.

So even with this patch, I think we would still probe the incorrect
512 bytes when the dm-crypt bug is present.

Kevin


