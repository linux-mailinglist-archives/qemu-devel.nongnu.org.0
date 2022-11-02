Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0901861674C
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Nov 2022 17:11:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqGJC-0003uO-B9; Wed, 02 Nov 2022 12:09:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIx-0003Xi-Ue
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oqGIw-0002RJ-K8
 for qemu-devel@nongnu.org; Wed, 02 Nov 2022 12:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667405366;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sA0aUnKWUG2lHJea+7N06ahIGd9aPeHX6W/XDF7Ebic=;
 b=DSZ185HRIG7XvvZIr2/ngvapAKGCK/RUxbm/hVmKX8qSF42CcUmQvz8gd7z5rrMv7vOl8P
 tL+Ow2ND2vRYtwIZzxHx2IbaSKFyQjnjcujH2boDGFJg34QFwlwJdoMkP8loxR3t+NzArD
 913lKj85JWH3nO43MJ6N/4Nqd6QAn5E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-364-ZA2D5UYOOMyEaYORh8ttMg-1; Wed, 02 Nov 2022 12:09:25 -0400
X-MC-Unique: ZA2D5UYOOMyEaYORh8ttMg-1
Received: by mail-wr1-f70.google.com with SMTP id
 j20-20020adfb314000000b002366d9f67aaso4974605wrd.3
 for <qemu-devel@nongnu.org>; Wed, 02 Nov 2022 09:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sA0aUnKWUG2lHJea+7N06ahIGd9aPeHX6W/XDF7Ebic=;
 b=o6B7Hh75iYeaWG+LsS2SGg3EGWXje7A9HaXW4TcANeWINlnXoa4l/qha/CGERbiFPf
 4MGpsipDUvYfn62bqLvwhl3DTEmDndJKqBGGjJ/hR3mv6D7VVcmRqYhOAgQYGQpr1ZlB
 auJWQqiiCG/kwoKxvmXn74n7mgC5E6is+C50RtflKT9Z1+mAcunAmuiIku631viJQ8rz
 Y+TIgmr8QCsXxkeL9dIHqyOgkh2+b1TQMjG9BiWjtQCuA7Dpu7iuOg9fe7mZqd5Tmivf
 SBLf4CLxy8B6JarFZvoj9wEM02E0gAnVcS4gfm1TAXQ5DtON3uomlN42sDJf/mDPIN4m
 rOog==
X-Gm-Message-State: ACrzQf3E/ml5jDda5j/fjfFDAhthv9rJOcs4MRPCTnxqlWEyl0tuJrv0
 RUXMplHczV/pEIgErhAyK7U/DOV+XdfiH9e0ZlvHrnrzCLEeBJO/XouyHsUPBGNiBIsatVVajcm
 OF6LTE6mGibVi59uB3WphH6h5FT2EqiLXyNbkYq5GUacVXNWrflk0UILJHV1T
X-Received: by 2002:a1c:f202:0:b0:3c2:10de:4016 with SMTP id
 s2-20020a1cf202000000b003c210de4016mr26238826wmc.158.1667405363507; 
 Wed, 02 Nov 2022 09:09:23 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4NK8fcrnJWgSJfI+TW0XDZ/cLEQYo5SFl3SmdZ5elkFv2qiUG2ZocN7CQL2x4iNtAAolP/1w==
X-Received: by 2002:a1c:f202:0:b0:3c2:10de:4016 with SMTP id
 s2-20020a1cf202000000b003c210de4016mr26238800wmc.158.1667405363201; 
 Wed, 02 Nov 2022 09:09:23 -0700 (PDT)
Received: from redhat.com ([2.52.15.189]) by smtp.gmail.com with ESMTPSA id
 t12-20020adff60c000000b002366ded5864sm13050767wrp.116.2022.11.02.09.09.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 09:09:22 -0700 (PDT)
Date: Wed, 2 Nov 2022 12:09:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL v2 22/82] tests/acpi: virt: allow acpi MADT and FADT changes
Message-ID: <20221102160336.616599-23-mst@redhat.com>
References: <20221102160336.616599-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221102160336.616599-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.048,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Miguel Luis <miguel.luis@oracle.com>

Step 3 from bios-tables-test.c documented procedure.

Signed-off-by: Miguel Luis <miguel.luis@oracle.com>
Message-Id: <20221011181730.10885-2-miguel.luis@oracle.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Acked-by: Ani Sinha <ani@anisinha.ca>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..8dc50f7a8a 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,7 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/virt/FACP",
+"tests/data/acpi/virt/FACP.numamem",
+"tests/data/acpi/virt/FACP.memhp",
+"tests/data/acpi/virt/APIC",
+"tests/data/acpi/virt/APIC.memhp",
+"tests/data/acpi/virt/APIC.numamem",
-- 
MST


