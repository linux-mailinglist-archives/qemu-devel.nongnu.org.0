Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4D50681B66
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:26:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMacW-0002GD-De; Mon, 30 Jan 2023 15:19:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacP-0002Ff-8C
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacN-0006p7-Qb
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109947;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RaykUdmYG7lWtZZWRxiRmGZWR8mEpfOcqXuCFGPAZyA=;
 b=H0Ye4w5QVsbKJX5HOMu/2OIw0ghrrdvWVU6k+rAf5XtH2yQVqQuDZecXiysQgKuOBzaEe+
 s0Zxt0BR/0PVsJPdkURFQzH/cQHtE1biL0a6Viof/LHTNY1dYp8jfltoXPrmGrQIjn4Ty5
 LNrOVaUY+9OnmLw0QH8e+Cywga15mnA=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-IzxoTOmwONGRIPn9kmC7oA-1; Mon, 30 Jan 2023 15:18:59 -0500
X-MC-Unique: IzxoTOmwONGRIPn9kmC7oA-1
Received: by mail-ed1-f71.google.com with SMTP id
 y21-20020a056402359500b0049e171c4ad0so8881841edc.6
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:18:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RaykUdmYG7lWtZZWRxiRmGZWR8mEpfOcqXuCFGPAZyA=;
 b=20HlhmOk92HiuyNmzVER6OGKmluD1Op4MO+FHnGWQd1NMjwIsU514/CySkf/I3NLsH
 BiuKIKNW/mo8pPhQmsFdI/7b3Nw9ogIlmNswwH2RyVJMZuFJNIUQVLYWO1my2AlUST3Q
 OSrfY9oRUOu9loal1Vheve5ycClQEEs4qC3LKo58YwjHbbSyVr3gW1pnetJ7ZlOGMrBk
 PMyKlX4VaU+3pallBN2b8AzkV/6x7Q37PlR6di2MPeEg4sXJUktUD9K1R9mFnFJTx0rj
 VNfMCGgTRbjy0lOL3+JZzZ08UYoDimFE9AW0qgsD2H68PK8SJ5EctASXWuIMzwJ8IWIJ
 8iog==
X-Gm-Message-State: AO0yUKUjh/PPUSiH5JR8CTeLiHrt6eZTv4XVEKYc1+EyVrs/Blow8f1O
 1X5JbZB6ECF6aZsgWLmhXqUzDjMjJYKrHQZvHTgYyC2LNt5R6EPdjUwZdA2jn5xVdS2tcAluU2R
 Ir0j7Y+Nqwh8AYRFvzneieZFzf3yV6/yb2WS58mtpsKnSeY/j9jMCsC4TSYf+
X-Received: by 2002:a05:6402:4505:b0:4a0:8bcc:3cbc with SMTP id
 ez5-20020a056402450500b004a08bcc3cbcmr24073874edb.25.1675109937586; 
 Mon, 30 Jan 2023 12:18:57 -0800 (PST)
X-Google-Smtp-Source: AK7set9lUqAX961AwrtwfLom5uF55M1F7bRWhCq6d86ExzmZxucE5dlsnrnK97chE1dTsKvLjIvZ7g==
X-Received: by 2002:a05:6402:4505:b0:4a0:8bcc:3cbc with SMTP id
 ez5-20020a056402450500b004a08bcc3cbcmr24073853edb.25.1675109937333; 
 Mon, 30 Jan 2023 12:18:57 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 q8-20020a056402032800b004a24b8b58cbsm1599595edw.16.2023.01.30.12.18.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:18:56 -0800 (PST)
Date: Mon, 30 Jan 2023 15:18:54 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Bernhard Beschow <shentey@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: [PULL 04/56] hw/acpi/piix4: No need to #include
 "hw/southbridge/piix.h"
Message-ID: <20230130201810.11518-5-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

From: Bernhard Beschow <shentey@gmail.com>

hw/acpi/piix4 has its own header with its structure definition etc.

Ammends commit 2bfd0845f0 'hw/acpi/piix4: move PIIX4PMState into
separate piix4.h header'.

Signed-off-by: Bernhard Beschow <shentey@gmail.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230121151941.24120-4-shentey@gmail.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/acpi/piix4.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 0a81f1ad93..2ab4930f11 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -21,7 +21,6 @@
 
 #include "qemu/osdep.h"
 #include "hw/i386/pc.h"
-#include "hw/southbridge/piix.h"
 #include "hw/irq.h"
 #include "hw/isa/apm.h"
 #include "hw/i2c/pm_smbus.h"
-- 
MST


