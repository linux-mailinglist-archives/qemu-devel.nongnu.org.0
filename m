Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06146400D29
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 23:44:09 +0200 (CEST)
Received: from localhost ([::1]:60274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMdSK-00074B-26
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 17:44:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35420)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLR-0005lW-E2
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27652)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mMdLP-0001Hm-N9
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 17:37:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630791419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vFrxzlGUYuvipK0lYqredbuf7giybAcrOV0JeHM2q0Y=;
 b=a8xlgAL8yoS53X7QP9IfXOyhGWrujxFNDzvG3cfaG//NEIt5GiY4r2jvG/MZjYTt+u5iEZ
 JzwWOAUCQ7HHeExZtIxwYJfNdHpXp07uT77o2NN1fVLk68eQgytc6Bb3Uv05zLz3VKLjWS
 m4iwh/zWiGDVgYBpo0XqwTzmDpzq/OU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-370-s0RaldS5OiCSgCtLEA74vw-1; Sat, 04 Sep 2021 17:36:58 -0400
X-MC-Unique: s0RaldS5OiCSgCtLEA74vw-1
Received: by mail-ed1-f72.google.com with SMTP id
 b15-20020a05640202cf00b003cd5efcd633so1507130edx.9
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 14:36:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=vFrxzlGUYuvipK0lYqredbuf7giybAcrOV0JeHM2q0Y=;
 b=mucyfOZb6As63TeYGAVkS/mFlJMWyco4I3adij/fDxjIgdCgVh969GRyEb4fAJwtMH
 g9CjVbO4QkW1e6FPR7cAbcN5XD3f94vNh8v83zEKbbyXSwBWrqm+7sT5wBaGHrYRq9Vh
 Rq4/cGRHrKZ+CakIUNgPDvN2vZMxJ6yhrthzvbtr+4aphRivx7SZ7JxMVHXlomsrtA8t
 BJ07scgJTxhAJu/0n38s/F8y3yF8cbKLTaCWD1Jdau3isPT/Wf2La8ec+49fsV8wmDIu
 X98WefsdIV5Aaf4nUnnnk5x4R5pdauMwlFUeSYFHbZpp1xFYPIrACoiMvcfAecn/O3S2
 WUMg==
X-Gm-Message-State: AOAM530gmbNVCZcbJ2wo8Xnve8S+gcEUsAWeWSxy0E17RUOM4YzjuJHw
 U+9aJtMa1A/6i6oU27SFT4afp+82cOpNRX0iROxxhUMkRkWnKXKiH5jKyKzaedoHy4eHgpxcRCm
 EhuTvVfLzckI/6v2Ek0nb1h9qzlT59lJ1WEuSDij1q++UQf3hP7s6X/vtN/P+
X-Received: by 2002:a17:906:988a:: with SMTP id
 zc10mr6024740ejb.256.1630791416751; 
 Sat, 04 Sep 2021 14:36:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnkjeDJtYLNSbNsguEmH4lDJgtevTGyMucaNvRFDuibG/oIX+9utyOZcAZbhmIDPA6F7rAGg==
X-Received: by 2002:a17:906:988a:: with SMTP id
 zc10mr6024723ejb.256.1630791416559; 
 Sat, 04 Sep 2021 14:36:56 -0700 (PDT)
Received: from redhat.com ([2.55.150.176])
 by smtp.gmail.com with ESMTPSA id d6sm1900829edx.0.2021.09.04.14.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 14:36:56 -0700 (PDT)
Date: Sat, 4 Sep 2021 17:36:53 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/35] MAINTAINERS: Added myself as a reviewer for acpi/smbios
 subsystem
Message-ID: <20210904213506.486886-20-mst@redhat.com>
References: <20210904213506.486886-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210904213506.486886-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Ani Sinha <ani@anisinha.ca>

I have developed an interest in this space and hopefully can lend some
helping hand to Igor and Michael in reviewing simpler patches.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20210825031949.919376-4-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5d923a6544..6c20634d63 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1751,6 +1751,7 @@ F: docs/specs/*pci*
 ACPI/SMBIOS
 M: Michael S. Tsirkin <mst@redhat.com>
 M: Igor Mammedov <imammedo@redhat.com>
+R: Ani Sinha <ani@anisinha.ca>
 S: Supported
 F: include/hw/acpi/*
 F: include/hw/firmware/smbios.h
-- 
MST


