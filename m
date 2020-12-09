Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5D72D4A01
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:24:13 +0100 (CET)
Received: from localhost ([::1]:56604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn54O-0007lz-Eg
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:24:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vu-0004qI-QJ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:11:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:47861)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kn3vs-0000d3-3T
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=DbpWHn7kujA8od1bySqWm905L7EHYrNPshpti/pX4Go=;
 b=VunjWWtEYeKxtLLUjweuIjnj51c0V7HFavEcQNiyiKIQofOA5MpbPZSkQVBs10W3nKxVjg
 +nMziB1W0ieMFbW4qtWSgZbJ1BKXVsUsbyOgbiSYeB7gZlVE1Ljn5LOkpHF28rrYxHOEmM
 i98Mjyia09yDPjwHM6NSAHbx5qIvlws=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-278-Y50n4L3NMrusg4BROOL-Tg-1; Wed, 09 Dec 2020 13:11:16 -0500
X-MC-Unique: Y50n4L3NMrusg4BROOL-Tg-1
Received: by mail-wr1-f69.google.com with SMTP id v5so965820wrr.0
 for <qemu-devel@nongnu.org>; Wed, 09 Dec 2020 10:11:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=DbpWHn7kujA8od1bySqWm905L7EHYrNPshpti/pX4Go=;
 b=OaKn29mg20ApcYdrCSWh35KF40dCdUy532Vu5cvLddnhVl/FFG8mI+HLO0xsJnR7pZ
 VZ9MT5zChaWfEx8xNlXvHxyw1YOF/QfkBzewf7wbRsgzScuMdhsdh2b/1JfCZLCigT6e
 D2D4xCrec6vR3OBZwR7FWvB/dNyZDsBfnKl/Np0Y9KBldjSwNNN6LC+/LOcorXlLqfPc
 kU8f70Imu58AUsLoizpy+HHPRe+NVgfOj9osZB9pxUAcMeLb7LYgUJiGa5yCRhI0cShI
 m3cfSlt3LTI59071g+4aeg6nb36HSpYgYD+rrq962S/9nCvnLkp/jghITuwtj9KP1qEo
 2XPQ==
X-Gm-Message-State: AOAM532myGwza+3MprvbVzPWLCD6XwCaZKftuwqVqD1w3xVT0wUVSZ7Y
 utXnY03+AKi8OkWIbPg5xc7mG6Cp/Nr5ABHBWcV4w/825vbD7uLLbF8a/JGGvWkFuqi5Z7pT7r0
 oaeoRlQ1wh9GWM4QRn6Nablv4P4B/Y9uEKw4b7IFb1HO/xJkZjaUZ867ljTjx
X-Received: by 2002:a7b:c751:: with SMTP id w17mr3973954wmk.121.1607537474689; 
 Wed, 09 Dec 2020 10:11:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxqB9tf2aNw4uPO7No4SgU/Z5irL2wDQfIPKn+mkT1StYIfpDrzTRnMq9PA7y5psakz+aO0pg==
X-Received: by 2002:a7b:c751:: with SMTP id w17mr3973922wmk.121.1607537474404; 
 Wed, 09 Dec 2020 10:11:14 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id n126sm4875202wmn.21.2020.12.09.10.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 10:11:13 -0800 (PST)
Date: Wed, 9 Dec 2020 13:11:10 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v2 58/65] tests/acpi: allow expected files change
Message-ID: <20201209180546.721296-59-mst@redhat.com>
References: <20201209180546.721296-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209180546.721296-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Igor Mammedov <imammedo@redhat.com>

Change that will be introduced by following patch:

@@ -557,6 +557,7 @@ DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
                 CINS,   1,
                 CRMV,   1,
                 CEJ0,   1,
+                CEJF,   1,
                 Offset (0x05),
                 CCMD,   8
             }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20201207140739.3829993-5-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..cc75f3fc46 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,22 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.hpbrroot",
-- 
MST


