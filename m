Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C05965E772
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 10:15:30 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDMKe-0001OD-1A; Thu, 05 Jan 2023 04:14:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKb-0001O0-1a
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pDMKZ-0006mK-MB
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 04:14:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1672910074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5A6GMov9PCeTxrjjQKoWBQC/93nLNMLXzF/LrE6+NE8=;
 b=Wp3oDU2SeoNSaFyt0Nf1UtaDZhW5yKwNtpeYD16d7RVCivL9WWAGsKSzu5obGJE2Jjf7Ya
 exDDwxjqQ5MGuHZqE5sfaODhk7LHzflaS8S0gfjifVyfpwQk+YPoh6Hp9QXmgxi12Rnpse
 hISOvhmQrBhLxYwaDYlDH+kgPT9jMsE=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-591-7pA_mUgpNWO05C7rOzv0Dw-1; Thu, 05 Jan 2023 04:14:33 -0500
X-MC-Unique: 7pA_mUgpNWO05C7rOzv0Dw-1
Received: by mail-wm1-f69.google.com with SMTP id
 a6-20020a05600c224600b003d1f3ed49adso261390wmm.4
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 01:14:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=5A6GMov9PCeTxrjjQKoWBQC/93nLNMLXzF/LrE6+NE8=;
 b=sjuvluAZPFOhPkGjlCtBMrsuAChny7EwiUmCTbIzf7xZW1AovHedM4MNE1tkGKVHJZ
 LPxY2FGBBNElfkNqDBjLvSG0pmVq0i/zb/fPOk+s0htF3MRe5gxocBy/CSR52HO1Eymf
 HV14vO7VxILkE6g/DzlTpud1mNQsbU8+S19wCpldwugRWPS55eqEG5nYGyTQLxYpzhZL
 RRAYhPrcwqjZRJ2zDk2DQgx67KKPbF0q1k+/+Zwjy/FUgN8Dsa2iYJ/LNIDtTea2tAQl
 hsZOfWWSHPO+iGokU/zEuSNYbOcEO4fDY7fwhwGwQG3X+7sHeIzOwB1dNeiFQAdtfEJf
 /FnQ==
X-Gm-Message-State: AFqh2kojW7NdvdNDdDXu0CCY6C6/qwXgJyki4qdUX3BMDDxMbWAjC9+I
 djDmgOmMJp3xx9VnRK5sqf9fQb2rfNHqmTDiQMxwBQWPAzU87DIYN2dGgAR+HG6nTm1+7DAJkPT
 H7WZkGC6meBXWxKB9yr5HqbSWyKmWh5R+SCqsz3bN/vNfWW8EP8HRf9aw/MWG
X-Received: by 2002:a05:6000:1d84:b0:273:6845:68ef with SMTP id
 bk4-20020a0560001d8400b00273684568efmr25895606wrb.60.1672910071998; 
 Thu, 05 Jan 2023 01:14:31 -0800 (PST)
X-Google-Smtp-Source: AMrXdXu8F9q8wU7Q1J9NyeJ0tEcDUiShqqyxnHbzyYHSH7n+ZnE2qd8ADfqIR28UMUglNgHVKPSxHQ==
X-Received: by 2002:a05:6000:1d84:b0:273:6845:68ef with SMTP id
 bk4-20020a0560001d8400b00273684568efmr25895590wrb.60.1672910071666; 
 Thu, 05 Jan 2023 01:14:31 -0800 (PST)
Received: from redhat.com ([2.52.151.85]) by smtp.gmail.com with ESMTPSA id
 h9-20020adffd49000000b00242209dd1ffsm35925584wrs.41.2023.01.05.01.14.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 01:14:31 -0800 (PST)
Date: Thu, 5 Jan 2023 04:14:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
 Jason Wang <jasowang@redhat.com>
Subject: [PULL 04/51] vdpa: do not handle VIRTIO_NET_F_GUEST_ANNOUNCE in
 vhost-vdpa
Message-ID: <20230105091310.263867-5-mst@redhat.com>
References: <20230105091310.263867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230105091310.263867-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Eugenio Pérez <eperezma@redhat.com>

So qemu emulates it even in case the device does not support it.

Signed-off-by: Eugenio Pérez <eperezma@redhat.com>
Acked-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20221221115015.1400889-5-eperezma@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 net/vhost-vdpa.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
index 41de76376f..b0c6109230 100644
--- a/net/vhost-vdpa.c
+++ b/net/vhost-vdpa.c
@@ -74,7 +74,6 @@ const int vdpa_feature_bits[] = {
     VIRTIO_F_RING_RESET,
     VIRTIO_NET_F_RSS,
     VIRTIO_NET_F_HASH_REPORT,
-    VIRTIO_NET_F_GUEST_ANNOUNCE,
     VIRTIO_NET_F_STATUS,
     VHOST_INVALID_FEATURE_BIT
 };
-- 
MST


