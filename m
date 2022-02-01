Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E54D04A616E
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 17:32:54 +0100 (CET)
Received: from localhost ([::1]:41566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEw5O-0000Jn-2I
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 11:32:54 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRW-0002mz-KP
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:48 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26318)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRL-00033N-53
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:37 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726644;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4m1IWIM4vrFshxv3bARBPkRLI1EnZQyjA3vdEGy/SvQ=;
 b=KsNSlZORtwFwGCq4wzNzgx70K5hh7PvCvJec1vyvHrlJm6Ey8OF/zR5MUWaBhixHgRWnVM
 JarWLryvGRQLyHwR7QsG69fiMfB8GxnLuAlAIPhdFlUYacYu4xOTmpqejYCNZUFxfiTltb
 VvEOv8B7DetyqWygzSwm9uwMCwE8nSY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-466-Qi-yjtnnM8ac8FJufsVS5Q-1; Tue, 01 Feb 2022 09:44:01 -0500
X-MC-Unique: Qi-yjtnnM8ac8FJufsVS5Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8051D1091DA3;
 Tue,  1 Feb 2022 14:43:59 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 24D7E7DE43;
 Tue,  1 Feb 2022 14:43:58 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/24] iotests 60: more accurate set dirty bit in qcow2 header
Date: Tue,  1 Feb 2022 15:42:28 +0100
Message-Id: <20220201144233.617021-20-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.081,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Don't touch other incompatible bits, like compression-type. This makes
the test pass with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20211223160144.1097696-18-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/060 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/060 b/tests/qemu-iotests/060
index d1e3204d4e..df87d600f7 100755
--- a/tests/qemu-iotests/060
+++ b/tests/qemu-iotests/060
@@ -326,7 +326,7 @@ _make_test_img 64M
 # Let the refblock appear unaligned
 poke_file "$TEST_IMG" "$rt_offset"        "\x00\x00\x00\x00\xff\xff\x2a\x00"
 # Mark the image dirty, thus forcing an automatic check when opening it
-poke_file "$TEST_IMG" 72 "\x00\x00\x00\x00\x00\x00\x00\x01"
+$PYTHON qcow2.py "$TEST_IMG" set-feature-bit incompatible 0
 # Open the image (qemu should refuse to do so)
 $QEMU_IO -c close "$TEST_IMG" 2>&1 | _filter_testdir | _filter_imgfmt
 
-- 
2.34.1


