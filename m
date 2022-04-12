Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75E984FE90B
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 21:46:07 +0200 (CEST)
Received: from localhost ([::1]:57028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neMSk-0000kE-Hn
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 15:46:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMOy-0006Lq-5b
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:12 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:46853)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1neMOv-0008CX-Rk
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 15:42:11 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 l62-20020a1c2541000000b0038e4570af2fso2257173wml.5
 for <qemu-devel@nongnu.org>; Tue, 12 Apr 2022 12:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=W7kGBoOFziFwDZCdpVxrVsG2S15PHM2kl111r31rtpg=;
 b=IfB/UKx3WlMHdsRadDkLwfUDx4aVI30Cmxq38zSjgeK117cf1QUCHsNMF/w464zXAD
 k2fbRbmcdRRvUosyIH2Dcg0ZsFbfq1VM29MXQ4METypcttRlh2EF3coxN2o8ik4fC4iT
 TOnrIchfsg0W7CBtas5jIx+orp6kUOFLKqHN5//sTxhscWtcO/iAgK3tRm4DvRgX33N9
 k8BIdXEkw9fbHHKhJrlcLrSvswuFTA2+IvALVoGuUsrhheulaOposJwh/jTQVllvoxH2
 Nuh8S6sUtlLimTxXwXmV157vzmCHnHplpndECkAJX/+Qth6rG4N0xzYgum+eQHrvxGOL
 cEmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=W7kGBoOFziFwDZCdpVxrVsG2S15PHM2kl111r31rtpg=;
 b=XNM4o6waF4gOSdh7OWcb3zvDuHiMMseKPVBm4P4K5AwutP0PKhIXOkPXlRM8vyEBoL
 hJwxoE4VoTdXlCGfNY9m4Yn3+JUF+ROnAorETx8IH/FVZPDe/NBd0aVc+jhIFdaEWoyw
 zFGpET6Swr/JZnK1cmz5nzGeGyon6MPA0umbr72vCuJLaiqn7ElGIH/nAh76T6MGniNf
 4gNhM7tk7KAHdc3qBCzInmZQYsT2Ud9Ho4/BmQbPTRQuBKOWV9fN8Af+B+uHSOdzOyt7
 n8b8GmeV+v6U78xwK8WJnmCL8HEIgO+XmFvBosi8GVwxOEBVnf/1BGC5gpCuX3q8mHRS
 yVIA==
X-Gm-Message-State: AOAM53208dM7Ji7faAzlxGCYbkkSV0GmYEp1A+BjTclUc18+Yv5zEzav
 7RmTP3vN/2Pe7y/3kfAN2uQG/kQBw3JCmw==
X-Google-Smtp-Source: ABdhPJyHjlNhzLG2d2GCrynGW7QoYdYMGKBKr86YAOweMmtW+aRdJCWX6gErnktVXj8ZA5bnrQgPJA==
X-Received: by 2002:a1c:3584:0:b0:38e:b8ba:181e with SMTP id
 c126-20020a1c3584000000b0038eb8ba181emr5373569wma.181.1649792528207; 
 Tue, 12 Apr 2022 12:42:08 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 l3-20020a05600002a300b00207902922cesm14150978wry.15.2022.04.12.12.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 12:42:07 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 1/8] nbd: actually implement reply_possible safeguard
Date: Tue, 12 Apr 2022 21:41:57 +0200
Message-Id: <20220412194204.350889-2-pbonzini@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220412194204.350889-1-pbonzini@redhat.com>
References: <20220412194204.350889-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The .reply_possible field of s->requests is never set to false.  This is
not a big problem as it is only a safeguard to detect protocol errors,
but fix it anyway.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/nbd.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index 567872ac53..6a5e410e5f 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -454,15 +454,16 @@ static coroutine_fn int nbd_receive_replies(BDRVNBDState *s, uint64_t handle)
             nbd_channel_error(s, -EINVAL);
             return -EINVAL;
         }
-        if (s->reply.handle == handle) {
-            /* We are done */
-            return 0;
-        }
         ind2 = HANDLE_TO_INDEX(s, s->reply.handle);
         if (ind2 >= MAX_NBD_REQUESTS || !s->requests[ind2].reply_possible) {
             nbd_channel_error(s, -EINVAL);
             return -EINVAL;
         }
+        s->requests[ind2].reply_possible = nbd_reply_is_structured(&s->reply);
+        if (s->reply.handle == handle) {
+            /* We are done */
+            return 0;
+        }
         nbd_recv_coroutine_wake_one(&s->requests[ind2]);
     }
 }
-- 
2.35.1



