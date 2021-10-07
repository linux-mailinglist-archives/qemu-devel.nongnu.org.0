Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E30424257B8
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:19:41 +0200 (CEST)
Received: from localhost ([::1]:38680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYW7R-0005wL-03
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:19:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46980)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5V-0003Hk-LP
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49738)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5U-0004hB-58
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623459;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uq3GCe1ePuf4e4h9nXgJWeyky4oXCfK2GmOEpWIO22Y=;
 b=aS0Yf7/9ZNlbn9WnrCasxFQyUI6CU/K/HHP5d4hgCzkuLuUOI6v6eQ9DjEhRmXlaLyuQUB
 7DITJkVqREc9F/1JfMjuKzcwrz/oUWvlyeo8wFHH6TxUmHuG6NLaXozS8tWojqS3dNjP1J
 BfgK96DV/dqaL2sg/wYoVi/n+Qzd/7U=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-300-ipvgLNRFNpCHuDkWc00hBQ-1; Thu, 07 Oct 2021 12:17:38 -0400
X-MC-Unique: ipvgLNRFNpCHuDkWc00hBQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 r16-20020adfb1d0000000b00160bf8972ceso5115866wra.13
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uq3GCe1ePuf4e4h9nXgJWeyky4oXCfK2GmOEpWIO22Y=;
 b=uBRafT7pkLUczFs+Oz0azt+CSZ0XTInLFFErCJSU0p0gGVr5odnPORFXtf7UaEpsED
 FNGl8rjJXBYhuIhsL/5DyIKZh4Njqvo3XmQwDsGq0M7z7VLjS+f3/P0D/agJp2fuLrkF
 wgHpNln957PJjQ3je7lESOVRdOtpkP4SHodZLnY4HdT3YFgyhkTH6qyx2+1Nfi5d0jbp
 LLkHEsrOAQi7mi4cMZm3kILpGhv74vRGHNLN3ryP3Bt+2eDc/e4KcbrFacVEGsgp31fO
 xI0PcwqKQgaQE3hqnKQsURa6bijpN1sx4XRY1T4g3rouL1g77ZxEzQNYp9WxgWumLnDb
 WoKQ==
X-Gm-Message-State: AOAM533Xqzm3/1WL0oILrL0rbJOo6YfpPlxjTvW9w09xGVB+yAJ++Xoh
 j49JzdP3a57UGj3brKEnO2oWLjrJmNoX+4NMiQMmevVy4SXv76K8DYHlW9Nk1bbFV/OLhx1lpyO
 NAlV0Pd2ia1f8SuW6J7DTHpikO+keffiNaRbjjK5pQuybJ8IUlU5fwxwLnMoLwBq0
X-Received: by 2002:a05:600c:3585:: with SMTP id
 p5mr17715023wmq.110.1633623457100; 
 Thu, 07 Oct 2021 09:17:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyRrHz4LpvS4F9A81Irylf6VyS/KU+7ApS5LGF0wX1DCUn4RZ7VNHky7fCfqHI5KKojHx92LA==
X-Received: by 2002:a05:600c:3585:: with SMTP id
 p5mr17714991wmq.110.1633623456879; 
 Thu, 07 Oct 2021 09:17:36 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id 189sm10244544wmz.27.2021.10.07.09.17.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:17:36 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 04/23] target/i386/kvm: Restrict SEV stubs to x86
 architecture
Date: Thu,  7 Oct 2021 18:16:57 +0200
Message-Id: <20211007161716.453984-5-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211007161716.453984-1-philmd@redhat.com>
References: <20211007161716.453984-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

SEV is x86-specific, no need to add its stub to other
architectures. Move the stub file to target/i386/kvm/.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 {accel => target/i386}/kvm/sev-stub.c | 0
 accel/kvm/meson.build                 | 1 -
 target/i386/kvm/meson.build           | 2 ++
 3 files changed, 2 insertions(+), 1 deletion(-)
 rename {accel => target/i386}/kvm/sev-stub.c (100%)

diff --git a/accel/kvm/sev-stub.c b/target/i386/kvm/sev-stub.c
similarity index 100%
rename from accel/kvm/sev-stub.c
rename to target/i386/kvm/sev-stub.c
diff --git a/accel/kvm/meson.build b/accel/kvm/meson.build
index 8d219bea507..397a1fe1fd1 100644
--- a/accel/kvm/meson.build
+++ b/accel/kvm/meson.build
@@ -3,6 +3,5 @@
   'kvm-all.c',
   'kvm-accel-ops.c',
 ))
-kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
 
 specific_ss.add_all(when: 'CONFIG_KVM', if_true: kvm_ss)
diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
index b1c76957c76..736df8b72e3 100644
--- a/target/i386/kvm/meson.build
+++ b/target/i386/kvm/meson.build
@@ -7,6 +7,8 @@
   'kvm-cpu.c',
 ))
 
+i386_softmmu_kvm_ss.add(when: 'CONFIG_SEV', if_false: files('sev-stub.c'))
+
 i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
 
 i386_softmmu_ss.add_all(when: 'CONFIG_KVM', if_true: i386_softmmu_kvm_ss)
-- 
2.31.1


