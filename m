Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB3C026859D
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Sep 2020 09:19:12 +0200 (CEST)
Received: from localhost ([::1]:44878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kHilb-00015J-OA
	for lists+qemu-devel@lfdr.de; Mon, 14 Sep 2020 03:19:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kHikI-0007nv-Kd
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 03:17:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:55824
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kHikG-00023X-R1
 for qemu-devel@nongnu.org; Mon, 14 Sep 2020 03:17:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600067867;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zYL27FBj2DzJDR+K+LlISoZBGeI1vdRnIhzz4PV85GI=;
 b=UFbpMyXRAP2Gl5kr8pfM/a8pzxSxSEn19K7QOO4aqiSww7dd4xfW8UBAERu3jrqrE1Dp2T
 0N5tGmRANZmBuIElmj7AmxPSBcLUo24kJETnzwv5unJeLVH9eXlDXnPIZtCwdi5FRT0nx3
 hf/ryMmiIqJt3t1p7e+Y397wYd4siu8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-453-6yTewbDZOHGjlOzmDZMX-A-1; Mon, 14 Sep 2020 03:17:43 -0400
X-MC-Unique: 6yTewbDZOHGjlOzmDZMX-A-1
Received: by mail-wm1-f70.google.com with SMTP id q205so1244380wme.0
 for <qemu-devel@nongnu.org>; Mon, 14 Sep 2020 00:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zYL27FBj2DzJDR+K+LlISoZBGeI1vdRnIhzz4PV85GI=;
 b=VDMQLebiv9MPL7k0knZ5nVx7RtMFZVzcxv0pmAATvJgWZRZY1MvzUsMXBrM4A+1gwO
 vrfzIpsTmFtie7aC/TxprIbadg8e5HHt9QKKIiy5tzJLVb6N5XmT69pbf5kxSFJ8++VZ
 WJb28RwiZ52rC/hoREhoNyddFBnjnJQydyqzKDK1KOQfBhYtOAT4mx/ZpxE7sS10Va9E
 9KGpz5UHJbDuc6TkPcGNJp1RSun8j97mu3ywU+tbStZheJB43ZT6Mao7i/lx+A3cApU0
 6Zh3ay4+KKjCbL9jiU+sQLmPb2Q/uoKyxEtOr4k6nMv1s98pqUYibABs0XpqLgHmMxvQ
 9VUQ==
X-Gm-Message-State: AOAM533ydwXOwpy8QE2GeXTgk56pfyy1vy67eJblrX16gXOBvHlZHC35
 wrmkO/FRyO4uQR0sqqsrs+YgQciF4XyTtre8at90Pci4mDCp0xcoL+9TYifCX7O7wBYfVBBO4vC
 3KmftjD+XC7fLqfA=
X-Received: by 2002:adf:fd8c:: with SMTP id d12mr14285613wrr.283.1600067862187; 
 Mon, 14 Sep 2020 00:17:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw8Bl3jC76pdpcmtApafPMP8UZwsW1G/muh2LsOYTFOsDYoPBNwP7JYhnSBCcRicV1s9R3jXA==
X-Received: by 2002:adf:fd8c:: with SMTP id d12mr14285599wrr.283.1600067862050; 
 Mon, 14 Sep 2020 00:17:42 -0700 (PDT)
Received: from localhost.localdomain (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id u17sm17224048wmm.4.2020.09.14.00.17.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 00:17:41 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/10] tests: acpi: tolerate "virt/SSDT.memhp" mismatch
 temporarily
Date: Mon, 14 Sep 2020 09:17:14 +0200
Message-Id: <20200914071720.1099898-5-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200914071720.1099898-1-philmd@redhat.com>
References: <20200914071720.1099898-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8;
	text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=207.211.31.120; envelope-from=philmd@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/14 01:36:47
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.695,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Laszlo Ersek <lersek@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Laszlo Ersek <lersek@redhat.com>

Tolerate "virt/SSDT.memhp" mismatch temporarily to let
"check-qtest-aarch64" pass until we refresh the AML after
advancing the edk2 submodule to tag edk2-stable202008.

Cc: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Ref: https://bugs.launchpad.net/qemu/+bug/1852196
Signed-off-by: Laszlo Ersek <lersek@redhat.com>
Acked-by: Igor Mammedov <imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20200908072939.30178-5-lersek@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf..e569098abdd 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/SSDT.memhp",
-- 
2.26.2


