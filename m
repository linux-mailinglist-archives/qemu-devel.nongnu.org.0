Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A20957C587
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 09:50:39 +0200 (CEST)
Received: from localhost ([::1]:56674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEQxB-0000Ox-Pl
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 03:50:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEQuy-0006oA-Vp
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 03:48:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:27356)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oEQuv-0008CR-K2
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 03:48:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658389696;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=QHMQ2K857kWSMFF03IoLUh4BZn3cICJ/eAt1tfGRuto=;
 b=C1ffXkMnwO7zvrf80GPNwyy7Zb2hZH2FYWlaRwa/IWGA7E0wB5GWvb/Y4DZ26vZIQVpmqB
 gciUaO89qrib+LkCXVSE9MZYjeKofnTg9YN04exw8Vj8aWcJckTeDIsGaD1PwDgkhv7TuS
 JOXdn4uYkJB2smwgsol5mZDqRCszweQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-ecAoWFgBMvCclToQxua1qg-1; Thu, 21 Jul 2022 03:48:12 -0400
X-MC-Unique: ecAoWFgBMvCclToQxua1qg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B0953801155;
 Thu, 21 Jul 2022 07:48:12 +0000 (UTC)
Received: from thuth.com (unknown [10.39.193.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97AE01415118;
 Thu, 21 Jul 2022 07:48:11 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH] include/qemu/host-utils.h: Simplify the compiler check in
 mulu128()
Date: Thu, 21 Jul 2022 09:48:09 +0200
Message-Id: <20220721074809.1513357-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
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

We currently require at least GCC 7.4 or Clang 6.0 for compiling QEMU.
GCC has __builtin_mul_overflow since version 5 already, and Clang 6.0
also provides this built-in function (see its documentation on this page:
https://releases.llvm.org/6.0.0/tools/clang/docs/LanguageExtensions.html ).
So we can simplify the #if statement here.

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/qemu/host-utils.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/include/qemu/host-utils.h b/include/qemu/host-utils.h
index 29f3a99878..88d476161c 100644
--- a/include/qemu/host-utils.h
+++ b/include/qemu/host-utils.h
@@ -533,8 +533,7 @@ static inline bool umul64_overflow(uint64_t x, uint64_t y, uint64_t *ret)
  */
 static inline bool mulu128(uint64_t *plow, uint64_t *phigh, uint64_t factor)
 {
-#if defined(CONFIG_INT128) && \
-    (__has_builtin(__builtin_mul_overflow) || __GNUC__ >= 5)
+#if defined(CONFIG_INT128)
     bool res;
     __uint128_t r;
     __uint128_t f = ((__uint128_t)*phigh << 64) | *plow;
-- 
2.31.1


