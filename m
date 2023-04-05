Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4526D835C
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 18:15:07 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk5m7-0007kT-Pg; Wed, 05 Apr 2023 12:14:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5lw-0007i6-Mx
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:14:10 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pk5lv-0006Yj-5b
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 12:14:08 -0400
Received: by mail-wr1-x429.google.com with SMTP id m2so36755093wrh.6
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 09:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680711245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=31Dm8tqveH6A+pTj5FPrc9/OxO1iY2GmqoL5qWMaQ24=;
 b=pd14cQKQnbGXSS7TUuEfdyDf5sS/zlY7sHExBVdaAoLm+FR9z4m97A4mvOPC2H8vyl
 Gmz3wjbmUwxY/fJqAOLuDOhY616GTL2Q01yU23hOvKYe5S3u7w5HMDoKvtMf+89yPnKW
 TJh1p0Vr+34FXtgnN9X54/7OdJnOV7yf+V4DeDcrkDTaQc6VPniCpr5vSXUXqAHSYMbY
 eeWSSwe4gODZc5fJdhIkgFvMmlCnM3sbzsuI09kT6kRfZgBvgHP7FiCnkJzQo2xF7F4D
 fqJGxbPspWNuXTatpW9EJFD+QObBG2IvHfaCUe0D2Se1nPtRizuXb0zttJf9EXgZ0BS2
 3i9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680711245;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=31Dm8tqveH6A+pTj5FPrc9/OxO1iY2GmqoL5qWMaQ24=;
 b=dL0oAKXgG9okcLDYd75Wze77PAQ4sTG/ngFp4H3/2Tu7c51DIXcMs423eIA+1C5TVY
 w+Vf3L+2QHsb3mcsL8rbdh8t6wbkeUDJVk9qOeo4FS83LMeqn9s3GWiTY+eeizHK34Dg
 u9yL1WEYBv0oIYnI921O8lTMYRSI0OXStlnRanEhYiQB3tGssl5nY9IPJzsNCEPRLXPf
 U4k1bTaDdsa4wL7MKTGc4PGWc+U84FczQ0xBV3OC/9yxAWamo2ntW5auSzAFNbAmWyMp
 8KRL/QfyjGkHx3esPgRGwL6gawkfGjLRN7vjzcz6/KsLON5HFIqX3TWeYxTBEGMYAGGs
 697Q==
X-Gm-Message-State: AAQBX9cFAzfe1WVMq9voWfUjvFHksXalfI/PcNdfZK99FhSyPY1mToQz
 btC/kcL3wDvGIWwE6TjbGUvzihm92xAFDqOw0+k=
X-Google-Smtp-Source: AKy350bBfE6YE7vKkF6jYUa53ola/eVUuEKMInhDF04I462o2T68qmBLO7/fpuw89LhKQ8T1lLCkdA==
X-Received: by 2002:adf:fcc5:0:b0:2d0:c37a:5ebd with SMTP id
 f5-20020adffcc5000000b002d0c37a5ebdmr4814064wrs.64.1680711244870; 
 Wed, 05 Apr 2023 09:14:04 -0700 (PDT)
Received: from localhost.localdomain
 (4ab54-h01-176-184-52-81.dsl.sta.abo.bbox.fr. [176.184.52.81])
 by smtp.gmail.com with ESMTPSA id
 k12-20020adfe8cc000000b002c7b229b1basm15351729wrn.15.2023.04.05.09.14.03
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 05 Apr 2023 09:14:04 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/2] accel/stubs: Remove kvm_flush_coalesced_mmio_buffer() stub
Date: Wed,  5 Apr 2023 18:13:55 +0200
Message-Id: <20230405161356.98004-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230405161356.98004-1-philmd@linaro.org>
References: <20230405161356.98004-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

kvm_flush_coalesced_mmio_buffer() is only called from
qemu_flush_coalesced_mmio_buffer() where it is protected
by a kvm_enabled() check. When KVM is not available, the
call is elided, there is no need for a stub definition.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 accel/stubs/kvm-stub.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/accel/stubs/kvm-stub.c b/accel/stubs/kvm-stub.c
index 235dc661bc..c0e2df3fbf 100644
--- a/accel/stubs/kvm-stub.c
+++ b/accel/stubs/kvm-stub.c
@@ -29,10 +29,6 @@ bool kvm_ioeventfd_any_length_allowed;
 bool kvm_msi_use_devid;
 bool kvm_direct_msi_allowed;
 
-void kvm_flush_coalesced_mmio_buffer(void)
-{
-}
-
 void kvm_cpu_synchronize_state(CPUState *cpu)
 {
 }
-- 
2.38.1


