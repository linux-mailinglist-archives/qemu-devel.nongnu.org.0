Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15F936A40DB
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 12:39:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWbpT-0007hB-IG; Mon, 27 Feb 2023 06:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboV-0005sK-Mh
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:37:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pWboP-0005ib-HG
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 06:36:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677497816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qGtxdCK9woe6+Rs1kSjCIb73FWpxI3wGanttbVAMtls=;
 b=Ab85A8IzN8U1JoiMv/PAc3q/tFYq4ZWJiSX5+p8jYeNPLSrXSeGtUD6WIyjADmLW9FMO+k
 LaTPzPXaRSMACQDY2lsYOla0/zRY2lO39PzvvFX4VqnrdfctfaeIWZCosAymtxIgZeRADc
 a8Rh3exuP6lfgklNligPLIeGooNOgmM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-139-O-YG3UpkOVS1NOtQlggDnQ-1; Mon, 27 Feb 2023 06:36:53 -0500
X-MC-Unique: O-YG3UpkOVS1NOtQlggDnQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 73CF5100F909;
 Mon, 27 Feb 2023 11:36:53 +0000 (UTC)
Received: from thuth.com (unknown [10.45.227.26])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DB48F1121314;
 Mon, 27 Feb 2023 11:36:52 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	qemu-devel@nongnu.org
Subject: [PULL 25/33] qemu-keymap: Silence memory leak warning from Clang's
 sanitizer
Date: Mon, 27 Feb 2023 12:36:13 +0100
Message-Id: <20230227113621.58468-26-thuth@redhat.com>
In-Reply-To: <20230227113621.58468-1-thuth@redhat.com>
References: <20230227113621.58468-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When compiling QEMU with "--enable-sanitizers --enable-xkbcommon --cc=clang"
there is a memory leak warning when running qemu-keymap:

 $ ./qemu-keymap -f pc-bios/keymaps/de -l de

 =================================================================
 ==610321==ERROR: LeakSanitizer: detected memory leaks

 Direct leak of 136 byte(s) in 1 object(s) allocated from:
     #0 0x5642830d0820 in __interceptor_calloc.part.11 asan_malloc_linux.cpp.o
     #1 0x7f31873b8d2b in xkb_state_new (/lib64/libxkbcommon.so.0+0x1dd2b) (BuildId: dd32581e2248833243f3f646324ae9b98469f025)

 SUMMARY: AddressSanitizer: 136 byte(s) leaked in 1 allocation(s).

It can be silenced by properly releasing the "state" again
after it has been used.

Message-Id: <20230221122440.612281-1-thuth@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 qemu-keymap.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/qemu-keymap.c b/qemu-keymap.c
index 4095b654a6..229866e004 100644
--- a/qemu-keymap.c
+++ b/qemu-keymap.c
@@ -226,6 +226,8 @@ int main(int argc, char *argv[])
 
     state = xkb_state_new(map);
     xkb_keymap_key_for_each(map, walk_map, state);
+    xkb_state_unref(state);
+    state = NULL;
 
     /* add quirks */
     fprintf(outfile,
-- 
2.31.1


