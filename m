Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DAD04CB55F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 04:19:19 +0100 (CET)
Received: from localhost ([::1]:44424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPbzq-00062b-K7
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 22:19:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPbsW-0006x6-UV
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:11:44 -0500
Received: from [2607:f8b0:4864:20::102a] (port=44947
 helo=mail-pj1-x102a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nPbsU-0003WX-71
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 22:11:44 -0500
Received: by mail-pj1-x102a.google.com with SMTP id
 gj15-20020a17090b108f00b001bef86c67c1so3497259pjb.3
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 19:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0C+p7bytk3qLimeI5anVabh7r6fqfbnBHos9vxQEE0I=;
 b=UdfoGZvrfcdeGnSWL3b2agfjxComzHVvPdzgqrCtAWMBlPC40H9+q2vZWw4K2XmRUn
 uob50IVomq10h/O+3BWkyicuQs+OKXqdfWD0AWfUqDXqCxg4w79ple53gstMHYt19Egz
 L8Z44RYMawNscMR5XxqNEH1/dXWbM8r1JWNefMII9JLgcDUmuMqsumLqxoE3fa12R0HV
 TWutziyk12IOFQFAGTEZ8cC2mtCxFb8BBklsbJ9vlpM0wCifwkBCJweLmaNB+3sQ5O6G
 IngaYjqgYSPnjZAo9KX3ko9hTNY+TDiU+fNlnXX8PkC9C//zczN4DawNTEW1F/T3orY8
 glbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0C+p7bytk3qLimeI5anVabh7r6fqfbnBHos9vxQEE0I=;
 b=JgaWwQqhFBeF195meLNbXhVBJfRtmhHimwHf/zYspOtltFv3e8BwTTNWI8I/mn0E1Q
 RXzy8tFfet0nMgYUyteptbT5L9f7DAYh9Ia1xaFHVqEsKLIACPrP4fZJX9peiAOIpnRZ
 H60VLqiUpemw+DRBFxC30l/mCtrAP7WaNmZ2aJiWF3Q8BLwPzIeIvL5v+Vw7xQiSERZE
 mFTgDkhQA8B0VbMJY2RALsnYqSsmumf5h7xKPMUJlUvXPOd1Fg5m33U4Yw+Z2MygKLdx
 h7q15CygmEcoltrwtyRkhdBHd5hd+h86jfCtCxyHK+BnZ79HA1VRNTVg82pEB8td3cGX
 mgXw==
X-Gm-Message-State: AOAM533M0e/rl4Gtg7eDLII8vDVGWwEt+ExbLx9RmNjKC/0T38Blw8Gh
 cRD8xJbgShvHW/htqQb+kCkxfKOK/kXYxw==
X-Google-Smtp-Source: ABdhPJx2a85X7M/zONYFP5m9y14YVPeYYkSvRjxM61XmoWE6vBc9yjLCvhCM3Ish2rkT3Fb3N1hiLA==
X-Received: by 2002:a17:903:41c5:b0:151:a579:bc5e with SMTP id
 u5-20020a17090341c500b00151a579bc5emr2670993ple.113.1646277095006; 
 Wed, 02 Mar 2022 19:11:35 -0800 (PST)
Received: from localhost.localdomain
 (2603-800c-1201-c600-e819-4400-f268-c391.res6.spectrum.com.
 [2603:800c:1201:c600:e819:4400:f268:c391])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a056a00170700b004e01663f59bsm605789pfc.117.2022.03.02.19.11.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 19:11:34 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] tcg/s390x: Fixes for host vector codegen
Date: Wed,  2 Mar 2022 17:11:29 -1000
Message-Id: <20220303031132.444233-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102a
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: qemu-s390x@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

I've run some risu tests for target arm neon on s390x
and have found a couple of bugs.


r~


Richard Henderson (3):
  tcg/s390x: Fix tcg_out_dupi_vec vs VGM
  tcg/s390x: Fix INDEX_op_bitsel_vec vs VSEL
  tcg/s390x: Fix tcg_out_dup_vec vs general registers

 tcg/s390x/tcg-target.c.inc | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

-- 
2.25.1


