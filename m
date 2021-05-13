Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0202437FC10
	for <lists+qemu-devel@lfdr.de>; Thu, 13 May 2021 19:04:13 +0200 (CEST)
Received: from localhost ([::1]:46408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhEku-0008GL-0J
	for lists+qemu-devel@lfdr.de; Thu, 13 May 2021 13:04:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhENE-0002fj-0H
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27868)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lhENC-00010c-9n
 for qemu-devel@nongnu.org; Thu, 13 May 2021 12:39:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620923981;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9162a9gsiDm6q5lv1tLX3hofqR6ZQKlarxc+XT9y4us=;
 b=fVQDnjQ70ArC9PNqIIqFpPXf+2lRhZ8TUW1yuBySJHlIjN375yUqY2nGCoIMYZ31BOFmrd
 Id96KG23lQa5Q1RzLIteJHi+X2l80NP76wgN3x1MGyLEhl+2PamNIiPaF2FcPCz5QQS9G3
 laDIyYnX6brw9WG1beHWQ7XlruHY/gI=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-Y8oR7OqBOR-71WTKRZYJ4w-1; Thu, 13 May 2021 12:39:40 -0400
X-MC-Unique: Y8oR7OqBOR-71WTKRZYJ4w-1
Received: by mail-ed1-f70.google.com with SMTP id
 k10-20020a50cb8a0000b0290387e0173bf7so15044021edi.8
 for <qemu-devel@nongnu.org>; Thu, 13 May 2021 09:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9162a9gsiDm6q5lv1tLX3hofqR6ZQKlarxc+XT9y4us=;
 b=GIX80vJLg/ZaJQPYxamfHXTbYe7qk6pI+bUm1V3f8PviYWlD+V8tyP+pT0Npl5AM8o
 V50ha6bIb9WGyA0EPvjMpftKmugg6m96mPlf4n/QRyHRralHuWee5ZhjjF1mASK/dCLb
 eHWih4CiXXjZAVtGsfkqxwFkRJI89ZPekBF0K8EyeqY4nUl+7XLE/eP0N7wabzIvnKRN
 xrVuhLC+BdeZrAQe4P9SQexwwzDk51LljeJswCLppiHDhFx6DevOPLWc9hzVURE0MsO5
 tXhDtjBG0t8kxJtMYU511m8Du3OQYPnpsL9lZf+eLTCOgmE/ruhnfB+TCV8cMr5cA/Ax
 NUQw==
X-Gm-Message-State: AOAM530cEAEADUYfPUy1HB5wGpxce02dd+LwD4lVD135AKEkmqKkcvz6
 snobbXVFB2biJg5bVFdVXBmFjq6Jg+O8Ks1MNAtreY4InpNWR36wiOEyueKQLhvlSVKEOpNc6lP
 Q2WgCmovlY10HemmDLEpQC84bRkE/Giu4tDu1GOY/l+kgJT0OZa1yOXQLECl8TI7h
X-Received: by 2002:aa7:c510:: with SMTP id o16mr51117606edq.310.1620923978896; 
 Thu, 13 May 2021 09:39:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAzVgm8Qwn9FiXpF/yuznqTA1YfSKUmYrD/MywIqRiF1fT01onNfI3Q+vOESyc3JUACn3t3A==
X-Received: by 2002:aa7:c510:: with SMTP id o16mr51117585edq.310.1620923978688; 
 Thu, 13 May 2021 09:39:38 -0700 (PDT)
Received: from x1w.redhat.com (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id i6sm2713664eds.83.2021.05.13.09.39.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 May 2021 09:39:38 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/10] hw/ppc/Kconfig: Add missing dependency E500 -> DS1338
 RTC
Date: Thu, 13 May 2021 18:38:56 +0200
Message-Id: <20210513163858.3928976-9-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210513163858.3928976-1-philmd@redhat.com>
References: <20210513163858.3928976-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, Amit Singh Tomar <amit.tomar@freescale.com>,
 "open list:PowerPC TCG CPUs" <qemu-ppc@nongnu.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Andrew Randrianasulu <randrianasulu@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 7abb479c7ab ("PPC: E500: Add FSL I2C controller and integrate
RTC with it") added a global dependency on the DS1338 model, instead
of a machine one (via Kconfig). This gives trouble when building
standalone machines not exposing I2C bus:

  The following clauses were found for DS1338

      CONFIG_DS1338=y
      config DS1338 depends on I2C

Fix by selecting the DS1338 symbol in the single machine requiring
it, the E500.

Fixes: 7abb479c7ab ("PPC: E500: Add FSL I2C controller and integrate RTC with it")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
Cc: Amit Singh Tomar <amit.tomar@freescale.com>
Cc: Andrew Randrianasulu <randrianasulu@gmail.com>
---
 default-configs/devices/ppc-softmmu.mak | 1 -
 hw/ppc/Kconfig                          | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/default-configs/devices/ppc-softmmu.mak b/default-configs/devices/ppc-softmmu.mak
index c2d41198cde..5a7f99d1e45 100644
--- a/default-configs/devices/ppc-softmmu.mak
+++ b/default-configs/devices/ppc-softmmu.mak
@@ -1,7 +1,6 @@
 # Default configuration for ppc-softmmu
 
 # For embedded PPCs:
-CONFIG_DS1338=y
 CONFIG_E500=y
 CONFIG_PPC405=y
 CONFIG_PPC440=y
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 66e0b15d9ef..2e4c56eb770 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -128,6 +128,7 @@ config E500
     select SERIAL
     select MPC_I2C
     select FDT_PPC
+    select DS1338
 
 config VIRTEX
     bool
-- 
2.26.3


