Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25E7D2D11D7
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 14:25:42 +0100 (CET)
Received: from localhost ([::1]:36226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmGWK-0000oY-NU
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 08:25:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmGMY-00049Q-Ub
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:15:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmGMJ-00014d-Cr
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 08:15:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607346915;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DUD443fjC7TlYCq2Zs7qkYPHzlFo7vsq2RAf28zHG0Y=;
 b=b49Y+4DyR6uXgzYr3drfs9eM2NaovpAiJryrok+zE1zpgP+0GZJlY/9Apr+vIgcT8Xveo7
 jbAkDr/2jZGDMDIb95XFKAd+21AM+VaEWpYUvgc8DOa8nclMXIV3lg9Dzf2dkKPa5In1yf
 QnNEFAFVp14994KiswEMc6UsNe7OdU0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-g-aJ3bDaMIizP2lEUAkDwA-1; Mon, 07 Dec 2020 08:15:14 -0500
X-MC-Unique: g-aJ3bDaMIizP2lEUAkDwA-1
Received: by mail-wm1-f71.google.com with SMTP id a134so4122047wmd.8
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 05:15:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DUD443fjC7TlYCq2Zs7qkYPHzlFo7vsq2RAf28zHG0Y=;
 b=qVsQMkQ9qbT57QvOJuHzAioaLUTn0PjxQ4ywdHg59xOw5iWRWqdqsJVsZVnlt74zIc
 xrciztdqO4s2K9p+i3CWy+fhmT2Ty15YxHBAtksulMQg7dYb4qVu0yx2zd1+ymUzFInW
 Pyh9qd0J4WkQ2SWEU/xAMtZx0laePy7K7+lboezTK1RhhPi2BwRDaUyvJD341nLqBJJm
 8GFGbuMGKKnNTaWLM02ocP9qikbzk/tTtzF7SHydBxgtk4wz8PT1WpDQr3lzLLkimKcG
 Weo/b7QWWRCTsE+3qUz1Yl8Wh89BXvoEwhIbPV9bpxeZhx/W/OkWu+9aKSqyv0uIAQUB
 TXeQ==
X-Gm-Message-State: AOAM531HQ6BMy36b959CgzWIdWmBn/hahp6xaDzvwOUrvd75w8DyYXjl
 +jbIUC8DuVNehl8uNGnKEfydKhT5GR7LQIeMc9Q1tHrD1oKFSVIPVBD7J/vFUKCNqT0I4rYXUSj
 w5TibFTO4zlrqpSKkRt/T6k45G0GOZGytsQf1b73QEBG5m0LMbOvGJ+oUBsBhHEK1
X-Received: by 2002:a1c:c2d4:: with SMTP id s203mr18470531wmf.58.1607346912838; 
 Mon, 07 Dec 2020 05:15:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0KSXp7DP6CDis0L6tP1I2Gzz9cpg1u4ccuV+5/oiKxMdma/cepl4uO8AaAxQi4CtlwH61VQ==
X-Received: by 2002:a1c:c2d4:: with SMTP id s203mr18470485wmf.58.1607346912558; 
 Mon, 07 Dec 2020 05:15:12 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id k18sm2265572wrd.45.2020.12.07.05.15.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 05:15:11 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 1/5] gitlab-ci: Document 'build-tcg-disabled' is a KVM X86
 job
Date: Mon,  7 Dec 2020 14:14:59 +0100
Message-Id: <20201207131503.3858889-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207131503.3858889-1-philmd@redhat.com>
References: <20201207131503.3858889-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>, Stefano Stabellini <sstabellini@kernel.org>,
 xen-devel@lists.xenproject.org, kvm@vger.kernel.org,
 Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Marcelo Tosatti <mtosatti@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Willian Rampazzo <wrampazz@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>, Anthony Perard <anthony.perard@citrix.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document what this job cover (build X86 targets with
KVM being the single accelerator available).

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d0173e82b16..ee31b1020fe 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -220,6 +220,11 @@ build-disabled:
       s390x-softmmu i386-linux-user
     MAKE_CHECK_ARGS: check-qtest SPEED=slow
 
+# This jobs explicitly disable TCG (--disable-tcg), KVM is detected by
+# the configure script. The container doesn't contain Xen headers so
+# Xen accelerator is not detected / selected. As result it build the
+# i386-softmmu and x86_64-softmmu with KVM being the single accelerator
+# available.
 build-tcg-disabled:
   <<: *native_build_job_definition
   variables:
-- 
2.26.2


