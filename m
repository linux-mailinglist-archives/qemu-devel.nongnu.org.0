Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 180CD316C43
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:14:56 +0100 (CET)
Received: from localhost ([::1]:60952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9t4p-0001Ha-6d
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:14:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l9sk5-0003QZ-HM
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:53:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pkrempa@redhat.com>)
 id 1l9sk4-00034P-1Q
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 11:53:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612976004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jq4lDtjtfdaIsAQ8d1e9EHeiq/64Cnbxk38+2t51+nA=;
 b=DA3wFXgdmer0KQmwWas5MlMRRS4mHRZtPJs5vkERvR62YwUs5uQX9/VMKplAvON43dkqEk
 LvQ7xkfblTLKplvThO+cSjbUuLIORkoGLzXDoilsP9UMWXbGcZGrF+cDFcHaepkivO/nYy
 hzm5k1KhtO53ImtnQkkRf45A30xTtSg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-bi2UKtx_NhCmznZyTjdtoQ-1; Wed, 10 Feb 2021 11:53:21 -0500
X-MC-Unique: bi2UKtx_NhCmznZyTjdtoQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E45E835E25;
 Wed, 10 Feb 2021 16:53:20 +0000 (UTC)
Received: from speedmetal.lan (unknown [10.40.208.53])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EBF9E19CBF;
 Wed, 10 Feb 2021 16:53:18 +0000 (UTC)
From: Peter Krempa <pkrempa@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] migration: dirty-bitmap: Allow control of bitmap
 persistence
Date: Wed, 10 Feb 2021 17:53:15 +0100
Message-Id: <cover.1612953419.git.pkrempa@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pkrempa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pkrempa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.568,
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

See 2/2 for explanation.

Peter Krempa (2):
  migration: dirty-bitmap: Convert alias map inner members to a struct
  migration: dirty-bitmap: Allow control of bitmap persistance

 migration/block-dirty-bitmap.c | 73 +++++++++++++++++++++++++++++-----
 qapi/migration.json            | 20 +++++++++-
 2 files changed, 81 insertions(+), 12 deletions(-)

-- 
2.29.2


