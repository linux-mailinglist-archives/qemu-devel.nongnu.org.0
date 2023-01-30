Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 780BC681B72
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:27:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMahR-0001tv-QD; Mon, 30 Jan 2023 15:24:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeR-0006bz-Ja
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeN-0007OL-OP
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QzxMyl4llw24Se1VUeY7NbL65Y4Zm5CqI4IBQd7BzjU=;
 b=XdOmYAUNlqXQw9998/lHvmY0xnfqbVTX1LzJlPmG2UPjjkEMg4XiNVFJV79sgKU0fQPVp2
 NZokrUQQQEv+SufxmrWcGYX4jb6zNB8o7TXKTKnJJW4GEv5WEp3I+lmAauMEXtd9C2ZRdv
 k8l3Vz2JVDrSN0qmva7s4HTDkkBVD9Y=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-612-n0hrAosHOP6WS8-1M_SA0g-1; Mon, 30 Jan 2023 15:21:06 -0500
X-MC-Unique: n0hrAosHOP6WS8-1M_SA0g-1
Received: by mail-ed1-f71.google.com with SMTP id
 o21-20020aa7dd55000000b004a245f58006so2755437edw.12
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QzxMyl4llw24Se1VUeY7NbL65Y4Zm5CqI4IBQd7BzjU=;
 b=JgkT4irlvofn9p2tUieCai7Rc5j/YqMLJuJnTAEIrWw75MZ1M7IQwa5yUG0DdZXkZI
 47Jhy19m//XUTQ/gmHkKYKfk69IlWxbvB2gVD1reLckPdAmPHrqW+QKRqrSQphqOJC28
 T8e28K+j7wtUmJ8MVKPoBQUbqdVIkRibC+Ohb5XTzq2aKhJ0Z+aZUd69HGPBu8AJZCq5
 /BrVRYgUi/+gIt2IH1LGHYRc6oEG7cuaCYHMxP0fasOrmX8TnSzDs/ILuMXkqQYZ9IIJ
 NtsPv9Q0O5y+9XtO8p/2ImhktKMknFvmkCu8TfD7LYLDoGhC5WtsIJkcQ1H5qBj5wBzc
 gPPQ==
X-Gm-Message-State: AO0yUKUbn2tWUtNZT5kLibM5XGsauDOvnwjnj9VyEOvkvbyoqF76A7bm
 n59RJ/Qjvho5yUPuqK7X/rYsg3xYxcAlROKmvbSmbUbrX3PSzdwLvi4EtMdk63ud1xck8NXr68Q
 gp8aLUvo1DdcSYnkklkkvDStonvc9x2rIeEKjeeE4KqkGUl1aJGUtZfOZba7U
X-Received: by 2002:a17:906:c14f:b0:879:4f94:41eb with SMTP id
 dp15-20020a170906c14f00b008794f9441ebmr18686001ejc.72.1675110065472; 
 Mon, 30 Jan 2023 12:21:05 -0800 (PST)
X-Google-Smtp-Source: AK7set8v54XGJhUCE0JYl9X8+p1RhEk9wA1bOOGfdGJ5lIIOBmiMm4Ud+x5e45yloWqVRHRqADoWVw==
X-Received: by 2002:a17:906:c14f:b0:879:4f94:41eb with SMTP id
 dp15-20020a170906c14f00b008794f9441ebmr18685986ejc.72.1675110065270; 
 Mon, 30 Jan 2023 12:21:05 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 i12-20020aa7dd0c000000b0045ce419ecffsm7302824edv.58.2023.01.30.12.21.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:04 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>
Subject: [PULL 42/56] tests: acpi: whitelist DSDT before decoupling PCI
 hotplug code from basic slots description
Message-ID: <20230130201810.11518-43-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-33-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..1983fa596b 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,15 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/pc/DSDT",
+"tests/data/acpi/pc/DSDT.acpierst",
+"tests/data/acpi/pc/DSDT.acpihmat",
+"tests/data/acpi/pc/DSDT.bridge",
+"tests/data/acpi/pc/DSDT.cphp",
+"tests/data/acpi/pc/DSDT.dimmpxm",
+"tests/data/acpi/pc/DSDT.hpbridge",
+"tests/data/acpi/pc/DSDT.ipmikcs",
+"tests/data/acpi/pc/DSDT.memhp",
+"tests/data/acpi/pc/DSDT.nohpet",
+"tests/data/acpi/pc/DSDT.numamem",
+"tests/data/acpi/pc/DSDT.roothp",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.multi-bridge",
-- 
MST


