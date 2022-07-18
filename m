Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7D8157855F
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 16:29:44 +0200 (CEST)
Received: from localhost ([::1]:45744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDRkl-0002SH-Qd
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 10:29:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDReX-0007ab-Br
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:23:17 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDReV-00075l-VU
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 10:23:17 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 ay11-20020a05600c1e0b00b003a3013da120so7962324wmb.5
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 07:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9fX0PWsGGqHc0At9k8nXKYGA8rQI/irOTgP5KrnmEOw=;
 b=o+jU7BnOTAvN1h6MEMg+xxQAZjCIOFAVWhPXxYXbFlsH62MgIrCpUgO+L4EUs9Q+CE
 uTaRBm6Ru4/ywgVSXCMn8egK/GTpO/b2M6xjgTdbG4t6fl6xvhYvBiXoisD26eKu1r5d
 e7KTRz82DfevOrWRyW7yfA5XSAI0sNlk3dMhMbNf97LC1qJusPmdueErTht64HE5tE7J
 oS/j4ON0kndiowfq6eFtpWjgg35CyoRLNgQfiy4lFEgmCquDzZEfoPKA5HmaVUBAKQUs
 nBv+40iW+iKW5uaLwj7OaHenf2k6AOpA+TQkVeo0JEyxXEFOGJq/IufznoeVLMm/Z2oF
 MqGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9fX0PWsGGqHc0At9k8nXKYGA8rQI/irOTgP5KrnmEOw=;
 b=UxfOQSxrK1Xy+XJb0pOF20o1a8wHO88gOU7MosfU0GQvu0/OBMmnR8Ka8hUSkL/G+r
 Gk2zGgN96Njhzv0psWRVWdQ595XldMC0RSZv74bd1r3jAfVwSPLzq+vlsa8HeR35EHF6
 yKSIBitOt0NkZDDbUFlFIehWFMCpEUuagC9E0hiM2ZXM3Jd+4mLnQ9HTcKWCM25g6EMk
 P1YnpMQkCj5FCo+9nVhq8nBh+tqfumDG5jyj9HtJs2ptsn/CkXOnOqxF0KFrw+24E6V6
 QMT3zw7QLbzx4kim9v0RncI7ICiX52KGEC9jw87HYsi0AH05MKRhIxXao2P5/vgszWru
 NH7A==
X-Gm-Message-State: AJIora+d/fud8boKiBY3Cz7IMmea1itrYEQgl3OgsgQV/DwdhjqN9C6b
 n/ELCApZuaBTKYvWOR7T6t4Yt+V3ykjFjA==
X-Google-Smtp-Source: AGRyM1vImBRidKdpSWNmdsQ8of6RDoi/pW2qhr5NGZTCAgyr4sZzkMfbhoZ7dqMkF71tBQpTsjW3Gw==
X-Received: by 2002:a7b:c7d8:0:b0:3a3:1b8a:97a4 with SMTP id
 z24-20020a7bc7d8000000b003a31b8a97a4mr4722248wmk.160.1658154194173; 
 Mon, 18 Jul 2022 07:23:14 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c12-20020a5d4ccc000000b0021d6e758752sm11079694wrt.24.2022.07.18.07.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 07:23:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 2/2] scripts/coverity-scan/COMPONENTS.md: Update slirp
 component info
Date: Mon, 18 Jul 2022 15:23:10 +0100
Message-Id: <20220718142310.16013-3-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220718142310.16013-1-peter.maydell@linaro.org>
References: <20220718142310.16013-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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


