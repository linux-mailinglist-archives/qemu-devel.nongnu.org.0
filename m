Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17A482EF7BE
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jan 2021 19:56:17 +0100 (CET)
Received: from localhost ([::1]:52932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxwvo-0007lQ-62
	for lists+qemu-devel@lfdr.de; Fri, 08 Jan 2021 13:56:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34206)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwri-00027I-EY
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:52:02 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:39181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <leif@nuviainc.com>) id 1kxwrg-0000uJ-T3
 for qemu-devel@nongnu.org; Fri, 08 Jan 2021 13:52:02 -0500
Received: by mail-wr1-x42c.google.com with SMTP id c5so9947162wrp.6
 for <qemu-devel@nongnu.org>; Fri, 08 Jan 2021 10:52:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=puA6/puXorIWl8XVvGX9+7qdGtTAWfovzDg6hzeCqzU=;
 b=e+Y85H6iaUqPYHcxfNj7Djbm2xfNZwQsFBtoS82ht05TZkYZXVOO8TDYK6/day16BG
 k9mfawz3IrR9ymxLsklYsJgJWy/U0+1DK455mnAQYNgmqgyGlCgGjwkIho53xzEIWnsE
 Wkm5ow5ImbRAUwaMgQzNC3PvzWysDAn9LNe909u+IITIdnX1OokLEkO0vFDoZEZ4Qfji
 OQbm+sOKEQ8rpyfEanmoNlW3Jol/uS7Ngkrbt6TKWDzjXt6F3O6wABPTcfMNSH0hPXqp
 Lw6ulIesFrTm5yymV8pUJgZ5VZT2MG55UscNpivESY1IkTi4fKf1ifSU4DOtEpU5AuGp
 vpwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=puA6/puXorIWl8XVvGX9+7qdGtTAWfovzDg6hzeCqzU=;
 b=uMu2LnpTyWJaJzorwd899UfoLIkzA7m2y31MN9iKxcXDEQN7KGQm257cOaw5nB9PYo
 /wY9DGwDvXxqJuOda2/C7Mr1seS5M2UMZ2b1BdBPB2t4ND3F9kETbD+4qXPJskgv08O0
 6BnP0JMpKCYkik3wX4+zGkpEgBMci2n6DBqutgm4kUfDZiCAnXuj2YGIp7BhzmeaRTA/
 NvHfWJowZrn9ueVaMfyPRZDjiVnBhSRN/Ga/hMWNfoN7S3fN2efG4AWchpDpQK9htJFi
 LBjaDTyejAWmEqBtKocQ9dSiCP3Z4226TreLGksWV9w/DfI6rTdcMu3UCsPn1JqRkd0G
 IWaQ==
X-Gm-Message-State: AOAM533qGCZLAnhEH1d9zY1fT0oITSHNqc3I+6UKy2gWF9a5twTeqtWo
 EObFglAq0XEGGXs9LNTMfCxVUkgo+8qeexT02vjVJvl5eibMLqj4XRksa0Uu9/2nI5A97MH+S4T
 WTphtdMZXyKgkt95qnoA4fWS6yKIFYD1DaGHcFI+91H94bQuytTaxTuZwKn4ipZkqKqaZAQ==
X-Google-Smtp-Source: ABdhPJwQmo8WCGXwztg+movEQFMWwlVZODimGGFInmo09t9NDOVp6HwanSIq25wtXVg3UFclM9fEAw==
X-Received: by 2002:a5d:6708:: with SMTP id o8mr4970661wru.64.1610131919324;
 Fri, 08 Jan 2021 10:51:59 -0800 (PST)
Received: from vanye.hemma.eciton.net
 (cpc1-cmbg19-2-0-cust915.5-4.cable.virginm.net. [82.27.183.148])
 by smtp.gmail.com with ESMTPSA id b19sm12353373wmj.37.2021.01.08.10.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 10:51:58 -0800 (PST)
From: Leif Lindholm <leif@nuviainc.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 4/6] target/arm: add descriptions of CLIDR_EL1, CCSIDR_EL1,
 CTR_EL0 to cpu.h
Date: Fri,  8 Jan 2021 18:51:52 +0000
Message-Id: <20210108185154.8108-5-leif@nuviainc.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210108185154.8108-1-leif@nuviainc.com>
References: <20210108185154.8108-1-leif@nuviainc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=leif@nuviainc.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Leif Lindholm <leif@nuviainc.com>
---
 target/arm/cpu.h | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 063228de2a..18c1cb02bb 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1736,6 +1736,37 @@ FIELD(V7M_FPCCR, ASPEN, 31, 1)
 /*
  * System register ID fields.
  */
+FIELD(CLIDR_EL1, CTYPE1, 0, 3)
+FIELD(CLIDR_EL1, CTYPE2, 3, 3)
+FIELD(CLIDR_EL1, CTYPE3, 6, 3)
+FIELD(CLIDR_EL1, CTYPE4, 9, 3)
+FIELD(CLIDR_EL1, CTYPE5, 12, 3)
+FIELD(CLIDR_EL1, CTYPE6, 15, 3)
+FIELD(CLIDR_EL1, CTYPE7, 18, 3)
+FIELD(CLIDR_EL1, LOUIS, 21, 3)
+FIELD(CLIDR_EL1, LOC, 24, 3)
+FIELD(CLIDR_EL1, LOUU, 27, 3)
+FIELD(CLIDR_EL1, ICB, 30, 3)
+
+/* When FEAT_CCIDX is implemented */
+FIELD(CCSIDR_EL1, CCIDX_LINESIZE, 0, 3)
+FIELD(CCSIDR_EL1, CCIDX_ASSOCIATIVITY, 3, 21)
+FIELD(CCSIDR_EL1, CCIDX_NUMSETS, 32, 24)
+
+/* When FEAT_CCIDX is not implemented */
+FIELD(CCSIDR_EL1, LINESIZE, 0, 3)
+FIELD(CCSIDR_EL1, ASSOCIATIVITY, 3, 10)
+FIELD(CCSIDR_EL1, NUMSETS, 13, 15)
+
+FIELD(CTR_EL0,  IMINLINE, 0, 4)
+FIELD(CTR_EL0,  L1IP, 14, 2)
+FIELD(CTR_EL0,  DMINLINE, 16, 4)
+FIELD(CTR_EL0,  ERG, 20, 4)
+FIELD(CTR_EL0,  CWG, 24, 4)
+FIELD(CTR_EL0,  IDC, 28, 1)
+FIELD(CTR_EL0,  DIC, 29, 1)
+FIELD(CTR_EL0,  TMINLINE, 32, 6)
+
 FIELD(MIDR_EL1, REVISION, 0, 4)
 FIELD(MIDR_EL1, PARTNUM, 4, 12)
 FIELD(MIDR_EL1, ARCHITECTURE, 16, 4)
-- 
2.20.1


