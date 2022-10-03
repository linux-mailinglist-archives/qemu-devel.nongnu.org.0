Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCA05F33E5
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 18:49:03 +0200 (CEST)
Received: from localhost ([::1]:47978 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofOcn-0000A4-HX
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 12:49:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofOEA-0007vx-8M
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 12:23:34 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:39878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ofODz-0000Hk-Ov
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 12:23:33 -0400
Received: by mail-wr1-x434.google.com with SMTP id f11so14867948wrm.6
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 09:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date;
 bh=Lbf7DgzaGFcfNvaM2KqWvg7D8B8oETdPLTVE9MwyWyA=;
 b=Ztonl5fAaT/D1XIUjRAGtBLqZtEtQcOO1AcvFUMECHec08QSr81I/6drRHu7Vo04kZ
 TafWgLq/jo/oVeDQBhbq/+yjvy+neYzsDL1nhY9HshWoQ7H5YifBu/zrFDuVnTrArAyh
 dqgzyKH5AEu8pzIszOGakyk4M5TXQGU/uYEFw9pKVdD8K6oXAuJBRe94fWIC1cnN7Hzb
 5JkCdreKWWSudhFlLBYT3av90wbwunr4PatY3yLslPOJ0sqPH2KU9RnofAAM8yAWwhiK
 mnWbcaGZMqYVbb8cW/MsYTvGxPr2KptdfHJ8JAoDjDunQs1wT3OobfAZTPvO/UZnp0ie
 VyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=Lbf7DgzaGFcfNvaM2KqWvg7D8B8oETdPLTVE9MwyWyA=;
 b=64/bjjhpDt5qNZupHLgMHbzlVnZGEXSZpgq2kvmouCC6wP7rfE78eBoVZyCTCk73nz
 MKr/DVGL95vEZH2Gud25PQLSy8uNlIVVafgL5X92Ha/fmqHAkBEUVs9EjpjXGCQLcJSs
 eOPjEcsT2w5lJm3A8qAXnlWykadOD7WA2ek51vh03xP81nC2xgS5+MSLM/n9McFO3iIG
 yRKnadxy/JVCDq4bpUot48MiYLJ5S30pvVWcFFGuJfCK3SZjG9+lE1uQSpEygzzBuLx7
 4IdK4zzDSb7g1PZIxYGHyeWyNiTKKxsi5/rC6RQjh9zNbesSDrXPamIpMuSM0vHZzpZI
 hKzQ==
X-Gm-Message-State: ACrzQf0y70YzrCw+qeZoKFQdmPh3npmQmMXmrmqxFZp/X4Z0z0+i8XqD
 33SRz/vHBdcfTIg3bucmxW1KOjugvkK1Ug==
X-Google-Smtp-Source: AMsMyM7UkkYFU7thWBeE+K1/ByPF7FWvFlICQAxLaMBxEzw/tz9wN9Oz6zBlPyUQVD7PL0Y3PQpRZQ==
X-Received: by 2002:adf:dbc3:0:b0:22a:d393:bd84 with SMTP id
 e3-20020adfdbc3000000b0022ad393bd84mr13600563wrj.626.1664814199791; 
 Mon, 03 Oct 2022 09:23:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 o2-20020a5d62c2000000b0022afce9ea93sm9897856wrv.40.2022.10.03.09.23.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Oct 2022 09:23:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] docs/system/arm/emulation.rst: Report FEAT_GTG support
Date: Mon,  3 Oct 2022 17:23:15 +0100
Message-Id: <20221003162315.2833797-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221003162315.2833797-1-peter.maydell@linaro.org>
References: <20221003162315.2833797-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

FEAT_GTG is a change tho the ID register ID_AA64MMFR0_EL1 so that it
can report a different set of supported granule (page) sizes for
stage 1 and stage 2 translation tables.  As of commit c20281b2a5048
we already report the granule sizes that way for '-cpu max', and now
we also correctly make attempts to use unimplemented granule sizes
fail, so we can report the support of the feature in the
documentation.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/emulation.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index be7bbffe595..cfb4b0768b0 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -31,6 +31,7 @@ the following architecture extensions:
 - FEAT_FRINTTS (Floating-point to integer instructions)
 - FEAT_FlagM (Flag manipulation instructions v2)
 - FEAT_FlagM2 (Enhancements to flag manipulation instructions)
+- FEAT_GTG (Guest translation granule size)
 - FEAT_HCX (Support for the HCRX_EL2 register)
 - FEAT_HPDS (Hierarchical permission disables)
 - FEAT_I8MM (AArch64 Int8 matrix multiplication instructions)
-- 
2.25.1


