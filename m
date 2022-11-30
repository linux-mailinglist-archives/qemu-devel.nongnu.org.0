Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDD9863D758
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:58:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0NaC-0001u1-JG; Wed, 30 Nov 2022 08:57:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Na8-0001r2-J7
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:57:01 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Na1-0004Qk-G8
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:56:58 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 h4-20020a1c2104000000b003d0760654d3so47459wmh.4
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=aBdBv82UGKe7lpbkxdfAYLFcJnkb42yafjZ/CJWDlQw=;
 b=DnWVCEd36Pwgn0clhpGFlxpVZvUJ3kiDclFVU6NWzUtB8T4IUg3cy9g0rh3PdCTY+g
 0mLMxQeAJzry8qNDjDek8yW/ou233XtHF2U+udpsj9hwPAU+juBnA9Qr/51GpG6vm1nB
 c3A37oKpQ0CDRIpr0sDMaGAl/+EX+EfqkZFcz/rzhaxxDPuFC8N0LjxGbSPYdM9sYq9o
 /36NZ13uh09ybVEBicC3ThQOo2SXVwTqCPXBKrgQtwVadPM2Yq9HgLxeCaMyoknuwMb4
 xKPVW2+J6IU8z4vHbZgKmf6qlWrkbSw1vJxqm94SjUzLyC0N8S5r6cMO45Ld7nh48aVn
 IKtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=aBdBv82UGKe7lpbkxdfAYLFcJnkb42yafjZ/CJWDlQw=;
 b=sAlJAJ/GYpai6BTfJFhL8vFjSXjHAlKdE/Kg4X5CU7XOxmpjbrf+Wtc3T+6BEue9AN
 rcLWJGPqWVU4MGDmfdPhqSIG1u7v1KO0nIIMp60ZGDlxAnlkabEoNNDhu93SOQETQJI+
 Th1UxgZdFsaIJVfQQtRZWwUIClIrxK0A66CSDOBedhDuozuhzejb9GgTMsZywnB1QZUz
 pv+XTDzKB21VgjStfiQ1dQZkUNhh74gfbV3Sw5zjEWwNTftT+MNs3KLefP2z72sHvpWd
 qdmIDxv8wR9iX6rERGBUidFaHpXZmdBgBfLpjp14t3gECMvVBjafEZcNS78BOSMQYQfY
 2bEw==
X-Gm-Message-State: ANoB5plbvr4uCXbIDTAvBPW2zDLMebiaaO39iG+HAle77tNKAMVI+nrp
 NTDm7hjrviNgkCVY1CExp57mT4j5Al5cQNOl
X-Google-Smtp-Source: AA0mqf40UMU88qOq0t541RY2jEenif7y5Oqd+sn0e3ovPhTQg+MsBB03rd3ubHmy4zsgWeJgPiD8Tw==
X-Received: by 2002:a05:600c:5254:b0:3d0:75d5:c64b with SMTP id
 fc20-20020a05600c525400b003d075d5c64bmr1549819wmb.12.1669816608332; 
 Wed, 30 Nov 2022 05:56:48 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a5d614d000000b00241727795c4sm1968825wrt.63.2022.11.30.05.56.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:56:47 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PATCH-for-8.0 1/2] typedefs: Forward-declare AccelState
Date: Wed, 30 Nov 2022 14:56:40 +0100
Message-Id: <20221130135641.85328-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130135641.85328-1-philmd@linaro.org>
References: <20221130135641.85328-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
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

Forward-declare AccelState in "qemu/typedefs.h" so structures
using a reference of it (like MachineState in "hw/boards.h")
don't have to include "qemu/accel.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 include/qemu/accel.h    | 4 ++--
 include/qemu/typedefs.h | 1 +
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/qemu/accel.h b/include/qemu/accel.h
index ce4747634a..e84db2e3e5 100644
--- a/include/qemu/accel.h
+++ b/include/qemu/accel.h
@@ -26,10 +26,10 @@
 #include "qom/object.h"
 #include "exec/hwaddr.h"
 
-typedef struct AccelState {
+struct AccelState {
     /*< private >*/
     Object parent_obj;
-} AccelState;
+};
 
 typedef struct AccelClass {
     /*< private >*/
diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
index 688408e048..073abab998 100644
--- a/include/qemu/typedefs.h
+++ b/include/qemu/typedefs.h
@@ -21,6 +21,7 @@
  * Incomplete struct types
  * Please keep this list in case-insensitive alphabetical order.
  */
+typedef struct AccelState AccelState;
 typedef struct AdapterInfo AdapterInfo;
 typedef struct AddressSpace AddressSpace;
 typedef struct AioContext AioContext;
-- 
2.38.1


