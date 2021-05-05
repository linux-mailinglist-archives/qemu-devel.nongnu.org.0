Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E098374A1E
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 23:27:56 +0200 (CEST)
Received: from localhost ([::1]:59674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leP3j-00025a-0o
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 17:27:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOp4-0001sw-N2
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55034)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1leOox-00054v-0f
 for qemu-devel@nongnu.org; Wed, 05 May 2021 17:12:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620249158;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gqZEVFVeZ1PP5CqVjY9bmTR5zVRvOWsxXWPKEVWrRSk=;
 b=gY5Rx3Q7V55uJUS5JC2o2BYyF3eSr66pjB8CeBgzbPylsW4hGn1jpW3qbEzf7Mos+md85M
 U/rouloOmcIK1oJ8UMvPdSzKc5dNk27afIczwlA6p5oExFVclpFw0W+qgIMacFfvRPrc60
 mThiY77P2+9KyS+l762/oT5yQR7iem4=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-160-5ih2lRrvP0efE3ybDyGX3g-1; Wed, 05 May 2021 17:12:37 -0400
X-MC-Unique: 5ih2lRrvP0efE3ybDyGX3g-1
Received: by mail-wr1-f69.google.com with SMTP id
 93-20020adf93e60000b029010d9bb1923eso1220904wrp.4
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 14:12:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gqZEVFVeZ1PP5CqVjY9bmTR5zVRvOWsxXWPKEVWrRSk=;
 b=JzCLtdOfEvSdkEGs082l4EM49h7LY8DLVZkO9rq55jn1dDRb5teyRMri2JF15OXyXR
 TnNKMgCpdtag+ZCI9x+alZR1uBEDJMw2u3V8nB3SeDCnrM+zY0gYgJbv8klv6IFGPAo1
 XGbWhZrGZrFgIyspv9zhmlIZGti4C0PCFYg/rzR4roMzyAhy2aUC/5tCVgWKri7QMcVl
 jGKS85vXWL46vXwQkegE+YuvEYcAtrfHJobqnt8glBbHwj4D0zYKPU/pB+cqYKBAnHB4
 9+aVpqLKcqK5/CBxIy4C2V/Np+Dmsu50JZcgPDFGsGPGlg9RmyXwtAZ04olKXp9ZXbZn
 D46g==
X-Gm-Message-State: AOAM530J35lacJb4TiSORrWC/aj8rcWCggXGKHKCJIBoPl/d1Xmu5EiA
 EFiTtaOded2/DZtriDnBP9Tg7YUG7QQMXwv35oFr4PDmFCezeRtdZ0xnysXcBURCFQKVB53XN1f
 Bu5CfazqWpUr+DFDw6ejllHbobdEOFB4ipbdWeYGz9WHwvsZXzwlo9DZELCEOgH35
X-Received: by 2002:a5d:4351:: with SMTP id u17mr1030241wrr.47.1620249155598; 
 Wed, 05 May 2021 14:12:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdfQQZsRtZ7nyL+DSHqlEkFdqu+Hv47j75LD54ri+lhlT8Xt5UqHtwkM5tFFazugNDQCPNDw==
X-Received: by 2002:a5d:4351:: with SMTP id u17mr1030222wrr.47.1620249155407; 
 Wed, 05 May 2021 14:12:35 -0700 (PDT)
Received: from x1w.redhat.com
 (astrasbourg-653-1-188-220.w90-13.abo.wanadoo.fr. [90.13.127.220])
 by smtp.gmail.com with ESMTPSA id g129sm8432025wmg.27.2021.05.05.14.12.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 May 2021 14:12:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 21/23] target/ppc/kvm: Avoid dynamic stack allocation
Date: Wed,  5 May 2021 23:10:45 +0200
Message-Id: <20210505211047.1496765-22-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210505211047.1496765-1-philmd@redhat.com>
References: <20210505211047.1496765-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Use autofree heap allocation instead of variable-length
array on the stack.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/ppc/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/ppc/kvm.c b/target/ppc/kvm.c
index ae62daddf7d..90d0230eb86 100644
--- a/target/ppc/kvm.c
+++ b/target/ppc/kvm.c
@@ -2660,7 +2660,7 @@ int kvmppc_get_htab_fd(bool write, uint64_t index, Error **errp)
 int kvmppc_save_htab(QEMUFile *f, int fd, size_t bufsize, int64_t max_ns)
 {
     int64_t starttime = qemu_clock_get_ns(QEMU_CLOCK_REALTIME);
-    uint8_t buf[bufsize];
+    g_autofree uint8_t *buf = g_malloc(bufsize);
     ssize_t rc;
 
     do {
-- 
2.26.3


