Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D4E9566836
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 12:40:42 +0200 (CEST)
Received: from localhost ([::1]:46990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8fyz-0000Us-O8
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 06:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwq-0006AD-F5
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:31787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1o8fwm-0005xo-OW
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 06:38:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657017504;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Q47/gDucdErFtimYKzlAGPZbxP0HHvQBICzufgAqLaQ=;
 b=SRfhxxeJ7iXf02fuhXvGPfWrgvu2aoiD59PEUpFD0ilYlrlmXbuvtFhgXvYlIsP0adxXJX
 /Ge/njVDtevsnsA6ITrZ5xjNCJen3H0EJ1S90g4LYnGt292yXNdFk/qVEXtdM/SGOTn9tF
 5vv2CtB9xBkjKZW5FpeAVdmEeUcuoS4=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-jxLlV_4TPZ2HaYzy1BI7oA-1; Tue, 05 Jul 2022 06:38:22 -0400
X-MC-Unique: jxLlV_4TPZ2HaYzy1BI7oA-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 813173C025B7;
 Tue,  5 Jul 2022 10:38:22 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.133])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 62FFB492C3B;
 Tue,  5 Jul 2022 10:38:21 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PULL 02/14] tests/fp: Do not build softfloat3 tests if TCG is
 disabled
Date: Tue,  5 Jul 2022 12:38:04 +0200
Message-Id: <20220705103816.608166-3-thuth@redhat.com>
In-Reply-To: <20220705103816.608166-1-thuth@redhat.com>
References: <20220705103816.608166-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

Technically we don't need the TCG accelerator to run the
softfloat3 tests. However it is unlikely an interesting
build combination. Developers using softfloat3 likely use
TCG too. Similarly, developers disabling TCG shouldn't
mind much about softfloat3 tests.

This reduces a non-TCG build by 474 objects!

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20220204152924.6253-3-f4bug@amsat.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 tests/fp/meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/fp/meson.build b/tests/fp/meson.build
index 8bd0979f67..2b4f00b916 100644
--- a/tests/fp/meson.build
+++ b/tests/fp/meson.build
@@ -1,3 +1,6 @@
+if 'CONFIG_TCG' not in config_all
+  subdir_done()
+endif
 # There are namespace pollution issues on Windows, due to osdep.h
 # bringing in Windows headers that define a FLOAT128 type.
 if targetos == 'windows'
-- 
2.31.1


