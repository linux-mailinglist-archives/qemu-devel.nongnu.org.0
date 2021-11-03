Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7CA944432B
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:14:24 +0100 (CET)
Received: from localhost ([::1]:46644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miH1y-0002EE-WE
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:14:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwg-000262-CY
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:54 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:40619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1miGwd-0004ur-9h
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:08:54 -0400
Received: by mail-qt1-x82d.google.com with SMTP id l12so415045qtx.7
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:08:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BCE1WlXmmaCtgHYc/C0kxl+XaSWrlWSBPlh1JjzXRMo=;
 b=Dr5Woc4Jop+dRmFy5mBMeyansUnLV+/FsJS4uB39qyYwWLTHGQpgLLVAPDtt0juxeb
 MKmPkvzG6icckvrxTFI40cEBDFpQ4A8kzYNbro2rhvsbyQ2M9QYwg5cDD3pd1AXQd2s6
 OYzyY28DHM9ukEO0+dLR5iPqbhER0/24j3VYaARWLhzMR012z3RdxhhVKGK/A7brxqF9
 Wat0zJy/kYrMvz7K7YJrXGz35SItjpm89jteJV81JcTjRG5R7JIdb3lTZx6I1HetN3JN
 kRu6vs+h6c+or8SCAomxTGWQiKQrKOodGfryO/3PTvHeiwGkInv4IIAM78z4Mc0aXx+l
 bfqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BCE1WlXmmaCtgHYc/C0kxl+XaSWrlWSBPlh1JjzXRMo=;
 b=q5EWyB1WcLKkllbtrtFgsQ55edKK7NXdWJilbxBPyExThmqP5l5cVjL+avFqvCFDIm
 Gu5vmOCq/UZJ/a4mMXu3nktlg0V3HST7qkltezFrFF+FPFgWFh7zIzN9WVRGw7wIe3mQ
 5jakauahmDHhtetAdQtfYXHHuphvUE2qKB0v+ZNHg1imtqTiXNLe0FGPog4QBt5LyWFN
 CPkpdUC3WX/se7ew1Ifd2YTygrgkxAUi6v/lAzUunj910XquTjhAnlV0BFMHTeWbq8NR
 /UDyxDSklk8GKTKvqr8KxDh7I5xjKePpdlcNnbWCYwU4ajO49Hj5TMCDKqayYRw9uChB
 loqw==
X-Gm-Message-State: AOAM533LfhIL3SiL4Wx2tkjIuzBE0npeDWcCd7p0aORF82uBAFeVj6i+
 r3WCWXSBx/h1QsMe2QxnSmJhJtf/U5q35g==
X-Google-Smtp-Source: ABdhPJynE3EfW9/gAsxjwhWIAMHEijPLBvq3CqOiPc+McfDQikTajGZIPHwsoHj6OzgvDCTOKLmaNg==
X-Received: by 2002:ac8:5dc6:: with SMTP id e6mr46128401qtx.174.1635948530051; 
 Wed, 03 Nov 2021 07:08:50 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id z5sm1669377qtw.71.2021.11.03.07.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 07:08:49 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 02/23] linux-user/alpha: Set FPE_FLTUNK for gentrap ROPRAND
Date: Wed,  3 Nov 2021 10:08:26 -0400
Message-Id: <20211103140847.454070-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211103140847.454070-1-richard.henderson@linaro.org>
References: <20211103140847.454070-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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
Cc: peter.maydell@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This si_code was changed in 4cc13e4f6d441, for linux 4.17.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/alpha/cpu_loop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/linux-user/alpha/cpu_loop.c b/linux-user/alpha/cpu_loop.c
index b039369198..92de2a4424 100644
--- a/linux-user/alpha/cpu_loop.c
+++ b/linux-user/alpha/cpu_loop.c
@@ -151,7 +151,7 @@ void cpu_loop(CPUAlphaState *env)
                     info.si_code = TARGET_FPE_FLTRES;
                     break;
                 case TARGET_GEN_ROPRAND:
-                    info.si_code = 0;
+                    info.si_code = TARGET_FPE_FLTUNK;
                     break;
                 default:
                     info.si_signo = TARGET_SIGTRAP;
-- 
2.25.1


