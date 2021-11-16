Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 441BF453A58
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Nov 2021 20:43:22 +0100 (CET)
Received: from localhost ([::1]:43000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mn4MT-0006Xq-EC
	for lists+qemu-devel@lfdr.de; Tue, 16 Nov 2021 14:43:21 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn4JJ-0003Am-W7
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 14:40:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mn4JH-00052I-96
 for qemu-devel@nongnu.org; Tue, 16 Nov 2021 14:40:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637091599;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=vUm/TldBGul3tXTFoBTYvPf/CBw3dYy/5GqR7NLE5aM=;
 b=N4N2g2iIyXof+U9nBqg3SXdYqTFdls0Fky8GrC4XJRq298hJIFe7FSW7qYf8A+YGhlkkDF
 Wdi9LH5AYI4AGzLz7JLYNxIKyuRAP0eyS1O7QztVPSLIKSv/mPkrP8PLpZsTqHQYXKOuCA
 pMxLBkr1goTortUOsbTR6kuUc7pe4g0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-g-AtNV6GOQO3jKXpGGyC7w-1; Tue, 16 Nov 2021 14:39:58 -0500
X-MC-Unique: g-AtNV6GOQO3jKXpGGyC7w-1
Received: by mail-wr1-f70.google.com with SMTP id
 b1-20020a5d6341000000b001901ddd352eso3975157wrw.7
 for <qemu-devel@nongnu.org>; Tue, 16 Nov 2021 11:39:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vUm/TldBGul3tXTFoBTYvPf/CBw3dYy/5GqR7NLE5aM=;
 b=phh/2tb+0FoMAJfSODJ6if7F5FTOIcJzbLsl75Zv3TiPh62w6lXOwuIUwuEyV7QwYz
 /GtBu7X+Eia+IXVFdGy6G439oN/QtFHCrgAjHYC1ad9GELPThbJcQpxa2BarNTmdG2PR
 F9L9d0JQYoW25LHN3vx5NJAL0puI3rEJ3MaV+ZzMmV7O3XFyzukOipMHXG5ulr5CIIEk
 1AZa4Wb2vuOn2rAQVx8eyBeil8JXkx/wgZO2VU1WhZe6x4KVOI81NN1gRrplPZvuFBWM
 7yBWcKqf+S4pXvhU1+SiGfOCMGoSNovOfQ5hrlVlvCs9Y2l+L3wJQKfAGOqeYJuMuug0
 hDUw==
X-Gm-Message-State: AOAM532sulBfKy/NNWyY3ALkszSxbTRwhyvoGQkqwyCsONK1NUda2ofY
 48YNXG4lK9ovHNJBzoGr39VpmkVPUBoCFmscvTXBYN4pBf3TF3GVo0epH1BLww64EGJlJKltiUN
 r6ybU6ik4cCErzw3aLvzpo3ymaNlLSlHzTtJ40EKKeIi8DitF197Pb36qavXrJ8WR
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr12099869wrs.270.1637091596939; 
 Tue, 16 Nov 2021 11:39:56 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyjY6Ggy48Sz4Z7KSFG/UEcnlEmgFThlxSG+OeC1hX1jIxFW4ooC+TV0bBUU9e86E9prClV6w==
X-Received: by 2002:a5d:6d88:: with SMTP id l8mr12099825wrs.270.1637091596610; 
 Tue, 16 Nov 2021 11:39:56 -0800 (PST)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 j19sm18354634wra.5.2021.11.16.11.39.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Nov 2021 11:39:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-7.0] target/i386/kvm: Replace use of __u32 type
Date: Tue, 16 Nov 2021 20:39:55 +0100
Message-Id: <20211116193955.2793171-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.697,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU coding style mandates to not use Linux kernel internal
types for scalars types. Replace __u32 by uint32_t.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/kvm/kvm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/i386/kvm/kvm.c b/target/i386/kvm/kvm.c
index 5a698bde19a..13f8e30c2a5 100644
--- a/target/i386/kvm/kvm.c
+++ b/target/i386/kvm/kvm.c
@@ -1406,7 +1406,7 @@ static int hyperv_fill_cpuids(CPUState *cs,
     c->edx = cpu->hyperv_limits[2];
 
     if (hyperv_feat_enabled(cpu, HYPERV_FEAT_EVMCS)) {
-        __u32 function;
+        uint32_t function;
 
         /* Create zeroed 0x40000006..0x40000009 leaves */
         for (function = HV_CPUID_IMPLEMENT_LIMITS + 1;
-- 
2.31.1


