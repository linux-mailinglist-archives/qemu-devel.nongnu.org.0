Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0207935A7DB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 22:29:49 +0200 (CEST)
Received: from localhost ([::1]:56856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUxlD-0005z4-Mg
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 16:29:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52626)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lUxee-00005Z-Ae
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:23:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1lUxeb-0004BK-B3
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:23:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617999775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=liB2Vx01UETRmR85jAnvUN5jWJXLjBT8ZS9U0KHp2kw=;
 b=UKr9XIueSL6paZF3XE9PngrJJn67QikJQJvNsNpdvUZn+D+FUMutBRBwLx467JOx59WgOJ
 sFq3zloy+MhAQ9hi+pfRljk5xKt/uPwBPngveT2SH3MUIkgwYENnQtkpoV3ZV1Z36x5+OY
 H3ldBMbmfTnflraJEKhWCZLS6S+6zgU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-145-CELbe1VpNaaFzGi-ieajaQ-1; Fri, 09 Apr 2021 16:22:53 -0400
X-MC-Unique: CELbe1VpNaaFzGi-ieajaQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6B8A1107ACCD;
 Fri,  9 Apr 2021 20:22:52 +0000 (UTC)
Received: from localhost (ovpn-118-57.rdu2.redhat.com [10.10.118.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 32ADC5D6AD;
 Fri,  9 Apr 2021 20:22:52 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: qemu-devel@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PULL 1/2] i386: Add missing cpu feature bits in EPYC-Rome model
Date: Fri,  9 Apr 2021 16:22:45 -0400
Message-Id: <20210409202246.1857179-2-ehabkost@redhat.com>
In-Reply-To: <20210409202246.1857179-1-ehabkost@redhat.com>
References: <20210409202246.1857179-1-ehabkost@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 David Edmondson <david.edmondson@oracle.com>, Babu Moger <babu.moger@amd.com>,
 Pankaj Gupta <pankaj.gupta@cloud.ionos.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Babu Moger <babu.moger@amd.com>

Found the following cpu feature bits missing from EPYC-Rome model.
ibrs    : Indirect Branch Restricted Speculation
ssbd    : Speculative Store Bypass Disable

These new features will be added in EPYC-Rome-v2. The -cpu help output
after the change.

x86 EPYC-Rome             (alias configured by machine type)
x86 EPYC-Rome-v1          AMD EPYC-Rome Processor
x86 EPYC-Rome-v2          AMD EPYC-Rome Processor

Reported-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Signed-off-by: Babu Moger <babu.moger@amd.com>
Signed-off-by: Pankaj Gupta <pankaj.gupta@cloud.ionos.com>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: David Edmondson <david.edmondson@oracle.com>
Message-Id: <161478622280.16275.6399866734509127420.stgit@bmoger-ubuntu>
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 target/i386/cpu.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6b3e9467f17..ad99cad0e7c 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -4179,6 +4179,18 @@ static X86CPUDefinition builtin_x86_defs[] = {
         .xlevel = 0x8000001E,
         .model_id = "AMD EPYC-Rome Processor",
         .cache_info = &epyc_rome_cache_info,
+        .versions = (X86CPUVersionDefinition[]) {
+            { .version = 1 },
+            {
+                .version = 2,
+                .props = (PropValue[]) {
+                    { "ibrs", "on" },
+                    { "amd-ssbd", "on" },
+                    { /* end of list */ }
+                }
+            },
+            { /* end of list */ }
+        }
     },
     {
         .name = "EPYC-Milan",
-- 
2.30.2


