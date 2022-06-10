Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8AAE545E5D
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 10:17:01 +0200 (CEST)
Received: from localhost ([::1]:50828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzZpE-00054G-Kg
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 04:17:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35200)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWf-00072r-UI
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29135)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nzZWe-0006Em-DY
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 03:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654847867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lTKRJanXFURgJLxcj5dmeUvRqlcXPToktz3OKgKMDvw=;
 b=MvmQqv7HMM7/PbsaJkITcjOs8JPwkmPjbUdyqD6wVC3UVI/wLW3yK5OJuESTp4K1b/l1rd
 E7X2NoETMPDxgfSqfaLK5y0wpXKqWOQjEmzW44qEQZO3ytKiPzbZ2QpPBc4YkpWvZ3a4ta
 oC4TTthA+zFgivpGaO0oEwxNolazIZU=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-5LFBjAHwNq6W6bjRWxlIgA-1; Fri, 10 Jun 2022 03:57:46 -0400
X-MC-Unique: 5LFBjAHwNq6W6bjRWxlIgA-1
Received: by mail-wm1-f71.google.com with SMTP id
 c187-20020a1c35c4000000b003970013833aso9327994wma.1
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 00:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=lTKRJanXFURgJLxcj5dmeUvRqlcXPToktz3OKgKMDvw=;
 b=ikN5TnFKeMokKEy7BVzkYnh4mF23DIn8WKiTvKlPqDXHjiz8qlQ+3S6KfSD7XN2C+V
 XWSmyDTAzrPgyu4+wUlO19sNsB9szsJRYv6LhJKBRTHh0h/COoGrygO/FyYWSKvmQsL/
 q00srAlPnBEcnyTerL7cqbKb9PuQ12DH8HG5H/scBnrtxuzgi1m2p3nTBDuQPPwULkHc
 J5Q41a/zceNWdjwWUaaYLPFWSoYFcOB8nDC3vJGdywn0C1ZaTnmLt+omzZqxNp0OKWaQ
 GR9lbuTS6u4JmlIqUEpr0t4ZbJXNYjL3JjzDrE5w26ILz/RagaZwKpak+6ZVP2sdESjO
 kxZA==
X-Gm-Message-State: AOAM5334slvFBy2N1Tx4//NdNX2mWGgsaiVzcZiqmbZklQZZuBF3w/Ws
 cDJzEQJY6IhOaI7o2NsXIIkvnf1X85h0wmoh8HNgR51uS31xwdL6PoVcbyx7LSHrJZgxhQtl3rM
 epFcq5AlmkB1GwajFM60jCvua9Uc3FJTBqiPDXrP+oFgWUpj/si7+9lTzwi/V
X-Received: by 2002:a05:600c:4ed4:b0:39c:325e:5d81 with SMTP id
 g20-20020a05600c4ed400b0039c325e5d81mr7577285wmq.76.1654847865269; 
 Fri, 10 Jun 2022 00:57:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2z22fzJLnEX2S61EHbf4y/mt61gkyRGdRCEfgjfnRsQXeju9V1ApTj19A7NdFcJ1jzSY4bA==
X-Received: by 2002:a05:600c:4ed4:b0:39c:325e:5d81 with SMTP id
 g20-20020a05600c4ed400b0039c325e5d81mr7577267wmq.76.1654847864999; 
 Fri, 10 Jun 2022 00:57:44 -0700 (PDT)
Received: from redhat.com ([212.116.178.142]) by smtp.gmail.com with ESMTPSA id
 m2-20020adfe942000000b0020fcaba73bcsm26952181wrn.104.2022.06.10.00.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 00:57:44 -0700 (PDT)
Date: Fri, 10 Jun 2022 03:57:42 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 14/54] tests: acpi: update expected DSDT.ipmismbus blob
Message-ID: <20220610075631.367501-15-mst@redhat.com>
References: <20220610075631.367501-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220610075631.367501-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Igor Mammedov <imammedo@redhat.com>

expected AML change:
         Name (_CRS, ResourceTemplate ()  // _CRS: Current Resource Settings
         {
            I2cSerialBusV2 (0x0000, ControllerInitiated, 0x000186A0,
    -           AddressingMode7Bit, "\\_SB.PCI0.SMB0",
    +           AddressingMode7Bit, "^",
                0x00, ResourceProducer, , Exclusive,
                )
          })

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20220608135340.3304695-15-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/DSDT.ipmismbus          | Bin 8391 -> 8378 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index b4687d1cc8..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/DSDT.ipmismbus",
diff --git a/tests/data/acpi/q35/DSDT.ipmismbus b/tests/data/acpi/q35/DSDT.ipmismbus
index 07ba873b79caadd73ed9721fcbeee84c57676e2a..415fe08a407690c0e118743d872de79d22f01a4c 100644
GIT binary patch
delta 85
zcmX@^xXY2tCD<iomjVL=W93G!vyzG~?0WIRPVoWGo(9oP?rg!nP6izDjxIqw%nb4j
k(M_(blYdBRi%D{c^$9XC0wGW%8^eM&5F>80n^Yqk0Lq6G-v9sr

delta 98
zcmdnxc-)c8CD<k8xB>$M<Nb|XXC)OKIrQR#o#F$WJq@CpT-bwsoeVhQ9bJNWm>J|5
sqMMx9CjXGsR#xLu?vrC+1VW%jHiiXlAVv&OqaH}39!S?_OQ}XS01jdo-v9sr

-- 
MST


