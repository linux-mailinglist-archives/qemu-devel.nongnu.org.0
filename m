Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDDA3374A17
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:24:35 +0200 (CEST)
Received: from localhost ([::1]:48966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leP0U-000672-R8
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:24:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOnv-0000IH-Ud
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOns-0004QG-Sd
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:11:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249092;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=edHCyfbjyQMGm06QajXLKrSMOyiP3lsHbgoNXfYmyHo=;
 b=Ripftz+ZW5j52Wp5eAXxhiDIc5EwWmUHgBUzexIeA0hY0mguN6Raoc0XBhPAsVmx3k53ba
 tQ4b4bGQyZIh0WkXylsAmoVhid7elSMkXQuEmAW6trCQp88ViXF05qoqO2LlJvCMbtL2xj
 qObRaAlMoqh+FXr5C9nKu96GP6Acp+Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-wyeZAzbLOEiICDUiVUWaQQ-1; Wed, 05 May 2021 17:11:28 -0400
X-MC-Unique: wyeZAzbLOEiICDUiVUWaQQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 93-20020adf80e60000b0290106fab45006so1200286wrl.20
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=edHCyfbjyQMGm06QajXLKrSMOyiP3lsHbgoNXfYmyHo=;
 b=A+E3JN5JDnmAMNqRH8MXQM1TlZnW1Pqb3uV+2lxYc1n7vYtFTcI2JUIO5BE4nFgbvH
 kN2dHAm6+hK5PWptiPunoC9rdf301h5xrxwZ2wvPSdHk4nKkvBOtC8cDlDZNDuXDsNOo
 DshSJAQq7eozjATrtUsvBsz1SpfcnpjN2/di1fBCUo18m6orRJsuTXg5iUgIyH0JOieh
 w1p+7qaPEl0n1OI3JJgwS4iGqcAlxSdVJFoB6zUcM56UgfTrCDz8KhiAOsMWig7aW+W5
 M4xluNCvL2MtLP+daPiwR5UZ+L8YvdQoJq2IyLPi7bnv4cfCMvpwvvE+grIS3qLAZO/c
 lWrQ==
X-Gm-Message-State: AOAM53171Dwxbf6ZtmE/4ZK8r9GqGrWOBIAXZ/zr3aejw46ok/yUrD1s
 RDeD5QjN3aQbmQVAH6NV6+bGyr8cZ2j6zvSkCIxvu/rmCarrL2DYfGDYmVIR9xxonV9lQXYg8cJ
 bTZl6mWqiGFCP5v4hkkPIrFB1uuYVlfGFwXBLGdkFj0fKb6UCDuzXHDe3cYQtcjWU
X-Received: by 2002:a7b:c846:: with SMTP id c6mr11554276wml.75.1620249086970; 
 Wed, 05 May 2021 14:11:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0VftcqDhM4DQJ04/+C4BJuKVLP11nCVQfP7uSkA2CI72+ZsfDVLy1hAWjQNzuDLBkFk6Qgg==
X-Received: by 2002:a7b:c846:: with SMTP id c6mr11554246wml.75.1620249086794; 
 Wed, 05 May 2021 14:11:26 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id v20sm629564wmj.15.2021.05.05.14.11.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:11:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 07/23] hw/block/nvme: Use definition to avoid dynamic stack
 allocation
Date: Wed,  5 May 2021 23:10:31 +0200
Message-Id: <20210505211047.1496765-8-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Klaus Jensen <its@irrelevant.dk>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The compiler isn't clever enough to figure 'SEG_CHUNK_SIZE' is
a constant! Help it by using a definitions instead.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/block/nvme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/block/nvme.c b/hw/block/nvme.c
index 5fe082ec34c..2f6d4925826 100644
--- a/hw/block/nvme.c
+++ b/hw/block/nvme.c
@@ -812,7 +812,7 @@ static uint16_t nvme_map_sgl(NvmeCtrl *n, NvmeSg *sg, NvmeSglDescriptor sgl,
      * descriptors and segment chain) than the command transfer size, so it is
      * not bounded by MDTS.
      */
-    const int SEG_CHUNK_SIZE = 256;
+#define SEG_CHUNK_SIZE 256
 
     NvmeSglDescriptor segment[SEG_CHUNK_SIZE], *sgld, *last_sgld;
     uint64_t nsgld;
-- 
2.26.3


