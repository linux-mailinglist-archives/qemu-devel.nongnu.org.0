Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 650723EB488
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Aug 2021 13:28:07 +0200 (CEST)
Received: from localhost ([::1]:47766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mEVM6-0005Cu-DC
	for lists+qemu-devel@lfdr.de; Fri, 13 Aug 2021 07:28:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52408)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mEVKO-0002ir-Iw
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 07:26:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mEVKL-0004VW-T0
 for qemu-devel@nongnu.org; Fri, 13 Aug 2021 07:26:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628853976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y9ZNqtKL1cC+fTmEJTF4kIlxQkEz59g4jviAlnj0Q4c=;
 b=cbHhPfoj/uA+7qZhfZ2fNQFYvOZMcpA6jCk/7n/EVRzNMNXOT8K8yxGllWfmXoZaWNhtwz
 +q1GLBmjwFlEj+ZttBBfzic3MTiT0PIGvYcIziLFaYFfuGeznI/Sue/zJgaiC7l/8bp8la
 LhKQWqdi0lYf2LCSn9cYUX3GbY3R4ac=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-532-5UbEVKFfPF-edBJWE4Qtvw-1; Fri, 13 Aug 2021 07:26:16 -0400
X-MC-Unique: 5UbEVKFfPF-edBJWE4Qtvw-1
Received: by mail-wm1-f72.google.com with SMTP id
 f19-20020a1c1f13000000b002e6bd83c344so934893wmf.3
 for <qemu-devel@nongnu.org>; Fri, 13 Aug 2021 04:26:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y9ZNqtKL1cC+fTmEJTF4kIlxQkEz59g4jviAlnj0Q4c=;
 b=ObUpgOdQdI3StbD3Yk1/PzERklT8p18TgLSINLBrjPkOCqj6Wh1q5ERLvkc3pGFeUR
 SpKk6XJt0m1DTkixb49dJICkQ/Xb+iQf7UAJlsIeaYWhxPl3t3R1pXukSWqGVavRdCva
 /CdStDD/Rf0aWkNhKOjgLb2yASiNPq/6QJPIUGjiMWvzaU+szqIlH7wTyUdqvKj3OgMR
 F33nblqef8Z1xGtOIH3gJu5QCYBX7jJgRfRItlfXxJjWrS+Z9HXVe8dd1uL7TTlQV03p
 zVMlm66/HnUjsi6pzFcxqBpY5/KAUgAuCGMppgNajj1dyEnrmmC056t7UzTUqf7qQOCc
 OOGg==
X-Gm-Message-State: AOAM531uf8MZbf8ENLiMWTXSRdFv3JzHtLDGivydIYPH01fvLcL1BALW
 jKf+6snTHOhl6jDnliRszIlie/Zc8T6U6l3xBKwtZKZrckjjTi/PCR57GnQ5VRHI/UI98gm11+8
 VahCmRZajOqZfXRGotRJERxvx/2LWAv0fsbcq5P4dzMT/9rErmm3qofMH6Fv3pVfU
X-Received: by 2002:adf:f046:: with SMTP id t6mr2617407wro.266.1628853974494; 
 Fri, 13 Aug 2021 04:26:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxBJKBUqSZxapvwL8yYh83lXE3AhuZKZ0UcL3YCGZIfD/BcHVkoJqjsGtjhpcfLYd9T2qsZYw==
X-Received: by 2002:adf:f046:: with SMTP id t6mr2617378wro.266.1628853974323; 
 Fri, 13 Aug 2021 04:26:14 -0700 (PDT)
Received: from x1w.. (163.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id
 f2sm1286209wrq.69.2021.08.13.04.26.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Aug 2021 04:26:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1? v2 1/3] hw/core: Add missing return on error
Date: Fri, 13 Aug 2021 13:26:06 +0200
Message-Id: <20210813112608.1452541-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210813112608.1452541-1-philmd@redhat.com>
References: <20210813112608.1452541-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If dies is not supported by this machine's CPU topology, don't
keep processing options and return directly.

Fixes: 0aebebb561c ("machine: reject -smp dies!=1 for non-PC machines")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/machine.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/core/machine.c b/hw/core/machine.c
index 943974d411c..abaeda589b7 100644
--- a/hw/core/machine.c
+++ b/hw/core/machine.c
@@ -752,6 +752,7 @@ static void smp_parse(MachineState *ms, SMPConfiguration *config, Error **errp)
 
     if (config->has_dies && config->dies != 0 && config->dies != 1) {
         error_setg(errp, "dies not supported by this machine's CPU topology");
+        return;
     }
 
     /* compute missing values, prefer sockets over cores over threads */
-- 
2.31.1


