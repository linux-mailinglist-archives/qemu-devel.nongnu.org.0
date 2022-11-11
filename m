Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0673062593E
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 12:23:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otS7C-0004BT-Dq; Fri, 11 Nov 2022 06:22:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otS7A-00047r-FY
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:22:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1otS79-0003Wh-5e
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 06:22:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668165746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=++IdrazyBQ1Hi7oaXVVWdIuMKaS+G6P6G2ldRWu7Nvw=;
 b=eB81tW0q4EmAoZGcn8vSsfmsGcGj6WGYpPagGMyAPoX+Z9b1ufrloCcF12x3SmW+K3dwaI
 Gehv8dhtWAPUhcuHRwFQPSlLd6fSGJsjztncbWndCCcia9Hlr6we7poL1EDexg31kCb22L
 pAA5ocOiDkIh8+o5Q/PT0SEsgxSdVIw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-481-fegD-BKoNheqEsgwTv-d-w-1; Fri, 11 Nov 2022 06:22:23 -0500
X-MC-Unique: fegD-BKoNheqEsgwTv-d-w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 08A6D3804063;
 Fri, 11 Nov 2022 11:22:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.152])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0B51863A55;
 Fri, 11 Nov 2022 11:22:21 +0000 (UTC)
Date: Fri, 11 Nov 2022 12:22:20 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>
Cc: qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 nsoffer@redhat.com, qemu-block@nongnu.org,
 Eric Biggers <ebiggers@google.com>
Subject: Re: [PATCH v2 2/2] file-posix: add statx(STATX_DIOALIGN) support
Message-ID: <Y24wbBLXEPBs9H4e@redhat.com>
References: <20221103183609.363027-1-stefanha@redhat.com>
 <20221103183609.363027-3-stefanha@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221103183609.363027-3-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
> Linux v6.1 commit 825cf206ed51 ("statx: add direct I/O alignment
> information") added an interface to fetch O_DIRECT alignment values for
> block devices and file systems.
> 
> Prefer STATX_DIOALIGN to older interfaces and probing, but keep them as
> fallbacks in case STATX_DIOALIGN cannot provide the information.
> 
> Testing shows the status of STATX_DIOALIGN support in Linux 6.1-rc3
> appears to be:
> - btrfs: no
> - ext4: yes
> - XFS: yes
> - NVMe block devices: yes
> - dm-crypt: yes
> 
> Cc: Eric Biggers <ebiggers@google.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>

I think it's worth noting in the commit message that this essentially
disables patch 1 again on Linux 6.1 because it doesn't even use the code
any more that patch 1 modified to work around the dm-crypt bug.

This is only okay because we think that the final 6.1 release is going
to have the bug fixed, and it's also the first version to support
STATX_DIOALIGN, so you won't have both STATX_DIOALIGN and the bug in a
stable kernel.

Kevin


