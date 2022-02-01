Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D3C4A60A7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 16:49:36 +0100 (CET)
Received: from localhost ([::1]:53054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEvPT-0007WC-Fb
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 10:49:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37148)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRM-0002jI-Ic
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40067)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1nEuRK-00034M-LF
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 09:47:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643726650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mEZubA4ulbjlRJDiuwJYLdFsxmg+fwni0GGh0RbT14g=;
 b=ZDdT291xBTHGapWPjQZvJtAv7WSS37I8iJwwVQyTDEY23RLweK6V0KXMFOdOPUZNhEwJ5n
 txZPzPW4BdPG0kHOPxYzkpnDlnF7ZCn/SDfPAtcAYzb2aA/qiQAW7FLtZk48vmvSNtgZ3F
 tUpukoihuQu3UfMs2ACKUF0vXV808ZQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-zLZZ77HOMEKGHJXIKptlyQ-1; Tue, 01 Feb 2022 09:44:02 -0500
X-MC-Unique: zLZZ77HOMEKGHJXIKptlyQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id AE8788144E0;
 Tue,  1 Feb 2022 14:44:01 +0000 (UTC)
Received: from localhost (unknown [10.39.193.129])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 567C0752D6;
 Tue,  1 Feb 2022 14:44:01 +0000 (UTC)
From: Hanna Reitz <hreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 20/24] iotest 214: explicit compression type
Date: Tue,  1 Feb 2022 15:42:29 +0100
Message-Id: <20220201144233.617021-21-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
References: <20220201144233.617021-1-hreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

The test-case "Corrupted size field in compressed cluster descriptor"
heavily depends on zlib compression type. So, make it explicit. This
way test passes with IMGOPTS='compression_type=zstd'.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20211223160144.1097696-19-vsementsov@virtuozzo.com>
Signed-off-by: Hanna Reitz <hreitz@redhat.com>
---
 tests/qemu-iotests/214 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qemu-iotests/214 b/tests/qemu-iotests/214
index 0889089d81..c66e246ba2 100755
--- a/tests/qemu-iotests/214
+++ b/tests/qemu-iotests/214
@@ -51,7 +51,7 @@ echo
 # The L2 entries of the two compressed clusters are located at
 # 0x800000 and 0x800008, their original values are 0x4008000000a00000
 # and 0x4008000000a00802 (5 sectors for compressed data each).
-_make_test_img 8M -o cluster_size=2M
+_make_test_img 8M -o cluster_size=2M,compression_type=zlib
 $QEMU_IO -c "write -c -P 0x11 0 2M" -c "write -c -P 0x11 2M 2M" "$TEST_IMG" \
          2>&1 | _filter_qemu_io | _filter_testdir
 
-- 
2.34.1


