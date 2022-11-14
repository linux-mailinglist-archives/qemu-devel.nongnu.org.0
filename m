Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B0E0628D52
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:21:13 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouiel-0004ZI-62; Mon, 14 Nov 2022 18:14:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidv-0001m0-EB
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiEI-0002Ba-TX
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:47:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466022;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSqAM4H/ZNj5Bd+6Dq49sMrpN7AEd4zkNtiLC0O8wQE=;
 b=Opht5we37c5X96yN4CkgGA5DJpKFPZeRzDohXU75tGtfvS34dCJWRcWOrRx4ii3uZwsEpE
 IA5a31fvNWLw1FoEHbnfhUYXbftkmEiBl3IBfwi/vM+DRNnDyj8hPT2YrdFWLNFh21D1mE
 spl3zr09wN1uFzBXt4X+iHHcW5OxHFw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-110-FBTKseLZNtKTycP_74kR4w-1; Mon, 14 Nov 2022 17:46:59 -0500
X-MC-Unique: FBTKseLZNtKTycP_74kR4w-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id C516685A5A6;
 Mon, 14 Nov 2022 22:46:58 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 52B1C2024CC0;
 Mon, 14 Nov 2022 22:46:58 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: nbd@other.debian.org
Cc: qemu-devel@nongnu.org,
	qemu-block@nongnu.org,
	libguestfs@redhat.com
Subject: [PATCH v2 0/6] NBD spec changes for 64-bit extensions
Date: Mon, 14 Nov 2022 16:46:49 -0600
Message-Id: <20221114224655.2186173-1-eblake@redhat.com>
In-Reply-To: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

This is the NBD spec series; there are matching qemu and libnbd
patches that implement the changes in this series.  I'm happy to drop
the RFC patches from all three, but wanted the conversation on whether
it makes sense to have 64-bit holes during NBD_CMD_READ first (it
would make more sense if we had a way for a client and server to agree
on a single-transaction buffer limit much larger than 32M).

Eric Blake (6):
  spec: Recommend cap on NBD_REPLY_TYPE_BLOCK_STATUS length
  spec: Tweak description of maximum block size
  spec: Add NBD_OPT_EXTENDED_HEADERS
  spec: Allow 64-bit block status results
  spec: Introduce NBD_FLAG_BLOCK_STATUS_PAYLOAD
  RFC: spec: Introduce NBD_REPLY_TYPE_OFFSET_HOLE_EXT

 doc/proto.md | 698 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 521 insertions(+), 177 deletions(-)

-- 
2.38.1


