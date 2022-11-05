Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B18E061DC7D
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Nov 2022 18:33:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1orMpD-0007nZ-HR; Sat, 05 Nov 2022 13:19:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmo-0006ez-0D
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1orMmm-0007NM-6r
 for qemu-devel@nongnu.org; Sat, 05 Nov 2022 13:16:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667668597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sA0aUnKWUG2lHJea+7N06ahIGd9aPeHX6W/XDF7Ebic=;
 b=VT7HoAenI8h1+82Y1pIxPIuHOsQJLPMZd8efutQHTSoQV/ktrrZ/CHhVzSJrDhxyhoyyYb
 bSOhgZ3u1s6o0suWVuCSbUebEFqjnWafOCvAsvxXkOpvn6NuevjUd+Jb5TGxaLyUkynwW2
 okcn0JuqJ3YJTbczNHCqwbyVC8wkOKY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-653-9VVBDLquM0iZff_I9GOu9w-1; Sat, 05 Nov 2022 13:16:36 -0400
X-MC-Unique: 9VVBDLquM0iZff_I9GOu9w-1
Received: by mail-wm1-f72.google.com with SMTP id
 bg21-20020a05600c3c9500b003c2acbff422so4772886wmb.0
 for <qemu-devel@nongnu.org>; Sat, 05 Nov 2022 10:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sA0aUnKWUG2lHJea+7N06ahIGd9aPeHX6W/XDF7Ebic=;
 b=3vM39oMve6I2LHF1lSlNehWF+lVtE0xHZKHMWjg447mZtyPGlJQxkrIDTjom+pxDCS
 9UYTaAf8lp47/0SZKnqSOLu7TlAb++okdDOCC32fOtk9fGrP1AcQA/LdINeVmTPpxoLr
 JOdr8d5fnngtWiryu6cbjD809/kcWySRbhl3EyX+CXATT28CS0rbjrEu50N92OTjvJ+9
 4Z98+2ggEJuRtaLFR7d39AUTj9QDIJRQiyuwRn4sqwPXlbfHkm1mRcbb/GFOYPIljRwQ
 5Ht5XwE8AIeHPRtq3Or0HxgfymnCPmA8089CJWuALRHWQEQD95zVh8vq0GW/mKupnf5i
 6pvA==
X-Gm-Message-State: ACrzQf3rIF4uWkBJ1cdksXpNG9dqVwrpJQyuyNcYOJDTey97gMbOR8tp
 oP+PWlYDx8IR5Rbn8p/oKaoyMIz+6xppQ1jWVleab2nI8eEfGFM1QE71NsDBtRBBwJp/AUpe3d9
 ayOLZKwucQOxT32ldXfWACfOG6vW6NLtfwLXrjkNGJvtxJ2QIfaPfltm4fX25
X-Received: by 2002:a5d:40d1:0:b0:236:786d:611e with SMTP id
 b17-20020a5d40d1000000b00236786d611emr26952458wrq.355.1667668594648; 
 Sat, 05 Nov 2022 10:16:34 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4WQwiXNpyHIuZACZDDw1CXjFYn6VFwZp9XNi7kF7Zn7mQgYjBCkFPEyCcIpsU2NcCgKSGH5g==
X-Received: by 2002:a5d:40d1:0:b0:236:786d:611e with SMTP id
 b17-20020a5d40d1000000b00236786d611emr26952446wrq.355.1667668594411; 
 Sat, 05 Nov 2022 10:16:34 -0700 (PDT)
Received: from redhat.com ([2.52.152.137]) by smtp.gmail.com with ESMTPSA id
 q10-20020adff94a000000b0022e035a4e93sm2572545wrr.87.2022.11.05.10.16.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Nov 2022 10:16:33 -0700 (PDT)
Date: Sat, 5 Nov 2022 13:16:31 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Miguel Luis <miguel.luis@oracle.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>
Subject: [PULL v3 22/81] tests/acpi: virt: allow acpi MADT and FADT changes
Message-ID: <20221105171116.432921-23-mst@redhat.com>
References: <20221105171116.432921-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221105171116.432921-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.045,
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


