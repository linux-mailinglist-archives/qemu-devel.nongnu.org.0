Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 821C740B1C1
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 16:43:59 +0200 (CEST)
Received: from localhost ([::1]:37778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ9fC-00059h-8o
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 10:43:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9Mb-0006He-Ko
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:45 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:41954)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mQ9MQ-0005T2-3m
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 10:24:45 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso2734161wme.0
 for <qemu-devel@nongnu.org>; Tue, 14 Sep 2021 07:24:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=f5XrvFDDkZUqLBW2jEoK6VwyJ0imWYKMpETpzgPB57g=;
 b=lNTA91agW+sX0Fk9Gfzir23NsmKvSnYl2JyYVcbA8pK+OhlBqlFKlG0igQLr8DIh2Z
 vi92CD8xg8rWHc9yUETTZow84894F/ol26wPsq8nKjWLnWeg+a6mYJH0S0xT0oLQQhyG
 7kugnDNpuy4LpMf6XLd/zG5adCexR7ZCAfRsDq+20MarPHLjMJvf8ZB3ViR5kvTCLZPZ
 eUaYGJxZ4t/EjWsxUYqWz8sH8o/TASR2tVi+4Lq89Dx3d6CXq6PmQwZeyJ9ZtLlZ8eNS
 DHrjgGFVKqBI0qnMEsqg1XDPa9+S0/heGBs65HVkX6qt7HSAjwqw9ZfkUJywXCDtAsC/
 flVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f5XrvFDDkZUqLBW2jEoK6VwyJ0imWYKMpETpzgPB57g=;
 b=OUPlFmcrBQM0kUQHjVpGFQjN/jBWesYyp1akH9aLKfZVh5MGZDmWMSJ3AMgTXZ4SIs
 3WbqFJdSf4IYKqI93udcvvprUFaWE4A54I3tDxPapntjPC2N/LUV82+kyfZrvq/LTxpM
 yBgaC39jyoybCqZaBUfk69biGAPiMeRZhW0FIpy+Q0Xm1aRhI1WBxR1n3tSTFrPDfwQ/
 3kY6RVfqRoLlf9sxYe20nTfrdPUVTE50MkwtSyherVpjfMb5JNdGgPPUkhZLa163BuLj
 ItDM6T5JzHUJ7mhHL3QnDZmEWlejUKyXbeoyVqC5gRU7Et4/Kg5GwFmD2iOaV9zABqTS
 H25A==
X-Gm-Message-State: AOAM533wMBbtqmNe4lMeGce/b/baa9XFc+Ak82vmgIv+ybjcjTTjoQoP
 +VZRSuMv2HPhneYHcjdNCCpjvg==
X-Google-Smtp-Source: ABdhPJwlBBkPLdk99KypeO6Zf6He5n2D/lTs/Y8a0rHUC1b8Nw06UV8Vhuv9uKpD7cs8VSpHBajsNg==
X-Received: by 2002:a1c:a78d:: with SMTP id q135mr2571767wme.36.1631629471748; 
 Tue, 14 Sep 2021 07:24:31 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k6sm184252wmo.37.2021.09.14.07.24.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Sep 2021 07:24:31 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com
Subject: [PATCH v3 10/10] tests/acpi: add expected VIOT blob for q35 machine
Date: Tue, 14 Sep 2021 15:20:05 +0100
Message-Id: <20210914142004.2433568-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210914142004.2433568-1-jean-philippe@linaro.org>
References: <20210914142004.2433568-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 pbonzini@redhat.com, ani@anisinha.ca, imammedo@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VIOT table generated for the q35 test is:

[000h 0000   4]                    Signature : "VIOT"    [Virtual I/O Translation Table]
[004h 0004   4]                 Table Length : 00000070
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : 3D
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   2]                   Node count : 0003
[026h 0038   2]                  Node offset : 0030
[028h 0040   8]                     Reserved : 0000000000000000

[030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
[031h 0049   1]                     Reserved : 00
[032h 0050   2]                       Length : 0010

[034h 0052   2]                  PCI Segment : 0000
[036h 0054   2]               PCI BDF number : 0010
[038h 0056   8]                     Reserved : 0000000000000000

[040h 0064   1]                         Type : 01 [PCI Range]
[041h 0065   1]                     Reserved : 00
[042h 0066   2]                       Length : 0018

[044h 0068   4]               Endpoint start : 00001000
[048h 0072   2]            PCI Segment start : 0000
[04Ah 0074   2]              PCI Segment end : 0000
[04Ch 0076   2]                PCI BDF start : 1000
[04Eh 0078   2]                  PCI BDF end : 10FF
[050h 0080   2]                  Output node : 0030
[052h 0082   6]                     Reserved : 000000000000

[058h 0088   1]                         Type : 01 [PCI Range]
[059h 0089   1]                     Reserved : 00
[05Ah 0090   2]                       Length : 0018

[05Ch 0092   4]               Endpoint start : 00003000
[060h 0096   2]            PCI Segment start : 0000
[062h 0098   2]              PCI Segment end : 0000
[064h 0100   2]                PCI BDF start : 3000
[066h 0102   2]                  PCI BDF end : 30FF
[068h 0104   2]                  Output node : 0030
[06Ah 0106   6]                     Reserved : 000000000000

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/q35/VIOT.viot               | Bin 0 -> 112 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 27ab8d3ba8..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/q35/VIOT.viot",
diff --git a/tests/data/acpi/q35/VIOT.viot b/tests/data/acpi/q35/VIOT.viot
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..275c78fbe8e93190321d957c91c3f17551f865d4 100644
GIT binary patch
literal 112
zcmWIZ^baXu00LVle`k+i1*eDrX9XZ&1PX!JAex!M0Hgv8m>C3sGzdcgBZCBjEAU?c
OrV=a;;~4xmfH48g0SW;C

literal 0
HcmV?d00001

-- 
2.33.0


