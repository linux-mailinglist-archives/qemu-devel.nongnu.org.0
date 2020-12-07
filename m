Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1C532D0F75
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 12:38:07 +0100 (CET)
Received: from localhost ([::1]:55582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmEq8-0006VS-VQ
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 06:38:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmEcj-0004Dt-0K
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:24:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54702)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kmEcg-0004Xt-0k
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 06:24:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607340245;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=U6QCRjxKvIwhYoV/41s2s2+6dI4wCbnqhxRPlqlth8U=;
 b=EfzQpQ/kqV49/D6sGFTAsOqsOLFZiRI2HKbkO+YuCnpL5UmPxJVmcpQyIpWrAOg2QMSpnF
 1/k90VajmPa2g2TPI5nIS809Km5vRJ5nnV5BwbaaBjyoWGJEq+73dWNZKyL9fWN6Z3RKGw
 dkU9z6fFhaV/DULnOwAUXui7lob1Ubg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-Bx0kCEzZMzm4zjk9x-O-Rw-1; Mon, 07 Dec 2020 06:24:03 -0500
X-MC-Unique: Bx0kCEzZMzm4zjk9x-O-Rw-1
Received: by mail-wr1-f70.google.com with SMTP id u29so312722wru.6
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 03:24:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=U6QCRjxKvIwhYoV/41s2s2+6dI4wCbnqhxRPlqlth8U=;
 b=HqWbcEnljj64zex+I814PuZTTAUMzDX8JiiWNW+fwS3MFbi1+QWQWxXq46Icw6IwRy
 ldaX7tyPTyzKwjkNwfhyUYcQX66dZciNi/ZZ4Gb22x7oqAuGg+jhl/861lGKtkutVQ7Y
 lv+33N0G0rrC0hwrUE26hWMEaTr0k3KpnT06tjrh1XXOKGuRqEWrX6+iH2Vl/cRZxzV3
 nO93h4IkUjWmGj2/E8TDUK3ubii2lCLek2a0QMP3qsj9wPsASApaBxgOmXiTjJ2HoH25
 dXN0nKyGNDqYe6CQvIcyNLraVf/kM4LUp6PYXOas0Cmr7J0w46cPkfBy5y0JjB9rS3W0
 w4oA==
X-Gm-Message-State: AOAM533RIOCTo4ta4/G4o4fM8gq4+grxTzxbzrjJSjek1NM9s/c2MeQb
 tOQqCke29q85SBj7/IT7IrmU9gZdnVrEsXW8YqY+fl94I7hvMQowW3BjnII/flwpJhaHcyaM4YX
 gc+sG3NaLafWbrB2ovAZ2QhUZNMNvJdhJkGxr+Kh8SZ9fwUs29NoBpyJVMUeoiAU0
X-Received: by 2002:a1c:4907:: with SMTP id w7mr10183712wma.175.1607340242542; 
 Mon, 07 Dec 2020 03:24:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyUOPOj91GL2D5bWSF19z1crpAKZX/6htMwNjDW7CLNGlfCM/ktiYiE4SKzGGKVP6p9Vp9lvg==
X-Received: by 2002:a1c:4907:: with SMTP id w7mr10183684wma.175.1607340242361; 
 Mon, 07 Dec 2020 03:24:02 -0800 (PST)
Received: from localhost.localdomain (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id k11sm13362266wmj.42.2020.12.07.03.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 03:24:01 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/5] gitlab-ci: Document 'build-tcg-disabled' is a KVM X86
 job
Date: Mon,  7 Dec 2020 12:23:49 +0100
Message-Id: <20201207112353.3814480-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201207112353.3814480-1-philmd@redhat.com>
References: <20201207112353.3814480-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Thomas Huth <thuth@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 kvm@vger.kernel.org, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Stefano Stabellini <sstabellini@kernel.org>,
 Claudio Fontana <cfontana@suse.de>, Willian Rampazzo <wrampazz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Document what this job cover (build X86 targets with
KVM being the single accelerator available).

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


