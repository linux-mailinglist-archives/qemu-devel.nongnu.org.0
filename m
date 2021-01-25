Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114AE302675
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 15:49:06 +0100 (CET)
Received: from localhost ([::1]:50328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l43Av-0004oq-4Q
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 09:49:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41044)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l437k-0003sa-MZ
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:45:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:44646)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l437h-0002oc-MV
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 09:45:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611585944;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eyAIWgb9gsg8MioYvbK2q4hAEL+3fqa+Th3P+PoqI/E=;
 b=iqfbw9EUFaZGIm60kPR8GJUyXSx6ssfkkWRsvouqstHXJ5sE2QcdAWAF1ug7c0DRhP2klf
 478NNriMUWjQH55KjobVriiNc3RrHB19NYSfOA87VHu6+zTqUxIYBvw72lypGW3iab0rnN
 +45SWOhKdVyMf1J+ipokWn5GItc3/zs=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-466-TM6jSDBROwatTZJjI17HSg-1; Mon, 25 Jan 2021 09:45:41 -0500
X-MC-Unique: TM6jSDBROwatTZJjI17HSg-1
Received: by mail-ed1-f72.google.com with SMTP id r4so7505168eds.4
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 06:45:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eyAIWgb9gsg8MioYvbK2q4hAEL+3fqa+Th3P+PoqI/E=;
 b=Sb07GOPNuHuR95begn2MpN7DQEGi1eqcWuGvxf3chet0W+jkSKjzW637OUsrs2Qg4l
 AoCcBkpIkKwGY3UJVNfYX71z9YA/+KfzWRp0t0hP0r2iAkqN2XVq5zf6NbbS9OmZN/Ut
 A+XcrKKhhveh7SctdxAXPlyt7YBk9zvcSvUF6uN4EICT4w5BvxFMNiht1pYNocyUglEv
 MRLcT9HnzKK8hZKb2URV/oIP0Ns/BzooAJFUWzIScSLvVtHbs6IQZtfXtVkFKJz3TCux
 0eq7xD9FoiU2n5qEZFI9iSVUmOCqWgFdtzepSneUyP/vhzaY9+rBoCAnyHzSkOWam00s
 KYXg==
X-Gm-Message-State: AOAM531/iMoE9nWGILDr4PqNVLsfiDTOsL9HEVmwVpUQV1c2JK1DfpgP
 K5WFQisqR2rSGf6Da5Jhz3sgiaU4EpoIUczK0FfCV5Wu0DhsTSoLPSZHeOl6spDBMomV/UyV2EE
 jNAWrA+4DhM8ut/4yCuZG0KuJb4sksKuPClfiAuwZmHkYgnt4HqxVvDRJcSTZ69Lu
X-Received: by 2002:a17:906:358f:: with SMTP id
 o15mr588639ejb.369.1611585940517; 
 Mon, 25 Jan 2021 06:45:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyVYQLQb66A79o/zw5D3p/Mlmg2n1oRdyBvcTXOdEjHjZYe4Rgdk6og4SOlqq37HtF15JItCg==
X-Received: by 2002:a17:906:358f:: with SMTP id
 o15mr588624ejb.369.1611585940358; 
 Mon, 25 Jan 2021 06:45:40 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id gb14sm8184040ejc.61.2021.01.25.06.45.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jan 2021 06:45:39 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 1/4] configure: Fix --enable-tcg-interpreter
Date: Mon, 25 Jan 2021 15:45:27 +0100
Message-Id: <20210125144530.2837481-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210125144530.2837481-1-philmd@redhat.com>
References: <20210125144530.2837481-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

The configure option was backward, and we failed to
pass the value on to meson.

Fixes: 23a77b2d18b ("build-system: clean up TCG/TCI configury")
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210124211119.35563-1-richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 configure | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/configure b/configure
index dcc5ea7d630..526c4cc1306 100755
--- a/configure
+++ b/configure
@@ -1119,9 +1119,9 @@ for opt do
   ;;
   --enable-whpx) whpx="enabled"
   ;;
-  --disable-tcg-interpreter) tcg_interpreter="true"
+  --disable-tcg-interpreter) tcg_interpreter="false"
   ;;
-  --enable-tcg-interpreter) tcg_interpreter="false"
+  --enable-tcg-interpreter) tcg_interpreter="true"
   ;;
   --disable-cap-ng)  cap_ng="disabled"
   ;;
@@ -6361,6 +6361,7 @@ NINJA=$ninja $meson setup \
         -Dmalloc=$malloc -Dmalloc_trim=$malloc_trim -Dsparse=$sparse \
         -Dkvm=$kvm -Dhax=$hax -Dwhpx=$whpx -Dhvf=$hvf \
         -Dxen=$xen -Dxen_pci_passthrough=$xen_pci_passthrough -Dtcg=$tcg \
+        -Dtcg_interpreter=$tcg_interpreter \
         -Dcocoa=$cocoa -Dgtk=$gtk -Dmpath=$mpath -Dsdl=$sdl -Dsdl_image=$sdl_image \
         -Dvnc=$vnc -Dvnc_sasl=$vnc_sasl -Dvnc_jpeg=$vnc_jpeg -Dvnc_png=$vnc_png \
         -Dgettext=$gettext -Dxkbcommon=$xkbcommon -Du2f=$u2f -Dvirtiofsd=$virtiofsd \
-- 
2.26.2


