Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2ED6136F6
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 13:53:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opUHJ-0003WN-My; Mon, 31 Oct 2022 08:52:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGj-0002Mw-MY
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:51:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1opUGW-0002NM-8b
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 08:51:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667220699;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oOh1HLJjiZGbBo3ZKq+CicPAufMrxh5O/nCB7GKJexA=;
 b=hdu2Xlw35aVx4gzWlGqGHLhwSc+67WEB/Yoe88ZbR/G0kGxBC0kD0c5Toov62mmwJtJ/bo
 Zr0wDx82xzjSZO/8+3mGgZv2wEC7opHYiKM+ho0hgXAOzmzuLoj7/662eHXN8hFNT9cvz+
 0iGcb3C50C0zOv7Pg/MEqoe0rK8xXws=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-4dPt7aMiPzmxi54Y3geLLw-1; Mon, 31 Oct 2022 08:51:38 -0400
X-MC-Unique: 4dPt7aMiPzmxi54Y3geLLw-1
Received: by mail-wm1-f69.google.com with SMTP id
 s7-20020a1cf207000000b003cf56bad2e2so2211669wmc.9
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 05:51:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oOh1HLJjiZGbBo3ZKq+CicPAufMrxh5O/nCB7GKJexA=;
 b=1gGRL1Z8vTf2UAeBbrMSR54xv7XhcCPUEl0RURkWwt1ozRHEtncnnz5JHxrnWFs/sj
 g/bEoThz48tWsbcYYr2ErfSXBYGu9RTrzYVOUAnaG5PIPiqOQ7EF2H6vOR80HEa2kgxt
 1I+TPAFzSuQzNG+WOTYNpFOrzL6SM1IOc+k52GUSni5iuEkfGUCjTZsGBPXsNTUrO+al
 ivz3cFr0saKTZwXdC4GQGvp8fgCm0SpOF9ds9YZeUU0M14mgbuKi8WwPaURyehHI7Hom
 AOo3qne1gM1SOCnbewVXhsiN3+xHhvTE+cufh9BEjMjP4r54mpxsXWo5AkuIzUtQ92+1
 eg6Q==
X-Gm-Message-State: ACrzQf0tRt/44rh1wRQnkGLCVFHvFNMiKKuu6DjQY2TajpOpMoKCWv6f
 odWL959mJ34XT4QbXfNjl2SfaRJqucIDVFNFlXjwTdGAlhbNoPwvKkYhSRcC/kcxSafs28jRr3D
 vCz0HkqaLsX9OkU6th74hBPFL76XprXFSkIT+dWi0HIQnptUF1NgnFVdH9V3G
X-Received: by 2002:adf:e911:0:b0:236:73b7:e668 with SMTP id
 f17-20020adfe911000000b0023673b7e668mr7903600wrm.96.1667220696578; 
 Mon, 31 Oct 2022 05:51:36 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7LrnxxpNfuuPQjQpAxa0W7JjWQfj8vUU7E2ffR3WQLKCIeYf/MahJ8C5zwn3rByIPchXDVBA==
X-Received: by 2002:adf:e911:0:b0:236:73b7:e668 with SMTP id
 f17-20020adfe911000000b0023673b7e668mr7903572wrm.96.1667220696284; 
 Mon, 31 Oct 2022 05:51:36 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 l24-20020a1c7918000000b003cf7928e731sm434856wme.9.2022.10.31.05.51.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 05:51:35 -0700 (PDT)
Date: Mon, 31 Oct 2022 08:51:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Daniel P =?utf-8?B?LiBCZXJyYW5nw6k=?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Michael Tsirkin <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PULL 17/86] MAINTAINERS: add myself as the maintainer for acpi
 biosbits avocado tests
Message-ID: <20221031124928.128475-18-mst@redhat.com>
References: <20221031124928.128475-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221031124928.128475-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

From: Ani Sinha <ani@anisinha.ca>

I wrote the biosbits avocado tests for testing QEMU's ACPI/SMBIOS implementation
and all the related changes including fixes in biosbits software itself. Making
myself as the maintainer for QEMU's biosbits related files and test scripts.

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Maydell Peter <peter.maydell@linaro.org>
Cc: John Snow <jsnow@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Michael Tsirkin <mst@redhat.com>
Signed-off-by: Ani Sinha <ani@anisinha.ca>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Message-Id: <20221021095108.104843-8-ani@anisinha.ca>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 64893e36bc..8ea193c812 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1859,6 +1859,13 @@ S: Supported
 F: hw/acpi/viot.c
 F: hw/acpi/viot.h
 
+ACPI/AVOCADO/BIOSBITS
+M: Ani Sinha <ani@anisinha.ca>
+S: Supported
+F: tests/avocado/acpi-bits/*
+F: tests/avocado/acpi-bits.py
+F: docs/devel/acpi-bits.rst
+
 ACPI/HEST/GHES
 R: Dongjiu Geng <gengdongjiu1@gmail.com>
 L: qemu-arm@nongnu.org
-- 
MST


