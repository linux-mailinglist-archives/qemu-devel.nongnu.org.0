Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE0630CD97
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 22:05:44 +0100 (CET)
Received: from localhost ([::1]:43538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l72rn-0007vu-GY
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 16:05:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72lx-0002pL-MI
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59313)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l72lr-0007Fz-Mp
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 15:59:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612299574;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fKnLbyA8FIbavjZwoLXTNCVP5/2XH47CtTSSPjQnXKc=;
 b=fouTjSU4aM0lpLLEArKWMiyQDrHrOSaBibZASGJ/kS/lIzyr3SVAYyvy+VtIolrcbMPt+f
 1NkHea6PqLGVP2no+qTBl0bptGivXQZTnbdjfrRz+vHkklct178FoZr4OGChDx5xwH+DFx
 7TeoOd5iZNSGnV2zBea8jDGYgTWDIW8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-119-qo3xfsO9Oh6yC5PPBlZbRw-1; Tue, 02 Feb 2021 15:59:32 -0500
X-MC-Unique: qo3xfsO9Oh6yC5PPBlZbRw-1
Received: by mail-ed1-f69.google.com with SMTP id f4so10206463eds.5
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 12:59:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fKnLbyA8FIbavjZwoLXTNCVP5/2XH47CtTSSPjQnXKc=;
 b=I6HQl8JxA9ytpWilcKfXIcM8TSq2Eu9Wgb1Z76RyovLWw951s9bfPmkNheZ1PutTXw
 7wBEcGWJeO3xk4Qq5biFgPxOD5e1DTl9yazs/gouZ8IRi1TtlH1rfN/gyxGVkcvsrlf4
 zQ1SaTTo0YeNfcdvy0/6/BPFnS3SrvRmEySVnzEBxFl5G+VTIbvq7Wen003xEU6DffWQ
 yb/vmgZbDRrBqmXZq689P9UaJN1FuiM677qEO6WwQI1+Vx22oPvuX1D3i6erVhySp2jl
 g0GyhT7MankLHf4wVy03h/K1K9NPLrBV9iXE9m7qeEsOB8hqYBGcQWO3kEZm4KNYax2V
 70Lg==
X-Gm-Message-State: AOAM530n0bDEuVHejgAfy17ybOINcaOE+UvOH1W8cEvxSF9fEszUyS1+
 jdaBM0rC9urrl/4G08FiIb7gr4RYPbD432Ki21syUVCDgAFJko5xI6gLDRF9MxqnnvMt7beVFjh
 RNWuQwr4xviCcG4vqYHb7f/E1fFNOytC4Wl0DVZzpKbLsixVtDe24Iqe4i9WTU9jr
X-Received: by 2002:a17:907:2d9e:: with SMTP id
 gt30mr3077706ejc.357.1612299571412; 
 Tue, 02 Feb 2021 12:59:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx5Aa9y4KjL1M4o9+I//59lOtc0x7xo8x877LQnM1OUm8TzwGhTYWYyWa9rW6YBtO4yv9EcfA==
X-Received: by 2002:a17:907:2d9e:: with SMTP id
 gt30mr3077684ejc.357.1612299571200; 
 Tue, 02 Feb 2021 12:59:31 -0800 (PST)
Received: from x1w.redhat.com (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id du6sm2345ejc.78.2021.02.02.12.59.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Feb 2021 12:59:30 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 09/12] qemu-options: Replace the word 'blacklist'
Date: Tue,  2 Feb 2021 21:58:21 +0100
Message-Id: <20210202205824.1085853-10-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210202205824.1085853-1-philmd@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Follow the inclusive terminology from the "Conscious Language in your
Open Source Projects" guidelines [*] and replace the word "blacklist"
appropriately.

[*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qemu-options.hx | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/qemu-options.hx b/qemu-options.hx
index d0410f05125..75997ee2ea6 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -4275,11 +4275,11 @@ DEF("sandbox", HAS_ARG, QEMU_OPTION_sandbox, \
     "                    by the kernel, but typically no longer used by modern\n" \
     "                    C library implementations.\n" \
     "                use 'elevateprivileges' to allow or deny QEMU process to elevate\n" \
-    "                    its privileges by blacklisting all set*uid|gid system calls.\n" \
+    "                    its privileges by denylisting all set*uid|gid system calls.\n" \
     "                    The value 'children' will deny set*uid|gid system calls for\n" \
     "                    main QEMU process but will allow forks and execves to run unprivileged\n" \
     "                use 'spawn' to avoid QEMU to spawn new threads or processes by\n" \
-    "                     blacklisting *fork and execve\n" \
+    "                     denylisting *fork and execve\n" \
     "                use 'resourcecontrol' to disable process affinity and schedular priority\n",
     QEMU_ARCH_ALL)
 SRST
-- 
2.26.2


