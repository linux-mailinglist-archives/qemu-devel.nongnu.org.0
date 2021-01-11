Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF192F21E4
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Jan 2021 22:37:42 +0100 (CET)
Received: from localhost ([::1]:56024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kz4se-0004MZ-VF
	for lists+qemu-devel@lfdr.de; Mon, 11 Jan 2021 16:37:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kz4lS-0001Sa-6K
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 16:30:14 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:38280)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kz4lP-0000xR-CV
 for qemu-devel@nongnu.org; Mon, 11 Jan 2021 16:30:13 -0500
Received: by mail-wm1-x32b.google.com with SMTP id y187so127685wmd.3
 for <qemu-devel@nongnu.org>; Mon, 11 Jan 2021 13:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=we9c6C1MRPbmQWwXIzHfqjouqe399u/gPSbVvZhbUSk=;
 b=rXSUr4UpMYrIJ6Y30UWa7PQy6FKOaPaEd36k2twF3vO/OkmfwcqwxjQ3cK4BBuW8n6
 cHX50R5gG8Ibf1s4IfmhsQTn+WnNmnQJawbovAC/1tk/KUoWlE3c2MdfEY/Dk4jpSZxA
 xXuLAIisAv4NjhEbKsYnnDQ56j8PzWJGKE90LubpIvtV3U95WqzJZqD3kVeK/Yw2DOCX
 xqUqz/ocUq4d97XouaGm4VS+/AOA5UY/TAydJfNvmtjLxDxygHQIXT4V69vYcJ4/SZlN
 SLMwCs8wQjQC2JRRLxsMLTteq1eBp28XFINmHahikEONtYSIF0stUqH4l40xTqGOlTLP
 vejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=we9c6C1MRPbmQWwXIzHfqjouqe399u/gPSbVvZhbUSk=;
 b=t5ohXZzkcGuubilL7USiRcND8lbkmRufAeS4QqqAOtTa+sbZm6Ars6RumhcLNiSzqM
 sVP9GcpAFnt5/M209od3REzbqOrGzkvBXSuBwp/dko1tBPf8kEGrTzd1ApbT45yhCYeV
 //J5vrdlmBA2JLLVlsswfH2t8a2ltRFvDD+Mb4sUU5asDr24HTqFoz4dFj+gdP5CsyoO
 CrQVN4DSSWebaWP7XxnMHaqjXluqZKAS4IKpsQvbZI6MaSAClAN6C6klRWphMJsh19eq
 wNl5G2IPumqUNDyseu/UtdEQG7yP50PcIdmoHNrMgn7c7a7NZGV/DPH8XC6T3w09wccV
 lB2g==
X-Gm-Message-State: AOAM531QzA1C1tMB75YWByeswgRx/QFKtfmIb9R92u1PZp6DR4hJTRMQ
 uisLRU1uqPFOeicsSbjS6a0EWHDCWq0Jtw==
X-Google-Smtp-Source: ABdhPJxMoU2c9eed27OZNQWZF8ROi1zalrJ5uISLdLSq3UhVeMS2Y1pNuksdvchjZ+8WwWF5Yku7Xg==
X-Received: by 2002:a1c:65d4:: with SMTP id z203mr624980wmb.65.1610400609692; 
 Mon, 11 Jan 2021 13:30:09 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id x66sm737578wmg.26.2021.01.11.13.30.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 13:30:09 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/intc/ppc-uic: Make default dcr-base 0xc0, not 0x30
Date: Mon, 11 Jan 2021 21:30:07 +0000
Message-Id: <20210111213007.7381-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In commit 34d0831f38fd8 the ppc-uic device was added, with a dcr-base
property. The intention was that the default value of dcr-base should be
the one that most of our boards need, so that in the common case they
don't need to specify a property value.

All QEMU boards with a UIC use a dcr-base of 0xc0, with the exception of
sam460ex which has four UICs and so puts them at 0xc0, 0xd0, 0xe0, 0xf0.
So 0xc0 is the obvious right choice for the default dcr-base.

The board code conversions in commits 0270d74ef88623505 (bamboo) and
c5ac9dc64fa552a6 (virtex_ml507) assumed that default was 0xc0. Unfortunately
the actual default in 34d0831f38fd8 was 0x30, by mistake, so the
bamboo and virtex_ml507 boards were broken as they were converted
away from ppcuic_init() (which always specifies the dcr_base property
value explicitly).

Set the default dcr-base to 0xc0 as was intended, fixing bamboo and
virtex_ml507.

Fixes: 34d0831f38fd8
Reported-by: Nathan Chancellor <natechancellor@gmail.com>
Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
This is the right way to fix the bug I was trying to fix with
"hw/ppc/ppc400_bamboo: Set dcr-base correctly when creating UIC".

David: you probably want to put this patch in your ppc queue
before "hw/ppc/ppc405_uc: Drop use of ppcuic_init()", as that patch
also assumes the 0xc0 default.

 hw/intc/ppc-uic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/intc/ppc-uic.c b/hw/intc/ppc-uic.c
index b21951eea83..7171de7b355 100644
--- a/hw/intc/ppc-uic.c
+++ b/hw/intc/ppc-uic.c
@@ -274,7 +274,7 @@ static void ppc_uic_realize(DeviceState *dev, Error **errp)
 
 static Property ppc_uic_properties[] = {
     DEFINE_PROP_LINK("cpu", PPCUIC, cpu, TYPE_CPU, CPUState *),
-    DEFINE_PROP_UINT32("dcr-base", PPCUIC, dcr_base, 0x30),
+    DEFINE_PROP_UINT32("dcr-base", PPCUIC, dcr_base, 0xc0),
     DEFINE_PROP_BOOL("use-vectors", PPCUIC, use_vectors, true),
     DEFINE_PROP_END_OF_LIST()
 };
-- 
2.20.1


