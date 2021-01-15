Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1C32F70EF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 04:28:44 +0100 (CET)
Received: from localhost ([::1]:44534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0Fn1-0007KJ-J9
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 22:28:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1l0Flf-0005vV-0T
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:27:19 -0500
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:45715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pizhenwei@bytedance.com>)
 id 1l0Flc-0000fm-Oy
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 22:27:18 -0500
Received: by mail-pf1-x436.google.com with SMTP id c13so4603597pfi.12
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 19:27:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ew8cu4iWibVSoFd8U1aw0x9TqKwKGBm+oggzSrlqzRs=;
 b=zkwQhwHW56AgBn3/EpEYzRbMQrFN7wF+lsCPVzdIwESowFCV60ySH4EdeM6E5a+qXp
 JmJ7bD0R8bSqqLzvbxcNWFLZ01K3t4Fap6BebcrdPeipiKQ5R11o4AVQB4IIDL6GAtAV
 twLYe1C/upJ5shvZPY0gzG727xWP/I7qxpww0y69Cpkurn8cdwD49PTVjFzwEmlo2nEz
 WxIwta3JgxUT+Zf0dW+qYQ09DX0cglHHMI8glb8d17rhxswaCh7WWp6H8AyGkEIx7V8x
 XbHbAJZoD/bPmviwMRBdxx9GGIh6UrcUz5ekHsdZuYMLaPawfFbbyPJ3kHLSjF5ZLZv9
 UkzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ew8cu4iWibVSoFd8U1aw0x9TqKwKGBm+oggzSrlqzRs=;
 b=FZK9HbJdfNWfz2AnEiYtu/eknxCV33ZjNmQWfuY8HZer3GtyxwGlZ20jCC0dtKZMSa
 bhMaaCXb8KYsktMhEADNuUV2a704RpbkDsP47ANHC9dgychO9N9SgiZebeKgaGvyAw6+
 BIPB48F7hYdOm/AKzheBJyEENolwTPJqSL/IKQ4kNeKIX7gLJC6GU4JdABAW/toLB5ZT
 lnoNbHIM/rBJBUzH40QVgnsSTW7ZlL2+JewXVoZe5pbNZyz27evHxRYublJZxEidOpSD
 eEd7B0+KCiVJUF+fLpXmqT2CZEtv0hXKKP3Uj6TFaIwsX9T2g1DcFjtNktvoLxv0iPD+
 gBsQ==
X-Gm-Message-State: AOAM532aH4Tx8DnBNQWU5o0Yq/mEimH83DECrm/+2+WISZt15BCKYo47
 IEWSA6YoTeqzzUsV6Qy93ynm0w==
X-Google-Smtp-Source: ABdhPJz2mzt58x3F961KTfvbvefute37Ujx6BR5hwBiWsRlFEdvuyC/4nIC2+Z7WHhAyt5oYUbRYvw==
X-Received: by 2002:a62:ca:0:b029:19e:67a9:f0f2 with SMTP id
 193-20020a6200ca0000b029019e67a9f0f2mr10485116pfa.60.1610681235475; 
 Thu, 14 Jan 2021 19:27:15 -0800 (PST)
Received: from always-libai.bytedance.net ([61.120.150.71])
 by smtp.gmail.com with ESMTPSA id j16sm6583662pjj.18.2021.01.14.19.27.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 19:27:14 -0800 (PST)
From: zhenwei pi <pizhenwei@bytedance.com>
To: kbusch@kernel.org, its@irrelevant.dk, kwolf@redhat.com, mreitz@redhat.com
Subject: [PATCH v4 1/3] block/nvme: introduce bit 5 for critical warning
Date: Fri, 15 Jan 2021 11:27:00 +0800
Message-Id: <20210115032702.466631-2-pizhenwei@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210115032702.466631-1-pizhenwei@bytedance.com>
References: <20210115032702.466631-1-pizhenwei@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=pizhenwei@bytedance.com; helo=mail-pf1-x436.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: zhenwei pi <pizhenwei@bytedance.com>, philmd@redhat.com,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to NVMe spec 1.4 section
<SMART / Health Information (Log Identifier 02h)>, introduce bit 5
for "Persistent Memory Region has become read-only or unreliable".

Signed-off-by: zhenwei pi <pizhenwei@bytedance.com>
---
 include/block/nvme.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/block/nvme.h b/include/block/nvme.h
index 9494246f1f..0baf4b27cd 100644
--- a/include/block/nvme.h
+++ b/include/block/nvme.h
@@ -789,6 +789,7 @@ enum NvmeSmartWarn {
     NVME_SMART_RELIABILITY            = 1 << 2,
     NVME_SMART_MEDIA_READ_ONLY        = 1 << 3,
     NVME_SMART_FAILED_VOLATILE_MEDIA  = 1 << 4,
+    NVME_SMART_PMR_UNRELIABLE         = 1 << 5,
 };
 
 typedef struct NvmeEffectsLog {
-- 
2.25.1


