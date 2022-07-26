Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F9258165D
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jul 2022 17:27:49 +0200 (CEST)
Received: from localhost ([::1]:51126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGMTM-0000ab-EC
	for lists+qemu-devel@lfdr.de; Tue, 26 Jul 2022 11:27:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMMD-0006Nv-Dw
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:25 -0400
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:33489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGMM7-00062i-3B
 for qemu-devel@nongnu.org; Tue, 26 Jul 2022 11:20:23 -0400
Received: by mail-wm1-x336.google.com with SMTP id
 a18-20020a05600c349200b003a30de68697so1149631wmq.0
 for <qemu-devel@nongnu.org>; Tue, 26 Jul 2022 08:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ey2A/ataBvQCviganlANpFwD3PZb1j/1pS05PcMDR9A=;
 b=oGYB/00/qxQ+aB5ZIL7hPc1MkryipGMmfiKR2ErMGJLSCj+s9nq/X6NGlPFBBew8hs
 kCvMAmA3oy8hFsLMWxC60ypvXeY5HnUdHt8KL7jNHwF2yeNu5S1AiOsSPhi0TlKNYfyq
 bGrGAI5AWsctMa9AfpQSpz5PX9II8GM4FKQFQCmLIsQESVsJhWSjxfih5Ys8Qz6T+yNp
 RNDWfC9Ed3Jbg2iPGztGlPOHvnj6UirXDnE2XzWjaQjTqZumBbUrKbz7ul09lKXzvmec
 J4p2PetrfJo3IhTYAPwz3OTKrIZCNPjgPoXq6QX/AE/yRKoKj08469TacJpXwqvg0e0I
 TrAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ey2A/ataBvQCviganlANpFwD3PZb1j/1pS05PcMDR9A=;
 b=mbVI9TT0qXvklL0DthSzgH1az+bWQOG9u5G/Tr+z7c1ePqXQwss/k7oNneJCEMT7QP
 ICnz4PS/Qz/p3Om/jd5EaGgGo0meIaPNXUTCIQm6WM/i4BlMOYyMbIkouhWCe+zsRX+Q
 Sg17FcOorHqwne4WnB7PErnvfTfvLgi0Yw/vTSB0AG+lmOebjWnz6XRSH16moF2V2V6x
 m0YkeD4jX4adwcq2yVlCQXQI1mbk8B3R+njBm4IQS0w6n8MZKFGFPwEn0llYB+ybLtLN
 idz1AhhdGVvilD2ygNr7Rji8un9SGbCRkrcB3HFPofbCglRkwM6HmAT1rPcymKzk3Adb
 KsCQ==
X-Gm-Message-State: AJIora+1QrtRxDQxQH6syVcv3ixIslp8LrVgnCHL212UJivPiHYbwbT7
 h2zgSIdRpTFyJK5kUTEQ5WPkISa5R5aLcA==
X-Google-Smtp-Source: AGRyM1tPElYMbwBsJ8ZGLg0iuS6IEHBXyAfMunMAbXO8ozhkZsjGtT0JwaF3AdVt5/eF7cdAD4kjog==
X-Received: by 2002:a1c:3541:0:b0:3a2:e2e2:d80e with SMTP id
 c62-20020a1c3541000000b003a2e2e2d80emr12672473wma.184.1658848817427; 
 Tue, 26 Jul 2022 08:20:17 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n5-20020a1c2705000000b003a1980d55c4sm21932739wmn.47.2022.07.26.08.20.16
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Jul 2022 08:20:16 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 2/9] scripts/coverity-scan/COMPONENTS.md: Update slirp
 component info
Date: Tue, 26 Jul 2022 16:20:05 +0100
Message-Id: <20220726152012.1631158-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220726152012.1631158-1-peter.maydell@linaro.org>
References: <20220726152012.1631158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Update the regex for the slirp component now that it lives
solely inside /slirp/, and note that it should be ignored in
Coverity analysis (because it's a separate upstream project
now, and they run Coverity on it themselves).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-id: 20220718142310.16013-3-peter.maydell@linaro.org
---
 scripts/coverity-scan/COMPONENTS.md | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/coverity-scan/COMPONENTS.md b/scripts/coverity-scan/COMPONENTS.md
index a61d011d9a4..3aad9cdfaf4 100644
--- a/scripts/coverity-scan/COMPONENTS.md
+++ b/scripts/coverity-scan/COMPONENTS.md
@@ -108,8 +108,8 @@ qemu-ga
 scsi
   ~ (/qemu)?(/scsi/.*|/hw/scsi/.*|/include/hw/scsi/.*)
 
-slirp
-  ~ (/qemu)?(/.*slirp.*)
+slirp (component should be ignored in analysis)
+  ~ (/qemu)?(/slirp/.*)
 
 tcg
   ~ (/qemu)?(/accel/tcg/.*|/replay/.*|/(.*/)?softmmu.*)
-- 
2.25.1


