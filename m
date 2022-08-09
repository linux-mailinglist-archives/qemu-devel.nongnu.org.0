Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F05158D60D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Aug 2022 11:12:56 +0200 (CEST)
Received: from localhost ([::1]:56146 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLLIF-0005p7-RU
	for lists+qemu-devel@lfdr.de; Tue, 09 Aug 2022 05:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLLEk-0001oH-UJ
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 05:09:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29892)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLLEg-0005Yq-Bl
 for qemu-devel@nongnu.org; Tue, 09 Aug 2022 05:09:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660036150;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sv2ylwUb77fjOOXBggXxwWMSrl9pFWc0E8Ej2Afz9ck=;
 b=OFOVs2Q+0OvWfYG2dvyW3g8jEVNTG4KkLytrTPgSU3i4jOmR/qL//f9byUHMmkEpVpo9eR
 +eVKZ+zcx8RM+XC+LYob7UXSz5aUaa1EiVDjygk1/Om5ao4R2C3+gPUKQdyNZ9BGlrn/Hs
 ZOfFCJ5xTTKYC7NJTPJhJaNsLjm0NQ0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-294-gRCh6sq9Plmk1e59YAs6Sg-1; Tue, 09 Aug 2022 05:09:08 -0400
X-MC-Unique: gRCh6sq9Plmk1e59YAs6Sg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E951F8032F0;
 Tue,  9 Aug 2022 09:09:07 +0000 (UTC)
Received: from localhost.localdomain (ovpn-13-255.pek2.redhat.com
 [10.72.13.255])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6F2C24010E3C;
 Tue,  9 Aug 2022 09:09:05 +0000 (UTC)
From: Jason Wang <jasowang@redhat.com>
To: peter.maydell@linaro.org,
	qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL] hw/net/rocker: Avoid undefined shifts with more than 31 ports
Date: Tue,  9 Aug 2022 17:08:59 +0800
Message-Id: <20220809090859.28338-2-jasowang@redhat.com>
In-Reply-To: <20220809090859.28338-1-jasowang@redhat.com>
References: <20220809090859.28338-1-jasowang@redhat.com>
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

From: Peter Maydell <peter.maydell@linaro.org>

In rocker_port_phys_link_status() and rocker_port_phys_enable_read()
we construct a 64-bit value with one bit per front-panel port.
However we accidentally do the shift as 32-bit arithmetic, which
means that if there are more than 31 front-panel ports this is
undefined behaviour.

Fix the problem by ensuring we use 64-bit arithmetic for the whole
calculation. (We won't ever shift off the 64-bit value because
ROCKER_FP_PORTS_MAX is 62.)

Resolves: Coverity CID 1487121, 1487160
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Jason Wang <jasowang@redhat.com>
---
 hw/net/rocker/rocker.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/hw/net/rocker/rocker.c b/hw/net/rocker/rocker.c
index 31f2340..d8f3f16 100644
--- a/hw/net/rocker/rocker.c
+++ b/hw/net/rocker/rocker.c
@@ -1010,7 +1010,7 @@ static uint64_t rocker_port_phys_link_status(Rocker *r)
         FpPort *port = r->fp_port[i];
 
         if (fp_port_get_link_up(port)) {
-            status |= 1 << (i + 1);
+            status |= 1ULL << (i + 1);
         }
     }
     return status;
@@ -1025,7 +1025,7 @@ static uint64_t rocker_port_phys_enable_read(Rocker *r)
         FpPort *port = r->fp_port[i];
 
         if (fp_port_enabled(port)) {
-            ret |= 1 << (i + 1);
+            ret |= 1ULL << (i + 1);
         }
     }
     return ret;
-- 
2.7.4


