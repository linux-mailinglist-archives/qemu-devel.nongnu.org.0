Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD3E6A7CB9
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 09:33:31 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXeHV-0005sm-Aw; Thu, 02 Mar 2023 03:27:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeHA-0005gD-HJ
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:56 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pXeGu-0002aX-CI
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 03:26:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677745598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=t6c10ACzCOZas8J7pxjW6LzY+glwxzDOaL5XtXdfnh8=;
 b=PcrTtEBYrbN6FrMcAtCxH3cTR3CTdjBVV1MvtMXdfghu3pbGXIpNgCYrg3UsNYlDPHgEU+
 BV0iw34JB99Ii5BgEDAYL5SgUl4ZLGIyXp8d2DNUevR3JzeUlHDJ4rsMMeYIS4JKFWLHkv
 lSROFx0m7lKlmS1nZsjo8XYRfE0480I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-3-iJbyPlRENbCGu5uToN6EBw-1; Thu, 02 Mar 2023 03:26:27 -0500
X-MC-Unique: iJbyPlRENbCGu5uToN6EBw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k26-20020a05600c0b5a00b003dfe4bae099so764686wmr.0
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 00:26:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677745586;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t6c10ACzCOZas8J7pxjW6LzY+glwxzDOaL5XtXdfnh8=;
 b=UtPj2jokDHKjC0Euknr+swb9PpMDL4PToWH5p2tRoRKKcSbn2EF98n/kBXpcq15+SN
 sdgeHHoPiwbGNMJJiVFlwDEronO8N3l2cKCvT+dTPJWxpAMOrRUfgHe+wV3aFF8O9T8H
 AxYoYz+XkFFXtlq5fVyTlHQiKqUBIJel7cVYJQkvdvz2Dpzr1K3DeSRw9+0N19ZefjV6
 N09yPhX3sOqfFirxQ1w5UcivS8CKWZXO93Fg43mgha/PMcGImnpDH2mFJ/bcFTzaR018
 xpEGX/Uc9PlYmXq1dUCtsIKv+4Vi21kOMbAT17SjN8gzwkZhFjGEkLM6lTvlBV5TUOSz
 cKIg==
X-Gm-Message-State: AO0yUKWalkeFzmgtGSjOnfM7QIH7NHgsxG3Uch0Xk82jomrBlAOGd5jc
 Qv3jtFCu1in3bkpHi+PxZ0oGo5ymroSoVpguJSqJjFbseFvqMEljLLQNpNULgujO/aPa51JiWks
 J2TpgsOfndLMPxmAF6eKxlTrvlhEa8SgMINb1ELXWp3G4iGt0nZGB/uxFOrHiM9zm0w==
X-Received: by 2002:a05:6000:110f:b0:2c7:d75:373a with SMTP id
 z15-20020a056000110f00b002c70d75373amr6695240wrw.1.1677745586524; 
 Thu, 02 Mar 2023 00:26:26 -0800 (PST)
X-Google-Smtp-Source: AK7set+/WTnByFy9CB08VApz6vCmNBpNWvwj0Pov3wkw/8kcyZ6gKfXnE3pw+3qClQF8Ut+u5z42kA==
X-Received: by 2002:a05:6000:110f:b0:2c7:d75:373a with SMTP id
 z15-20020a056000110f00b002c70d75373amr6695223wrw.1.1677745586304; 
 Thu, 02 Mar 2023 00:26:26 -0800 (PST)
Received: from redhat.com ([2.52.141.194]) by smtp.gmail.com with ESMTPSA id
 j14-20020a5d464e000000b002c558869934sm14759686wrs.81.2023.03.02.00.26.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Mar 2023 00:26:25 -0800 (PST)
Date: Thu, 2 Mar 2023 03:26:23 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Eric Auger <eric.auger@redhat.com>,
 Viktor Prutyanov <viktor@daynix.com>, Peter Xu <peterx@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 37/53] intel-iommu: fail MAP notifier without caching mode
Message-ID: <20230302082343.560446-38-mst@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230302082343.560446-1-mst@redhat.com>
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

From: Jason Wang <jasowang@redhat.com>

Without caching mode, MAP notifier won't work correctly since guest
won't send IOTLB update event when it establishes new mappings in the
I/O page tables. Let's fail the IOMMU notifiers early instead of
misbehaving silently.

Reviewed-by: Eric Auger <eric.auger@redhat.com>
Tested-by: Viktor Prutyanov <viktor@daynix.com>
Signed-off-by: Jason Wang <jasowang@redhat.com>
Message-Id: <20230223065924.42503-2-jasowang@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/intel_iommu.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/hw/i386/intel_iommu.c b/hw/i386/intel_iommu.c
index 6b1de80e85..b520542c47 100644
--- a/hw/i386/intel_iommu.c
+++ b/hw/i386/intel_iommu.c
@@ -3186,6 +3186,13 @@ static int vtd_iommu_notify_flag_changed(IOMMUMemoryRegion *iommu,
                          "Snoop Control with vhost or VFIO is not supported");
         return -ENOTSUP;
     }
+    if (!s->caching_mode && (new & IOMMU_NOTIFIER_MAP)) {
+        error_setg_errno(errp, ENOTSUP,
+                         "device %02x.%02x.%x requires caching mode",
+                         pci_bus_num(vtd_as->bus), PCI_SLOT(vtd_as->devfn),
+                         PCI_FUNC(vtd_as->devfn));
+        return -ENOTSUP;
+    }
 
     /* Update per-address-space notifier flags */
     vtd_as->notifier_flags = new;
-- 
MST


