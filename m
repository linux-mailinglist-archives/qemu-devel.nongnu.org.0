Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1D569C7A4
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 10:28:03 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU2Ft-0005oc-S8; Mon, 20 Feb 2023 04:14:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fr-0005na-0e
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:39 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU2Fp-0003nx-Ft
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 04:14:38 -0500
Received: by mail-wr1-x432.google.com with SMTP id p8so467435wrt.12
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 01:14:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PYSWNkl19vdmz07TNk4hcBZdhyvX8ZTfJLLhpTEmM7g=;
 b=VMMF68IfCFBiDNEPh2dFsd5bYegYPyfqkTAd6Wm+uAcTN42e87fDZX7tljlFHKUz0r
 nCjsFJ42bcvyhzqmbdvKRRqjFWLeStLnTwoXMLZW/Df1KPOfunFVQazS/XZzPWoBt812
 wCh6metLi+npgDYELGFsfAKpKaPfO/WwqZLpXr8KOznKfl/pKXogh1NPNX0sqgM8hRsz
 cio9jLxRR12hIfD3eCgkEHoOnGO9HmRYxSmVoBVv7mRCa4nyiHT+U913l4hhDnXiKMTA
 3FWtqdenLKc0TBxDWiiEMCyH6ZvQ7UQUKA4Di0tDsaEDba+2rMRIanbahdFYTQTr6QSV
 c2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PYSWNkl19vdmz07TNk4hcBZdhyvX8ZTfJLLhpTEmM7g=;
 b=P5mItirDn6hHGeMN2si2lCGfYN1EwrNjVhIYETjppyahOhwcl6uuCJ/6gafmhBkraW
 leV4UPQ+diIFdaPOKnGyCDsfUtjscZhZUCIvGpSvXASgwQzTa0HUWqyUrZNGAfnCer/7
 xH+YecyCvrHnNAavBYcsU224CkqurI8zsVjL9i6MnFqS8JBRE84Q3B0QzQGHwuuqJ3W6
 rPtZVG7zL7ZsUGZy7mCwI00ekFq+bW3s3brcId6CWC+VqG52jLDjRt2oJL8GlB4p+GlJ
 iUDznKUFMnFVPkg/68R8H1n8+Tz11eo46ll/62ki8nwNE2cSjzgrTL/X4Y1eJ/AMThdP
 W/7w==
X-Gm-Message-State: AO0yUKVIGnFHtqA2ggZuEnL7orvwYet+ZCj3Wl9WgmxKZVIaRJW0HwMp
 U1K48jV7qzgAjd9JvQ1z4U6glphVj1u2PexM
X-Google-Smtp-Source: AK7set+DqnVCp6r34paNc3EB7u3lBl1uk3qnFaofMI4Pt9jycEDbc1to+tcUudwi65nxFddVPascWg==
X-Received: by 2002:a5d:5e93:0:b0:2c5:5297:24ae with SMTP id
 ck19-20020a5d5e93000000b002c5529724aemr1418808wrb.2.1676884476580; 
 Mon, 20 Feb 2023 01:14:36 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 w15-20020adfec4f000000b002c54241b4fesm5428562wrn.80.2023.02.20.01.14.35
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 01:14:36 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, John Snow <jsnow@redhat.com>, qemu-block@nongnu.org,
 qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 07/24] hw/ide/atapi: Restrict 'scsi/constants.h' inclusion
Date: Mon, 20 Feb 2023 10:13:41 +0100
Message-Id: <20230220091358.17038-8-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220091358.17038-1-philmd@linaro.org>
References: <20230220091358.17038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Only atapi.c requires the SCSI constants. No need to include
it in all files including "hw/ide/internal.h".

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230215112712.23110-7-philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/ide/atapi.c            | 1 +
 include/hw/ide/internal.h | 1 -
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/ide/atapi.c b/hw/ide/atapi.c
index 0a9aa6f009..0c36bd0afd 100644
--- a/hw/ide/atapi.c
+++ b/hw/ide/atapi.c
@@ -27,6 +27,7 @@
 #include "hw/ide/internal.h"
 #include "hw/scsi/scsi.h"
 #include "sysemu/block-backend.h"
+#include "scsi/constants.h"
 #include "trace.h"
 
 #define ATAPI_SECTOR_BITS (2 + BDRV_SECTOR_BITS)
diff --git a/include/hw/ide/internal.h b/include/hw/ide/internal.h
index fc0aa81a88..29a8e79817 100644
--- a/include/hw/ide/internal.h
+++ b/include/hw/ide/internal.h
@@ -13,7 +13,6 @@
 #include "hw/isa/isa.h"
 #include "sysemu/dma.h"
 #include "hw/block/block.h"
-#include "scsi/constants.h"
 
 /* debug IDE devices */
 #define USE_DMA_CDROM
-- 
2.38.1


