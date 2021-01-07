Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E79952ECDC9
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 11:28:54 +0100 (CET)
Received: from localhost ([::1]:35226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxSXG-0001oB-0j
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 05:28:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kxSR6-0003ND-4T
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:22:32 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29148)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlevitsk@redhat.com>)
 id 1kxSR2-0006Gb-4W
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 05:22:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610014946;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P3hiWEjtVY0rHs3us59vCQVAF20c1f1fiNcqs/4nmNw=;
 b=G7GBnECIcq++KZa/JnxeAA2daVG7eQZ8bn2jSWi3+6x+AhvdngfFqgBztQuthsaKd5g6wG
 +gtduzgV/fl8T0VJr9A0ZO4a4EcUz/vcztT9fZMgumTv6f/7RhQAW2Fdg9Qr3NkP01LXTp
 uPBawINvKMZua3lw0oLhKKR8t1qRt20=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-385-6BxzhtoNNGG7Ok-wfAc-Ag-1; Thu, 07 Jan 2021 05:22:24 -0500
X-MC-Unique: 6BxzhtoNNGG7Ok-wfAc-Ag-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 22013612AC;
 Thu,  7 Jan 2021 10:22:23 +0000 (UTC)
Received: from starship (unknown [10.35.206.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D99719714;
 Thu,  7 Jan 2021 10:22:21 +0000 (UTC)
Message-ID: <5109467a62d0a629d71d386ebab6c754da14836c.camel@redhat.com>
Subject: Re: [PATCH v6 0/3] qcow2: don't leave partially initialized file on
 image creation
From: Maxim Levitsky <mlevitsk@redhat.com>
To: qemu-devel@nongnu.org
Date: Thu, 07 Jan 2021 12:22:20 +0200
In-Reply-To: <20201217170904.946013-1-mlevitsk@redhat.com>
References: <20201217170904.946013-1-mlevitsk@redhat.com>
User-Agent: Evolution 3.36.5 (3.36.5-1.fc32)
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlevitsk@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlevitsk@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Alberto Garcia <berto@igalia.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2020-12-17 at 19:09 +0200, Maxim Levitsky wrote:
> Use the bdrv_co_delete_file interface to delete the underlying
> file if qcow2 initialization fails (e.g due to bad encryption secret)
> 
> This makes the qcow2 driver behave the same way as the luks driver behaves.
> 
> Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=1845353
> 
> V3: addressed review feedback and reworked commit messages
> 
> V4: got rid of code duplication by adding bdrv_co_delete_file_noerr
> and made the qcow2 driver use this function to delete
> both the main and the data file.
> 
> V5: addresssed review feedback on reworked version.
> 
> V6: addressed most of the review feedback.
> 
> Best regards,
> 	Maxim Levitsky
> 
> Maxim Levitsky (3):
>   crypto: luks: Fix tiny memory leak
>   block: add bdrv_co_delete_file_noerr
>   block: qcow2: remove the created file on initialization error
> 
>  block.c               | 22 ++++++++++++++++++++++
>  block/crypto.c        | 13 ++-----------
>  block/qcow2.c         |  8 +++++---
>  include/block/block.h |  1 +
>  4 files changed, 30 insertions(+), 14 deletions(-)
> 
> -- 
> 2.26.2
> 
> 
> 
Any update on this?

Best regards,
	Maxim Levitsky


