Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B96803B45A4
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 16:33:22 +0200 (CEST)
Received: from localhost ([::1]:35570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwmtV-0003zS-O1
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 10:33:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfU-0003uO-K4
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:52 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:44955)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1lwmfT-0003LX-26
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 10:18:52 -0400
Received: by mail-ej1-x62b.google.com with SMTP id n2so4245156eju.11
 for <qemu-devel@nongnu.org>; Fri, 25 Jun 2021 07:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/R3TDq643NWhjtYvkYyERAd4NBN6y6ftEYduc2A59LQ=;
 b=T7ExMpV26pJwva/vkFo3EhSq7MjwrtFZoVJms8NCP5HDx3A2tgHsNRLPq4B/yj0g0p
 djzdGsHfuXNCcrvH4wR4mmwjZZ9iF3vHbtHz+bG+AB1ZGYd1a2qP9yhpvbmlsWBHdbJf
 0xRz7e1bQf/tlVkPC2r95MG/IqCquABStUIjiKQgV8be5xfY3CSSLbofNKhq8RH9Kov6
 5qzyitUr6qpCmrMuOIMyn5nCU1/lND2bojli9ZCvdXUoUtJ1oN1urZJACLkL4wTZLKqB
 6tTQuU1quqKAPeSXR+9nijos0VyvyXz1tQSIuZ1WJ9r8c/3bULCMbdEBHm+wNt4tQc4N
 z43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=/R3TDq643NWhjtYvkYyERAd4NBN6y6ftEYduc2A59LQ=;
 b=WKm3ie/C7nDaQdDf9dSyPV0rbomMW1bE/INSYZ7dtT4H4toz3rx1ymPpj6DUZ10FP8
 O0yGwEriFf0gXnS7+XE+Bn+7UoedHlNR19+ZVHbKACDay8bGwc9G0r+feI8BqStrxmCC
 bY0vuYHvM49mrHy/mvPhUsqpgbsBJoL+blenkJ2dDNWMTO+VpbQC/CaJxO/80cSOP54h
 jmsTOxg4JCJcMC77CmbrLr5DEgDbRCwbbfUdpErNeNB+dzj5kjgA/h3yp679Pr9cJcxY
 MF8GlQKCrN19CjDO+fD6UidujzaOvf5rPSnuZlFacpD0VksSEld+ZQfB8ts/oJ3xF7JG
 exdw==
X-Gm-Message-State: AOAM531zAu1NFTyF+LdBZSU9Opyg9TSWC3wt3spXRVTbdh30CcR0ubdH
 j770+Em9dzVW1ncutlZWWJG7tzdJmf4=
X-Google-Smtp-Source: ABdhPJzYyWk7d9a0o9HUYp/ml1ZbtldPQDT4bmGWvEkV1Vjf+Lax1jvIbsTKjowhuQB9jnQkPk49+Q==
X-Received: by 2002:a17:906:1f11:: with SMTP id
 w17mr11098136ejj.33.1624630729714; 
 Fri, 25 Jun 2021 07:18:49 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id c28sm326579ejc.102.2021.06.25.07.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 07:18:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 28/28] machine: reject -smp dies!=1 for non-PC machines
Date: Fri, 25 Jun 2021 16:18:22 +0200
Message-Id: <20210625141822.1368639-29-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625141822.1368639-1-pbonzini@redhat.com>
References: <20210625141822.1368639-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210617155308.928754-11-pbonzini@redhat.com>
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


