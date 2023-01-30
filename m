Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8466E681B82
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:29:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMadd-0003nN-Dr; Mon, 30 Jan 2023 15:20:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMad0-0002hs-UN
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMacz-0006tJ-E5
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:19:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675109984;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=OKOxG4S89v1obpj9TdPdrFOeAdpqYXMWWo36nPaCZEQ=;
 b=YF7ikbspRS4dP0pRONfU6d12NFXJvh1wWUPw4l7ezBlW5/+yX2YNriXJKb+g8X1esd24v+
 Hdy+z+BCkeEsZdIbNX7Hkk6Hz6dXFCXk7WQ/KQaxWoI4Rue7odyNpyoWzwRPoQWuBP3Ur0
 poFmoebco/DOzP4pcV/fnGxGl0GjG5E=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-50-vyMG81RSMci7LBmIWKVQ8Q-1; Mon, 30 Jan 2023 15:19:43 -0500
X-MC-Unique: vyMG81RSMci7LBmIWKVQ8Q-1
Received: by mail-ej1-f69.google.com with SMTP id
 ti11-20020a170907c20b00b00886244203fcso3073410ejc.2
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OKOxG4S89v1obpj9TdPdrFOeAdpqYXMWWo36nPaCZEQ=;
 b=lWpN1xbn4tG+mcjIrEouPq+BAqGaKwGFbASsG+J72Tt/lgyxpbOj4fnysKCELf4teZ
 XxN+bfuaJfcnFGf4oKyqy3petRy4dDxS2if2569bp62BRMXUS85TirdrZ/hfp4w8TdLs
 dcQVV0KJPrbHdYLg2zDdtM9Q2RHi21m8QellW50qVRaksSiru2IAmW4gdNfy/+JJPI4M
 xfGad+pOacIcO8E3eOwvAT1Eohj+Z2VF84NhY/+ERVoTouQ0gV3ez2igWbIB5jt9W+pY
 84bAIv5k4aLqsN+syQJ7ajC9suAqFPtZu2UbkK+AHSgyehEGIr0Ldu3HkNG7mwsuGcbK
 WPzg==
X-Gm-Message-State: AFqh2kqlqcIjZJtlrKC+4qvcAUQy/fUT9hMFASG6RZPxAYFy1E9kjzl+
 MUtb4eHoycfX+w0QjD7z/fjNNjARTwZXz6kSdklbVFzXLDri2ikhiWGFcsin4ErB+k/P/DETHsA
 6oiWyxR5Ck2PbxbeLoe0Uio2T+7dNTnb8yzC102TDyoWtSi6lkyxhMPv2wjO5
X-Received: by 2002:aa7:dbd0:0:b0:49e:351b:5ab3 with SMTP id
 v16-20020aa7dbd0000000b0049e351b5ab3mr45128547edt.6.1675109981333; 
 Mon, 30 Jan 2023 12:19:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuI37+AynnFMls1JtG1WZgONYCGgutpYRXYWMedbhm8i3Ge9iUYSMKyMRG+XA0h1nZMQDnQhw==
X-Received: by 2002:aa7:dbd0:0:b0:49e:351b:5ab3 with SMTP id
 v16-20020aa7dbd0000000b0049e351b5ab3mr45128529edt.6.1675109981031; 
 Mon, 30 Jan 2023 12:19:41 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 m15-20020a056402050f00b0049ef70a2894sm7356118edv.38.2023.01.30.12.19.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:19:40 -0800 (PST)
Date: Mon, 30 Jan 2023 15:19:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 17/56] pci_bridge: remove whitespace
Message-ID: <20230130201810.11518-18-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Igor Mammedov <imammedo@redhat.com>

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-8-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/pci-bridge/pci_bridge_dev.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index 3435df8d73..4b2696ea7f 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -186,7 +186,6 @@ static Property pci_bridge_dev_properties[] = {
                      res_reserve.mem_pref_32, -1),
     DEFINE_PROP_SIZE("pref64-reserve", PCIBridgeDev,
                      res_reserve.mem_pref_64, -1),
-
     DEFINE_PROP_END_OF_LIST(),
 };
 
-- 
MST


