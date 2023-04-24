Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A626ED1FE
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Apr 2023 18:05:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pqygQ-0001B3-NR; Mon, 24 Apr 2023 12:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqygO-0001Al-77
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:04:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1pqygM-0008O7-QE
 for qemu-devel@nongnu.org; Mon, 24 Apr 2023 12:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682352290;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qSmNA5+BbuZmTG8DgFkfnmAn466f15976BdLfdWzDeI=;
 b=H0tzv+vD4xdtBlWZLfCiFF/Cs47mNUl5dmguds80qtPrWUbjl1K/OpRHsnQvEiuKIIsKwd
 oPTHdvAd838XIR60s/7gPB2WdiYmENhItGo17Yn99As4ntlC+MHEUurUqwFXND4fSF8ap7
 8rKKnUnBIz4drDe2fYYS9SJ426Z2/0Q=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-571-yWgoKZGFNAORfTizcZuzgg-1; Mon, 24 Apr 2023 12:04:43 -0400
X-MC-Unique: yWgoKZGFNAORfTizcZuzgg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 400FC382C964;
 Mon, 24 Apr 2023 16:04:42 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.156])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A1954492B03;
 Mon, 24 Apr 2023 16:04:40 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-s390x@nongnu.org, Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 2/3] cpu: Introduce a wrapper for being able to use
 TARGET_NAME in common code
Date: Mon, 24 Apr 2023 18:04:33 +0200
Message-Id: <20230424160434.331175-3-thuth@redhat.com>
In-Reply-To: <20230424160434.331175-1-thuth@redhat.com>
References: <20230424160434.331175-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

In some spots, it would be helpful to be able to use TARGET_NAME
in common (target independent) code, too. Thus introduce a wrapper
that can be called from common code, too, just like we already
have one for target_words_bigendian().

Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 include/hw/core/cpu.h | 2 ++
 cpu.c                 | 5 +++++
 2 files changed, 7 insertions(+)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 5a019a27bc..39150cf8f8 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -1013,6 +1013,8 @@ void cpu_exec_unrealizefn(CPUState *cpu);
  */
 bool target_words_bigendian(void);
 
+const char *target_name(void);
+
 void page_size_init(void);
 
 #ifdef NEED_CPU_H
diff --git a/cpu.c b/cpu.c
index 9105c85404..65ebaf8159 100644
--- a/cpu.c
+++ b/cpu.c
@@ -427,6 +427,11 @@ bool target_words_bigendian(void)
 #endif
 }
 
+const char *target_name(void)
+{
+    return TARGET_NAME;
+}
+
 void page_size_init(void)
 {
     /* NOTE: we can always suppose that qemu_host_page_size >=
-- 
2.31.1


