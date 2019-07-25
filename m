Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C01DC752A7
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Jul 2019 17:33:19 +0200 (CEST)
Received: from localhost ([::1]:33012 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqfk6-000751-2c
	for lists+qemu-devel@lfdr.de; Thu, 25 Jul 2019 11:33:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48986)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <mst@redhat.com>) id 1hqfiW-0002rh-MH
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 11:31:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <mst@redhat.com>) id 1hqfiV-0001sB-Jh
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 11:31:40 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:46901)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <mst@redhat.com>) id 1hqfiV-0001rt-GS
 for qemu-devel@nongnu.org; Thu, 25 Jul 2019 11:31:39 -0400
Received: by mail-qt1-f195.google.com with SMTP id h21so49427550qtn.13
 for <qemu-devel@nongnu.org>; Thu, 25 Jul 2019 08:31:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=GDp8j9NviBwiadQVNh7husgN8Q3GImxt9I1Zswm0kPk=;
 b=jf3v6H0dLr8w5bGdVMiByLJhOfnlY/DtUIrH9hO+7mAahseErn2J1/D23Hxss7cr85
 Bbvs636J1xgT/eyUzeouPjtfDMpNvnCRgnXudH6E/gX5zwl9l+/zdKrAo1UYq34nceJy
 aXzWrP5KTFhCzO4oG8s3hhGcpn4A6vSU99HupxIS1WCkDJUBUqO0y5C/r6+pB7IfJyPi
 82UFI9PyPY8et+9vZxcN4qxmD1lVH01x8kZ2LV/brtoXrPm/3qtZrXJYD5EPISyLtdez
 tMMPW7vgiyab3z5B5AYmNAmQutBSrZxni8tKZIL7Ug/cNXpgezoH7AcroVkyqN/xVuMC
 Q2rQ==
X-Gm-Message-State: APjAAAXOD/jia/+HWtpiJlCCGtCKweHX/KBPfj54oOhCGT6mXRbXOBoY
 H9f98kei/1+s48Uge/7U/sWQhlibNWanIw==
X-Google-Smtp-Source: APXvYqw99hI9kPNmINbA0Y0Su/xjM2Zm5om9x5ZyQpkyC72LVHfDhTpcSKLcBeELTI1vu9G8vldWyQ==
X-Received: by 2002:a0c:b999:: with SMTP id v25mr64792777qvf.36.1564068698775; 
 Thu, 25 Jul 2019 08:31:38 -0700 (PDT)
Received: from redhat.com (bzq-79-181-91-42.red.bezeqint.net. [79.181.91.42])
 by smtp.gmail.com with ESMTPSA id
 w80sm24007737qka.74.2019.07.25.08.31.35
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 25 Jul 2019 08:31:38 -0700 (PDT)
Date: Thu, 25 Jul 2019 11:31:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <1563466463-26012-1-git-send-email-wrfsh@yandex-team.ru>
References: <20190725153059.7313-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190725153059.7313-1-mst@redhat.com>
X-Mailer: git-send-email 2.22.0.678.g13338e74b8
X-Mutt-Fcc: =sent
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.160.195
Subject: [Qemu-devel] [PULL 02/12] i386/acpi: fix gint overflow in
 crs_range_compare
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
 Eduardo Habkost <ehabkost@redhat.com>, qemu-stable@nongnu.org,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Evgeny Yakovlev <wrfsh@yandex-team.ru>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Evgeny Yakovlev <wrfsh@yandex-team.ru>

When very large regions (32GB sized in our case, PCI pass-through of GPUs)
are compared substraction result does not fit into gint.

As a result crs_replace_with_free_ranges does not get sorted ranges and
incorrectly computes PCI64 free space regions. Which then makes linux
guest complain about device and PCI64 hole intersection and device
becomes unusable.

Fix that by returning exactly fitting ranges.

Also fix indentation of an entire crs_replace_with_free_ranges to make
checkpatch happy.

Cc: qemu-stable@nongnu.org
Signed-off-by: Evgeny Yakovlev <wrfsh@yandex-team.ru>
Message-Id: <1563466463-26012-1-git-send-email-wrfsh@yandex-team.ru>
Signed-off-by: Evgeny Yakovlev <wrfsh@yandex-team.ru>
---
 hw/i386/acpi-build.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index d281ffa89e..e7b756b51b 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -755,10 +755,16 @@ static void crs_range_set_free(CrsRangeSet *range_set)
 
 static gint crs_range_compare(gconstpointer a, gconstpointer b)
 {
-     CrsRangeEntry *entry_a = *(CrsRangeEntry **)a;
-     CrsRangeEntry *entry_b = *(CrsRangeEntry **)b;
+    CrsRangeEntry *entry_a = *(CrsRangeEntry **)a;
+    CrsRangeEntry *entry_b = *(CrsRangeEntry **)b;
 
-     return (int64_t)entry_a->base - (int64_t)entry_b->base;
+    if (entry_a->base < entry_b->base) {
+        return -1;
+    } else if (entry_a->base > entry_b->base) {
+        return 1;
+    } else {
+        return 0;
+    }
 }
 
 /*
-- 
MST


