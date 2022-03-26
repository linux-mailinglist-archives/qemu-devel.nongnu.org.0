Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DA94E8138
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 14:56:51 +0100 (CET)
Received: from localhost ([::1]:36076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY6uQ-000570-FQ
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 09:56:50 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qw-0007VQ-FG
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:24 -0400
Received: from [2001:4860:4864:20::2b] (port=41702
 helo=mail-oa1-x2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nY6Qu-0005Ve-Hc
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 09:26:22 -0400
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-dd9d3e7901so10708454fac.8
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 06:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7UhpieTmtFS288gQ6ONEYE1O22i32fWGmp3rPIltdFw=;
 b=hQEOV8VFb8U9KhfIMtbSVRjj4U8dQIg6g8SdNRWniBGSgJEbFp1ta/BicT2kRr6XKU
 QB7qn/cTuHEaOIdnfg/XifD1Ym44NxBCv7CRvUmBcsoK+4trJrlr048utnd54hU7GZOE
 rzNm/YrgNpYYYLnqwhRXbGiKlmv7kkoBTmrYaVGXn+nzjpN/mgBaSFE5VLg+14vqlxxB
 HvtvibTT82IGmSul/uxPxgBD8yYmy+IVdjazde6Ztp0vjQhFE5sBpTRWPVS6VN/aRh2A
 2suEdU7cLxf22Mh3E3rLwK5WciIf0PvX/rmtYfnu+FMhw4wV48QufNaJ7DplQ/eSB3Lm
 ZDmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7UhpieTmtFS288gQ6ONEYE1O22i32fWGmp3rPIltdFw=;
 b=meTj54hABm2q7Ro7X9zme30V4YHszF73xVaytlVLL56lKqSS2Z8EYw54O63U5FFsUf
 FSNvVGgP8Db+jFay/nMsf/G+xEpkCXsLag0NDF2A+VrBRif63TrTmu8IjgFJqu36ceJS
 aDukJ75j/lkS5At6UUpZir61uYaSPJa2/Bl14d6OS+F48t9wf41B7BZILbG/XzAdrIsx
 uSQyani+IvhuuzNx88OoeX61EUgatGKye1LDN1Q5JWNUCxwMRA72T7RR/v51F8oFilvM
 wSy2HpOe6EsiHHReYhLV92TZ0E93CILtZz8e/bGj2Gdsbtxg1bbISMutV44LVv2LzYAf
 CiGA==
X-Gm-Message-State: AOAM532zvIhLar7G4SoC4EfAiYO2lhZ1uC7jK9kn2sVo6p5tzLop0Ol8
 XNodYXKys2ZresKjyXRKWmALZZgv0VH4z+IW
X-Google-Smtp-Source: ABdhPJzxF6BgUz7ehH/eGBQ9bWLjnG9Yom1Ajl8XtNENIXbAmKyr4F9e1NUEpDwbIJtMdC418bPSpg==
X-Received: by 2002:a05:6870:204c:b0:de:10fe:ba3b with SMTP id
 l12-20020a056870204c00b000de10feba3bmr7190665oad.80.1648301178861; 
 Sat, 26 Mar 2022 06:26:18 -0700 (PDT)
Received: from localhost.localdomain (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 n62-20020acaef41000000b002ef646e6690sm4610331oih.53.2022.03.26.06.26.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 26 Mar 2022 06:26:17 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 18/39] util/log: Mark qemu_log_trylock as
 G_GNUC_WARN_UNUSED_RESULT
Date: Sat, 26 Mar 2022 07:25:13 -0600
Message-Id: <20220326132534.543738-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220326132534.543738-1-richard.henderson@linaro.org>
References: <20220326132534.543738-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:4860:4864:20::2b
 (failed)
Received-SPF: pass client-ip=2001:4860:4864:20::2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now that all uses have been updated, consider a missing
test of the result of qemu_log_trylock a bug and Werror.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/qemu/log.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/qemu/log.h b/include/qemu/log.h
index 2d9455dc85..3a1f3a6020 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -67,7 +67,7 @@ static inline bool qemu_log_separate(void)
 
 /* Lock/unlock output. */
 
-FILE *qemu_log_trylock(void);
+FILE *qemu_log_trylock(void) G_GNUC_WARN_UNUSED_RESULT;
 void qemu_log_unlock(FILE *fd);
 
 /* Logging functions: */
-- 
2.25.1


