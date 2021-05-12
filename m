Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2070937B51A
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 06:44:48 +0200 (CEST)
Received: from localhost ([::1]:58472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lggjn-0000DK-7f
	for lists+qemu-devel@lfdr.de; Wed, 12 May 2021 00:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgghl-000647-D3
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:42:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:39392)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgghj-0005q0-R3
 for qemu-devel@nongnu.org; Wed, 12 May 2021 00:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620794559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NAmU7rsSu4yY05SolpQM+issNDGmpH9ZTRh1JJ5Osss=;
 b=PVxgLzW0oXiaXkY/iZb6X8VU3iPrCubQb12s4+TWuIjCQISi5FuPBvtlm+8sgsExaXsxPb
 BWukRwZ4K0Jn1BgQLKEQwa3Io0ocWF1azUOudYqp8i026ChERsRhrOdxrX8u0/0f501y4F
 XFxhNJFvBPRSnmh1okTzbjLxJDXv65A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-488-v7seU_DpNGOWQ9iTWfIiMQ-1; Wed, 12 May 2021 00:42:37 -0400
X-MC-Unique: v7seU_DpNGOWQ9iTWfIiMQ-1
Received: by mail-wr1-f71.google.com with SMTP id
 c13-20020a5d6ccd0000b029010ec741b84bso953446wrc.23
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 21:42:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NAmU7rsSu4yY05SolpQM+issNDGmpH9ZTRh1JJ5Osss=;
 b=ZGHLgWuPgQRg+PIscmZRKy4yn7RydT/rfpIpFOHQQA2n5+FhlXvYW1IK2j4GLrzfjD
 F/01zuDn8oMEW8URpitD9q1+qewHLsn7/y/VQh67QY+Gljz+TFPR8gXk9ruA9dN+n95W
 csTd51VdXFFeobM9TPqt58mFzyzv29prZ5HpfytFTUgmEM2mgoO5en9gTrHLm5VTs3Gt
 8oM13u/f44AuEHCZFwj9Xi6AgIvgFBG07C94wkgp4uITlvMKCxzYcaRFiRgA8W1PpmYl
 JOaeQc2AEPeg61tPLVs3LEfHUFGnQ/ZyV9Nshaxbx25UAHMf35gAg4T7AZVp7DlaK8lN
 Q/UA==
X-Gm-Message-State: AOAM531yUXruqeHC3pJDAoZCGlUEOzzxPBLeDwEG3gseelih+tDKJbUy
 Y6SiFz+cV+dvUPuELyOYFqeEvbK3sOiqu11kKcpQxg6URAKpE0UST7DFCtqYWYOHWUlAZ2bsZIO
 35Xh+2aKf/6YV6xGj676oO6iDVcb+dYEuCDtRjtrGrlgit7hy0wTW+pOnrs+D4mUQ
X-Received: by 2002:a5d:64c7:: with SMTP id f7mr41639853wri.257.1620794556435; 
 Tue, 11 May 2021 21:42:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxItVLkB47E8TP00Z9d8vG0eC/W7dtUmgfyv6ifehXhtcKq6PFSgEayq4yq1T1VdeYRHHeLmA==
X-Received: by 2002:a5d:64c7:: with SMTP id f7mr41639830wri.257.1620794556242; 
 Tue, 11 May 2021 21:42:36 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id n2sm30067814wmb.32.2021.05.11.21.42.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 21:42:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/1] gitlab-ci: Add KVM x86 cross-build jobs
Date: Wed, 12 May 2021 06:42:28 +0200
Message-Id: <20210512044228.3254073-2-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210512044228.3254073-1-philmd@redhat.com>
References: <20210512044228.3254073-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Willian Rampazzo <willianr@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add a new job to cross-build the x86 target without the
TCG/XEN accelerators (IOW: only KVM accelerator enabled).

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 .gitlab-ci.d/crossbuilds.yml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/.gitlab-ci.d/crossbuilds.yml b/.gitlab-ci.d/crossbuilds.yml
index e44e4b49a25..a8eac2cddba 100644
--- a/.gitlab-ci.d/crossbuilds.yml
+++ b/.gitlab-ci.d/crossbuilds.yml
@@ -198,6 +198,14 @@ cross-win64-system:
   variables:
     IMAGE: fedora-win64-cross
 
+cross-i386-kvm-only:
+  extends: .cross_accel_build_job
+  needs:
+    job: i386-fedora-cross-container
+  variables:
+    IMAGE: fedora-i386-cross
+    ACCEL_CONFIGURE_OPTS: --disable-tcg --disable-xen
+
 cross-amd64-xen-only:
   extends: .cross_accel_build_job
   needs:
-- 
2.26.3


