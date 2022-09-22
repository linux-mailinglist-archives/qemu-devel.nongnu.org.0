Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51A25E5E17
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 11:03:22 +0200 (CEST)
Received: from localhost ([::1]:33024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obI77-0007FC-L4
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 05:03:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHtt-0004Ho-LW
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1obHto-000391-5I
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 04:49:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1663836575;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lGOEj22T6lvWm61okRSFdvQTf9Aoa2AFT1tkZ6fRMl0=;
 b=ILunKviOm1pAhPU5JUe+Q/dyZQzSoyFHUOsO3M0q8PiqoLGlTEkXlTO0zgQqgfPkKkSKih
 SL+mLh0Qo8sEPLuXOxPLmPrfeGPNbZwVgK2YnQpIocNNjyebrt7S4T3kdqLIlE9NSwf16C
 D6wlzzhIICLwm56AZHAsGUg4eULgsWs=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-224-ofAqmCJSPrONCTufrw5JVQ-1; Thu, 22 Sep 2022 04:49:34 -0400
X-MC-Unique: ofAqmCJSPrONCTufrw5JVQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 sa15-20020a1709076d0f00b00781d793f51fso1346172ejc.18
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 01:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=lGOEj22T6lvWm61okRSFdvQTf9Aoa2AFT1tkZ6fRMl0=;
 b=5gpmETe9B91876eUMsiN/+C/0x/FRoIsmie89VbnAn9oTL2ZPsal2Dd0/x7ivhpHl6
 sVSVefsME9NZYmRSf6zqZLXTquxn5CtGTA/6RtovrjLk+SZC7xXYbJSK/vWY6BH3ozIX
 8ig4MO/HGTXUb08X6A48DD+rpQfW5Y341ZZB4Hr0qlsV30Raf6K6OjBdrRDeBPczgBa6
 9CJU8KIpsOi4T/wOO9dFFGHGNcI9CB0ngA68xvnRq0ce41H/MAvRspy2qNu6m9LEh4nb
 1pcYC9KAWgwo0SafMCeS2qgOZyO5po/fgG+y86s1DYGnYitN1TzTSU7TVpU9w+cN+QO4
 Q5qA==
X-Gm-Message-State: ACrzQf1JDYBUZJiWFDXQu3yhifRpzfovsRUdKi90KTglRmhHOQ0TNsYo
 oTkmMeC3r6L383oRi9vtAe8Zj15oG1I4TOj4CiIv9zlPHIHkqOkJ5u/gzhGHYc6gzQ9hfifG6Q7
 q7nbKzU9JKPUb7S6LU6oLJn4ko9jw5AhDMA633l2NfnE3UuoVj2QO3np3YVixLyQ1PWc=
X-Received: by 2002:aa7:dd0a:0:b0:44e:a27b:fec with SMTP id
 i10-20020aa7dd0a000000b0044ea27b0fecmr2070436edv.168.1663836572822; 
 Thu, 22 Sep 2022 01:49:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5L6p+2CY47nRI4vPJrsO2bzG6WRfm+SJ5oa7k8EMLs/NhtV0pcALoOlbSHmpPKBg/KTD6k7w==
X-Received: by 2002:aa7:dd0a:0:b0:44e:a27b:fec with SMTP id
 i10-20020aa7dd0a000000b0044ea27b0fecmr2070420edv.168.1663836572597; 
 Thu, 22 Sep 2022 01:49:32 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 ky6-20020a170907778600b00778e3e2830esm2384298ejc.9.2022.09.22.01.49.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 01:49:32 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: kwolf@redhat.com, qemu-block@nongnu.org, afaria@redhat.com,
 Eric Blake <eblake@redhat.com>
Subject: [PATCH 04/26] nbd: remove incorrect coroutine_fn annotations
Date: Thu, 22 Sep 2022 10:49:02 +0200
Message-Id: <20220922084924.201610-5-pbonzini@redhat.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220922084924.201610-1-pbonzini@redhat.com>
References: <20220922084924.201610-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

nbd_co_establish_connection_cancel() cancels a coroutine but is not called
from coroutine context itself, for example in nbd_cancel_in_flight()
and in timer callbacks reconnect_delay_timer_cb() and open_timer_cb().

Reviewed-by: Alberto Faria <afaria@redhat.com>
Reviewed-by: Eric Blake <eblake@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/nbd.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/nbd.h b/include/block/nbd.h
index c74b7a9d2e..4ede3b2bd0 100644
--- a/include/block/nbd.h
+++ b/include/block/nbd.h
@@ -424,6 +424,6 @@ QIOChannel *coroutine_fn
 nbd_co_establish_connection(NBDClientConnection *conn, NBDExportInfo *info,
                             bool blocking, Error **errp);
 
-void coroutine_fn nbd_co_establish_connection_cancel(NBDClientConnection *conn);
+void nbd_co_establish_connection_cancel(NBDClientConnection *conn);
 
 #endif
-- 
2.37.3


