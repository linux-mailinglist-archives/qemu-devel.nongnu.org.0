Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D00D758C2B4
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Aug 2022 07:08:28 +0200 (CEST)
Received: from localhost ([::1]:51806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oKv07-00089p-V8
	for lists+qemu-devel@lfdr.de; Mon, 08 Aug 2022 01:08:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45224)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKuxW-00047E-Px
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:05:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oKuxV-0001Me-BN
 for qemu-devel@nongnu.org; Mon, 08 Aug 2022 01:05:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659935144;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KK8q6yFnKqoNZZsWA+N+R+/sEUtZIDcPe31pRheLg/U=;
 b=JC73ljiiHBcegVaArybI/QHOiLSY72WmKuAeYKNkX2fSZBxomSGSGZUYTqj/+ix9/rFyz5
 AnKjeW7jNN9eP4R6DuZPFLz5mxxcI4uXXeJ6KAOQXunlmBmL2m8dRSjYHR9zUcof0tJrJj
 K0wLDwDyKwhMjSndxGUoN+ikhAtGt14=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-6wehF78uO1af6bAnFiXsIQ-1; Mon, 08 Aug 2022 01:05:22 -0400
X-MC-Unique: 6wehF78uO1af6bAnFiXsIQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 8B9F9802D1C;
 Mon,  8 Aug 2022 05:05:22 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.55])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B3762492C3B;
 Mon,  8 Aug 2022 05:05:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Richard Henderson <richard.henderson@linaro.org>,
	qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>
Subject: [PULL 3/4] tests/avocado: fix replay-linux test
Date: Mon,  8 Aug 2022 07:05:14 +0200
Message-Id: <20220808050515.1283174-4-thuth@redhat.com>
In-Reply-To: <20220808050515.1283174-1-thuth@redhat.com>
References: <20220808050515.1283174-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

From: Pavel Dovgalyuk <pavel.dovgalyuk@ispras.ru>

Last line of the test is missing by accident.
This patch fixes the script.

Signed-off-by: Pavel Dovgalyuk <Pavel.Dovgalyuk@ispras.ru>
Message-Id: <165943656662.362178.2086588841425038338.stgit@pasha-ThinkPad-X280>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/avocado/replay_linux.py | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/avocado/replay_linux.py b/tests/avocado/replay_linux.py
index 40e4f6908e..e1f9981a34 100644
--- a/tests/avocado/replay_linux.py
+++ b/tests/avocado/replay_linux.py
@@ -189,3 +189,4 @@ def test_virt_gicv3(self):
 
         self.run_rr(shift=3,
                     args=(*self.get_common_args(),
+                          "-machine", "virt,gic-version=3"))
-- 
2.31.1


