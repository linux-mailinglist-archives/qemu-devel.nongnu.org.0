Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F26B112D28
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Dec 2019 15:03:05 +0100 (CET)
Received: from localhost ([::1]:39350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1icVF9-0002cI-PD
	for lists+qemu-devel@lfdr.de; Wed, 04 Dec 2019 09:03:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38549)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <prvs=2346a8ea7=sveith@amazon.com>)
 id 1icV8u-0005Pl-Iv
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 08:56:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <prvs=2346a8ea7=sveith@amazon.com>)
 id 1icV8t-0005Sz-IT
 for qemu-devel@nongnu.org; Wed, 04 Dec 2019 08:56:36 -0500
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:9536)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <prvs=2346a8ea7=sveith@amazon.com>)
 id 1icV8r-0005QG-6e; Wed, 04 Dec 2019 08:56:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amazon.de; i=@amazon.de; q=dns/txt; s=amazon201209;
 t=1575467793; x=1607003793;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=uThbvtPQAz4aUcOeaWmIN//ZqDzYZn0zQCbaxFwdtm0=;
 b=FEZpZAsTEgUabUqIqUochmBbsfGJ9UvVqT7JWHO3eLSokf10badQzn5y
 gZUGy8gNbWzLFChaB+Zfyrz3+jgyfWgGTv19UidtKkZEUOFv3KoRxGkpO
 tWDTHk/mBYDC488mbJqqiaJ3Bqg7fVJfEKDl4x2lXJJCJjU9E2bWV+iPx c=;
IronPort-SDR: 99aAc83sA2OgyShNxfulzAYj5fH+VfXXffUGMHdweV+0Iuyx7LbWzGx1DrSMd9TbQzfj+YgX+/
 8qH33e89q97w==
X-IronPort-AV: E=Sophos;i="5.69,277,1571702400"; 
   d="scan'208";a="3177723"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO
 email-inbound-relay-2a-119b4f96.us-west-2.amazon.com) ([10.47.23.38])
 by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP;
 04 Dec 2019 13:56:32 +0000
Received: from sveith-desktop.aka.corp.amazon.com
 (pdx2-ws-svc-lb17-vlan3.amazon.com [10.247.140.70])
 by email-inbound-relay-2a-119b4f96.us-west-2.amazon.com (Postfix) with ESMTPS
 id BA66F1A11D5; Wed,  4 Dec 2019 13:56:31 +0000 (UTC)
Received: from sveith-desktop.aka.corp.amazon.com (localhost [127.0.0.1])
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Debian-3) with ESMTP id
 xB4DuUkY029462; Wed, 4 Dec 2019 14:56:30 +0100
Received: (from sveith@localhost)
 by sveith-desktop.aka.corp.amazon.com (8.15.2/8.15.2/Submit) id xB4DuUrM029461;
 Wed, 4 Dec 2019 14:56:30 +0100
From: Simon Veith <sveith@amazon.de>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: Simon Veith <sveith@amazon.de>, Eric Auger <eric.auger@redhat.com>
Subject: [PATCH 5/5] hw/arm/smmuv3: Report F_STE_FETCH fault address in
 correct word position
Date: Wed,  4 Dec 2019 14:55:48 +0100
Message-Id: <1575467748-28898-6-git-send-email-sveith@amazon.de>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575467748-28898-1-git-send-email-sveith@amazon.de>
References: <1575467748-28898-1-git-send-email-sveith@amazon.de>
Precedence: Bulk
X-detected-operating-system: by eggs.gnu.org: FreeBSD 9.x [fuzzy]
X-Received-From: 207.171.184.25
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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

The smmuv3_record_event() function that generates the F_STE_FETCH error
uses the EVT_SET_ADDR macro to record the fetch address, placing it in
32-bit words 4 and 5.

The correct position for this address is in words 6 and 7, per the
SMMUv3 Architecture Specification.

Update the function to use the EVT_SET_ADDR2 macro instead, which is the
macro intended for writing to these words.

ref. ARM IHI 0070C, section 7.3.4.

Signed-off-by: Simon Veith <sveith@amazon.de>
Cc: Eric Auger <eric.auger@redhat.com>
Cc: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
---
 hw/arm/smmuv3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 2d6c275..125e47d 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -172,7 +172,7 @@ void smmuv3_record_event(SMMUv3State *s, SMMUEventInfo *info)
     case SMMU_EVT_F_STE_FETCH:
         EVT_SET_SSID(&evt, info->u.f_ste_fetch.ssid);
         EVT_SET_SSV(&evt,  info->u.f_ste_fetch.ssv);
-        EVT_SET_ADDR(&evt, info->u.f_ste_fetch.addr);
+        EVT_SET_ADDR2(&evt, info->u.f_ste_fetch.addr);
         break;
     case SMMU_EVT_C_BAD_STE:
         EVT_SET_SSID(&evt, info->u.c_bad_ste.ssid);
-- 
2.7.4


