Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7850C41F3A2
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:52:01 +0200 (CEST)
Received: from localhost ([::1]:56220 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMhU-0000YU-I6
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:52:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUM-0000aa-Rk
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:28 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:40867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1mWMUI-0000nx-H1
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:38:25 -0400
Received: by mail-wr1-x42f.google.com with SMTP id s21so16616204wra.7
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=LXRO/fMo8Qw/FWNF0Yyw4kfLM8T681YtQWZQBpSYMfI=;
 b=wnzB3u40kwE25RRbECRmS+b95hw+bozObqSwAyohmKp4lMi85g1vko8yMEgPOfvJb1
 BLiZOZC8Z7j/1hdsIXFOxvINCBciiWY5Yo20soVs/KpdQfSO5MWdywxc88oESPF3a+52
 swyaG2u2na1J56pQso5jZhrxbmym3O2fkE0EECzyJIc3KyrV+vMpQh07fRZq48EfoFis
 bCYxGqlMbohM9WcuH8Iby2nHIY11T2vrdKu1n1v5SrtXDkko+gqJTExhLSaXXNya7zSF
 VGC9dnAp+RWdNfSqzVUa3k/iCUAEPY3Y2lgiVx8bEk2GITTrurZLTkOPLJqKZ1oUe+UA
 T3Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LXRO/fMo8Qw/FWNF0Yyw4kfLM8T681YtQWZQBpSYMfI=;
 b=vfDaVLXYAH3Tq69TdGhmyfzIqeOARiUwvET3FlJ/Dm+jv/yoNKIO7dS+mLAq2+Oxny
 bD4YY3oF5+KdSMFLZelQBEUAxHHcDgxCkLcLKGRihdu7qrOWVRpJqPrJwzlj0Mg+VSOP
 Ysutwlz/2xRukhM+6Nm9u6XSrBfuiPCO+Dcg90ONYKzkOu339SowmbZG4b/KB2hVb/nB
 Wnc4qdntYq3HFhE1qW6lVHt7emtgkPatU7EruJ5U+l4/Vd5eK7aytNqhr2uGQn451rhC
 OAVKSEL4npGwRgJc57B8cBVJt6SsHcAWWAfzfHyu8Fu8oR8lzNL+TVFRE0UeOFKzvlb3
 ADBw==
X-Gm-Message-State: AOAM532As66O1SD1p/dlCAFPLU91iC7oT/purogT0fwmjVippUZwwiPE
 dUW+AXlquxI/IfTq8SSVspeUxA==
X-Google-Smtp-Source: ABdhPJyLNOaL55lonL4zFWy3iyhodXbu+zOq2iWmvubruxFj28FPvMwKeihHtUQqz9zjffN/sIYYTw==
X-Received: by 2002:adf:b311:: with SMTP id j17mr13567604wrd.340.1633109901232; 
 Fri, 01 Oct 2021 10:38:21 -0700 (PDT)
Received: from localhost.localdomain
 (cpc92880-cmbg19-2-0-cust679.5-4.cable.virginm.net. [82.27.106.168])
 by smtp.gmail.com with ESMTPSA id k9sm6186592wrz.22.2021.10.01.10.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:38:20 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: eric.auger@redhat.com,
	imammedo@redhat.com
Subject: [PATCH v4 10/11] tests/acpi: add expected blob for VIOT test on virt
 machine
Date: Fri,  1 Oct 2021 18:33:58 +0100
Message-Id: <20211001173358.863017-11-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211001173358.863017-1-jean-philippe@linaro.org>
References: <20211001173358.863017-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=jean-philippe@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, ehabkost@redhat.com, mst@redhat.com,
 richard.henderson@linaro.org, qemu-devel@nongnu.org, shannon.zhaosl@gmail.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, qemu-arm@nongnu.org,
 ani@anisinha.ca, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VIOT blob contains the following:

[000h 0000   4]                    Signature : "VIOT"    [Virtual I/O Translation Table]
[004h 0004   4]                 Table Length : 00000058
[008h 0008   1]                     Revision : 00
[009h 0009   1]                     Checksum : 66
[00Ah 0010   6]                       Oem ID : "BOCHS "
[010h 0016   8]                 Oem Table ID : "BXPC    "
[018h 0024   4]                 Oem Revision : 00000001
[01Ch 0028   4]              Asl Compiler ID : "BXPC"
[020h 0032   4]        Asl Compiler Revision : 00000001

[024h 0036   2]                   Node count : 0002
[026h 0038   2]                  Node offset : 0030
[028h 0040   8]                     Reserved : 0000000000000000

[030h 0048   1]                         Type : 03 [VirtIO-PCI IOMMU]
[031h 0049   1]                     Reserved : 00
[032h 0050   2]                       Length : 0010

[034h 0052   2]                  PCI Segment : 0000
[036h 0054   2]               PCI BDF number : 0008
[038h 0056   8]                     Reserved : 0000000000000000

[040h 0064   1]                         Type : 01 [PCI Range]
[041h 0065   1]                     Reserved : 00
[042h 0066   2]                       Length : 0018

[044h 0068   4]               Endpoint start : 00000000
[048h 0072   2]            PCI Segment start : 0000
[04Ah 0074   2]              PCI Segment end : 0000
[04Ch 0076   2]                PCI BDF start : 0000
[04Eh 0078   2]                  PCI BDF end : 00FF
[050h 0080   2]                  Output node : 0030
[052h 0082   6]                     Reserved : 000000000000

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/virt/VIOT                   | Bin 0 -> 88 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 29b5b1eabc..fa213e4738 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,4 +1,3 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/VIOT",
 "tests/data/acpi/q35/DSDT.viot",
 "tests/data/acpi/q35/VIOT.viot",
diff --git a/tests/data/acpi/virt/VIOT b/tests/data/acpi/virt/VIOT
index e69de29bb2d1d6434b8b29ae775ad8c2e48c5391..921f40d88c28ba2171a4d664e119914335309e7d 100644
GIT binary patch
literal 88
zcmWIZ^bd((0D?3pe`k+i1*eDrX9XZ&1PX!JAexE60Hgv8m>C3sGzXN&z`)2L0cSHX
I{D-Rq0Q5fy0RR91

literal 0
HcmV?d00001

-- 
2.33.0


