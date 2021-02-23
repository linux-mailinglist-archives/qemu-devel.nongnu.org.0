Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFA84322E77
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:13:10 +0100 (CET)
Received: from localhost ([::1]:47968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaJB-0006Wr-RN
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:13:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33810)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaCb-0006o3-4L
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:06:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lEaCY-0004lW-KN
 for qemu-devel@nongnu.org; Tue, 23 Feb 2021 11:06:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614096377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=z9qHGdV04zeNTc+xnPb71EfvMlhKMC3upZAdBsWl0u0=;
 b=QttjvPPuqbg3Bma7kUYEDre+i4jb5Th3NypuTHktsHNA8kTfOJhCa2lYdBg9Hv6hhS+nt1
 0GLRwhQpZgwKIv6vRcQkzrpfxu9b591V4wOKxvIWbpHWRiiNRESMf0DIMTm7cZbIdyVNNP
 zimxaMrE1eCQ2QV7cwm7FK/huCNs6ls=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-gEwxob0DP2qUEdURmN35tA-1; Tue, 23 Feb 2021 11:04:00 -0500
X-MC-Unique: gEwxob0DP2qUEdURmN35tA-1
Received: by mail-wr1-f72.google.com with SMTP id e13so7530616wrg.4
 for <qemu-devel@nongnu.org>; Tue, 23 Feb 2021 08:04:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=z9qHGdV04zeNTc+xnPb71EfvMlhKMC3upZAdBsWl0u0=;
 b=Xqg9LPjDmYyHVClX5kCl3gRM+lW0cJ8Kl1dEIvIb3hYkW5manS2gDPzZB4Ler0NEcS
 b4EOz2Pz86uh+WcTf7wd714okxb7QHjly9uN0UVpcFx+HGwt1XGGF7Xrqcwc82t+6M4S
 X6ljV1FeI1NRSOg/r6LlXo1dHjZzknYkTAsnIcO96Qqu0P0q9qa4X4XJakBS56ZevkZm
 940cCxbhSE1Fq2WtN9OVkuV4AxGZQ4Ycbf1XiN2lldLfghH7aWm6fuI8SaobHp9hMmiO
 VV03gd5xefy3lpl2Y9LibQYHuoe8PnqNlx8sK+yDlZO0MgLOAH5Nr29PVJ7R0Zd3zyHF
 OLYg==
X-Gm-Message-State: AOAM530sFMW/aj1Dq2GGAkn7sNjxT+y9AsMI8Dx2/p8VUCC0I9MWzuVX
 WmSRuaWR4M/FzCLGUn85E1YHuoyOMIGx6rQll5dYB3C5C0EKCRrQuZpFEgW3/PQ0lyWWz+X1Bw0
 3rSSZ4m/n7PStU/jtGCuSWZ060HTaf5xeC2cofh80HffYu0VOfwC59ub5gVEB
X-Received: by 2002:adf:8185:: with SMTP id 5mr27831238wra.288.1614096239406; 
 Tue, 23 Feb 2021 08:03:59 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGfRujFjKVQd98znNsyvV49ITcYaOuOaSnIMG+w5C9irhOrqzT2tCdqKFFhXuo7R5D1DzmYQ==
X-Received: by 2002:adf:8185:: with SMTP id 5mr27831208wra.288.1614096239182; 
 Tue, 23 Feb 2021 08:03:59 -0800 (PST)
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
 by smtp.gmail.com with ESMTPSA id q24sm3059295wmq.24.2021.02.23.08.03.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Feb 2021 08:03:58 -0800 (PST)
Date: Tue, 23 Feb 2021 11:03:57 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 07/17] tests/data/acpi/virt/DSDT.pxb: update with _CCA
Message-ID: <20210223160144.1507082-8-mst@redhat.com>
References: <20210223160144.1507082-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210223160144.1507082-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jiahui Cen <cenjiahui@huawei.com>,
 Xingang Wang <wangxingang5@huawei.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xingang Wang <wangxingang5@huawei.com>

Update expected DSDT files accordingly, and re-enable their testing.
diff of disassembly of changed expected files:

    diff -ru -IDisassembly old/tests/data/acpi/virt/DSDT.pxb.dsl new/tests/data/acpi/virt/DSDT.pxb.dsl
    --- old/tests/data/acpi/virt/DSDT.pxb.dsl       2021-02-23 09:54:18.566781350 -0500
    +++ new/tests/data/acpi/virt/DSDT.pxb.dsl       2021-02-23 09:57:51.952816428 -0500
                 Name (_BBN, 0x80)  // _BBN: BIOS Bus Number
                 Name (_UID, 0x80)  // _UID: Unique ID
                 Name (_STR, Unicode ("pxb Device"))  // _STR: Description String
    +            Name (_CCA, One)  // _CCA: Cache Coherency Attribute
                 Name (_PRT, Package (0x80)  // _PRT: PCI Routing Table
                 {
                     Package (0x04)

Signed-off-by: Jiahui Cen <cenjiahui@huawei.com>
Signed-off-by: Xingang Wang <wangxingang5@huawei.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h |   1 -
 tests/data/acpi/virt/DSDT.pxb               | Bin 7689 -> 7695 bytes
 2 files changed, 1 deletion(-)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index 90c53925fc..dfb8523c8b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1,2 +1 @@
 /* List of comma-separated changed AML files to ignore */
-"tests/data/acpi/virt/DSDT.pxb",
diff --git a/tests/data/acpi/virt/DSDT.pxb b/tests/data/acpi/virt/DSDT.pxb
index eaa507b4bba45186d58c03695e46c5bba6a2695a..46b9c4cad5d65cb1b578410fb3168b70a05021be 100644
GIT binary patch
delta 40
wcmeCQ>9^r>33dtLmt$aHnm3V4nz3u6nj|Nq=VS-YfX)8GB^;ao33BrQ0MsA~u>b%7

delta 40
vcmeCT>9pZ;33dtLlw)9Ex<8Rinz3c0nj|Nq^JE9kfX&guc^sQrgt&PC)sYG9

-- 
MST


