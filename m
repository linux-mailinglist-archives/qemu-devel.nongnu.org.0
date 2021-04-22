Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 233C4368559
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Apr 2021 18:58:08 +0200 (CEST)
Received: from localhost ([::1]:58524 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZceV-00075z-7o
	for lists+qemu-devel@lfdr.de; Thu, 22 Apr 2021 12:58:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZcR0-0003UH-J6
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:44:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28241)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1lZcQu-0001PF-L4
 for qemu-devel@nongnu.org; Thu, 22 Apr 2021 12:44:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619109840;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=53K0Gqb/34thLug4EhhNbQzboqD6QJuKrGBFya0Xebw=;
 b=i2x8D/DCm5ynN5VG0V8oDuKVEVIGo9SYu1szyvE/LHJ5VK9BsdnZkhJbuBJKYvxeN96Kv/
 1vJtMTVf2ueVCg9X02RF0ZcH+qoIhYXRlrKyyuCRl1OiYt6oXYL+QZUZ6qcAO4bOcrEg/E
 /9TDSCk2BfbHtgL97CFGDhxDaxdlZvc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-286-R67ZT5jxMY6vyjF1L2NDlg-1; Thu, 22 Apr 2021 12:43:56 -0400
X-MC-Unique: R67ZT5jxMY6vyjF1L2NDlg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB0398C5A23;
 Thu, 22 Apr 2021 16:43:51 +0000 (UTC)
Received: from merkur.fritz.box (ovpn-112-159.ams2.redhat.com [10.36.112.159])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BFF7E5C27C;
 Thu, 22 Apr 2021 16:43:47 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 0/2] qemu-img convert: Unshare write permission for source
Date: Thu, 22 Apr 2021 18:43:42 +0200
Message-Id: <20210422164344.283389-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: kwolf@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

v2:
- Still share BLK_PERM_CONSISTENT_READ. It doesn't hurt users that don't
  want their image modified in parallel and it fixes some use cases
  covered by iotests.

Kevin Wolf (2):
  block: Add BDRV_O_NO_SHARE for blk_new_open()
  qemu-img convert: Unshare write permission for source

 include/block/block.h |  1 +
 block/block-backend.c | 19 +++++++++++++------
 qemu-img.c            |  2 +-
 3 files changed, 15 insertions(+), 7 deletions(-)

-- 
2.30.2


