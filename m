Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA1A694D9E
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 18:04:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRcEA-0003mT-VJ; Mon, 13 Feb 2023 12:02:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcDa-0002sq-JX
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:02:22 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRcDW-0007WZ-IX
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 12:02:17 -0500
Received: by mail-wm1-x32c.google.com with SMTP id r18so9152801wmq.5
 for <qemu-devel@nongnu.org>; Mon, 13 Feb 2023 09:01:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nyLbjeolJt6ZW4phcgy63TammsHqUZyvpx842CmDisc=;
 b=QWZY9CryGlVdSgTHbSKoxaymnHl/VL20bVgsjMRsyeRrPD4tWapd+Q+ZUowArWE1io
 C/SEk2oDUKV00XPiz8spGIz7NfWF/Cbfwqp7OohHcIT3VZ3Hr//J4II+Y5JOEAGN+E9d
 ZN4ic1Jhx6PLkQ+uk2cvMvTKIGGuMLqTONZPDkJDWBumxS+duku+h3Xtvi3X9f8aJZT+
 W7Z9rYkBzIcpFfotGVRSvLIgEuGWqyXFmVulFLLfOOcKGwcuwEMoZC1yw05esN+MJfK3
 448F8HaNlaRE5fNT7X0FIkd4SriBeTFQv00zE5eMkW+C4YRU5DkkB4biVFeEL603O0am
 PfCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nyLbjeolJt6ZW4phcgy63TammsHqUZyvpx842CmDisc=;
 b=yK2CaFeZZ/T1CHRy7jL2o0TzoRLDBRgQOTRcw0eA0RqP7i5uP9EzDTq4WsyNrrVme9
 dYAvliu92qpDx1TDV9UFeObLrUfTPyTBCF5na9daJpOAh27G3MZeN8KWW3NnsFMojUO5
 hW62BnR/r8utVu35YH9bPEGV83z5iUNpPgqBuSg9AeC4DJztTQWHPgniut7xMiIja/Qj
 y8VtjBzzWyayl6e/t5ePYjLESaTyOPQ77xr2QBEwj9/K+u+y8r0PsxjrASh0NGK14O6A
 6Fl0REJ9XKKfGDuN/0/Pub3p8aM2HhhgotZcDq0xTENoitCgSEYJTjw8E4GxGktLh2bH
 O6+g==
X-Gm-Message-State: AO0yUKW7kyGsiJHHq2r0tZPYuUWQPFfHKmxbuyAvE6kTedxgxqBNfvSt
 rLFwwid8Z2v4EMsKCcNrmlVZDA==
X-Google-Smtp-Source: AK7set90CkhHSo3LRsKyc6A6piIY1o8Y6F8Z1bO4UvTahltfRn9lEtVp7/BCbt0V4d+08aaXCfg/Pw==
X-Received: by 2002:a05:600c:43d3:b0:3da:1357:4ca2 with SMTP id
 f19-20020a05600c43d300b003da13574ca2mr21719945wmn.11.1676307714869; 
 Mon, 13 Feb 2023 09:01:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f15-20020adff98f000000b002c5583ab017sm3517148wrr.15.2023.02.13.09.01.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 13 Feb 2023 09:01:54 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Eduardo Habkost <eduardo@habkost.net>, Eric Farman <farman@linux.ibm.com>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Alex Williamson <alex.williamson@redhat.com>,
 David Hildenbrand <david@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 1/6] hw/s390x/event-facility: Replace DO_UPCAST(SCLPEvent)
 by SCLP_EVENT()
Date: Mon, 13 Feb 2023 18:01:40 +0100
Message-Id: <20230213170145.45666-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213170145.45666-1-philmd@linaro.org>
References: <20230213170145.45666-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Use the SCLP_EVENT() QOM type-checking macro to avoid DO_UPCAST().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Eric Farman <farman@linux.ibm.com>
---
 hw/s390x/event-facility.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/hw/s390x/event-facility.c b/hw/s390x/event-facility.c
index faa51aa4c7..6891e3cd73 100644
--- a/hw/s390x/event-facility.c
+++ b/hw/s390x/event-facility.c
@@ -64,8 +64,7 @@ static bool event_pending(SCLPEventFacility *ef)
     SCLPEventClass *event_class;
 
     QTAILQ_FOREACH(kid, &ef->sbus.qbus.children, sibling) {
-        DeviceState *qdev = kid->child;
-        event = DO_UPCAST(SCLPEvent, qdev, qdev);
+        event = SCLP_EVENT(kid->child);
         event_class = SCLP_EVENT_GET_CLASS(event);
         if (event->event_pending &&
             event_class->get_send_mask() & ef->receive_mask) {
-- 
2.38.1


