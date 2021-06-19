Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 182343ADB1F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 19:31:52 +0200 (CEST)
Received: from localhost ([::1]:45974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lueox-0003a7-1r
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 13:31:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejr-0003Sm-Nq
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:35 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38597)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1luejq-0003aU-6G
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 13:26:35 -0400
Received: by mail-pg1-x534.google.com with SMTP id t17so10538602pga.5
 for <qemu-devel@nongnu.org>; Sat, 19 Jun 2021 10:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4DqfBYyC7ObKfbG1l0o4eNafS1Tj4TIv+YV4IdJQSPo=;
 b=l2vev/wsBIu24+tueVFV7HZGAuMEDul93jt+Q89bB7LcdutySDUupFnMAcmgcAXjWc
 vVZwx0N08XkJikZOp+4z2m8ayhXJQoKlhSklb8l406FthQKEOJYMJp4SXiRB2xL2tNK3
 yT8SLpwzrTVdxPa+fMrr/SnmkF5SlgFSP9mH3YuKLFCFnu3wwrdkBleqrIQzfKFyVUkZ
 2j6vYjFQoYviLZFqBc4AO6HSZ83JHr5Zwb1pKx9WOJoPAbL6WzPPLawBcO6EtUBkxvEM
 XP62I9HVSCKJyUmZAsVh/1Ez9G3t3a5JBoQgw0kQ6s7HM8941xHimi1bgkG/toF+FbqB
 QBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4DqfBYyC7ObKfbG1l0o4eNafS1Tj4TIv+YV4IdJQSPo=;
 b=l/BkdX6lyZ1LOvby88SUhjN3DPMEej86uEhA8lWU/ABptblO0w/gcN1ijWMn8LZ0Oe
 EZo5q7M1szhWcRplA67QdtT5JhkKDCkhqavJ1pb9YcowYV+f+UQ43A0XFF+iLupwSgUW
 LaTH/Sv+Wbc5yyMw1lPds4hVJ/M3IpqJc/EjoNwyAf62DNj05kxd5NjjuM5UdpGJvpuG
 ZKJmOeWC3Lzkokknk6ePKnZjnfyOoi+hu7agDcxIhEq7gK8d0CXNMXLtzZ7AXf3RIYrN
 DPbYjp/ZHNB4FMIESTFsD5qo9rU4hCaRsoGni8ravk3CFAmy0W5BwOKGSfPe66zpamhm
 oxBA==
X-Gm-Message-State: AOAM533Ts3UaXk7C1eqMNxvg1PM7IKI5e9u2WA5jseUqiF/xE0y8Oapy
 b2GDZyAsBBv45hbqWGYEU7NjSeIj7ZyTxw==
X-Google-Smtp-Source: ABdhPJyP3K0xi71F9Rb5N36s9acDKRzrA4jpCFRf0CtkHaySxkbIHSpEbnnocUnKbMXk6UM7HL2ciA==
X-Received: by 2002:aa7:96e3:0:b029:2ec:e8a1:3d66 with SMTP id
 i3-20020aa796e30000b02902ece8a13d66mr10926914pfq.79.1624123592978; 
 Sat, 19 Jun 2021 10:26:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id co18sm2084241pjb.37.2021.06.19.10.26.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 19 Jun 2021 10:26:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/15] hw/net/e1000e: Fix size of io operations
Date: Sat, 19 Jun 2021 10:26:19 -0700
Message-Id: <20210619172626.875885-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210619172626.875885-1-richard.henderson@linaro.org>
References: <20210619172626.875885-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>,
 Jason Wang <jasowang@redhat.com>, mark.cave-ayland@ilande.co.uk,
 f4bug@amsat.org, pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The size of the operation is an argument to the respective
functions, and has nothing to do with sizeof(val).

Cc: Jason Wang <jasowang@redhat.com>
Cc: Dmitry Fleytman <dmitry.fleytman@gmail.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/net/e1000e.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/e1000e.c b/hw/net/e1000e.c
index a8a77eca95..ea3347fbb4 100644
--- a/hw/net/e1000e.c
+++ b/hw/net/e1000e.c
@@ -145,7 +145,7 @@ e1000e_io_read(void *opaque, hwaddr addr, unsigned size)
         return s->ioaddr;
     case E1000_IODATA:
         if (e1000e_io_get_reg_index(s, &idx)) {
-            val = e1000e_core_read(&s->core, idx, sizeof(val));
+            val = e1000e_core_read(&s->core, idx, size);
             trace_e1000e_io_read_data(idx, val);
             return val;
         }
@@ -171,7 +171,7 @@ e1000e_io_write(void *opaque, hwaddr addr,
     case E1000_IODATA:
         if (e1000e_io_get_reg_index(s, &idx)) {
             trace_e1000e_io_write_data(idx, val);
-            e1000e_core_write(&s->core, idx, val, sizeof(val));
+            e1000e_core_write(&s->core, idx, val, size);
         }
         return;
     default:
-- 
2.25.1


