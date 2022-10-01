Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D73E95F1E2D
	for <lists+qemu-devel@lfdr.de>; Sat,  1 Oct 2022 19:09:09 +0200 (CEST)
Received: from localhost ([::1]:58314 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oefzA-0007qL-VO
	for lists+qemu-devel@lfdr.de; Sat, 01 Oct 2022 13:09:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50676)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefI9-0008LK-Ip
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:41 -0400
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34]:39770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefI7-0006DC-Jr
 for qemu-devel@nongnu.org; Sat, 01 Oct 2022 12:24:41 -0400
Received: by mail-qv1-xf34.google.com with SMTP id z18so4439939qvn.6
 for <qemu-devel@nongnu.org>; Sat, 01 Oct 2022 09:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=hVHPTtrjmM6MNnCdxtnW1ZJbSHSO1tW4oindFVrgmZU=;
 b=onJGwdnkg+b6fFSsOItnuuTHvQR8qpV76LpSBLr6ZnsZPNKs3LZSvijmu13cwzl1Rl
 JoQmy41pCEMDX76xZzwQQS6kZDeYnneVcQ3ffY4IiZ+rfhm+JpwfboDVHGgbitusCBzP
 IdipD78AWWDPruAyfAkNBJGC+Q43wnUWuqY2tjv5aSpWRATj1XEded6smZX03zriRd1E
 PMMS75V6c1nVdUoGg6rb/EtnhM7GNdGrHVq8anUCIX69jaF3m/1HjsIweBhkRHDlv+6o
 zQ9rpFrcp3oKGQLnk45aT6VUtne6OWV/e4yKRgMSIZPntoghTHtS60qqlGYTotgZq2v+
 +CmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=hVHPTtrjmM6MNnCdxtnW1ZJbSHSO1tW4oindFVrgmZU=;
 b=dlws0aShGvPnllYhPRKJoncAwVFHrH7j019GtOpBTplNT7Y1iYfXXnr1N9HmpG3/Ei
 uSYlCLjpi9bZyFrTKYjFmYcr+631hNVqPWOKjPGAKxOTCTg2uZHGyBPdLko8VfTaG9NP
 WhrJONA+Jsmm+VMZb6u2Rq3d4NhDOAl6BJHHtOMHpTIVJHnBvhea60HFyc6h4lrTpAUz
 mVgDby0jh8egoQzmBz34eMD5Mq04inYwRRgAGX9bdtmaf3bxPvXt2OnccQIA+YOe15ij
 l4TrfYiCxgcl6R7I1Gy4OwU48ySUepX9S11OTsu4/iH9PaiUK8boymJTV2H9lqNMpYf+
 D/eA==
X-Gm-Message-State: ACrzQf1Xmk/H63FO0Zrjzboa+VWNoir8gc4y8aREYFqIdV5jH8WQx2x6
 3hWLvvMr7FhWWTJl9vc3EYld5HVDEHGhbQ==
X-Google-Smtp-Source: AMsMyM5D1HAJ0HuHxckJc+bCh+9tAuDGffKcuejDIRFP7d0BkNWioX3q4D4kP3CKnTXldB/O9a9E+A==
X-Received: by 2002:a05:6214:19c2:b0:4b1:7a38:49c1 with SMTP id
 j2-20020a05621419c200b004b17a3849c1mr3267819qvc.1.1664641479007; 
 Sat, 01 Oct 2022 09:24:39 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:24:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 31/42] target/arm: Add isar predicates for FEAT_HAFDBS
Date: Sat,  1 Oct 2022 09:23:07 -0700
Message-Id: <20221001162318.153420-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f34;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf34.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The MMFR1 field may indicate support for hardware update of
access flag alone, or access flag and dirty bit.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 7108568685..e499a84850 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4100,6 +4100,16 @@ static inline bool isar_feature_aa64_lva(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR2, VARANGE) != 0;
 }
 
+static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) != 0;
+}
+
+static inline bool isar_feature_aa64_hdbs(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, HAFDBS) >= 2;
+}
+
 static inline bool isar_feature_aa64_tts2uxn(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, XNX) != 0;
-- 
2.34.1


