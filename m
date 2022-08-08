Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D72C58C2B6
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 07:10:33 +0200 (CEST)
Received: from localhost ([::1]:55354 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKv28-0002Am-90
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 01:10:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKuxJ-0003gc-VD
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:05:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKuxE-0001Lj-My
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:05:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659935128;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mwfbe2I5gLgUm6skWeR9CbsotMHUiuAl3iYC3+xLuA8=;
 b=b0tEzhK2iBjtoBTeGTYUfsa29Qs1KGF4xoZDhMOOzlP7DWhDdEqrMysf1+wCAEm3CJJ8CC
 8Wshrxh/TDEpMyXIux1qE978ZZYXCuSQXK61U7VI3e4dJHwUqNyZwQXc58beSMx9X07lkE
 qEsdW8iMAovoeYv9vHDJl6DO6F67SLQ=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-411-CSQCO3VRNKq80M4so5jEYQ-1; Mon, 08 Aug 2022 01:05:21 -0400
X-MC-Unique: CSQCO3VRNKq80M4so5jEYQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 509D985A58B;
 Mon,  8 Aug 2022 05:05:21 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 47B15492C3B;
 Mon,  8 Aug 2022 05:05:20 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: [PULL 2/4] pc-bios/s390-ccw: Update the s390-ccw.img with the block
 size fix
Date: Mon,  8 Aug 2022 07:05:13 +0200
Message-Id: <20220808050515.1283174-3-thuth@redhat.com>
In-Reply-To: <20220808050515.1283174-1-thuth@redhat.com>
References: <20220808050515.1283174-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

The new binary now gets the block size of virtio-blk devices right.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 pc-bios/s390-ccw.img | Bin 42608 -> 42608 bytes
 1 file changed, 0 insertions(+), 0 deletions(-)

diff --git a/pc-bios/s390-ccw.img b/pc-bios/s390-ccw.img
index 39f9680a0ef1c57f8a0bac9e12ff77ce15150d37..554fcbd1b7af8ea5f8f0d887fba98d52b7a8611d 100644
GIT binary patch
delta 4206
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

delta 4218
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

-- 
2.31.1


