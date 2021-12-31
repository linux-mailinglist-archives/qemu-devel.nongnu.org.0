Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A5AA482409
	for <lists+qemu-devel@lfdr.de>; Fri, 31 Dec 2021 13:52:59 +0100 (CET)
Received: from localhost ([::1]:46560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n3HP0-0000Ma-Hq
	for lists+qemu-devel@lfdr.de; Fri, 31 Dec 2021 07:52:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKP-0005sB-SV
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1n3HKO-0000hW-59
 for qemu-devel@nongnu.org; Fri, 31 Dec 2021 07:48:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640954891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JTqiL35hH/fnhlD9CAtxeQRLllRocCsMZlpBqswrwZk=;
 b=ECoZA3aVdYDNAbEVAnHxFuqa1wG7lG+yfJ7d/4v6cQoWLYbMe252qjx+SQjoRXOtuGIFfA
 bF/qnVnxFnYXehkOSoKstrv/WaryJ4rorj+O8auI5Qu4Gx82FUmCCKYKfR1wX/1lSRMBpL
 8FUne6kLuVQEshrQREk20GaXu/k30No=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-xMX-Ce7yOkiQMU9zSKDy5A-1; Fri, 31 Dec 2021 07:48:10 -0500
X-MC-Unique: xMX-Ce7yOkiQMU9zSKDy5A-1
Received: by mail-wr1-f72.google.com with SMTP id
 q21-20020adfab15000000b001a24b36e47eso7486604wrc.2
 for <qemu-devel@nongnu.org>; Fri, 31 Dec 2021 04:48:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JTqiL35hH/fnhlD9CAtxeQRLllRocCsMZlpBqswrwZk=;
 b=4pOB0ZnfRgrK4DQvmR1Q61l8gnAapYtunMjxMqLseO4MZdKma1SVGkMUMOQ9++POeT
 bkbV0optEkQN0u4/WUhjSRweLk1TS2vaB4d3CBEs7ETmcQzwFh0f418uAzHDYK+3EQRY
 AVPyLmt0DOo86vFOUwXD/PrKjQdqNqOwaIKRUyguPZyaMrMiC9NaWWzlSI/VhpSOnfHC
 oLEdht46Gmxx4qlrtZAbqdNiy4Af6ilAsXDodIFBXs3HcR1V7UC1U8KavD7dln1wPLWC
 dlaTjmffmOSd6O/rNYltprVFcjKMbIVl7mDCEnO5fhfoZqjGZDY2Ah8xb8VNskn2zFUx
 pMqQ==
X-Gm-Message-State: AOAM531cPRC0C99AdJK7KsSwN+OYx/WtM6VT3s9sqJ6s3RY/NrAHDs8a
 wLggxAHBwWS6LgLZ7ug3oSxNxSH0CJhF81uF8q+Z/4G26P/NmAdgpHBjd+v+JC/rNSLbcdRK9dg
 7MeuOHLMSxHw2aJBDTiAItW/CycHGxOLU5OMLFSRSyyzzFI/RWgv5XJ3yQSRGHeZO
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr29419136wrs.527.1640954889241; 
 Fri, 31 Dec 2021 04:48:09 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwr/EmqueGAyqLvgcx4UNeUxXdD+Kd40nXpHzxituCIozj2AWoPC+VvUnNH9ocWmeRXHzswhg==
X-Received: by 2002:a5d:6d8a:: with SMTP id l10mr29419120wrs.527.1640954889066; 
 Fri, 31 Dec 2021 04:48:09 -0800 (PST)
Received: from x1w.redhat.com (26.red-83-50-86.dynamicip.rima-tde.net.
 [83.50.86.26])
 by smtp.gmail.com with ESMTPSA id y11sm31550168wry.70.2021.12.31.04.48.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Dec 2021 04:48:08 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 03/20] hw/qdev: Correct qdev_connect_gpio_out_named()
 documentation
Date: Fri, 31 Dec 2021 13:47:37 +0100
Message-Id: <20211231124754.1005747-4-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211231124754.1005747-1-philmd@redhat.com>
References: <20211231124754.1005747-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) DKIMWL_WL_HIGH=-0.573, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

qdev_connect_gpio_out_named() is described as qdev_connect_gpio_out(),
and referring to itself in an endless loop, which is confusing. Fix.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Message-Id: <20211218130437.1516929-4-f4bug@amsat.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 include/hw/qdev-core.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index dcf20c69b89..424c48daf6e 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -504,7 +504,8 @@ qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n);
 void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
 
 /**
- * qdev_connect_gpio_out: Connect one of a device's anonymous output GPIO lines
+ * qdev_connect_gpio_out_named: Connect one of a device's named output
+ *                              GPIO lines
  * @dev: Device whose GPIO to connect
  * @name: Name of the output GPIO array
  * @n: Number of the anonymous output GPIO line (which must be in range)
@@ -526,7 +527,7 @@ void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin);
  * qemu_irqs at once, or to connect multiple outbound GPIOs to the
  * same qemu_irq; see qdev_connect_gpio_out() for details.
  *
- * For named output GPIO lines, use qdev_connect_gpio_out_named().
+ * For anonymous output GPIO lines, use qdev_connect_gpio_out().
  */
 void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
                                  qemu_irq pin);
-- 
2.33.1


