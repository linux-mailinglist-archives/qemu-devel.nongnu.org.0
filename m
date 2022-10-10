Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0585FA34C
	for <lists+qemu-devel@lfdr.de>; Mon, 10 Oct 2022 20:19:59 +0200 (CEST)
Received: from localhost ([::1]:59352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ohxNe-0007eT-VK
	for lists+qemu-devel@lfdr.de; Mon, 10 Oct 2022 14:19:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwc1-0002t8-0O
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:34630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ohwbt-00072z-Ez
 for qemu-devel@nongnu.org; Mon, 10 Oct 2022 13:30:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665423036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bcgVrMucjq5MVdk/8jgUWx53f3p+F0negAoWTpz5SKg=;
 b=LuPdTL4w4yRQKQZnlGGUHTHqL2DILu8YgP24IcobUy0I11KMANqJb+hosNotc0QbeELvGV
 nSisjjyOEAKuGoGV9zo76qgG3wE5x0ZwuqEdvy4AbF8noB68hlsfEmz5qqe+3KiT8QWzGQ
 PkFo7qn+8eh8G6amCK5slv+DofBoxeI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-232-xrCHcv7eMd6wPapt0rt49A-1; Mon, 10 Oct 2022 13:30:35 -0400
X-MC-Unique: xrCHcv7eMd6wPapt0rt49A-1
Received: by mail-wm1-f70.google.com with SMTP id
 d5-20020a05600c34c500b003b4fb42ccdeso9283407wmq.8
 for <qemu-devel@nongnu.org>; Mon, 10 Oct 2022 10:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bcgVrMucjq5MVdk/8jgUWx53f3p+F0negAoWTpz5SKg=;
 b=SlRV7JM24hcLy8W6ba4Qpj9zzaYI0h+7SvMVc20iiq+EPxS2pm3sfiFqgDhV9Adeii
 fn+RhsF4Ujxw1VZQoBB+cV/AC3ewaxUmtqAuv8SCLmj0rjISByzcL4NvrNkWfn/kDfN+
 WDF8E2S24g7CzZEaCsaYqbheY0bbPOQ+GtAvZleE/bWqadmcEgtqFihj99sdJug5kL6q
 8+Av3YPq/ecUxDml9mzSD5B8o2550KgG2SJ7UOJMu5USFepDL+876VWpxZc+GQteBIPd
 JaZ01PDH3r3zYGwj7pag+nrWJmwCr33FCbdZnM7hk2SWHu8UCLYYHhXyRJSlZNSnKkOo
 72YA==
X-Gm-Message-State: ACrzQf2zSTeOM7BRenpyfIjK7fE5auB31mFlhnJcJUSApHTgLW8nlzx6
 oxwonq0079cjwu9f7OJvLPePsNTjkNU8v8gqOtONx6115guLnlBXAmB6QelBDFt1JzBRaccgbxT
 BbwZVjWzi+VYZ5/cWaMfRquc3QNbwDxKemCKYGTi59RftfQxjp3KZJc5SZwpC
X-Received: by 2002:a05:6000:18aa:b0:22e:60ef:9c1 with SMTP id
 b10-20020a05600018aa00b0022e60ef09c1mr11973549wri.108.1665423032968; 
 Mon, 10 Oct 2022 10:30:32 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5GzS9hFhpgzUE90hw5Ga835yytgef4CUmiXaPzS7oxdS4nCsZnwyWR/ZH/t610jb82xUByAw==
X-Received: by 2002:a05:6000:18aa:b0:22e:60ef:9c1 with SMTP id
 b10-20020a05600018aa00b0022e60ef09c1mr11973528wri.108.1665423032607; 
 Mon, 10 Oct 2022 10:30:32 -0700 (PDT)
Received: from redhat.com ([2.55.183.131]) by smtp.gmail.com with ESMTPSA id
 m38-20020a05600c3b2600b003b4ff30e566sm37207523wms.3.2022.10.10.10.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Oct 2022 10:30:32 -0700 (PDT)
Date: Mon, 10 Oct 2022 13:30:28 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL 25/55] tests/acpi: virt: allow acpi GTDT changes
Message-ID: <20221010172813.204597-26-mst@redhat.com>
References: <20221010172813.204597-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221010172813.204597-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Miguel Luis <miguel.luis@oracle.com>

Step 3 from bios-tables-test.c documented procedure.

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Message-Id: <20220920162137.75239-2-miguel.luis@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..957bd1b4f6 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/GTDT",
+"tests/data/acpi/virt/GTDT.memhp",
+"tests/data/acpi/virt/GTDT.numamem",
-- 
MST


