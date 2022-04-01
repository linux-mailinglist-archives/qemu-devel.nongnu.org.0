Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A3394EF22D
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 17:02:57 +0200 (CEST)
Received: from localhost ([::1]:42994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1naInf-0006gZ-UJ
	for lists+qemu-devel@lfdr.de; Fri, 01 Apr 2022 11:02:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIlx-0003hB-70
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:01:09 -0400
Received: from [2a00:1450:4864:20::42d] (port=39761
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1naIlv-0005iB-AT
 for qemu-devel@nongnu.org; Fri, 01 Apr 2022 11:01:08 -0400
Received: by mail-wr1-x42d.google.com with SMTP id j18so4664648wrd.6
 for <qemu-devel@nongnu.org>; Fri, 01 Apr 2022 08:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Z1XQpnTzzax90Lh6sULRJEKvqLBLpmW6JvIqcejUeVw=;
 b=wNkQqP6naLIT65DWIY2ns+pOgLwMThCwDBD/G+hCmKKItN7pQkyYmPUo5F2oTJe5Gy
 LrTpAYtjeh8NHletIJISzg8NPIEtV0dGPcxVVklTWRnpTHwtpEWIWGOtAp/1jdHOm3hh
 9AOlOrIyBb7AfWdIKaM6yQsmIZdKQ71tidADf5/EGyzPtOFOBxUshGKDM6OHw2hQTTu8
 u6xaZrE1XOluOvK+Ea+ZZm67WGaWKPaaDrobZI4D5aQLvRIixcIXv8/mQXVlV/4ITz6R
 ll/MRqlwe7omqOC3qYRw9thwD13Qop1FtSVN6KHATdqHjhHg1vIcktUjYnZIIEPiGqzL
 4caQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z1XQpnTzzax90Lh6sULRJEKvqLBLpmW6JvIqcejUeVw=;
 b=x/p7vCBeWa2GyKlxMxWtYOkfmgvdJZoryyQIqLNTR88ySmdS/Co2ttUBTeqIf6z5zU
 ULNSB7lglzGsGjXRZfa0fRUS2O66D1VGPwPdkKmC3nqTjVP96/0jdueAJLfrCvdeaTYp
 Tk3zQFSP2GPlsxXrfSeoVZn7RJZF07vKJznsU/hq8okLkCdg11vHf6fRNRVw2ryhF1fX
 Yp1rNqjPlsrOrOy1fg/by2L7goi/KgaHVDADYYd1PlFI8bq7Up0sY2FRlmuVlkWVHkid
 fPHzj/i8BguW0YtJsdqHedu5ry1nLWRvl9IaRaO5qXFT2Up3GFPS6YEMA8J9ODUXjQg8
 2LsQ==
X-Gm-Message-State: AOAM533Pv/e0HLNz3yEylrDeyBzB84MuPoWC+j8SUJsnzK2yS7ogLYh5
 iKBGx5r0rC5xCmTBC0UrhOQNhTJAoh8xjw==
X-Google-Smtp-Source: ABdhPJynz/8khrhlXYAF/jteC+4GaQQUexE3dS07pT1MRV0zwx2SWz9pDY2iouGk3k2/A9zBdszlcg==
X-Received: by 2002:adf:bb54:0:b0:203:e244:fbe4 with SMTP id
 x20-20020adfbb54000000b00203e244fbe4mr7980525wrg.313.1648825265908; 
 Fri, 01 Apr 2022 08:01:05 -0700 (PDT)
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 6-20020a05600c020600b0038cbb21fb00sm2084023wmi.39.2022.04.01.08.01.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Apr 2022 08:01:05 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 5/6] MAINTAINERS: change Fred Konrad's email address
Date: Fri,  1 Apr 2022 16:00:54 +0100
Message-Id: <20220401150055.421608-6-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220401150055.421608-1-peter.maydell@linaro.org>
References: <20220401150055.421608-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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

From: Frederic Konrad <konrad@adacore.com>

frederic.konrad@adacore.com and konrad@adacore.com will stop working starting
2022-04-01.

Use my personal email instead.

Signed-off-by: Frederic Konrad <frederic.konrad@adacore.com>
Reviewed-by: Fabien Chouteau <chouteau@adacore.com <clg@kaod.org>>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 1648643217-15811-1-git-send-email-frederic.konrad@adacore.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 .mailmap    | 3 ++-
 MAINTAINERS | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/.mailmap b/.mailmap
index 09dcd8c2169..2976a675ea5 100644
--- a/.mailmap
+++ b/.mailmap
@@ -56,7 +56,8 @@ Alexander Graf <agraf@csgraf.de> <agraf@suse.de>
 Anthony Liguori <anthony@codemonkey.ws> Anthony Liguori <aliguori@us.ibm.com>
 Christian Borntraeger <borntraeger@linux.ibm.com> <borntraeger@de.ibm.com>
 Filip Bozuta <filip.bozuta@syrmia.com> <filip.bozuta@rt-rk.com.com>
-Frederic Konrad <konrad@adacore.com> <fred.konrad@greensocs.com>
+Frederic Konrad <konrad.frederic@yahoo.fr> <fred.konrad@greensocs.com>
+Frederic Konrad <konrad.frederic@yahoo.fr> <konrad@adacore.com>
 Greg Kurz <groug@kaod.org> <gkurz@linux.vnet.ibm.com>
 Huacai Chen <chenhuacai@kernel.org> <chenhc@lemote.com>
 Huacai Chen <chenhuacai@kernel.org> <chenhuacai@loongson.cn>
diff --git a/MAINTAINERS b/MAINTAINERS
index cc364afef73..68142340bd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1533,7 +1533,7 @@ F: include/hw/rtc/sun4v-rtc.h
 
 Leon3
 M: Fabien Chouteau <chouteau@adacore.com>
-M: KONRAD Frederic <frederic.konrad@adacore.com>
+M: Frederic Konrad <konrad.frederic@yahoo.fr>
 S: Maintained
 F: hw/sparc/leon3.c
 F: hw/*/grlib*
-- 
2.25.1


