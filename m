Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED23584830
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jul 2022 00:24:03 +0200 (CEST)
Received: from localhost ([::1]:53434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oHBvG-00022o-IF
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 18:24:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHBu2-0000cz-IZ
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 18:22:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37178)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1oHBtz-00020D-Oq
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 18:22:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659046962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ORLqmTavrpmFCjM97zE9EOvvemvokaHihzrA+oOsJbE=;
 b=BIo2lvi8DGuaVKEk15UyFYNxeWv8FYpLJe/ezTY0TGmnWHk1ft12ZMXvLtIqqrUyHTJI3Y
 ECD+Y4AXhcGIPW1oar/23SoKJKLWZYsLdJ0Utd84hQRmUVkOLC5HwwM0yd4jPSiS0/fE38
 y+JQaZpyjizyBYmQbyij64YgaLABnQA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-37-B6eBW9eVMw6Pp146Yy0Xvw-1; Thu, 28 Jul 2022 18:22:41 -0400
X-MC-Unique: B6eBW9eVMw6Pp146Yy0Xvw-1
Received: by mail-wr1-f71.google.com with SMTP id
 t12-20020adfba4c000000b0021e7440666bso728327wrg.22
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 15:22:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ORLqmTavrpmFCjM97zE9EOvvemvokaHihzrA+oOsJbE=;
 b=6XyCeQhL22dmgLyWC7XHMsvUwUEtFcjXSU+4Z4aS+A9TFNmaTkQvnBBsZG1adyuApi
 yQrHyr8M69knfy+SalHBbneZ13upVbOnhrYjBq3NBCy2cYIczSe7E76209oLte+2Pzv/
 VQpAiw9JbhTqr+Cfp2jyfDe9xy3mLXXf7ipx0A0x+6/RRS1BxyXAXfC3NY97jv62OYa8
 kRLy0L2ghCXibev55jcN4ohG9dbKQMjFU1AgNBOncX/wI/Z/jDac3D1OtyvWlrGdDGTV
 fijjxpzanPDNeJWPS0EOckz0R2TgJmf+1vqSDv01vSeaPCXn7ehJ8bEdAsJ7LLa52LeS
 k6qQ==
X-Gm-Message-State: ACgBeo17rjQAqHqOzxsE+XzJ458DMG1RPFmMHyVJwJlem5Fv7Y3YgtCH
 XzcpU5Zi576jqEX4nhRDiq7U+Qn9F3PXDpfmUC6MNlF81XztaU3adxLbq5mlbqrTtNHWsWnyxxf
 gfwQPCavuJ81OzUocwr1MJN5m2iFP/dPRUxXcFJuGG8KPsW8iSOFDMwNQqs2MCZ3rGXk=
X-Received: by 2002:adf:f3cb:0:b0:21e:4cce:b620 with SMTP id
 g11-20020adff3cb000000b0021e4cceb620mr568507wrp.7.1659046959721; 
 Thu, 28 Jul 2022 15:22:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7vSI6GgWSLGf0lwTnPlrbfXMVdOLVJknHQmo7WivJlbKsqgB+aukgPMZOcUbT1ilIAvcdVIw==
X-Received: by 2002:adf:f3cb:0:b0:21e:4cce:b620 with SMTP id
 g11-20020adff3cb000000b0021e4cceb620mr568497wrp.7.1659046959467; 
 Thu, 28 Jul 2022 15:22:39 -0700 (PDT)
Received: from goa-sendmail ([93.56.169.184]) by smtp.gmail.com with ESMTPSA id
 o9-20020a05600c4fc900b003a31c4f6f74sm7774150wmq.32.2022.07.28.15.22.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jul 2022 15:22:38 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	Taylor Simpson <tsimpson@quicinc.com>
Subject: [PATCH] configure: pass correct cflags to container-based cross
 compilers
Date: Fri, 29 Jul 2022 00:22:37 +0200
Message-Id: <20220728222237.307698-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
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

probe_target_compiler returns nonempty $target_cc for installed toolchains
and $container_cross_cc for container-based toolchains.  In both cases
however the flags (coming from $cross_cc_cflags_${target_arch}) must be
in $target_cflags.

Therefore, do not clear them prior to returning from probe_target_compiler.

Reported-by: Taylor Simpson <tsimpson@quicinc.com>
Fixes: 92e288fcfb ("build: try both native and cross compilers", 2022-07-08)
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 configure | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configure b/configure
index c4c02b8438..72ab03f11a 100755
--- a/configure
+++ b/configure
@@ -2173,7 +2173,6 @@ probe_target_compiler() {
     build_static=
     target_cc=
     target_ccas=
-    target_cflags=
     target_ar=
     target_as=
     target_ld=
-- 
2.36.1


