Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2314257CD
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 18:22:20 +0200 (CEST)
Received: from localhost ([::1]:46154 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYW9z-0002ai-VO
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 12:22:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5S-00038O-1S
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYW5Q-0004cT-Cb
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 12:17:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633623455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y8MKkMv6eEYqC4N/epBYvYnHUWa4qpxEvyDLGqIxORI=;
 b=IFF3vcia44C88nr0U/W2xUB442PcmYNXJnuZZSuEa4m52MQK/scGiz5bw6DYG3y4IEsLp3
 ON04kKfh0mmbaKcjNpbnngG1pG5Le/i/QqSry6M12cJ7ma9d5pczknE8+su8BLhSDoLU6f
 kxMEtOrF+z3GXBsqHmmmgEEvEv2AoRM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-vc7WhhnQNpyPZbIaa6UY-g-1; Thu, 07 Oct 2021 12:17:34 -0400
X-MC-Unique: vc7WhhnQNpyPZbIaa6UY-g-1
Received: by mail-wr1-f71.google.com with SMTP id
 e12-20020a056000178c00b001606927de88so5113212wrg.10
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 09:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y8MKkMv6eEYqC4N/epBYvYnHUWa4qpxEvyDLGqIxORI=;
 b=3bpxtE/oGLIGVNQw5Y99rm1ZGD6nESkiuSkMW9IAoraYgGuYZPLu2yZ/IrrcWQhOM5
 UCgVGDaqu8eGirItHxzItmr8imgvV9KYz9EkOTglzgngkdmbjuZE+kXlzsI5+MFM2RTY
 9py5WDVCBIh64kot7c0TmVvt37mjZpGAJeA32BXR4ZAQJ1iK+9rEAuhyWWlr6CpVz6iv
 GP9+AOmOoouINuH8SPJDqExesOqmNUA+AzUJQ5fhd1MQNWqfaf/dlIAVxK0NPKFQ3HaO
 toP1P792PausE/bpD0I/L+Nf3q3t+mHGexV+849JMGJSHrz5ATiUo3p2rw32Pz0al72q
 AAfQ==
X-Gm-Message-State: AOAM530s82O7x9bYmbZ+2lGk96HmzQkKvny99AiYM9BKL8Qt1yjN7Esz
 jLdcKvMzrB2gdKsnOMzAayG4IF+qIDIi5EWnaFn0pLKz4jRU+IQ8RavhtK4ImXhY13UBVnozUcR
 rjildm8bprjX6vK8DimaQ6cjQt0Ui6H0zI76dqdXuGxw+KdH8ObP9ZuQtZVAmnUl5
X-Received: by 2002:a1c:7d56:: with SMTP id y83mr17824184wmc.86.1633623452366; 
 Thu, 07 Oct 2021 09:17:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwF+d5yHeqVCso2c8JoGm6EX0nJrH1IGYECCnAhCYPfhEDrS5UZoqX1jwZPwYaiW6EnnPePGQ==
X-Received: by 2002:a1c:7d56:: with SMTP id y83mr17824160wmc.86.1633623452185; 
 Thu, 07 Oct 2021 09:17:32 -0700 (PDT)
Received: from x1w.redhat.com (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y23sm1024155wmj.42.2021.10.07.09.17.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 09:17:31 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/23] target/i386/kvm: Introduce i386_softmmu_kvm Meson
 source set
Date: Thu,  7 Oct 2021 18:16:56 +0200
Message-Id: <20211007161716.453984-4-philmd@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introduce the i386_softmmu_kvm Meson source set to be able to
add features dependent on CONFIG_KVM.

Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 target/i386/kvm/meson.build | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/target/i386/kvm/meson.build b/target/i386/kvm/meson.build
index 0a533411cab..b1c76957c76 100644
--- a/target/i386/kvm/meson.build
+++ b/target/i386/kvm/meson.build
@@ -1,8 +1,12 @@
 i386_ss.add(when: 'CONFIG_KVM', if_false: files('kvm-stub.c'))
 
-i386_softmmu_ss.add(when: 'CONFIG_KVM', if_true: files(
+i386_softmmu_kvm_ss = ss.source_set()
+
+i386_softmmu_kvm_ss.add(files(
   'kvm.c',
   'kvm-cpu.c',
 ))
 
 i386_softmmu_ss.add(when: 'CONFIG_HYPERV', if_true: files('hyperv.c'), if_false: files('hyperv-stub.c'))
+
+i386_softmmu_ss.add_all(when: 'CONFIG_KVM', if_true: i386_softmmu_kvm_ss)
-- 
2.31.1


