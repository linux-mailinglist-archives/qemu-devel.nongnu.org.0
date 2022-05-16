Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65ED252824C
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 12:40:14 +0200 (CEST)
Received: from localhost ([::1]:41086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqY97-0000DA-80
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 06:40:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY4r-0005fZ-Lr
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:35:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:50279)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqY4p-00052T-Kk
 for qemu-devel@nongnu.org; Mon, 16 May 2022 06:35:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652697346;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XkrRJedOufle4jodSsyRS23wATzWQCLpHV6nsFBGNzU=;
 b=F1sj4kPazFVrlGr4n/Ris8PPxxSIOkgc8doAKJWbqJWcrBuVGh/TIatcZugb4ov0l9ZcBF
 JYSD/qFLVxbioJQZTtl4E/1leFFDcIRdb496LqWgyz91SrPlJLiQHHtWqGIg4jZT7rCpCd
 14IL69NjSxH9CDi2Ce8zBEvFjoC6e0M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-31-nyDzu164P1qQZ0uxiMjdnA-1; Mon, 16 May 2022 06:35:45 -0400
X-MC-Unique: nyDzu164P1qQZ0uxiMjdnA-1
Received: by mail-wm1-f70.google.com with SMTP id
 r186-20020a1c2bc3000000b00396fee62505so639004wmr.0
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 03:35:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XkrRJedOufle4jodSsyRS23wATzWQCLpHV6nsFBGNzU=;
 b=rFk1viNGM2KpyjVzyEo6A+Zt2h3RFp7iTdO1TTWQnYlh1R8b7XGbSJerXRQr2VDVjH
 vXnS0KZI1TlGaVAosmD+RZUFkPPHkgFwDqZeyiwY9BMFbd7wDXMapP1+LyugEpPQn4Aw
 PfuNjqp8kYuAmQVbhd3YDQay6cvlpVPgTjD3D4W6jJsbWEBVvrrZgNF5eLBlMMKrUKFl
 ebrK85obrwm44yPM7eYdvhwzJ6ZIjrZcczHO7nSTDujyZ66qtCc9s0YkvA9k+YOQS2JU
 Wc6+B3dEXOU+M5XqlGq5DlRPYVYYCFeF5U6zhmcMll3cyV6IRYSxN+syavkBQfZT0PTe
 MQ5Q==
X-Gm-Message-State: AOAM531MMrjNqyNVIHPcpyNqOoSnzzAnLmnroeb6tdJJ9+kfGc+etgjf
 FzrEleSDazHkR2THoD2BaSYD4oQFpnRnYjkoAd24OLaLXDo7LdJazk/rL/iXTIuXOlgkCxMkPZM
 2o6+cx92Byr1HzdXCnWDXkZERgwGa6E4/o2pwwinKGSBH2sXa3hMc2twaZ4eg
X-Received: by 2002:adf:9dce:0:b0:20a:c019:ad4 with SMTP id
 q14-20020adf9dce000000b0020ac0190ad4mr13802652wre.591.1652697344180; 
 Mon, 16 May 2022 03:35:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJznPjGrX6OtVoh7cDzJ10W8b3MRYfTK8NGgLi3dncz0nDeuCe1m/Vz/NtrF3CyjEtxFoXiU2A==
X-Received: by 2002:adf:9dce:0:b0:20a:c019:ad4 with SMTP id
 q14-20020adf9dce000000b0020ac0190ad4mr13802628wre.591.1652697343934; 
 Mon, 16 May 2022 03:35:43 -0700 (PDT)
Received: from redhat.com ([2.55.141.66]) by smtp.gmail.com with ESMTPSA id
 l9-20020adfc789000000b0020cd8f1d25csm9688971wrg.8.2022.05.16.03.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 03:35:43 -0700 (PDT)
Date: Mon, 16 May 2022 06:35:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: [PULL 02/91] intel-iommu: correct the value used for
 error_setg_errno()
Message-ID: <20220516095448.507876-3-mst@redhat.com>
References: <20220516095448.507876-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516095448.507876-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Jason Wang <jasowang@redhat.com>

error_setg_errno() expects a normal errno value, not a negated
one, so we should use ENOTSUP instead of -ENOSUP.

Fixes: Coverity CID 1487174
Fixes: ("intel_iommu: support snoop control")
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20220401022824.9337-1-jasowang@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Peter Xu <peterx@redhat.com>
---
 hw/i386/intel_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index c64aa81a83..e05d69a2c0 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3032,7 +3032,7 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
 
     /* TODO: add support for VFIO and vhost users */
     if (s->snoop_control) {
-        error_setg_errno(errp, -ENOTSUP,
+        error_setg_errno(errp, ENOTSUP,
                          "Snoop Control with vhost or VFIO is not supported");
         return -ENOTSUP;
     }
-- 
MST


