Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C493C2701
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 17:42:10 +0200 (CEST)
Received: from localhost ([::1]:59790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1sdl-0007AE-Kq
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 11:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1sbf-0004TY-Ct
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:39:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59734)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1m1sbc-0003Qg-E8
 for qemu-devel@nongnu.org; Fri, 09 Jul 2021 11:39:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625845194;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=441fFd3g7m2p+XOBVv/de+1tKHQaxTtjlmIfKVaE63U=;
 b=D8QW3jvTIAyXKtPlNoAVtxRa+QZYsXZQMI+0jYWM7cvH28TbMqmVyTe8xGl/RT82HF/R5e
 hjKV0V8FcnGBV/WAZU7i91eUbvSAqb1ERw2cRGu8N3mcy4g3Plu/A7S5hJ1Xu5qTf+ujVA
 nyb7DrLt9zbjzyC8FF+CBIyxAnDoKgE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-5oEe-IuvOwuqIbf7MLBTaQ-1; Fri, 09 Jul 2021 11:39:53 -0400
X-MC-Unique: 5oEe-IuvOwuqIbf7MLBTaQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 46D1F362FA;
 Fri,  9 Jul 2021 15:39:52 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CE21760C04;
 Fri,  9 Jul 2021 15:39:51 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/3] Let 'qemu-img convert --bitmaps' skip inconsistent
 bitmaps
Date: Fri,  9 Jul 2021 10:39:48 -0500
Message-Id: <20210709153951.2801666-1-eblake@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: kwolf@redhat.com, nsoffer@redhat.com, vsementsov@virtuozzo.com,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In v2:
- patch 1: clean up leftover file [Vladimir]
- patch 2: new, to fix badness with leaving corrupt destination on
  failed bitmap copy [Vladimir]
- patch 3: spell new option --skip-broken-bitmaps (note that --skip-broken
  as an abbreviation still works) [Vladimir]

Eric Blake (3):
  iotests: Improve and rename test 291 to qemu-img-bitmap
  qemu-img: Fail fast on convert --bitmaps with inconsistent bitmap
  qemu-img: Add --skip-broken-bitmaps for 'convert --bitmaps'

 docs/tools/qemu-img.rst                       |  8 ++-
 block/dirty-bitmap.c                          |  2 +-
 qemu-img.c                                    | 50 +++++++++++++--
 .../{291 => tests/qemu-img-bitmaps}           | 27 +++++++-
 .../{291.out => tests/qemu-img-bitmaps.out}   | 63 ++++++++++++++++++-
 5 files changed, 141 insertions(+), 9 deletions(-)
 rename tests/qemu-iotests/{291 => tests/qemu-img-bitmaps} (82%)
 rename tests/qemu-iotests/{291.out => tests/qemu-img-bitmaps.out} (69%)

-- 
2.31.1


