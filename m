Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48251693ED4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 08:13:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRSyN-0003Ut-OP; Mon, 13 Feb 2023 02:09:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSyA-000346-TI
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:47 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pRSy7-00021f-OE
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 02:09:46 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 l21-20020a05600c1d1500b003dfe462b7e4so8027409wms.0
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 23:09:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3lPcQ4RHMZ3h7WGdkWu74gz5pDiRQhZMKvDRNLxsYVM=;
 b=wyPLaCOROiDrV3rkwxSm3BX+Khn9+ppsF3yoF3tSm4blOeFJkfIjnHVY1Y4Fk5rHIM
 ms3UKjk7AUEZYPAX1xb/7Y/ljcQch47holiGwTaNILzvdQtry4KZn2ykj9TtGgqi/Bbu
 jWc1C1jvr2G/MF+VYt2AtjvylsJ3/1OOsbeYgzBsCmV2Asvl9T/XPxmfTUVhOEZP3MM2
 Oy8YlXK2GVlV5FhbgYLV4Z4YwuIAqmt7VVV9v37xCEsnKWJ8k8PcMi6SLH7qZmDeb5i9
 1u23fGGvwM4oJpjLbmaeDOAYXCNu+nezMJdNkYIIuNyH2F6hmJZqiatIz7mmeT12RGjv
 ftBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3lPcQ4RHMZ3h7WGdkWu74gz5pDiRQhZMKvDRNLxsYVM=;
 b=MOzor00VZiOvmHS6EIgvcQN2k9/K4lwJ+Wmsy2sRBSkLIEdt+VnKG/gBjluOXaKuIM
 Yh+rxGxcLxOfsGiIMsl1nfT0+a8vfTwmS67s8F1hk1sPcdL2MgONuTZVCy2wttBeDoxS
 VbQtegYr/GWotJNBLZwwHwXLFc0LApwpP/IvT7iv+ySPCf7U1KQT1XNkcTDWpSLrVjEs
 1Mt3MlPlyHYCUEJiiGBSSnOhwYTBX0q7930449HvwXMj41MYZJh1dKIBNhjSYT5SXCfc
 CjYOcA1K8AaCfDzaWDWtmnYHs+uwoF1LmflGlPfqVTzWgD+XLGSy6vFZXthYYwS66TD6
 6nwQ==
X-Gm-Message-State: AO0yUKW87id1zcpYkp2NRaquRKhJZ5f8eHNq12T9GfiCLeeCPbCuHTBk
 9n4GukvpSr1zureA2xLM1ZdYP5/e5uBIhR/A
X-Google-Smtp-Source: AK7set/IOJLVLOW+fB4941M5uIAj6b4DO0FKHmKTCr5+weFJeqclgfQSiibo9RYN7J6zRPS5KsnBBA==
X-Received: by 2002:a05:600c:4da2:b0:3dc:51f6:8f58 with SMTP id
 v34-20020a05600c4da200b003dc51f68f58mr18304792wmp.6.1676272180875; 
 Sun, 12 Feb 2023 23:09:40 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a05600c45cc00b003dfe5190376sm13794724wmo.35.2023.02.12.23.09.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sun, 12 Feb 2023 23:09:40 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Eduardo Habkost <eduardo@habkost.net>
Cc: qemu-block@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Li Qiang <liq3ea@163.com>, qemu-s390x@nongnu.org,
 Hu Tao <hutao@cn.fujitsu.com>, Gonglei Arei <arei.gonglei@huawei.com>,
 Cao jin <caoj.fnst@cn.fujitsu.com>, xiaoqiang zhao <zxq_yx_007@163.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, David Hildenbrand <david@redhat.com>,
 Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH v2 15/19] hw/s390x/event-facility: Replace
 DO_UPCAST(SCLPEvent) by SCLP_EVENT()
Date: Mon, 13 Feb 2023 08:08:16 +0100
Message-Id: <20230213070820.76881-16-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230213070820.76881-1-philmd@linaro.org>
References: <20230213070820.76881-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
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


