Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05B849F05B
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:09:52 +0100 (CET)
Received: from localhost ([::1]:42644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFlv-0007Pt-GY
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:09:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZQ-0003cA-Ma
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:56 -0500
Received: from [2607:f8b0:4864:20::732] (port=36408
 helo=mail-qk1-x732.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wwcohen@gmail.com>) id 1nDFZL-0005Nk-0d
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:56:55 -0500
Received: by mail-qk1-x732.google.com with SMTP id g145so4262722qke.3
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IpK1t7O12XB1gUTpxDv+JAxDZc8jNUYhNMaDg+eDHdE=;
 b=CSit2c6EOJI467Nw4Dr4+OxsblvNNh/AXoAdCkG4RworV58cvmnCX7pAZucXvJZJMq
 sAZDlnvwqornK5XM9Wch2czf14q9a4uTVSC+gnmmzY3eWHv2q0KpS3G0YVBbv6IQAu+0
 b/phhFkH8ouWa8mLqkGsyFwfc5yxWVKgNP7xsyaU0xnRIuvYX6K1f474uMKBT24iNENE
 449Q6DkkrCjOvmpWE/oLqW8RxU1Erh6cBndmx6XBYHxxKFYz+CKPZO9dQeEkipPeGPnR
 JkGBdoGxoBzSpWDHCJ6tWLDW0fuqQqLFo1HNPQ15+tCxejlk0oWyhC4fm9HADoEDj/5X
 49NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IpK1t7O12XB1gUTpxDv+JAxDZc8jNUYhNMaDg+eDHdE=;
 b=m0o7R3XRVbrcZqB5VL7iQ+ptB8Kvq7RMJJvLuQ2zWrP1dU7OYUsq6hH4dxGyKTjfd+
 fpmljzK0+d8yScADLv/uzDyFyD1VHWxPaLq4Hv+GnaqJky++Saa5mhXbpb2sj3QdS+SN
 nsz0lXMNgyNOyO5+WNXDbCBY9ql+9iIwLmN+boqyCzRT/5wGzvbfUVcfvuHiEB+fBUHT
 UOzAvg12p5FVwZPltpLzjVW/y4g6S5BcBQoTPuFcF/IAg6015BKUMQoF8KPHpBxvO9ap
 qZb0W72PUymJfIQzc37fajEHztNz42mK0YAGJB2sizTQYRX//XLSU401DNtuxybBIQoe
 Y2wA==
X-Gm-Message-State: AOAM531DGRK4FW3n6bfNHNZt6ylMDadF630HzNFDz7JNQAG65L1lPqkG
 YnK1Rr8P3J7Zddja20mCCnZmokQ+DMGTEA==
X-Google-Smtp-Source: ABdhPJwkVBRl6kD4wi/pPtPvCAmLmBORdkzIzDyxVg5XXuZASuH00wqOthXS1qpQE0o7inmDv8hQHw==
X-Received: by 2002:a05:620a:1678:: with SMTP id
 d24mr4401583qko.477.1643331391636; 
 Thu, 27 Jan 2022 16:56:31 -0800 (PST)
Received: from localhost.localdomain
 (209-6-248-219.s2265.c3-0.wrx-ubr1.sbo-wrx.ma.cable.rcncustomer.com.
 [209.6.248.219])
 by smtp.gmail.com with ESMTPSA id d8sm2182003qtd.70.2022.01.27.16.56.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 16:56:31 -0800 (PST)
From: Will Cohen <wwcohen@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 06/11] 9p: darwin: Compatibility defn for XATTR_SIZE_MAX
Date: Thu, 27 Jan 2022 19:56:06 -0500
Message-Id: <20220128005611.87185-7-wwcohen@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128005611.87185-1-wwcohen@gmail.com>
References: <20220128005611.87185-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::732
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::732;
 envelope-from=wwcohen@gmail.com; helo=mail-qk1-x732.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, Greg Kurz <groug@kaod.org>,
 hi@alyssa.is, Michael Roitzsch <reactorcontrol@icloud.com>,
 Will Cohen <wwcohen@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Keno Fischer <keno@juliacomputing.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Keno Fischer <keno@juliacomputing.com>

Signed-off-by: Keno Fischer <keno@juliacomputing.com>
Signed-off-by: Michael Roitzsch <reactorcontrol@icloud.com>
[Will Cohen: - Adjust coding style
             - Lower XATTR_SIZE_MAX to 64k]
Signed-off-by: Will Cohen <wwcohen@gmail.com>
---
 hw/9pfs/9p.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
index 9b0c057e9c..611ac14c4c 100644
--- a/hw/9pfs/9p.c
+++ b/hw/9pfs/9p.c
@@ -3943,6 +3943,13 @@ out_nofid:
     v9fs_string_free(&name);
 }
 
+#if defined(CONFIG_DARWIN) && !defined(XATTR_SIZE_MAX)
+/*
+ * Darwin doesn't seem to define a maximum xattr size in its user
+ * space header, so manually configure it as 64k.
+ */
+#define XATTR_SIZE_MAX 65536
+#endif
 static void coroutine_fn v9fs_xattrcreate(void *opaque)
 {
     int flags, rflags = 0;
-- 
2.34.1


