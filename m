Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C51B454E851
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 19:06:06 +0200 (CEST)
Received: from localhost ([::1]:55324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1swX-0004ci-HU
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 13:06:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soQ-0004iJ-8T
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37793)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1o1soO-0001wI-BZ
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 12:57:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655398659;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fahg6cAiYMJMdcL25Zly7aFQGzBKOhS5hPC6CyTMkLs=;
 b=JDfctVTLK3aKtOCBSbrvVdSMI5BKQshOozaHkKw8o+5iw+gDu337iuT4uj238IXNbjvaZa
 i4VFSrFuj8Cv+Tiu4ylOlLXCZyMMVOCKONa/2OFUoZoxAw+9WPZadCqIbHPP7iEIcSh38V
 1ktV9xsx/JvT81nI/4dlWsSEG77v844=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-426-jeR9lvPuMCuEd8JegDfrZg-1; Thu, 16 Jun 2022 12:57:38 -0400
X-MC-Unique: jeR9lvPuMCuEd8JegDfrZg-1
Received: by mail-wr1-f71.google.com with SMTP id
 u18-20020adfb212000000b0021855847651so387522wra.6
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 09:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=fahg6cAiYMJMdcL25Zly7aFQGzBKOhS5hPC6CyTMkLs=;
 b=CKlhKAuIzp22DnD73xgCG6pkMfHlJRHNeJfcrt8M26JDn/p/xyScj7T+hpvHVHyO3L
 dEkE+KZf892ljPmp8PCBM3zYW6Ssy2AOnh+JW+FhE3u8V7yL72ORwj27v745LndqoMsy
 pbI5xkOa6vTkzeGiUAGeBqdC6EUsIs2M8gPka3lMilDlmT2cTACpT36DTBU1VB9XsO8G
 /xv8EFY9NHQjAOJDGjzLv+D3NMX2PoNw72VPiZvFiXCCyr5VTeG/11AXX22bZbrKfk5F
 +2PizRCLwAPYc0EED9VPEnV5CKFA9dSbq94JRL/S3UgmGU3iC5HhjAQA3MD9EPuKsfaS
 //mw==
X-Gm-Message-State: AOAM533Rz8grf+Y5r0ko2tNzo//+8j2pew2hoWrPbP3rNTR1WfZ3AgLd
 VhHYC59/PnQ13nQGvp0rbfaAEXBG4FwIrQ3gXYCt6qqDV5+H4pUCbTiJg8J0cPyt8TrOOfVXP8J
 /KJuao+ciNdEv1hAQqBGj2sjMxZbt8vEC492fWcXkHSWZpBsSVjrlrMBv22s6
X-Received: by 2002:a05:600c:4c06:b0:39c:975a:a548 with SMTP id
 d6-20020a05600c4c0600b0039c975aa548mr16367951wmp.99.1655398656437; 
 Thu, 16 Jun 2022 09:57:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3vGP4PIyaaCI+EB89c1t06K7XCNT1CYBaUBxpUiVhZ7X8wLD6LVs2bkGW5pSAI0wCDiWVhw==
X-Received: by 2002:a05:600c:4c06:b0:39c:975a:a548 with SMTP id
 d6-20020a05600c4c0600b0039c975aa548mr16367923wmp.99.1655398656159; 
 Thu, 16 Jun 2022 09:57:36 -0700 (PDT)
Received: from redhat.com ([2.53.13.204]) by smtp.gmail.com with ESMTPSA id
 t10-20020a5d460a000000b002117ef160fbsm2397043wrq.21.2022.06.16.09.57.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 09:57:35 -0700 (PDT)
Date: Thu, 16 Jun 2022 12:57:33 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Parav Pandit <parav@nvidia.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Eddie Dong <eddie.dong@intel.com>
Subject: [PULL 04/10] virtio/vhost-user: Fix wrong vhost notifier GPtrArray
 size
Message-ID: <20220616165703.42226-5-mst@redhat.com>
References: <20220616165703.42226-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220616165703.42226-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
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

From: Yajun Wu <yajunw@nvidia.com>

In fetch_or_create_notifier, idx begins with 0. So the GPtrArray size
should be idx + 1 and g_ptr_array_set_size should be called with idx + 1.

This wrong GPtrArray size causes fetch_or_create_notifier return an invalid
address. Passing this invalid pointer to vhost_user_host_notifier_remove
causes assert fail:

    qemu/include/qemu/int128.h:27: int128_get64: Assertion `r == a' failed.
	shutting down, reason=crashed

Backends like dpdk-vdpa which sends out vhost notifier requests almost always
hit qemu crash.

Fixes: 503e355465 ("virtio/vhost-user: dynamically assign VhostUserHostNotifiers")
Signed-off-by: Yajun Wu <yajunw@nvidia.com>
Acked-by: Parav Pandit <parav@nvidia.com>
Change-Id: I87e0f7591ca9a59d210879b260704a2d9e9d6bcd
Message-Id: <20220526034851.683258-1-yajunw@nvidia.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Eddie Dong <eddie.dong@intel.com>
---
 hw/virtio/vhost-user.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/virtio/vhost-user.c b/hw/virtio/vhost-user.c
index 0594178224..4b9be26e84 100644
--- a/hw/virtio/vhost-user.c
+++ b/hw/virtio/vhost-user.c
@@ -1525,7 +1525,7 @@ static VhostUserHostNotifier *fetch_or_create_notifier(VhostUserState *u,
 {
     VhostUserHostNotifier *n = NULL;
     if (idx >= u->notifiers->len) {
-        g_ptr_array_set_size(u->notifiers, idx);
+        g_ptr_array_set_size(u->notifiers, idx + 1);
     }
 
     n = g_ptr_array_index(u->notifiers, idx);
-- 
MST


