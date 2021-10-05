Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63C50422F30
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 19:27:31 +0200 (CEST)
Received: from localhost ([::1]:39136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXoDy-00062s-Ck
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 13:27:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvn-0002Oa-A7
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42951)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1mXmvZ-0007J6-IH
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 12:04:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633449864;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=irel6CMQ0akhtmSUsZfVhTgoEW0RWATql/OJv9DFUtE=;
 b=ZqbJcGa+8CSpgA96HSJ6JMZQ5kjD+dNPVKwSAMDonpd0c7aDPx+GKWBxGsFmOZDWuVctYF
 plfT66QymSqDk5286RuiUfueDcHwqHG8Veje1/SnzxWrzkmZE1j2VDAqn2v4XtwIDe1t49
 4FFg2bhlpuSwwFEGCJbByLEYax2sqjg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-67-qNFTKqcYO_WzsOuVKZihyg-1; Tue, 05 Oct 2021 12:04:23 -0400
X-MC-Unique: qNFTKqcYO_WzsOuVKZihyg-1
Received: by mail-wm1-f70.google.com with SMTP id
 d7-20020a1c7307000000b0030d6982305bso1497637wmb.5
 for <qemu-devel@nongnu.org>; Tue, 05 Oct 2021 09:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=irel6CMQ0akhtmSUsZfVhTgoEW0RWATql/OJv9DFUtE=;
 b=T2h8gz/FUk7vshX1YTmtDHxq9wId93L66CRSaKENZZRGTG3iq/Aj+cu6XO5KVHEev7
 SOvnM9zWaKmNsNWmPRvZQzrUW1IR/LnT3oVj/le6MmrQJggLF4/4UtoCKYomWjlx1NTb
 qVrV5HhNY5oINJ7WTkAKid54OR4ZbVimO3Ci2NvsxmfAUDi+2Ay7RmnD/6JP579VzDij
 u2BtSmOqiDiRMgIhcT2a4DK+EyUL3k59/FhfIkelk84FuIfxzOT284H2UrSza5epg8hz
 xBS4RY0uDT3XDVf+qqUMNcifu8STOqAcjQwGRjdzynanzt3oO8CshqB297xia7p7oRUL
 liZA==
X-Gm-Message-State: AOAM53122Y4tVxDPZWasqPNcBHhFT2Ua37ahvyQMULv85568/hXDI0In
 RRZ2ru5cV7/0wWkR3JyQjvIZnnzVuZQP3iEnq+y2KxBWYxcWJ4sRHxDw8R6aiqCmyZbL6qbAi6s
 8rOymv0g1r5lslC1k3YHvtmwRMIccr/4ELzsqEG0GoZ6mOamb7+QxfMwglE8a
X-Received: by 2002:adf:a35d:: with SMTP id d29mr22069296wrb.318.1633449861504; 
 Tue, 05 Oct 2021 09:04:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyLnofy00wNYxEaw1K4Z7Re2lwCAhBoTY2Ns1elMXQh5XC+adJUHfWSCFEyjmEh0aP592zifg==
X-Received: by 2002:adf:a35d:: with SMTP id d29mr22069262wrb.318.1633449861210; 
 Tue, 05 Oct 2021 09:04:21 -0700 (PDT)
Received: from redhat.com ([2.55.147.134])
 by smtp.gmail.com with ESMTPSA id j6sm4442102wrh.76.2021.10.05.09.04.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Oct 2021 09:04:20 -0700 (PDT)
Date: Tue, 5 Oct 2021 12:04:17 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 49/57] acpi: AcpiGenericAddress no longer used to map/access
 fields of MMIO, drop packed attribute
Message-ID: <20211005155946.513818-50-mst@redhat.com>
References: <20211005155946.513818-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20211005155946.513818-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Cc: Ani Sinha <ani@anisinha.ca>, Peter Maydell <peter.maydell@linaro.org>,
 Eric Auger <eric.auger@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
Message-Id: <20210924122802.1455362-36-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/acpi/acpi-defs.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/hw/acpi/acpi-defs.h b/include/hw/acpi/acpi-defs.h
index ee733840aa..c97e8633ad 100644
--- a/include/hw/acpi/acpi-defs.h
+++ b/include/hw/acpi/acpi-defs.h
@@ -55,7 +55,7 @@ struct AcpiGenericAddress {
     uint8_t access_width;    /* ACPI 3.0: Minimum Access size (ACPI 3.0),
                                 ACPI 2.0: Reserved, Table 5-1 */
     uint64_t address;        /* 64-bit address of struct or register */
-} QEMU_PACKED;
+};
 
 typedef struct AcpiFadtData {
     struct AcpiGenericAddress pm1a_cnt;   /* PM1a_CNT_BLK */
-- 
MST


