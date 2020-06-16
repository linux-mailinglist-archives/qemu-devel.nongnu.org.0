Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 313641FB4A4
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Jun 2020 16:42:00 +0200 (CEST)
Received: from localhost ([::1]:59424 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jlCml-0001yi-4W
	for lists+qemu-devel@lfdr.de; Tue, 16 Jun 2020 10:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQ8-0002n4-Nu; Tue, 16 Jun 2020 10:18:37 -0400
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:40784)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <flukshun@gmail.com>)
 id 1jlCQ6-0006nk-2c; Tue, 16 Jun 2020 10:18:36 -0400
Received: by mail-ot1-x32e.google.com with SMTP id s13so16033014otd.7;
 Tue, 16 Jun 2020 07:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=wXGzXtnYVU6jrvJg29PeDu0tkOnyv8mwvCmy2U31qtA=;
 b=JMyL4062p7Ya3b44mu8H4BWUcHgQBV3krFnzhEpw3zuqPbOsTM6fkxCkdtMgkECXJR
 gHoS/QP9hrGaHrd3ZUJZuyFedZD+6DX+XKJSi7nbKmMJjDtRA/8WmBEyGrl8l7HqcumC
 NAwxNICd4pOvsKgRmHZ8Eq4Qa/Koafg5kkz8/wCtIev36hBF2toSZP3EC5ZtUsSTXJEY
 ZR8Rois0q4L2amVni3bIyJTY4p/6/IPpjw+HPCVkIe4WMIP5Ay3fqebnMN2rKbwII3qQ
 obkWmsTb9fshAuzzLKv0F3myUttZRm1DdeT4c8/hR1kQlCTi0C6yYpKk6DrUGOsFFdXj
 bCCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references;
 bh=wXGzXtnYVU6jrvJg29PeDu0tkOnyv8mwvCmy2U31qtA=;
 b=WVRY0Kc5RWZi+XSTG/mcjNYi1IYX0brCbPCLm52sIkJ6tRRtOlq3/2tnsvjMzSFtxp
 U58bx+3VadTZm2evT+Ip+c5SnPO/yaEqDikhEfa/CRxgrY+7PBHJXYlSuwYv2LQZ/xzR
 +QbY5tlFyKS1G5JyUdek8wRcUqjtGW2JhamUbEun7CaqNmMWc3tQhIGN3iY5cdy8vCPr
 ZooIKFKhXmZdY3Ox890MAqqaZGmEtOB/V3PI2w4Dn2FFKUvHVvg3DQEmBpvPLUlT728z
 U//11os+/1shjIpzgCKwGWYOnSdWd9Rpl67nvj++acPoJe/LAKKLUDWRxcTnbw0y4im5
 UudQ==
X-Gm-Message-State: AOAM533e1qRUx++IdxXfCnFOe0H0q6MXir7NYSS8Y04wkThvgwdX/egK
 tMnz3++6GfxdHYQR2+U9ZsAWuhO0
X-Google-Smtp-Source: ABdhPJyseph+9oblm6gVqU8XIoCwHoe8uANq5BFAg/pp1+Yfy/Q8jNWUkfgp8P3M2U+SdTxjFrgGEA==
X-Received: by 2002:a9d:5190:: with SMTP id y16mr2631839otg.68.1592317110163; 
 Tue, 16 Jun 2020 07:18:30 -0700 (PDT)
Received: from localhost (76-251-165-188.lightspeed.austtx.sbcglobal.net.
 [76.251.165.188])
 by smtp.gmail.com with ESMTPSA id w5sm4081384otb.38.2020.06.16.07.18.29
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Tue, 16 Jun 2020 07:18:29 -0700 (PDT)
From: Michael Roth <mdroth@linux.vnet.ibm.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 41/78] s390/sclp: improve special wait psw logic
Date: Tue, 16 Jun 2020 09:15:10 -0500
Message-Id: <20200616141547.24664-42-mdroth@linux.vnet.ibm.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
References: <20200616141547.24664-1-mdroth@linux.vnet.ibm.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::32e;
 envelope-from=flukshun@gmail.com; helo=mail-ot1-x32e.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=1, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Christian Borntraeger <borntraeger@de.ibm.com>

There is a special quiesce PSW that we check for "shutdown". Otherwise disabled
wait is detected as "crashed". Architecturally we must only check PSW bits
116-127. Fix this.

Cc: qemu-stable@nongnu.org
Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
Message-Id: <1582204582-22995-1-git-send-email-borntraeger@de.ibm.com>
Reviewed-by: David Hildenbrand <david@redhat.com>
Acked-by: Janosch Frank <frankja@linux.ibm.com>
Signed-off-by: Cornelia Huck <cohuck@redhat.com>
(cherry picked from commit 8b51c0961cc13e55b26bb6665ec3a341abdc7658)
Signed-off-by: Michael Roth <mdroth@linux.vnet.ibm.com>
---
 target/s390x/helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/helper.c b/target/s390x/helper.c
index a3a49164e4..6808dfda01 100644
--- a/target/s390x/helper.c
+++ b/target/s390x/helper.c
@@ -89,7 +89,7 @@ hwaddr s390_cpu_get_phys_addr_debug(CPUState *cs, vaddr vaddr)
 static inline bool is_special_wait_psw(uint64_t psw_addr)
 {
     /* signal quiesce */
-    return psw_addr == 0xfffUL;
+    return (psw_addr & 0xfffUL) == 0xfffUL;
 }
 
 void s390_handle_wait(S390CPU *cpu)
-- 
2.17.1


