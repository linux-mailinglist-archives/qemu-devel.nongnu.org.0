Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7A2365233D
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 15:58:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7e34-0006oV-6Y; Tue, 20 Dec 2022 09:56:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7e2y-0006n4-VF
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:56:49 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7e2x-0004jd-Fu
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 09:56:48 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 c65-20020a1c3544000000b003cfffd00fc0so11337131wma.1
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 06:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KTQVfyiY+5oU5Xtk/+Ze+nTz1jeq6EB/aAS/3jJOPVI=;
 b=Jo7oFkhIu58yclZNFJIOe2SxiE7d7ZQQphiQm8NYDReZadCRtz3pwThdg+329eC4WC
 ipppJcpGIet0nwT7F/18FiDNwcLkU9UUjFjZnmJdAJ8cT2IFj4leEodHXfDU7CCpGyTF
 Hl5PKCXNbeyRwio1kYhcDOOeFMjeOLCla4mgEsZImCX9DrgNvMkdcPGIBU4supzA2To/
 UUf/E1Bah1X9GjsokTK8QJnXD82xWBRrAXzN5IwQvwLkmLTKOP8d1wRfzd9H7Ao3Ta9U
 3hMbpvSQfKYO62iiOUhuoVBmyNfGs5j7Pdqm+jvv7BVGg1F5Pb10z4blIyATs5xJXubA
 8dnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KTQVfyiY+5oU5Xtk/+Ze+nTz1jeq6EB/aAS/3jJOPVI=;
 b=rJseoiHLyt3x8WXeDorSSs1KyL4OAIcyL/Bli1tVe39vFGxY9XPwdk8UXw/URVXO9Z
 EhscSwdty8YjtOuSmzUWh59N5udiLKkSFCBSIWYuWACqrVmYLOSRNHsVnKaeVG33YxDi
 I6k1tDKPHXyvZdBMFDuh6gXww+LFtKCTRmEygVOlsuo9TwiJFPYRaB9y+FtXK0dxnj+9
 cTWOGsPXXLxT09AvGyafwwsvjcz6HZd2PzFmLHJzecobyGUUio7RLIVl9z8YfgohCNgz
 qwrjjgrValffSbIHbT4F3ADIRBXPx1EwNzJ5nYznMD/8qSLwueKcuVirNH2HCXaA+hfr
 41Bg==
X-Gm-Message-State: ANoB5plXDsvVt0kFyQBSIfW/NHkycaUWoXU+890i1i/hL60o7fBeLTjD
 8VLPbUCKodFuIcN9aBdbgtP10aI/W6gioJ7FZyk=
X-Google-Smtp-Source: AA0mqf5oOYdqDWaLIZHFAYa368zAnI71VuOl8+rnI/KB3X6qsMSxJgHu+v30i+vzQga4HzlC0fXE0Q==
X-Received: by 2002:a05:600c:4fc8:b0:3cf:b067:4142 with SMTP id
 o8-20020a05600c4fc800b003cfb0674142mr35408720wmq.4.1671548206007; 
 Tue, 20 Dec 2022 06:56:46 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 v2-20020a05600c214200b003cfa81e2eb4sm15828948wml.38.2022.12.20.06.56.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Dec 2022 06:56:45 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Ilya Leoshkevich <iii@linux.ibm.com>,
 Eduardo Habkost <eduardo@habkost.net>, qemu-s390x@nongnu.org,
 Song Gao <gaosong@loongson.cn>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 3/5] target/loongarch: Restrict sysemu/reset.h to system
 emulation
Date: Tue, 20 Dec 2022 15:56:23 +0100
Message-Id: <20221220145625.26392-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221220145625.26392-1-philmd@linaro.org>
References: <20221220145625.26392-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
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

In user emulation, threads -- implemented as CPU -- are
created/destroyed, but never reset. There is no point in
allowing the user emulation access the sysemu/reset API.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/cpu.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 0fb853d915..441dfbab74 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -16,7 +16,9 @@
 #include "internals.h"
 #include "fpu/softfloat-helpers.h"
 #include "cpu-csr.h"
+#ifndef CONFIG_USER_ONLY
 #include "sysemu/reset.h"
+#endif
 
 const char * const regnames[32] = {
     "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
-- 
2.38.1


