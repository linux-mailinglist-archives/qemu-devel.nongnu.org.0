Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB12C1EF270
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 09:49:36 +0200 (CEST)
Received: from localhost ([::1]:59166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jh76d-0001Nb-P9
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 03:49:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jh6yG-0003eP-Jk
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 03:40:56 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48994
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jh6yE-0005Hg-TK
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 03:40:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591342854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gy7eiStux+gIOMgnul3BY8RTTpwPoXMNvRdb9ailA+g=;
 b=D9bCcvd7F5Ebyrfw+m0/TlHwph/7OWsTef1gKx8o1dz2r9W78tBoZ1nMb1pVtBJbo8x/9K
 +PquG2lwF3RGrYQap+49TDQXSNnxdgp/t5Pk2GdQWOTngIycNjTxC4fi30Vf3YoEN2+ooh
 OdsXVaF4uks0TMnBz7thCV8vztulfMU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-o6ze86IoO_-V0AQZKdmGKQ-1; Fri, 05 Jun 2020 03:40:52 -0400
X-MC-Unique: o6ze86IoO_-V0AQZKdmGKQ-1
Received: by mail-wr1-f72.google.com with SMTP id m14so3410582wrj.12
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 00:40:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gy7eiStux+gIOMgnul3BY8RTTpwPoXMNvRdb9ailA+g=;
 b=OJ8AiFcuyznjIsvhxqzukF4fL37SD+qaLlad1BWMtdrXmlqAoFMsaOvbFYguxOXlHu
 YHz55e0hDVjY9gPtNABBbNCAHEVRmcoU5fi0W2/IPVXAfmHcCc1EVjP1c6E/u1T/3k5Q
 o8bEO/DiTmlllx5aLpJDhXY6udyzwJvbV2jQ5a2Ic4WY+77HQ44empJN6vYjzhMgFpul
 sJsRebVT/WwrVHsqvFmcd97BMtzITQ+XVty2OgrD+2Ed2qDdelttLoOkb8WuMQ2B6vUP
 UPr2jeYwlnUsKseULQ3Bifx5zph1V2aUS7kQTveSrri7VnS5GupMnH0Tck5Lzu25LO8D
 4q3w==
X-Gm-Message-State: AOAM532eWkDPG7/gwfsWkluszKxiQoBZXAgTjmZH6ul+fMFB6rg1XUr0
 emHNq4Whvf1SWv2Ytml/lAajIPSeVXEWSIhAQcaUiK8MH7v/46DxSdQP+GJvffzTduHkAs2zCXx
 OYF2nQ12wIXbcmFc=
X-Received: by 2002:adf:e3c4:: with SMTP id k4mr8054282wrm.262.1591342851289; 
 Fri, 05 Jun 2020 00:40:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzhNHgKitGBEaORWIjUtZXjF0vLIf/Pqv+AR+EmOw8gATOrlbfL+tKOnxRUOTDs5P2VLBCXqw==
X-Received: by 2002:adf:e3c4:: with SMTP id k4mr8054263wrm.262.1591342851084; 
 Fri, 05 Jun 2020 00:40:51 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id l2sm10814021wru.58.2020.06.05.00.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 00:40:50 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 11/11] accel/tcg: Add stub for probe_access()
Date: Fri,  5 Jun 2020 09:39:53 +0200
Message-Id: <20200605073953.19268-12-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200605073953.19268-1-philmd@redhat.com>
References: <20200605073953.19268-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:40:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 "Emilio G . Cota" <cota@braap.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The TCG helpers where added in b92e5a22ec3 in softmmu_template.h.
probe_write() was added in there in 3b4afc9e75a to be moved out
to accel/tcg/cputlb.c in 3b08f0a9254, and was later refactored
as probe_access() in c25c283df0f.
Since it is a TCG specific helper, add a stub to avoid failures
when building without TCG, such:

  target/arm/helper.o: In function `probe_read':
  include/exec/exec-all.h:362: undefined reference to `probe_access'

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
Cc: Richard Henderson <rth@twiddle.net>
Cc: Emilio G. Cota <cota@braap.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: David Hildenbrand <david@redhat.com>
---
 accel/stubs/tcg-stub.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/accel/stubs/tcg-stub.c b/accel/stubs/tcg-stub.c
index 677191a69c..e4bbf997aa 100644
--- a/accel/stubs/tcg-stub.c
+++ b/accel/stubs/tcg-stub.c
@@ -22,3 +22,10 @@ void tb_flush(CPUState *cpu)
 void tlb_set_dirty(CPUState *cpu, target_ulong vaddr)
 {
 }
+
+void *probe_access(CPUArchState *env, target_ulong addr, int size,
+                   MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
+{
+     /* Handled by hardware accelerator. */
+     g_assert_not_reached();
+}
-- 
2.21.3


