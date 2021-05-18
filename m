Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02774388091
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 21:36:20 +0200 (CEST)
Received: from localhost ([::1]:43202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lj5Vq-0003ka-JG
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 15:36:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj5Se-000192-Ix
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:33:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33778)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lj5SZ-00075V-SI
 for qemu-devel@nongnu.org; Tue, 18 May 2021 15:32:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621366368;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yIx6qnixzEdCFqcaxOcBVgzeXQKdqlMaGZGGlAdFf2k=;
 b=FrQhQXs+7PEW656SV53oq06Dil8T2zzJXE3wg1DWoHjwMjDGgV10QtbEIQPMKouFyasxZE
 Gca3ioqlVkqZF4Owv35vbDJX2w8/gIDBLsNodKSPfxdggYHXX+/WSK8TrBleVeOzvDJ5BK
 zWkhwQG6EFC4b+YNvjuzozpvJA1oods=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-356-RFcoydAmPUOLaj2NKDTZgw-1; Tue, 18 May 2021 15:32:47 -0400
X-MC-Unique: RFcoydAmPUOLaj2NKDTZgw-1
Received: by mail-ej1-f72.google.com with SMTP id
 w13-20020a170906384db02903d9ad6b26d8so935080ejc.0
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 12:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yIx6qnixzEdCFqcaxOcBVgzeXQKdqlMaGZGGlAdFf2k=;
 b=VB++ZkT1afMOUVWLsccBi1aVWiZAPJTfcMTSpL/Fv1SALOLuwbdJlmsdW9/PC1SvKy
 ngRmr9jXjiqOLyczh91W/zXxmGDKdn2qZo27dzcuAFNRTuurKQyo3+uRHb1g1tjAgUF1
 I4jChrJvdiaU3fB5Rbd2awpBtscAu3BQ1OTil7G8RaVajBuR3oTXrzx7QlVdc+S7ymr5
 hsjPVC51fgrBRe/RvgWi9s+et0qwBWnYF76NnDRvjzPrW4oyylyXhQSdJ4Kq3YN87nUA
 P1vay0krq8R8OcBKjEVrOGkMbA17DRfLd7CxfpiFW/39Xmvs2jxcoJJzsaFK3iTxqjlz
 VQiQ==
X-Gm-Message-State: AOAM531CSW9ZaGT8OiAObCryOUliNJbOZvvufm4C1rQrhw3aA8mmWW4T
 3w1nGUf32Wu4BloqWRpTAOgj8B02XDa7BPliOPisE7/DdUNNtQPMW2sKsYoeY2obw8Xs2nWDGMp
 5RS16KiGO60Z7Jizc8oFOXxxq5nSWf7XSndpKRl1HrqF5aQuR7yKRjBfL9lEFX2+9
X-Received: by 2002:a05:6402:22a8:: with SMTP id
 cx8mr9002712edb.296.1621366366200; 
 Tue, 18 May 2021 12:32:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyyi9MbN+GaQlROKLmKdvxFf0PCYniIN8qbV9iBhw2eYepl0m5MupEDpbrvgJv6dm01d1Q8EA==
X-Received: by 2002:a05:6402:22a8:: with SMTP id
 cx8mr9002693edb.296.1621366366048; 
 Tue, 18 May 2021 12:32:46 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id g4sm13795876edw.8.2021.05.18.12.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 12:32:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org,
	John Snow <jsnow@redhat.com>
Subject: [PATCH v5 1/6] hw/isa/Kconfig: Fix missing dependency ISA_SUPERIO ->
 FDC
Date: Tue, 18 May 2021 21:32:34 +0200
Message-Id: <20210518193239.1725624-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210518193239.1725624-1-philmd@redhat.com>
References: <20210518193239.1725624-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

isa_superio_realize() calls isa_fdc_init_drives(), which is defined
in hw/block/fdc.c, so ISA_SUPERIO needs to select the FDC symbol.

Reported-by: John Snow <jsnow@redhat.com>
Fixes: c0ff3795143 ("Introduce a CONFIG_ISA_SUPERIO switch for isa-superio.c")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/isa/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/isa/Kconfig b/hw/isa/Kconfig
index 55e0003ce40..7216f66a54a 100644
--- a/hw/isa/Kconfig
+++ b/hw/isa/Kconfig
@@ -17,6 +17,7 @@ config ISA_SUPERIO
     bool
     select ISA_BUS
     select PCKBD
+    select FDC
 
 config PC87312
     bool
-- 
2.26.3


