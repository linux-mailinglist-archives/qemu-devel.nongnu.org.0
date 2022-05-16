Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 188985291FA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 22:54:21 +0200 (CEST)
Received: from localhost ([::1]:60702 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqhjP-0007E0-Ug
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 16:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58070)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhfS-0004AC-A9
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:48729)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nqhfQ-00067H-Me
 for qemu-devel@nongnu.org; Mon, 16 May 2022 16:50:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652734212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XkrRJedOufle4jodSsyRS23wATzWQCLpHV6nsFBGNzU=;
 b=XZ3sMVAoEUMiFbKY4L5vsZb1V0J77vSGWzhhi51h2fnCC87HyhHlqKQnV035dgnTCoNuEV
 88HwWBzkYVVuw526eQnPw9t7L8LUOdM+IpOpwq0EC+NlYtpQHVrN0QsnPMQ2T4guU+qPu7
 jnxnuFurVSbHXITYQ6K89MsKmTYllDA=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-AImkDfgMOsK1yVcgSt8yhA-1; Mon, 16 May 2022 16:50:10 -0400
X-MC-Unique: AImkDfgMOsK1yVcgSt8yhA-1
Received: by mail-ej1-f71.google.com with SMTP id
 re25-20020a170906d8d900b006f50701fbefso6348741ejb.23
 for <qemu-devel@nongnu.org>; Mon, 16 May 2022 13:50:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=XkrRJedOufle4jodSsyRS23wATzWQCLpHV6nsFBGNzU=;
 b=ROKhTKGpl19mnHHFSorP2oZ8jVV1bonPdIurR3tZVYSa9aNllr564Ba5w5dWdHUDV2
 QTiHdV7TBrhjIjRL0rJ7C0z/GogJDDCLmkLT3GV7BoZLSbDDs8qaKHvS+wfeI4TxBbaQ
 +Elr3ME/DPmTiyIAzu8L3BpBqjC98EP3Ksfz8Wf+hDePTHW3Var1UwmxcQh/Lu1fS73t
 Xy8HLvdUdmrZYRztmY+ue1rnBeUVuRaHnvRr7YvXLIxXHEdxtk26806cTFm+FHMY2V/v
 dONZngn2R7HtX8qOeiz3Kc5t50FFVd6upDhGJmrVuRtt6yw9M9GR+TbMEL0EULxJtOdg
 RVlQ==
X-Gm-Message-State: AOAM531mbMOTR9XGjmjCb2T4H0NOylCZUGRS4Q4wvW7iX9X9YoxPF3Ol
 jsEVkWftp0R5qanpIlP2+gURRaXOYl1V9UZFEtzMbSQfi07/y0yAJBlToA+gUQRW+ayPtHUN6XU
 JaKQutR4clYgCeFbh4jH93BjcQ0vYmRn+rNSUMd2wyh7+tXJzeUL7F85/J6/l
X-Received: by 2002:a17:906:d296:b0:6f4:318d:7ee3 with SMTP id
 ay22-20020a170906d29600b006f4318d7ee3mr16731603ejb.575.1652734209291; 
 Mon, 16 May 2022 13:50:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx478dz5h5GobeTp0s5XiICs/IqGHUxClhe9zfjcNcHXofY0A790tOFoC7QSSvpdck2RCel8w==
X-Received: by 2002:a17:906:d296:b0:6f4:318d:7ee3 with SMTP id
 ay22-20020a170906d29600b006f4318d7ee3mr16731572ejb.575.1652734209010; 
 Mon, 16 May 2022 13:50:09 -0700 (PDT)
Received: from redhat.com ([2.55.131.38]) by smtp.gmail.com with ESMTPSA id
 h27-20020a1709070b1b00b006f3ef214e5fsm146423ejl.197.2022.05.16.13.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 13:50:08 -0700 (PDT)
Date: Mon, 16 May 2022 16:50:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Peter Xu <peterx@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL v2 02/86] intel-iommu: correct the value used for
 error_setg_errno()
Message-ID: <20220516204913.542894-3-mst@redhat.com>
References: <20220516204913.542894-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220516204913.542894-1-mst@redhat.com>
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


