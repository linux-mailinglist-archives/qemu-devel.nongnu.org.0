Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48CB56A9D61
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 18:21:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY94i-0005bV-DX; Fri, 03 Mar 2023 12:20:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94g-0005bD-AH
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:20:06 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pY94e-0003g6-So
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 12:20:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677864004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yuToPMiVADxMT2mY36PVNqAmrx6q3c6Vff/ClLGF4k0=;
 b=fzl5+2ylJtM9ecNLnYYnRrelfCErxBWxaAzdYBrO2xjL59rUrTsURZ9CvQ2GOlu3gods+l
 xI2S9RsL8SKk3TymKjCF4Mt6r/YLzsJXStj0rs2U0tp8CyzkCJw6ofvs209Un4ip4pDQ5T
 1hVoX85L8pizgGa7EDHE2Cipw+rmhPQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-5s2FIUeBMjm1RYOeFhcuyA-1; Fri, 03 Mar 2023 12:20:03 -0500
X-MC-Unique: 5s2FIUeBMjm1RYOeFhcuyA-1
Received: by mail-wm1-f70.google.com with SMTP id
 p22-20020a7bcc96000000b003e2036a1516so3129843wma.7
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 09:20:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yuToPMiVADxMT2mY36PVNqAmrx6q3c6Vff/ClLGF4k0=;
 b=iqRDn14pvaNlAtbClXItQKqJGyjy/SmKs1yO/MWaClpZ6P8WYceF+9t2OfWeHuZHlY
 1KiVKcCqCCQU2nX2aeiNZ+lxoBMo7F6PS20OocW5CXiNccKh/TN5olM1AnVAvww4aaLF
 KDU++/Soo9wOfh5+MXnr+vxKaDDNpikbvjzn+AjrxxEs3Zv+BgjOzd2mFBd7BV0sJiG1
 pJpEPizSfbB16+E+tlnixrorLCVSjE2n9DWiK0it2IIWPKX7nP+PxKGKR19uWXrY3n4f
 vXSxcMJ8HacUoyoB4Teyg6UjdZMjj0PKc4TQqjNOS6F1/KA8WXgxi8J+4u4LFf+e0BS3
 xOWg==
X-Gm-Message-State: AO0yUKWWH6cn40h5ny3vptbwV65PV98t9QbRtq3iikopD81xGyPW/yXy
 +5GB6RKAmQXZKypuFS9kcMjNHWDRPyVujj8oZmvq6YXsnp8XLJ+gDEFOjtJkjm5sB2aYtOHXUsB
 oNirrkNCly6paymOdTS7D3fI+qYcXByCGcRghZx2FlS+ok9+7iKzenEUN7Rk2u5C92PfoWB0f
X-Received: by 2002:a05:600c:4592:b0:3dc:4b87:a570 with SMTP id
 r18-20020a05600c459200b003dc4b87a570mr2568831wmo.35.1677864001782; 
 Fri, 03 Mar 2023 09:20:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9v/yhZvizQ1y5nSujp0ZtVhdg1UU5w/ygh8Xb6Idd01OdOfndCZGX7S1q3Me0J/gcl5RWvDQ==
X-Received: by 2002:a05:600c:4592:b0:3dc:4b87:a570 with SMTP id
 r18-20020a05600c459200b003dc4b87a570mr2568808wmo.35.1677864001404; 
 Fri, 03 Mar 2023 09:20:01 -0800 (PST)
Received: from avogadro.local (nat-pool-mxp-u.redhat.com. [149.6.153.187])
 by smtp.gmail.com with ESMTPSA id
 e5-20020a5d5945000000b002c3f9404c45sm2691795wri.7.2023.03.03.09.20.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 09:20:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: gshan@redhat.com, eesposit@redhat.com, david@redhat.com,
 stefanha@redhat.com, cohuck@redhat.com, eauger@redhat.com
Subject: [PATCH 6/8] aio-wait: switch to smp_mb__after_rmw()
Date: Fri,  3 Mar 2023 18:19:37 +0100
Message-Id: <20230303171939.237819-7-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230303171939.237819-1-pbonzini@redhat.com>
References: <20230303171939.237819-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
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

The barrier comes after an atomic increment, so it is enough to use
smp_mb__after_rmw(); this avoids a double barrier on x86 systems.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 include/block/aio-wait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index dd9a7f6461ef..da13357bb8cf 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -85,7 +85,7 @@ extern AioWait global_aio_wait;
     /* Increment wait_->num_waiters before evaluating cond. */     \
     qatomic_inc(&wait_->num_waiters);                              \
     /* Paired with smp_mb in aio_wait_kick(). */                   \
-    smp_mb();                                                      \
+    smp_mb__after_rmw();                                           \
     if (ctx_ && in_aio_context_home_thread(ctx_)) {                \
         while ((cond)) {                                           \
             aio_poll(ctx_, true);                                  \
-- 
2.39.1


