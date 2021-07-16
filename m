Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5198B3CB9AC
	for <lists+qemu-devel@lfdr.de>; Fri, 16 Jul 2021 17:22:54 +0200 (CEST)
Received: from localhost ([::1]:40250 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m4Pfx-0006bj-Be
	for lists+qemu-devel@lfdr.de; Fri, 16 Jul 2021 11:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYc-0000xM-4T
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31003)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1m4PYa-0003vz-G8
 for qemu-devel@nongnu.org; Fri, 16 Jul 2021 11:15:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626448515;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rnZmrpdt3JApfVreMKFcNarnw8Jq+7AjA6w24KOMdJg=;
 b=NAy2/fTiw332r3qRwe1YSksRe8KwX4Mq2i0NlV9fhvq80C928ZntTWxskcuYGXasBUEFjb
 ZflmzBfxTz/UqH2xnX3htAhsx72gl63TB+7lGCsKzKYDJMEHTtsmMHE7q/+91rwDIQqJR5
 ERHZkTKbaqg9PAHVLxuh0TidyiNCG8A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-xi9p5p7INeGuHQ0vGdDAFQ-1; Fri, 16 Jul 2021 11:15:14 -0400
X-MC-Unique: xi9p5p7INeGuHQ0vGdDAFQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 5-20020a0560001565b029013fe432d176so4927559wrz.23
 for <qemu-devel@nongnu.org>; Fri, 16 Jul 2021 08:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=rnZmrpdt3JApfVreMKFcNarnw8Jq+7AjA6w24KOMdJg=;
 b=CoYdOWdclDDeQBBriYqwVNjI++KC0fyomXwbOe3MDEqEMcAn80jXwJlWAYje5xIZhz
 IAtLFBK0f5QFaWfyKscRbPX+8LZcXfXHxP7wfbCDEPYUx8kXDwZLS8Ac9RavnZSG8eG+
 xZ77njEz/KFkW0W2+L0z/Iu0jiba+4wpIdU5jM6ctdaa7P+jjUOrjNDxsCgBvcH+qXd1
 DtTyx5/2UJP0iMzFYPZu+6l93xSOpWEvrUmSvNWLkkLFJxbZO5vhLrJSJ2CQzRvRoHnU
 BpqlO41TX6TTCtTL6MrqEJM/YRTxfHQxfpsFyU7bXHCxE1lCpHHvhjovfjhoXn/U2Tck
 eo+Q==
X-Gm-Message-State: AOAM53360XcKuJ9DXuQXX0QoUQPgC182JqYu7+rraQHfCAjRrimElqff
 0ogouCrqIdJeomxfZjGrBfkBegFYUEWdiMG5lmAXGW96GYydPNs9OlKnpKpckGys7+eSb9kfeCV
 T3IK0IvCm14kR0xXhIKA4stjTlu3BZAHfYoMJ5rrkDhux2IHxyRD2WTkg+PNf
X-Received: by 2002:a5d:4527:: with SMTP id j7mr12889629wra.137.1626448512984; 
 Fri, 16 Jul 2021 08:15:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYVrfIE7EUczMkmHlPekVLUSyoYfY2LK07NyR/fBlLmupG6BzSQANhTMAU4hvJus/DJVgShg==
X-Received: by 2002:a5d:4527:: with SMTP id j7mr12889610wra.137.1626448512839; 
 Fri, 16 Jul 2021 08:15:12 -0700 (PDT)
Received: from redhat.com ([2a10:8004:6ff2:0:a1b1:b3d8:4c4e:4825])
 by smtp.gmail.com with ESMTPSA id x18sm9936188wrw.19.2021.07.16.08.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 08:15:12 -0700 (PDT)
Date: Fri, 16 Jul 2021 11:15:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL v3 04/19] bios-tables-test: Allow changes in DSDT ACPI tables
Message-ID: <20210716151416.155127-5-mst@redhat.com>
References: <20210716151416.155127-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210716151416.155127-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
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
 Julia Suvorova <jusual@redhat.com>, Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Julia Suvorova <jusual@redhat.com>

All DSDT Q35 tables will be modified because ACPI hot-plug is enabled
by default.

Signed-off-by: Julia Suvorova <jusual@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-Id: <20210713004205.775386-5-jusual@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..c5167f48af 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,12 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.tis",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.acpihmat",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.dimmpxm",
+"tests/data/acpi/q35/DSDT.nohpet",
-- 
MST


