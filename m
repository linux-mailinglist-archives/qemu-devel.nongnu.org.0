Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBE33C5EAE
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 16:59:21 +0200 (CEST)
Received: from localhost ([::1]:33686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2xOy-0003v1-9q
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 10:59:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2xMp-0000ie-2z
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:57:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29247)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m2xMm-0002kF-JO
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 10:57:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626101824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EsWJ3o/dMM6pXUig7V9DTooMmlda06sL7JmtLC+S8Uc=;
 b=RCYAP9wKXpg0f+sIh6TCOcSD7iuwIE3yoiyDKcJQ8zcfSQEqEHq7Z1ra7Jwv/DvVMWO81w
 VWMst6qMZFhbrLNh9WJWn1sB2DAb8Ke0SwV3M7ARELI0yrup47yGxr4WGP/PdGdTTQHmup
 AvNgL+UqVd0p0coXaMZuzUjUZ3TV7bg=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-273-ulPXEKEQNraCf_k9j_QACw-1; Mon, 12 Jul 2021 10:57:01 -0400
X-MC-Unique: ulPXEKEQNraCf_k9j_QACw-1
Received: by mail-wm1-f69.google.com with SMTP id
 k8-20020a05600c1c88b02901b7134fb829so2998285wms.5
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 07:57:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EsWJ3o/dMM6pXUig7V9DTooMmlda06sL7JmtLC+S8Uc=;
 b=D3AEJd1vqqg+NF8tF9H9+ADoh8TlimV9t6k6b/ipkfj2ldI36NSGpOA9teDT7qhk11
 pebUDi0vowpDbnjDE1qbD4+diA3fQ227ZHvn3LFxo/RRcLHMqbLobGyv7m+rM6A9MSFS
 liskYV/m/N0lxES+bjAxbJlKfKea/pSExmenS6MsHTFbIMalwXdh/a7jrMPSeLFzNfRs
 1KPzhAkzNMf760lykPoBYGRkHM+Mb8Pu8XFeCn9vXXNXpwJdoD3kMSFcFIqQdHsMUBhU
 OYMgFv5YoaJclr+lnB6EPAyWXJ2QFlGQHobpOS8Jw4sLurYId9qAGkOb2WFqMy77cX7Y
 BvvA==
X-Gm-Message-State: AOAM531EjMRiPsQZHSO+BVS+lWN/9h2WMLvSOlU4CxxSBdLAMRZD8lxV
 DC/ZoFVeyC5409nb6pbJZgBWPMYhGQyRQtQRBu5R+fY4h89H5azw3rVQcfueE2diR0dw3IdytuK
 Fuk4RR+zWKYSBs4Ku0CoiVVPNoCLOLYnOWIQ70+X8q2FlWfIfOrbeQQcFrQ+7t0gv
X-Received: by 2002:a7b:c958:: with SMTP id i24mr14788220wml.177.1626101820411; 
 Mon, 12 Jul 2021 07:57:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvlrLnyEM3YacRYYfpOWuriVigNivVM8AnjAWCj5fhXKYbPWeRhfsIcXxOe6hHLjZsCqugKQ==
X-Received: by 2002:a7b:c958:: with SMTP id i24mr14788193wml.177.1626101820121; 
 Mon, 12 Jul 2021 07:57:00 -0700 (PDT)
Received: from localhost.localdomain
 (abayonne-654-1-142-116.w86-222.abo.wanadoo.fr. [86.222.93.116])
 by smtp.gmail.com with ESMTPSA id h13sm14527112wrs.68.2021.07.12.07.56.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Jul 2021 07:56:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 4/4] MAINTAINERS: remove Laszlo Ersek's entries
Date: Mon, 12 Jul 2021 16:56:30 +0200
Message-Id: <20210712145630.2857814-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210712145630.2857814-1-philmd@redhat.com>
References: <20210712145630.2857814-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Kashyap Chamarthy <kchamart@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laszlo Ersek <lersek@redhat.com>

I've relinquished my edk2 roles with the following commit message [1] [2]
[3]:

> Maintainers.txt: remove Laszlo Ersek's entries
>
> I'm relinquishing all my roles listed in "Maintainers.txt", for personal
> reasons.
>
> My email address <lersek@redhat.com> remains functional.
>
> To my understanding, my employer is working to assign others engineers
> to the edk2 project (at their discretion).

[1] https://edk2.groups.io/g/devel/message/77585
[2] https://listman.redhat.com/archives/edk2-devel-archive/2021-July/msg00202.html
[3] http://mid.mail-archive.com/20210708070916.8937-1-lersek@redhat.com

Accordingly, remove my entries from QEMU's MAINTAINERS file as well, which
all relate to guest firmware.

Cc: Daniel P. Berrange <berrange@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Kashyap Chamarthy <kchamart@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20210708071409.9671-1-lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 MAINTAINERS | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 7a2bd2e7184..8543c7d1eb8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2200,7 +2200,6 @@ F: include/hw/southbridge/piix.h
 
 Firmware configuration (fw_cfg)
 M: Philippe Mathieu-Daudé <philmd@redhat.com>
-R: Laszlo Ersek <lersek@redhat.com>
 R: Gerd Hoffmann <kraxel@redhat.com>
 S: Supported
 F: docs/specs/fw_cfg.txt
@@ -2932,7 +2931,6 @@ F: include/hw/i2c/smbus_slave.h
 F: include/hw/i2c/smbus_eeprom.h
 
 Firmware schema specifications
-M: Laszlo Ersek <lersek@redhat.com>
 M: Philippe Mathieu-Daudé <philmd@redhat.com>
 R: Daniel P. Berrange <berrange@redhat.com>
 R: Kashyap Chamarthy <kchamart@redhat.com>
@@ -2940,7 +2938,6 @@ S: Maintained
 F: docs/interop/firmware.json
 
 EDK2 Firmware
-M: Laszlo Ersek <lersek@redhat.com>
 M: Philippe Mathieu-Daudé <philmd@redhat.com>
 S: Supported
 F: hw/i386/*ovmf*
-- 
2.31.1


