Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5338D3ADB23
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:35:22 +0200 (CEST)
Received: from localhost ([::1]:54970 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luesL-0001Hq-CP
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55496)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejy-0003pR-2o
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:42 -0400
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c]:40911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejt-0003cd-Cr
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:41 -0400
Received: by mail-pg1-x52c.google.com with SMTP id m2so10524336pgk.7
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Yy09HFXA/NASjDT3bmx0qnRV9VbZG6YqFHV8U+MenEU=;
 b=n0fb8U5HvjzyiL+pQjY0icbU6efCOTvW7FjgBsJr8ge+pVcjvXJYOHErHp0TvB/7fB
 tQax6iEWHv2A6cGevaa9V42AWcxN5xzhmEZkAgs3ZhdmrQfTz6xtLID/smKvG9BRqN2/
 LEiLqaFUDQ++1YM/PFbxxnwbTporZ/j47G0Ga3WArmWjTHGE0mBVjjHXuht0a5KpSVoQ
 U+GQHPaFhX/sVtLqv6I2t539SDJqjSou05dPR3cM24SvSwwNJ5HYdY+Y3nVf9JC+HmEz
 nDz50Jx77GadSAs+HYvHb9IbhJGJ5rddLRNI1GzwTASFox91H6nFuv2+UiqHn7jsQHxX
 KZSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Yy09HFXA/NASjDT3bmx0qnRV9VbZG6YqFHV8U+MenEU=;
 b=NlA85ITrxRMMfWrX32beKZOCvKq7ao5pSMUfah/JipcDjTNmGRi8otL/HCaby0zAt1
 hF1vLodu5TmIoz61Kca/M+RbsRlJbmAuducOk7Rxpk7Zcb2Sv8xZh5eWogvJYUfaD/u+
 e0PJnbZYy0cRkTou+PMFMTySgYmrh69km7pIherofezWbjg9haLfLItPG8WTFyalwWYe
 6hksQlMg5ZoOnw8syOO5pOcXx9WnZUQpUW2qAMOrXqk/+0tvcimCyddL6SM8WLxmEHtS
 vA4rUhBlq4S5Mnho5ZzYEo1i/fqG2VavGJ3wrnwoNhiTTkarReVp0qX8G47ny8fkrGdW
 kxAw==
X-Gm-Message-State: AOAM531SG6FmLgHGQ4qx64yfS5rlV5Y8MOz4okmSMDRPTEEsDSFyFFUN
 3zZn7qU8jcH14G3gdbwIeViBFnaJUYF3pw==
X-Google-Smtp-Source: ABdhPJwtFCaYMftAPaZHKBswh5QhPd9ClEeXbZbqgFXXCvCy/wdW76gFafgwqGmC/LEYMjEjTH/ctg==
X-Received: by 2002:a63:a805:: with SMTP id o5mr15894498pgf.328.1624123596119; 
 Sat, 19 Jun 2021 10:26:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/15] hw/scsi/megasas: Improve megasas_queue_ops
 min_access_size
Date: Sat, 19 Jun 2021 10:26:23 -0700
Message-Id: <20210619172626.875885-13-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52c.google.com
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
Cc: Fam Zheng <fam@euphon.net>, Hannes Reinecke <hare@suse.com>,
 qemu-block@nongnu.org, mark.cave-ayland@ilande.co.uk, f4bug@amsat.org,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This device is a read-zero-write-ignored device.
We can trivially support any size operation.

Cc: qemu-block@nongnu.org
Cc: Fam Zheng <fam@euphon.net> 
Cc: Hannes Reinecke <hare@suse.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/scsi/megasas.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/scsi/megasas.c b/hw/scsi/megasas.c
index c98cb7a499..197b75225f 100644
--- a/hw/scsi/megasas.c
+++ b/hw/scsi/megasas.c
@@ -2207,7 +2207,7 @@ static const MemoryRegionOps megasas_queue_ops = {
     .write = megasas_queue_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .impl = {
-        .min_access_size = 8,
+        .min_access_size = 1,
         .max_access_size = 8,
     }
 };
-- 
2.25.1


