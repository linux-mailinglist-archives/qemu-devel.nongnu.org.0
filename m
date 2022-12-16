Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51BD64F3C3
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Dec 2022 23:11:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6Imi-0005wU-IP; Fri, 16 Dec 2022 17:02:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Imd-0005vs-8Y
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:02:23 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6Imb-0004Y8-GC
 for qemu-devel@nongnu.org; Fri, 16 Dec 2022 17:02:23 -0500
Received: by mail-ed1-x52a.google.com with SMTP id d14so5435861edj.11
 for <qemu-devel@nongnu.org>; Fri, 16 Dec 2022 14:02:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bsYElVm876q/0ZqLXVB4BT+73LRGAkhD0hBlyKLVHqQ=;
 b=flnntruX73Zzy0t/jROQZBggFAGJK88sjUttKc9z8TQjz092cNZRLRn74UUSbCMgtu
 RWSVq3NqNY2o/jn9IvKu6PWdO64WWHD6fQWziI10FCRaaFkri94Gm80Ve1xW3W/3HmL1
 t5+sKIWTso2JyzoC2iBQ2z1VoBPj46YDe5Ay8/icRKATjGcpMNWfdYyadgS3JotVBH4h
 s6k1xcJ1RhrydnubUV5QzN//3TX3s0zDNk1w4swCd3vjEZwGdwcXuA1WOIG0ZZna6abl
 OXyBw7gL9c3jt7JH1H12Oz2paU6aXW0GORSMfLEKQlyrqVXPUmDdahQ2dEunvlno1wrv
 4ozg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bsYElVm876q/0ZqLXVB4BT+73LRGAkhD0hBlyKLVHqQ=;
 b=GBuUC1ekz4CB+CGBhmQhbMPDMniruANcPJ+Xh00X0ZH0YYJ04OFAU3i9VJmCAzlWc8
 oUvrcNariv/4HBlPGorNED95DDd/5eixS79jWJD/uvcOT+G7wecFqOCmYIrea7BJZ9qN
 VPaGzR4DdwG9x2qwajIDa6W04a+ld9wbSJCDJqf7f9vGXurAdOM/66MpHPlV3g0HCzsY
 HyXqoym0trSlYe2anLn3XzTUKlFGQYFdf3keDySFp4wdmlnTsMIgVgC7mteXZ4WvzjxN
 2exwent2q+XAmmfD28QW0CKEpXIqHcitAynt4l8AMvxOC+n2smABNsgSo74MITtfbyNW
 rtoQ==
X-Gm-Message-State: ANoB5pm4B4KzDlMSJUuSEFPZWnN6kKaQdy1hc6JUn6S8mT8yK+eQ+iwA
 aeiBzLiTXgpPf8+4bLTp5i7WfZZJmx3P684EeQM=
X-Google-Smtp-Source: AA0mqf7jEwTTUCaptKy44fqGpvvN+j0b3E2kEg6UJ72iEBNB25rE+B9lGpK339BDGIOd5XCZKBXvDg==
X-Received: by 2002:a05:6402:448f:b0:470:25cf:99d1 with SMTP id
 er15-20020a056402448f00b0047025cf99d1mr16674901edb.31.1671228139536; 
 Fri, 16 Dec 2022 14:02:19 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 cm12-20020a0564020c8c00b00463b9d47e1fsm1320516edb.71.2022.12.16.14.02.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 16 Dec 2022 14:02:19 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Cameron Esfahani <dirty@apple.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>, haxm-team@intel.com,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/5] target/i386/ops_sse: Include missing "cpu.h" header
Date: Fri, 16 Dec 2022 23:01:56 +0100
Message-Id: <20221216220158.6317-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221216220158.6317-1-philmd@linaro.org>
References: <20221216220158.6317-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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

'Reg' is defined as 'MMXReg', itself declared in "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/i386/ops_sse.h        | 1 +
 target/i386/ops_sse_header.h | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/target/i386/ops_sse.h b/target/i386/ops_sse.h
index 3cbc36a59d..68c88c9ee3 100644
--- a/target/i386/ops_sse.h
+++ b/target/i386/ops_sse.h
@@ -19,6 +19,7 @@
  */
 
 #include "crypto/aes.h"
+#include "cpu.h"
 
 #if SHIFT == 0
 #define Reg MMXReg
diff --git a/target/i386/ops_sse_header.h b/target/i386/ops_sse_header.h
index 8a7b2f4e2f..5631a6d1e1 100644
--- a/target/i386/ops_sse_header.h
+++ b/target/i386/ops_sse_header.h
@@ -16,6 +16,9 @@
  * You should have received a copy of the GNU Lesser General Public
  * License along with this library; if not, see <http://www.gnu.org/licenses/>.
  */
+
+#include "cpu.h"
+
 #if SHIFT == 0
 #define Reg MMXReg
 #define SUFFIX _mmx
-- 
2.38.1


