Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4B3552444
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:53:22 +0200 (CEST)
Received: from localhost ([::1]:46680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3MWX-0002Ka-Jb
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdJ-0002s4-A2
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:18 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:40706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LdH-00021w-O7
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:56:16 -0400
Received: by mail-pg1-x530.google.com with SMTP id f65so10894109pgc.7
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jX6jS4dtrhW1QeYx18wps/PVKx5vjATldMSj/oHyJlI=;
 b=cJBQmN8u5foW7DhxY3Kw9hOfAhVoKSajQ78GZeVWOW7yFy/GEv1bOnFG7rIofo0yx6
 yE4APOAWhAw2s7JxGSxxgf5VuySEpcf2vF7Rpx1KXTdEcjZ7yM7BrHAQay3+mShMQkyb
 nZIfpoyDO4+7TBzVt4zPi4ipSP75XdTwZGHGAiZJJckCGIoQC41+djhLC/TK1lnPFSN8
 ZxMj6lHQJAYLjNO2frI+AuQhNWlS3/Aycdzisgk/Jmt8Df4yYb4l0ZfHRvHBljQCyChO
 QrpTVAroJaX933MxEQlYTqnZMBkmvqRi2SLh1GJYKhAbr5c9rXBu7LMbSjusgO4oc1xF
 he7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jX6jS4dtrhW1QeYx18wps/PVKx5vjATldMSj/oHyJlI=;
 b=63eZBhbmkbhnkYrehhRiJxw+6uXd3xmFRhCAL9cTjMwJ483UbRVZhmLaan4ZvcFcb9
 5T/r3k2AXaBcewXasjXvw0nwaRdPRK14zIlDms52JsN2Em1luiomrADU7mmaC8Eyha73
 FnFu4aSPtWm/tnIRD2CPD662qlygwjxM5NsAmjH10eMXLSgIMYBzBGYcku+ddo7qSJ7N
 r2tv1d466aqhxp8BcMdHJ77Nrc4PiHUMLl0mMIm50zgFQ12TEqwmdnIlOhDEYMU8Ld1e
 tYbAzbbZn6NEfnbWFGzgZ8riYfi5KYlP7OGSiWv+XrnqmRkwfpyq0Sh1MQakNDxbxMvb
 tgvg==
X-Gm-Message-State: AJIora8hw+t/qTOQgr0UtJzGD9mHxqs1QXeRx2Rya/Hc3AcZlsCZeOWl
 BAOPEqUN9i3mJAnWs1Xmravc4HKDtzHE1w==
X-Google-Smtp-Source: AGRyM1tlVm6+lQeIYC42uJQsN3JmSwqctCSB2quHEeKwaSvhvM8Z4k3YFqb+zqtAKcomg4CmYOmziA==
X-Received: by 2002:a63:de01:0:b0:3fd:9833:cdcf with SMTP id
 f1-20020a63de01000000b003fd9833cdcfmr22321148pgg.315.1655747774968; 
 Mon, 20 Jun 2022 10:56:14 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 z14-20020aa7990e000000b00525184bad54sm3850474pff.126.2022.06.20.10.56.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:56:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 44/51] linux-user/aarch64: Verify extra record lock
 succeeded
Date: Mon, 20 Jun 2022 10:52:28 -0700
Message-Id: <20220620175235.60881-45-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/signal.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/linux-user/aarch64/signal.c b/linux-user/aarch64/signal.c
index 8fbe98d72f..9ff79da4be 100644
--- a/linux-user/aarch64/signal.c
+++ b/linux-user/aarch64/signal.c
@@ -340,6 +340,9 @@ static int target_restore_sigframe(CPUARMState *env,
             __get_user(extra_size,
                        &((struct target_extra_context *)ctx)->size);
             extra = lock_user(VERIFY_READ, extra_datap, extra_size, 0);
+            if (!extra) {
+                return 1;
+            }
             break;
 
         default:
-- 
2.34.1


