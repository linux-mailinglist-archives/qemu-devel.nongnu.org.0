Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1846531B79F
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:51:26 +0100 (CET)
Received: from localhost ([::1]:42906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbTR-0006Ed-6I
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:51:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBbS9-0005db-2L
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:50:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28130)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lBbS7-0000cE-Oi
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:50:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613386203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V+gZd4XVVP68KAGn4W3srPv4EQuvUeR1t8l+cKwvppM=;
 b=HBbEadkYR+tYe776Q/J1RiI2DFcu/ttDO9awvV3ZPMB9EADu82wYF8ER1v2q52PT9wPIo1
 o9I/lZOHDiucjnyAkWELiSJgZuPHIV/lDrCS84qiAMtXi2fv5J+vsfJmBnYe/KhMYfBYfW
 FAQXa4Xc2x8YqpqU3kH30IZMUIfc7gU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-326-XDxZElk8N-mynRrFGd_rvg-1; Mon, 15 Feb 2021 05:50:01 -0500
X-MC-Unique: XDxZElk8N-mynRrFGd_rvg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1D80D107ACE3;
 Mon, 15 Feb 2021 10:50:00 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-113-28.ams2.redhat.com [10.36.113.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3594C5F9B8;
 Mon, 15 Feb 2021 10:49:59 +0000 (UTC)
Date: Mon, 15 Feb 2021 11:49:57 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Alexander Bulekov <alxndr@bu.edu>
Subject: Re: [PATCH] hw/ide/ahci: map cmd_fis as DMA_DIRECTION_TO_DEVICE
Message-ID: <20210215104957.GF7226@merkur.fritz.box>
References: <20210119164051.89268-1-alxndr@bu.edu>
MIME-Version: 1.0
In-Reply-To: <20210119164051.89268-1-alxndr@bu.edu>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: qemu-devel@nongnu.org, "open list:IDE" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 19.01.2021 um 17:40 hat Alexander Bulekov geschrieben:
> cmd_fis is mapped as DMA_DIRECTION_FROM_DEVICE, however, it is read
> from, and not written to anywhere. Fix the DMA_DIRECTION and mark
> cmd_fis as read-only in the code.
> 
> Signed-off-by: Alexander Bulekov <alxndr@bu.edu>

Thanks, applied to the block branch.

Kevin


