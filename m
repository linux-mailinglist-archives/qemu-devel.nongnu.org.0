Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FFDF3AB856
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 18:04:37 +0200 (CEST)
Received: from localhost ([::1]:34586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltuVQ-00047a-8C
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 12:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKc-0006s2-E9
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:26 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:38900)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ltuKW-0001Vs-IX
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 11:53:21 -0400
Received: by mail-ej1-x62d.google.com with SMTP id og14so10669676ejc.5
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 08:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QBnoN+mJIyViJRaC52bSEIIRzamZ0YRTp8VHhJaLMeU=;
 b=ZxdECt5TEuUAd0VInp20ZKofrZrflkx6rEyoUDWdNZmE5k82TALG2fRKxt4SjlXtL4
 WD0SMGIA5wxNo/9EbDdmpdGaq40f6feUYJ30FDtUMmkdWYkksVtvyLKmqTkeoa/TOC2R
 bXQfQDLXG1O7o4MHE2LpHaENxtf5NUzX2ZoEghvxPzw0ZDjvTeCKG9pN9W6dqF7pvFAp
 RiTc5IS1hs75IIRi4vXTk0YwEgeUV7aoA2dQAvwRJOfPHYRcj+4iox8XsWAUcz6aC1im
 xiDzZfdQeUY2nr42axvSeifESGYHsMw+ngPAX0Ka4IsW/D5nK+5zcxUujTHiis6+M61H
 p4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=QBnoN+mJIyViJRaC52bSEIIRzamZ0YRTp8VHhJaLMeU=;
 b=tIcyk5/KIs+aBv92B+2+SOcr9p06+t5N9tEaksJ+fGVC0RTbFy5ZMoawIwfMu/jKcG
 ZjB8o6vjj2xkhA8I0B8qYQF9PcwZyhENNHLPMHBeg7Mt0zDTaWqTQiY/ks1by0joVVMF
 lOsmTdn1Fr5SomLUQDTWHetbCMMT0NdhCgzvHfboJPqAR0nEuWm5f69Ylf5Ald3XgvyH
 DzkZ+D2EH+JuWGjfOBf1JimhsScdUOtDj0NI2YIjcdSV7M9ExmqCoSxP1J2QsJwLoTFN
 P4pQNxM4V+Pp+rsWeyfFBvCAj9usVMLNF3uZ3C3Xery4dYJugcpz7JF80VfBJe7k1gne
 P35g==
X-Gm-Message-State: AOAM5330RORidp0jGQirZtPBt/6fGXbTWuQoYHsoyWkUr1JTvHGcJmWr
 h++HB404+vOPPdqSHOQjr04jqDGCv4c=
X-Google-Smtp-Source: ABdhPJyB3Sew+49i0RPdIILhcmc2W+7s826P5cp7M0kza4iGAxyPe/9LfY6Q0rNcSdGxbtu6y7hODw==
X-Received: by 2002:a17:906:2bcc:: with SMTP id
 n12mr5772263ejg.430.1623945198172; 
 Thu, 17 Jun 2021 08:53:18 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id p13sm4604061edh.79.2021.06.17.08.53.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 08:53:17 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 10/11] machine: reject -smp dies!=1 for non-PC machines
Date: Thu, 17 Jun 2021 17:53:07 +0200
Message-Id: <20210617155308.928754-11-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617155308.928754-1-pbonzini@redhat.com>
References: <20210617155308.928754-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/core/machine.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 9ad8341a31..ffc076ae84 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -746,6 +746,10 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
     unsigned cores   = config->has_cores ? config->cores : 0;
     unsigned threads = config->has_threads ? config->threads : 0;
 
+    if (config->has_dies && config->dies != 0 && config->dies != 1) {
+        error_setg(errp, "dies not supported by this machine's CPU topology");
+    }
+
     /* compute missing values, prefer sockets over cores over threads */
     if (cpus == 0 || sockets == 0) {
         cores = cores > 0 ? cores : 1;
-- 
2.31.1



