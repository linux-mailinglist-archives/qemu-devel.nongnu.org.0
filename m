Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3942F521DFC
	for <lists+qemu-devel@lfdr.de>; Tue, 10 May 2022 17:18:39 +0200 (CEST)
Received: from localhost ([::1]:47276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1noRdG-0000Tv-CS
	for lists+qemu-devel@lfdr.de; Tue, 10 May 2022 11:18:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1noRW6-0000AK-Bx
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:11:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47476)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1noRW4-0002qW-HA
 for qemu-devel@nongnu.org; Tue, 10 May 2022 11:11:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652195471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=RgJKBivgXU78NbgRre35x+pClWK3mmZJsZodFdwh1mI=;
 b=EbsI3Ix0q2ci/hPHHgq37SdESwIUQZZR/vrnK93n9ccEi+OHUIvkV/ntNcTpAQlFZVHxIf
 GzjxS76EpAo+Hp4zrcUDkWj3Ngusmd48/96lBhu+3wMA1+VKXB+sippSSgtH0TTJXiV+nM
 9h7zX2BAphaivVgzyMoUMh8PpkbW2oc=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-669-jcMaOxQOODKqoVHAvty5qw-1; Tue, 10 May 2022 11:11:05 -0400
X-MC-Unique: jcMaOxQOODKqoVHAvty5qw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 545CE10B9595;
 Tue, 10 May 2022 15:10:58 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.149])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BBC1A9E84;
 Tue, 10 May 2022 15:10:38 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, stefanha@redhat.com, hnarukaw@yahoo-corp.jp,
 qemu-devel@nongnu.org, qemu-stable@nongnu.org
Subject: [PATCH 0/2] coroutine: Fix crashes due to too large pool batch size
Date: Tue, 10 May 2022 17:10:18 +0200
Message-Id: <20220510151020.105528-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Kevin Wolf (2):
  coroutine: Rename qemu_coroutine_inc/dec_pool_size()
  coroutine: Revert to constant batch size

 include/qemu/coroutine.h |  6 +++---
 hw/block/virtio-blk.c    |  6 ++----
 util/qemu-coroutine.c    | 26 ++++++++++++++++----------
 3 files changed, 21 insertions(+), 17 deletions(-)

-- 
2.35.3


