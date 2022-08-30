Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6955A6C9F
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 20:56:32 +0200 (CEST)
Received: from localhost ([::1]:44126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT6PX-0006T0-KK
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 14:56:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6A4-0007LU-F6
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1oT6A1-000559-0I
 for qemu-devel@nongnu.org; Tue, 30 Aug 2022 14:40:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661884828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bKEMXikKpeKS8iKJzeEmQoStxydeeSeqaMZMu0CJ3gw=;
 b=YWMDhXOygGhttbjUFCT7b26k4mC3odl5s5ZV8zCLk/YcCwP4kh2oB10tMB0WVtQm+3cloo
 3xTJ3pJToHeZh3yarKS0YTnaZhGj7ruk6dJ3UTs43kSXDOvA1RH3TZuKBajiAdITgShIzN
 qWspadI2T7dx+/8Cs0VPrdna8GIpEXI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-132-krwAMfabOy2vFg2oCmZxtw-1; Tue, 30 Aug 2022 14:40:24 -0400
X-MC-Unique: krwAMfabOy2vFg2oCmZxtw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 28A20811E80;
 Tue, 30 Aug 2022 18:40:24 +0000 (UTC)
Received: from thuth.com (unknown [10.39.192.125])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 900D31415117;
 Tue, 30 Aug 2022 18:40:22 +0000 (UTC)
From: Thomas Huth <thuth@redhat.com>
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: Bin Meng <bin.meng@windriver.com>,
	Stefan Berger <stefanb@linux.ibm.com>
Subject: [PULL 05/23] backends/tpm: Exclude headers and macros that don't
 exist on win32
Date: Tue, 30 Aug 2022 20:39:54 +0200
Message-Id: <20220830184012.77978-6-thuth@redhat.com>
In-Reply-To: <20220830184012.77978-1-thuth@redhat.com>
References: <20220830184012.77978-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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

From: Bin Meng <bin.meng@windriver.com>

These headers and macros do not exist on Windows. Exclude them.

Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20220824094029.1634519-15-bmeng.cn@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
---
 backends/tpm/tpm_ioctl.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/backends/tpm/tpm_ioctl.h b/backends/tpm/tpm_ioctl.h
index bd6c12cb86..d67bf0283b 100644
--- a/backends/tpm/tpm_ioctl.h
+++ b/backends/tpm/tpm_ioctl.h
@@ -9,8 +9,10 @@
 #ifndef TPM_IOCTL_H
 #define TPM_IOCTL_H
 
+#ifndef _WIN32
 #include <sys/uio.h>
 #include <sys/ioctl.h>
+#endif
 
 #ifdef HAVE_SYS_IOCCOM_H
 #include <sys/ioccom.h>
@@ -222,6 +224,7 @@ typedef struct ptm_setbuffersize ptm_setbuffersize;
 #define PTM_CAP_SET_DATAFD         (1 << 12)
 #define PTM_CAP_SET_BUFFERSIZE     (1 << 13)
 
+#ifndef _WIN32
 enum {
     PTM_GET_CAPABILITY     = _IOR('P', 0, ptm_cap),
     PTM_INIT               = _IOWR('P', 1, ptm_init),
@@ -241,6 +244,7 @@ enum {
     PTM_SET_DATAFD         = _IOR('P', 15, ptm_res),
     PTM_SET_BUFFERSIZE     = _IOWR('P', 16, ptm_setbuffersize),
 };
+#endif
 
 /*
  * Commands used by the non-CUSE TPMs
-- 
2.31.1


