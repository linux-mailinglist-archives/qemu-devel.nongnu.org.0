Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7BA4628D62
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Nov 2022 00:25:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ouieD-0002jr-Dp; Mon, 14 Nov 2022 18:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouidt-0001eb-7r
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 18:13:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1ouiG8-0002LC-1z
 for qemu-devel@nongnu.org; Mon, 14 Nov 2022 17:48:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668466135;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XRP8SoUQK2UbFrLAVubx17NxzDIvuhaHb/czom7cG6I=;
 b=J35HLLCgoh3+8inij35H/Fhw9mUn98AygQ7YRdUEg6TnCxRzzK6xw0gQPY8JNpB4/asIHw
 pLK6Bnw/qmVcv1LC8Xd6O0zJ8fmMlIkf0vc+tp9HQikqpMw90r17oWJjZXawjDMj5aAwA2
 E3mcOky659tuFqbv5n1kQ7zaGfGX/S8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-c4HjLoCZOEmVs2jUUNRfvQ-1; Mon, 14 Nov 2022 17:48:52 -0500
X-MC-Unique: c4HjLoCZOEmVs2jUUNRfvQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 187FB87B2A1;
 Mon, 14 Nov 2022 22:48:51 +0000 (UTC)
Received: from green.redhat.com (unknown [10.2.16.240])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A524340B48EA;
 Mon, 14 Nov 2022 22:48:50 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org,
	libguestfs@redhat.com,
	nbd@other.debian.org
Subject: [PATCH v2 00/15] qemu patches for 64-bit NBD extensions
Date: Mon, 14 Nov 2022 16:48:33 -0600
Message-Id: <20221114224848.2186298-1-eblake@redhat.com>
In-Reply-To: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
References: <20221114224141.cm5jgyxfmvie5xb5@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
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

This series implements the spec changes in a counterpart NBD series,
and has been tested to be interoperable with libnbd implementing the
same spec.  I'm not too happy with the RFC patch at the end, but
implemented it for discussion.  Given the release timing, this would
be qemu 8.0 material if we are happy with the direction the spec is
headed in.

Eric Blake (15):
  nbd/client: Add safety check on chunk payload length
  nbd/server: Prepare for alternate-size headers
  nbd: Prepare for 64-bit request effect lengths
  nbd: Add types for extended headers
  nbd/server: Refactor handling of request payload
  nbd/server: Refactor to pass full request around
  nbd/server: Initial support for extended headers
  nbd/server: Support 64-bit block status
  nbd/client: Initial support for extended headers
  nbd/client: Accept 64-bit block status chunks
  nbd/client: Request extended headers during negotiation
  nbd/server: Prepare for per-request filtering of BLOCK_STATUS
  nbd/server: Add FLAG_PAYLOAD support to CMD_BLOCK_STATUS
  RFC: nbd/client: Accept 64-bit hole chunks
  RFC: nbd/server: Send 64-bit hole chunk

 docs/interop/nbd.txt                          |   1 +
 include/block/nbd.h                           | 163 +++--
 nbd/nbd-internal.h                            |   8 +-
 block/nbd.c                                   | 102 ++-
 nbd/client-connection.c                       |   1 +
 nbd/client.c                                  | 132 +++-
 nbd/common.c                                  |  14 +-
 nbd/server.c                                  | 636 +++++++++++++-----
 qemu-nbd.c                                    |   3 +
 block/trace-events                            |   1 +
 nbd/trace-events                              |  11 +-
 tests/qemu-iotests/223.out                    |  18 +-
 tests/qemu-iotests/233.out                    |   5 +
 tests/qemu-iotests/241.out                    |   3 +
 tests/qemu-iotests/307.out                    |  15 +-
 .../tests/nbd-qemu-allocation.out             |   3 +-
 16 files changed, 797 insertions(+), 319 deletions(-)

-- 
2.38.1


