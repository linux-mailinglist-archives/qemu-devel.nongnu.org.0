Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EFF6EDD14
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 09:47:27 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prDNe-0000cK-SR; Tue, 25 Apr 2023 03:46:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDN9-0000VQ-Cm
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:59 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1prDN7-0006os-Ua
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 03:45:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682408757;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1alCUm+k7ESdeXvrCp2Z+zu3n7fe+Oxkw/OyZwonDqs=;
 b=XWMqgfJ3utPFjIJnT2eshZl4Kcf/YZ7vAj0UW7lIOKv0YSayOMPFakjaWqZivbLMMe5kIs
 YxbNNT4luAV319/Ob7T1/eQFrhw0/5dzWZXort4T3RMJVXdJgkYgtnkJOmHpSrY/gW6kV3
 DxljRc+gnBYA+/Q3KueDDbYyPFzUW0k=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-207-s-iojnCTP-aiQ0PSTEv9hQ-1; Tue, 25 Apr 2023 03:45:56 -0400
X-MC-Unique: s-iojnCTP-aiQ0PSTEv9hQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-301110f1756so1924159f8f.0
 for <qemu-devel@nongnu.org>; Tue, 25 Apr 2023 00:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682408754; x=1685000754;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1alCUm+k7ESdeXvrCp2Z+zu3n7fe+Oxkw/OyZwonDqs=;
 b=j+0xEqeDT4QKpu1VIgYmZhLVccw5eVO4caNBiyHU8odSvTR5gop651NSGd9QDnyBwP
 UCW0+hTEH0iYcAJdpR2Oohey/ePgEjS5QV9UwGffx1YJjEGGiAZjGoUDsKMcgccn6CFP
 Iu4C/NUsHM0ewShONh/V2W5HuHS95ldO43M9eVVb/sLjVF10P1VbO6PNxiJhHkH4W0sN
 kiNUKcDhNNjNwo0MyNuDn6na4WLxX5+iwypig96vt+H3hW02M5iidZArplWtaHLvTANz
 HptBMf1+WU8Hwz2vyQh/VoThGugXslhU3H0j1J6OBmNghmS3TO0Qo16mZS+xqhf1Y0Pj
 3FiQ==
X-Gm-Message-State: AAQBX9dAOIFdECt/hZ6Bg1JdAPXYrxSYS2zjTETPlxhx57T6zCCMdgvJ
 ushrxL51v6LEAdIh/669cGv0BcExok9eGvd9/mYzoKhUf4OOVJY7/9qg7QB4QFV4CgbROcPUhIT
 KzX6xyhOCC4xrW4z7eLLi3SPgRU3btx+gHuGjaNMoEqlFOHmQ9SHVIioTKsLhY5Cb0FHe
X-Received: by 2002:a5d:4611:0:b0:2f4:2f98:bf2d with SMTP id
 t17-20020a5d4611000000b002f42f98bf2dmr11696117wrq.37.1682408753797; 
 Tue, 25 Apr 2023 00:45:53 -0700 (PDT)
X-Google-Smtp-Source: AKy350af3YHfhj5uUR5MZKZrL1hRIgwssjjQ2eE3mPv0EoXh8QekozNoWKEo3pYIi0rXIU11zfQ4Pg==
X-Received: by 2002:a5d:4611:0:b0:2f4:2f98:bf2d with SMTP id
 t17-20020a5d4611000000b002f42f98bf2dmr11696092wrq.37.1682408753465; 
 Tue, 25 Apr 2023 00:45:53 -0700 (PDT)
Received: from redhat.com ([2.55.61.39]) by smtp.gmail.com with ESMTPSA id
 c7-20020a5d4cc7000000b002fa5a73bf9bsm12410799wrt.89.2023.04.25.00.45.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Apr 2023 00:45:52 -0700 (PDT)
Date: Tue, 25 Apr 2023 03:45:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Ani Sinha <ani@anisinha.ca>,
 Ani Sinha <anisinha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PULL 18/31] Add my old and new work email mapping and use work
 email to support acpi
Message-ID: <104593c3ad48f3857e9c48d9e3e7feb3566444c7.1682408661.git.mst@redhat.com>
References: <cover.1682408661.git.mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1682408661.git.mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Ani Sinha <ani@anisinha.ca>

Updating mailmap to indicate ani@anisinha.ca and anisinha@redhat.com are one
and the same person. Also updating my email in MAINTAINERS for all my acpi work
(reviewing patches and biosbits) to my work email. Also doing the same for
bios bits test framework documentation.

Signed-off-by: Ani Sinha <anisinha@redhat.com>
Message-Id: <20230329040834.11973-1-anisinha@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 83c0373872..e365a7a47e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1894,7 +1894,7 @@ F: hw/pci/pcie_doe.c
 ACPI/SMBIOS
 M: Michael S. Tsirkin <mst@redhat.com>
 M: Igor Mammedov <imammedo@redhat.com>
-R: Ani Sinha <ani@anisinha.ca>
+R: Ani Sinha <anisinha@redhat.com>
 S: Supported
 F: include/hw/acpi/*
 F: include/hw/firmware/smbios.h
-- 
MST


