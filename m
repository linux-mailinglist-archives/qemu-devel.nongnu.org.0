Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6A5A4A8D20
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 21:22:49 +0100 (CET)
Received: from localhost ([::1]:39786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFicy-00053p-Tc
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 15:22:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhwO-0004Gw-8s
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:38:52 -0500
Received: from [2607:f8b0:4864:20::62c] (port=40588
 helo=mail-pl1-x62c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFhwM-0005zE-7O
 for qemu-devel@nongnu.org; Thu, 03 Feb 2022 14:38:47 -0500
Received: by mail-pl1-x62c.google.com with SMTP id y17so3073904plg.7
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 11:38:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6RIL9HXL1vvqg0MDPxJ4fnmtDJM0NiBpkFMH07BGdV0=;
 b=RX8aQZNoKh8MFfFGU2qEhW5EBXPRTE8IBmyfVZcJzrwkUO3y1pZEDmZYlTa0IbKx3X
 R3+JR5ZQvJ/BvSMirmnBR0J4/nu0bcsqN4TVIbD/JAe1oONz/gpzpdOvAqDJIbrR3x5h
 6rhlWYlZmksxevEgmUudk+9vfzo0f8Vo6ovlZmDTqF6x7FhfbKiWIXntIKJOWEFNSfAf
 oTosTxPBISdgSfy92anAnPoLgukjPaUJmcYM8Xx6MqPBB8FcMyZrnku4AXKfqwTNfUYH
 LkQ5UQePyqpFNWKxdv3AuPeIJEyTD+WMhBPasp7b5JsvdQU0sRR9xA5pVDMVpPjXWDJn
 SLQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=6RIL9HXL1vvqg0MDPxJ4fnmtDJM0NiBpkFMH07BGdV0=;
 b=pi9gjrz4amI3OaSNOrqSbu9sBWNUGJQ3Xoy4yDGEYL+UfVTivGxCTDOG9JI67zPbf7
 vK2tUx4jCYWKEIb2hnYmhJZhd1ca4L0fl6tU5LLVpojFMTXDtc1KiAdpbmn7Ycd6ruFY
 1QnX3p2qQQgk8h+YDzgmlzWhPMl3xiQR1HkI4FMtDBHhAtLcuwC2g/UrNxyFdg6hNxy6
 alVn240OMjg7EmmBslodl/NsTGkSduZjDpbgLog7rHq4GXnbhLTPLNFYlzHoZOTcmYbJ
 4Ir/ir3s7WiTaSSYwL6tvutgzQ0fCoF744WpjKjMaRCAUAWs6G1ToacONptsQyjgZ3Rw
 csSw==
X-Gm-Message-State: AOAM5336d4FwJRROKzgWRZPshaUgjzgN+PD7iw0XAxGK6gQAT7kfjTMM
 wy9Z1NSdIvqk6xoJFYxQN3MmYqvpHEA=
X-Google-Smtp-Source: ABdhPJzC59ESp4BvDsKsXr5XARWXdHxEgL16KZcNhbNV7LsOGXNZeUPjjgm5X9PTldk3oBsseNLu6A==
X-Received: by 2002:a17:90a:8544:: with SMTP id
 a4mr15477646pjw.171.1643917113023; 
 Thu, 03 Feb 2022 11:38:33 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id q17sm30169792pfk.108.2022.02.03.11.38.31
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 03 Feb 2022 11:38:32 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 03/10] hw/s390x/virtio: Add missing 'cpu.h' include
Date: Thu,  3 Feb 2022 20:37:56 +0100
Message-Id: <20220203193803.45671-4-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220203193803.45671-1-f4bug@amsat.org>
References: <20220203193803.45671-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

CPUS390XState is declared in "cpu.h".

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/s390x/s390-virtio-hcall.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/s390x/s390-virtio-hcall.h b/hw/s390x/s390-virtio-hcall.h
index 9800c4b351..9773ed8a21 100644
--- a/hw/s390x/s390-virtio-hcall.h
+++ b/hw/s390x/s390-virtio-hcall.h
@@ -13,6 +13,7 @@
 #define HW_S390_VIRTIO_HCALL_H
 
 #include "standard-headers/asm-s390/virtio-ccw.h"
+#include "cpu.h"
 
 /* The only thing that we need from the old kvm_virtio.h file */
 #define KVM_S390_VIRTIO_NOTIFY 0
-- 
2.34.1


