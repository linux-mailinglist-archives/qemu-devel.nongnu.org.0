Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BCE5793F0
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 09:15:06 +0200 (CEST)
Received: from localhost ([::1]:48186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDhRh-0004UC-Nn
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 03:15:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42122)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHT-0002OA-Lo
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oDhHQ-0002zb-Tl
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 03:04:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658214268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2skFCuoZNOni/2rLGH446C6EEkBER13cEUuT3/7jpps=;
 b=f74oBP432zMaO4ebzcZ4b1wmPyB+4R4plKaduU+lVt7skVeU6mj/1rps0tH1HbEU0Kmzui
 SF6jRmCZEMO22C3myEtc18S2BT00GnFp4eWYqxEl/8VLs93PqpjLnm6gkZ69DovCJWTc5C
 s1MKmoRDut1gkr3hyzPasavsC1l1DW8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-550-TW9y30DkOPK_U1no9kapHg-1; Tue, 19 Jul 2022 03:04:24 -0400
X-MC-Unique: TW9y30DkOPK_U1no9kapHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id AED281C04B4D;
 Tue, 19 Jul 2022 07:04:23 +0000 (UTC)
Received: from thuth.com (dhcp-192-183.str.redhat.com [10.33.192.183])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D595940CFD0A;
 Tue, 19 Jul 2022 07:04:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Song Gao <gaosong@loongson.cn>
Subject: [PULL 10/14] qtest/machine-none: Add LoongArch support
Date: Tue, 19 Jul 2022 09:04:08 +0200
Message-Id: <20220719070412.16757-11-thuth@redhat.com>
In-Reply-To: <20220719070412.16757-1-thuth@redhat.com>
References: <20220719070412.16757-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Song Gao <gaosong@loongson.cn>

Update the cpu_maps[] to support the LoongArch target.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220713020258.601424-1-gaosong@loongson.cn>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/qtest/machine-none-test.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/machine-none-test.c b/tests/qtest/machine-none-test.c
index d0f8cd9902..f92fab479f 100644
--- a/tests/qtest/machine-none-test.c
+++ b/tests/qtest/machine-none-test.c
@@ -54,6 +54,7 @@ static struct arch2cpu cpus_map[] = {
     { "riscv64", "rv64" },
     { "riscv32", "rv32" },
     { "rx", "rx62n" },
+    { "loongarch64", "la464"},
 };
 
 static const char *get_cpu_model_by_arch(const char *arch)
-- 
2.31.1


