Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F64426A3AE
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 12:54:12 +0200 (CEST)
Received: from localhost ([::1]:33044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kI8bD-0002JO-55
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 06:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kI8Uc-00012J-2q
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 06:47:22 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34612
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1kI8Ua-0004f0-Cf
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 06:47:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600166839;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q1d7aSDUJFfCbXjMlR1mUnXgVGpiraArPRPgnZfoQOs=;
 b=M/hudjAvTO+kIr5xpCI1U2VJzC+ECF9v8M3tCYnjjVQVGEGQYIDCWne06K4ls+3b0NOn1H
 xOuawIdJazhvGbwSkj9moW3uitconyTYlW6x39VDzAiBNkiFW9OiEaqVrXGHTJoIQP7WT3
 7MYAu24868QSYAqSEF0hfiG48F1L0Oc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-Oa0EyMkQMDOyn8s19hz2tg-1; Tue, 15 Sep 2020 06:47:13 -0400
X-MC-Unique: Oa0EyMkQMDOyn8s19hz2tg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F042F801AC2;
 Tue, 15 Sep 2020 10:47:11 +0000 (UTC)
Received: from localhost (ovpn-113-7.ams2.redhat.com [10.36.113.7])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 923D02C31E;
 Tue, 15 Sep 2020 10:47:11 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 19/22] block/qcow: remove runtime opts
Date: Tue, 15 Sep 2020 12:46:24 +0200
Message-Id: <20200915104627.699552-20-mreitz@redhat.com>
In-Reply-To: <20200915104627.699552-1-mreitz@redhat.com>
References: <20200915104627.699552-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/15 03:21:13
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.792,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: John Snow <jsnow@redhat.com>

Introduced by d85f4222b468,
These were seemingly never used at all.

Signed-off-by: John Snow <jsnow@redhat.com>
Message-Id: <20200806211345.2925343-3-jsnow@redhat.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/qcow.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/block/qcow.c b/block/qcow.c
index e514a86fe5..f8919a44d1 100644
--- a/block/qcow.c
+++ b/block/qcow.c
@@ -105,15 +105,6 @@ static int qcow_probe(const uint8_t *buf, int buf_size, const char *filename)
         return 0;
 }
 
-static QemuOptsList qcow_runtime_opts = {
-    .name = "qcow",
-    .head = QTAILQ_HEAD_INITIALIZER(qcow_runtime_opts.head),
-    .desc = {
-        BLOCK_CRYPTO_OPT_DEF_QCOW_KEY_SECRET("encrypt."),
-        { /* end of list */ }
-    },
-};
-
 static int qcow_open(BlockDriverState *bs, QDict *options, int flags,
                      Error **errp)
 {
-- 
2.26.2


