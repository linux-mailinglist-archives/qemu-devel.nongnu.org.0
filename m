Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 941E13B3553
	for <lists+qemu-devel@lfdr.de>; Thu, 24 Jun 2021 20:11:18 +0200 (CEST)
Received: from localhost ([::1]:56472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwTor-0000oR-JJ
	for lists+qemu-devel@lfdr.de; Thu, 24 Jun 2021 14:11:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiN-00080C-So; Thu, 24 Jun 2021 14:04:37 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:37513)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwTiI-0001S1-Ay; Thu, 24 Jun 2021 14:04:32 -0400
Received: by mail-ed1-x52e.google.com with SMTP id i24so9796980edx.4;
 Thu, 24 Jun 2021 11:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qpjBRyyTP4cjVVNX0Br2C9CiFX8IHvmV4kWlXQxiCsA=;
 b=pQ4qf/DY1cJzzI1s96GU6X9CEinrrHU358IvMC16bjfmqnnmlSO6MZZnr8s0kAsyqC
 eRx5DQHygU6O+SGPDPpwkK4L3qT9JJgmZAHYbPlr1ksnUZhc8JDx6cMGlArNhh+6peQz
 TB3+EA+2I6mibxBG8rWzvdMaLo1PvWUARHKr7I5GDugE8ygZfrpojsuPkVezIyyd8X3K
 0wJnhJRg6hrFxQ8UDsegiT4+mOnBV1tqNMJQCD3cTv+zlLAy5DqKIhsLaq7PX7V8r+ix
 0WjDWITsLfBNkZrwAzeGkai1BazM93LxDGs8l8jFTqTNz25/TlCE85fLV3ymSFxJ+dv/
 qwaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=qpjBRyyTP4cjVVNX0Br2C9CiFX8IHvmV4kWlXQxiCsA=;
 b=o4aT8XkIwrVNmq8ZD+WJyMBBYIK8OMFLlr/6bJ07NsUSfcZLj+HSSbm/wN/96trj7s
 VhTQ3zcpHkblPlMIlkztGA7g0fcztXhA4f8xQCo5N13SZylsMhQCPrjaOTvyG0VFoPqU
 xba7xWHMXrA2GDRnH5DOGGrj/QFc0NGAgnC3CW22G2MkfSNdZjeUbVWQ5iTm1Xn0xKj2
 kUVeN9WmFqyTbVrHOpLGlw9rLKeK5qbMN4H4Lwp0njfgUA7QtGk57bUky60CpgeyLO6D
 POEmFiy/tQFrvEIjX5wZdDgRN6atGz1a0tdmg+NioOciR1ByR9txnZYGfInBbEMLtB8q
 1Wkg==
X-Gm-Message-State: AOAM531IXAeFuYcQ4vfufzebPtyWNh+FxubBGaFp/kW+HjIWWQ4nt7Jf
 1olY9CviRVd5rrr8YTpOW7axscU7bzw=
X-Google-Smtp-Source: ABdhPJyKLKiKr7OFiWakk56fW2Bh85KXN/+sVUniC/UWA4c1ytDZe7A1jCAdr390boX9rsBWHphPdQ==
X-Received: by 2002:aa7:d413:: with SMTP id z19mr9119497edq.37.1624557868745; 
 Thu, 24 Jun 2021 11:04:28 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id a1sm2436466edt.16.2021.06.24.11.04.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 11:04:28 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 04/11] block-backend: align max_transfer to request alignment
Date: Thu, 24 Jun 2021 20:04:16 +0200
Message-Id: <20210624180423.1322165-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210624180423.1322165-1-pbonzini@redhat.com>
References: <20210624180423.1322165-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: mreitz@redhat.com, qemu-block@nongnu.org, mlevitsk@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Block device requests must be aligned to bs->bl.request_alignment.
It makes sense for drivers to align bs->bl.max_transfer the same
way; however when there is no specified limit, blk_get_max_transfer
just returns INT_MAX.  Since the contract of the function does not
specify that INT_MAX means "no maximum", just align the outcome
of the function (whether INT_MAX or bs->bl.max_transfer) before
returning it.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 block/block-backend.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 15f1ea4288..6e37582740 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1957,12 +1957,12 @@ uint32_t blk_get_request_alignment(BlockBackend *blk)
 uint32_t blk_get_max_transfer(BlockBackend *blk)
 {
     BlockDriverState *bs = blk_bs(blk);
-    uint32_t max = 0;
+    uint32_t max = INT_MAX;
 
     if (bs) {
-        max = bs->bl.max_transfer;
+        max = MIN_NON_ZERO(max, bs->bl.max_transfer);
     }
-    return MIN_NON_ZERO(max, INT_MAX);
+    return ROUND_DOWN(max, blk_get_request_alignment(blk));
 }
 
 int blk_get_max_iov(BlockBackend *blk)
-- 
2.31.1



