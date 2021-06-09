Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3EF3A1C76
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 20:03:35 +0200 (CEST)
Received: from localhost ([::1]:49826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lr2YA-0000Vr-Fg
	for lists+qemu-devel@lfdr.de; Wed, 09 Jun 2021 14:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lr2WG-0006PV-Uh
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:01:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lr2WC-0005Oi-2t
 for qemu-devel@nongnu.org; Wed, 09 Jun 2021 14:01:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623261690;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LiYmwRIg5pa+pAuYMhA0llUc3lpj9PZYGWLltPyqTxw=;
 b=LjplpAKSSvZA5EoF2BFCOhQqPlcqNO1e0KU53o1EDr8Z/VqimgxuyOvQu66PJrl9V77QTQ
 rnkXsKzLpIOP8x6pRCvhp5lD8ziYcRBvEn2NNjB4DmLWDNepBXasxW8VTAPrt2rGZp3l5B
 /B8U7sIgKFcF59SmMZ+HC4TJ3iGbH94=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-559-3o0pis7KNoGMusayhTZ6Lg-1; Wed, 09 Jun 2021 14:01:29 -0400
X-MC-Unique: 3o0pis7KNoGMusayhTZ6Lg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 714268189DA;
 Wed,  9 Jun 2021 18:01:22 +0000 (UTC)
Received: from blue.redhat.com (ovpn-113-53.phx2.redhat.com [10.3.113.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F181C60CC9;
 Wed,  9 Jun 2021 18:01:18 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 0/2] New NBD metacontext
Date: Wed,  9 Jun 2021 13:01:16 -0500
Message-Id: <20210609180118.1003774-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: nsoffer@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 libguestfs@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is my counter-proposal to Nir's request [1] to revert a 6.0
behavior change.  It does not expose any new information over NBD, but
does make it easier to collect necessary information from a single
context rather than requiring the client to have to request two
contexts in parallel, then cross-correlate what may be different
extent lengths between those contexts.  Furthermore, this is easy to
backport to downstream based on qemu 6.0, at which point clients could
use the existence or absence of qemu:joint-allocation as a witness of
whether it can get away with trusting base:allocation when trying to
recreate a qcow2 backing chain.

[1] https://lists.gnu.org/archive/html/qemu-devel/2021-06/msg01796.html

Things I still want to do:
- a followup patch to libnbd to teach 'nbdinfo
  --map=qemu:joint-allocation' to decode the bits
- teach 'nbdinfo --map' to read all available contexts, instead of
  having to manually type each map besides base:allocation
- potential followup patches to qemu to automatically feed this
  information through qemu-img map:
  - add a new BDRV_BLOCK_BACKING bit for bdrv_block_status(), with
    opposite semantics from BDRV_BLOCK_ALLOCATED, but where the only
    thing known is that the data is not local (not how deep it is)
  - teach qemu to favor qemu:joint-allocation over base:allocation
    when available, and use it to drive BDRV_BLOCK_BACKING
  - teach qemu-img map to recognize BDRV_BLOCK_BACKING

Eric Blake (2):
  iotests: Improve and rename test 309 to nbd-qemu-allocation
  nbd: Add new qemu:joint-allocation metadata context

 docs/interop/nbd.txt                          | 31 ++++++-
 docs/tools/qemu-nbd.rst                       |  4 +-
 qapi/block-export.json                        |  4 +-
 include/block/nbd.h                           | 10 ++-
 nbd/server.c                                  | 87 +++++++++++++++++--
 .../{309 => tests/nbd-qemu-allocation}        |  5 +-
 .../nbd-qemu-allocation.out}                  | 13 ++-
 7 files changed, 139 insertions(+), 15 deletions(-)
 rename tests/qemu-iotests/{309 => tests/nbd-qemu-allocation} (95%)
 rename tests/qemu-iotests/{309.out => tests/nbd-qemu-allocation.out} (79%)

-- 
2.31.1


