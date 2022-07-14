Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B347057491E
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 11:33:09 +0200 (CEST)
Received: from localhost ([::1]:40646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBvDY-0006Xo-EE
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 05:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk8-0005DL-D3
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:59421)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oBuk6-00060u-Lg
 for qemu-devel@nongnu.org; Thu, 14 Jul 2022 05:02:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657789362;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g7/2rhhJSC5UwuybsQoC8MTZAQnVSiRbNGooBdIOgBk=;
 b=GJOy7PJhTWel8jPT8WAFsYoWKNdJTVi2b5K8W14ltcHY3a/t1jnqP0qOjSNEW6lnw0z+F9
 twC7jgHAG1QbGD16VsEsL6yq0DCBNjN4igZAGL1i3c7JmFsyTPLpYDi5ZSok7o4PrByDBk
 /fCfQcVZTBIATStsW0+727L4LlVynnQ=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-501-OmebZRYOP0KF9kuV3trk7g-1; Thu, 14 Jul 2022 05:02:40 -0400
X-MC-Unique: OmebZRYOP0KF9kuV3trk7g-1
Received: by mail-ed1-f72.google.com with SMTP id
 z5-20020a05640235c500b0043ae18edeeeso1109655edc.5
 for <qemu-devel@nongnu.org>; Thu, 14 Jul 2022 02:02:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g7/2rhhJSC5UwuybsQoC8MTZAQnVSiRbNGooBdIOgBk=;
 b=Xwgk98vSoZSIJDUNKf1CxGN7heIK69LliKiM0r0rwHir5m3ak5RUqRVKH8P7fxUUwC
 27QmmlfD50/xtvssv14xz8XubxcaFzJYIDh12ruIWnLbX6H1TzSBrh1960ppSn6t3ctN
 vXWt6TWS/sMhPlFScN4z0H1/su1OWmtyTupVS8I8G8WigqfwiBXHflz81XUh10Eqz2kF
 sHxAzlyT9XkzEBireeYUubJJtgzyCluNKfFtxipdPGfJk7yptccGjiLncsbTyUGLwfXZ
 Nx7PMzXB75KyIP+k1Wynf45w3tan1ENrYw6o1HkDzgjNi27yjBMXTs1e1UV+vwDelwW4
 z8iw==
X-Gm-Message-State: AJIora/wctT03fVmX9UtfDxOPRvk9aFJjlBp52f+vqyyh8c3xVv7FEQo
 mHvndja2kYFoJ007eB+7RJRvKvCfnKbj0qBNuNwXKy89451Hfc89soeCfqs/ayXGGFWB+dRDuum
 sk2Si5vFubxjwAySNlVC3CVvtyQBWJpWSyvCJaWvTMK+rkTF2VnMVjTnADFnI2NpDwuI=
X-Received: by 2002:a17:907:2854:b0:72b:7daf:cc0d with SMTP id
 el20-20020a170907285400b0072b7dafcc0dmr7645895ejc.524.1657789358787; 
 Thu, 14 Jul 2022 02:02:38 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1te4mXaqvR6nQd0eHpcSnlDpmpWqwVJ7WkItIqnTQcG7X7Uy2FbjIOPsKO2pdf05jr9/68AZg==
X-Received: by 2002:a17:907:2854:b0:72b:7daf:cc0d with SMTP id
 el20-20020a170907285400b0072b7dafcc0dmr7645870ejc.524.1657789358523; 
 Thu, 14 Jul 2022 02:02:38 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id
 t6-20020aa7d706000000b0043a85d7d15esm686295edq.12.2022.07.14.02.02.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jul 2022 02:02:37 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 15/20] q800: implement compat_props to enable
 quirk_mode_page_truncated for scsi-cd devices
Date: Thu, 14 Jul 2022 11:02:06 +0200
Message-Id: <20220714090211.304305-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714090211.304305-1-pbonzini@redhat.com>
References: <20220714090211.304305-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

By default quirk_mode_page_truncated should be enabled for all scsi-cd devices
connected to the q800 machine to allow A/UX to enumerate SCSI CDROM devices
without hanging.

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20220622105314.802852-11-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/m68k/q800.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/m68k/q800.c b/hw/m68k/q800.c
index b774a5b20a..3254ffb5c4 100644
--- a/hw/m68k/q800.c
+++ b/hw/m68k/q800.c
@@ -691,6 +691,7 @@ static GlobalProperty hw_compat_q800[] = {
     { "scsi-cd", "quirk_mode_page_apple_vendor", "on"},
     { "scsi-cd", "quirk_mode_sense_rom_use_dbd", "on"},
     { "scsi-cd", "quirk_mode_page_vendor_specific_apple", "on"},
+    { "scsi-cd", "quirk_mode_page_truncated", "on"},
 };
 static const size_t hw_compat_q800_len = G_N_ELEMENTS(hw_compat_q800);
 
-- 
2.36.1



