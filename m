Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4195C30FE49
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 21:31:50 +0100 (CET)
Received: from localhost ([::1]:54724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7lI5-00006h-AS
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 15:31:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l7lFr-0007Eq-1k
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:29:31 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:40707)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yuri.benditovich@daynix.com>)
 id 1l7lFp-0002dv-MR
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 15:29:30 -0500
Received: by mail-wm1-x333.google.com with SMTP id c127so4122554wmf.5
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 12:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=vXzMO6i9R0x1KvOrRVIzXnXswl1dMtXqTbmX3II/M48=;
 b=ajeJPW5ndkDGNuEb4kuhLWMpnSBO3aSHobF+0r3an4Uwspf1lFGsAbCzuIiD9+Z0/d
 cq8sV8yD8/5NfzrE5hZjgjD6s1nLYl7vUM5FXyADEEgTMQzxhEUzGsTGPP8bb6USLoeL
 PxVVHTvVQyfIdALmEiFViY6qFbWrlePx7LoJd1Sv9153ikg9csdgXWKoYnKciPw7Koth
 aZSvP7366AabczkDMExD+xE+YRWlFQveR6byKJOhmDEpDNPbxENPqSdISlWdLrhbUcXs
 8pdM9TDQPKMiKYjuzozzz0Q4bwu4FrHtRy0r38Qk66+JQY0dMhh94KBAJOwykToHEHnt
 e9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=vXzMO6i9R0x1KvOrRVIzXnXswl1dMtXqTbmX3II/M48=;
 b=OZvd1SXGf3Cz8w8z+dhX7RrtfYreoBj/nvF5u++0qO3v5g/Bxd9WZ44poVJQ0JPzNq
 mG5ytR0GPvjy3prNrxs+gGFPRVzk8A3wTWtpBOdPJODwAL+rnFmNwSPp67lznT4Q10cY
 UWyP52rbdUC9dvg4jC/wRNUQIG3aID0TutnrvaBM1U7nbj7AoNe/FEQ7aCJ+o59asmUZ
 /3KhBb3V0kNk2l2p4I76Yln+LavA4mYVMX3VtTwaKA1SI9tTvFh6Ktf7jNWTE/pIz7to
 ce0Kd2fR2UtYqtJSt1/3+hChBQMKaswB0oIX9F3lW8mMiCxFbASWOh01HxeOTxVBtoTp
 mZTQ==
X-Gm-Message-State: AOAM531E3NBOOOkQA8892vuXTJQiQWHkh6Joe/Y70irSmWW008lB+nb7
 A6QnNz+ykul8t9pwrqo1dMgxCgGqpyN02g==
X-Google-Smtp-Source: ABdhPJz8+6VzEdzBb0fQETBegW8F3y3jWeL5lx58C6oKMnlWFAfb+39sa8/mOknMexWdo3zwPy5Zbg==
X-Received: by 2002:a1c:7f93:: with SMTP id a141mr763821wmd.105.1612470568123; 
 Thu, 04 Feb 2021 12:29:28 -0800 (PST)
Received: from f2.Home (bzq-109-64-9-177.red.bezeqint.net. [109.64.9.177])
 by smtp.gmail.com with ESMTPSA id f7sm8807834wre.78.2021.02.04.12.29.27
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 04 Feb 2021 12:29:27 -0800 (PST)
From: Yuri Benditovich <yuri.benditovich@daynix.com>
To: mst@redhat.com,
	jasowang@redhat.com,
	qemu-devel@nongnu.org
Subject: [PATCH 1/3] vhost-net: add VIRTIO_NET_F_HASH_REPORT to the list of
 kernel features
Date: Thu,  4 Feb 2021 22:29:13 +0200
Message-Id: <20210204202915.15925-2-yuri.benditovich@daynix.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210204202915.15925-1-yuri.benditovich@daynix.com>
References: <20210204202915.15925-1-yuri.benditovich@daynix.com>
Received-SPF: none client-ip=2a00:1450:4864:20::333;
 envelope-from=yuri.benditovich@daynix.com; helo=mail-wm1-x333.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: yan@daynix.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

In case of vhost TAP the kernel must support this feature,
otherwise the device can't offer it.

Signed-off-by: Yuri Benditovich <yuri.benditovich@daynix.com>
---
 hw/net/vhost_net.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
index 24d555e764..8282e440bd 100644
--- a/hw/net/vhost_net.c
+++ b/hw/net/vhost_net.c
@@ -45,6 +45,7 @@ static const int kernel_feature_bits[] = {
     VIRTIO_NET_F_MTU,
     VIRTIO_F_IOMMU_PLATFORM,
     VIRTIO_F_RING_PACKED,
+    VIRTIO_NET_F_HASH_REPORT,
     VHOST_INVALID_FEATURE_BIT
 };
 
-- 
2.17.1


