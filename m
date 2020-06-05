Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE5F1EFF99
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Jun 2020 20:04:42 +0200 (CEST)
Received: from localhost ([::1]:47822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jhGht-0004lt-H8
	for lists+qemu-devel@lfdr.de; Fri, 05 Jun 2020 14:04:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jhGcn-0006IO-5y
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 13:59:28 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:60072
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1jhGcm-0000f3-D8
 for qemu-devel@nongnu.org; Fri, 05 Jun 2020 13:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1591379963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EtHXc08cU2h+YYoVzqMY8ITi4IAZMxthxIEDG0nzDUM=;
 b=cOodsi+mfngnR4E8usiqCxNv/Wul1K0On/qq+3pCV7yJ4LCJw/glvgILh25BAneWxtVxlw
 p3+L/tj2wH5/M24hyDMou3V2/ogitjhO/SolU/b2uvVRjMf+Fv37nNzHwjyYBsapw+Ey9b
 EPp4ptB1PbJnIgTaHZZzLKqRj3PcC5k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-90-qk0rOu4IOr2KWL6uj2AwcA-1; Fri, 05 Jun 2020 13:59:20 -0400
X-MC-Unique: qk0rOu4IOr2KWL6uj2AwcA-1
Received: by mail-wr1-f69.google.com with SMTP id l1so4064679wrc.8
 for <qemu-devel@nongnu.org>; Fri, 05 Jun 2020 10:59:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EtHXc08cU2h+YYoVzqMY8ITi4IAZMxthxIEDG0nzDUM=;
 b=QL8eXTZfhTPBVIytJxV+xzQiRfUlhNEOG16tnIloErmSizTaMKd1buDC5Y7q8tlso/
 giCJgBTkP0C2uIdomz+3K8Xdy+tzVKrPH+xxiKxLqzrgqB2LHJ7OxVhupRJDOBRLrMiv
 1j7M8Qp/Gnnhb5BgPrXD+NojX63rIEW3pREp3Ay1/0LxrScDOabxM4whzAB1DIyIBVGn
 NI57IBQs3OGkUPzv+VFBpqxR4+qQpGUeR4hIoMZdtvZid7wPzYdBMkluSvg7zHaXKErl
 QQ/1B4V5Bh11qLDQxagxrqfSR1tr3q3gM/1IJrSeoCqADVgVd2kNNH1NiqQiApZe5uoB
 jBpg==
X-Gm-Message-State: AOAM530AZfhngWVCG2KK+991I3WIIPqIc/Nuc0Axs5BLB4eW+xYdjw0t
 UMvshT8cGUP1T5SakjxqkY5Xm4yJNCQ7AX2Vu9riogaVfFbyUfvf39FhiQCe6b0RRN71M39SGaj
 lP7LLPwjAF/hFwM0=
X-Received: by 2002:a1c:e0c3:: with SMTP id x186mr3742387wmg.17.1591379958894; 
 Fri, 05 Jun 2020 10:59:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwEle4zM0O5FN65X66KgWJBPS6QuFGnI/2gr9FFF+EjV0CsQ+3nSC3lfzQ7zq4IE2Vx2JDnmA==
X-Received: by 2002:a1c:e0c3:: with SMTP id x186mr3742380wmg.17.1591379958678; 
 Fri, 05 Jun 2020 10:59:18 -0700 (PDT)
Received: from localhost.localdomain
 (181.red-88-10-103.dynamicip.rima-tde.net. [88.10.103.181])
 by smtp.gmail.com with ESMTPSA id y19sm11760700wmi.6.2020.06.05.10.59.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Jun 2020 10:59:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 11/11] accel/tcg: Add stub for probe_access()
Date: Fri,  5 Jun 2020 19:58:21 +0200
Message-Id: <20200605175821.20926-12-philmd@redhat.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20200605175821.20926-1-philmd@redhat.com>
References: <20200605175821.20926-1-philmd@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/05 03:35:49
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
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
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


