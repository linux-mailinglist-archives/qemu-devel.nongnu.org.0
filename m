Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD50344444F
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 16:09:49 +0100 (CET)
Received: from localhost ([::1]:52668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHtc-0002G7-T3
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 11:09:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1miHoL-0002ac-Hz
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29402)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1miHoJ-0008SV-Ey
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 11:04:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635951858;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=tw4K5/JQXTIkuGO+rNjxwYM6ad0YsYOlkdlxu1hB2ro=;
 b=ivIrIoJi2mplPZ9sqWNsUr3kYIacj3p+TQG5ptBNVm+e+SYytT3jErQQJe90kLsdeVRK9K
 cY2x4/kZ4AYfOGZRNUPbxEkbhEmwyInE1uhE6TfTyMzIFoAir1w4Dbk7KpMH8qoGeAG6aL
 A09FqXd8fGKXIlR1YFxl9G2axDXEkmY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-BJZJpAtQPYOtFs6DjbTMMg-1; Wed, 03 Nov 2021 11:04:11 -0400
X-MC-Unique: BJZJpAtQPYOtFs6DjbTMMg-1
Received: by mail-wr1-f70.google.com with SMTP id
 v13-20020adfe28d000000b00186c47ee9e3so492425wri.3
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 08:04:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tw4K5/JQXTIkuGO+rNjxwYM6ad0YsYOlkdlxu1hB2ro=;
 b=0XPC8oEQZX9zCF4LDu3YcBc+3V7dTDdzT2qMm7DEmlbPXQd3oS9282JO/gYFbqi1Zu
 x8SVcABiFrmbYNG2sDhlMwL4mv6MU16oHiuKiUHzom2BiHJ+kawRt6LFT5kWE2c9+7zX
 dws5jtXVJcjl2VO7VrDHvf9Hn3vF33LBkF1UG8y4SERFFt4ktbk+ZdugAXJgywGfhgtT
 FSFOqNiA4GSaMIbZtdedVlnOMoqmH/nRvMjsKDPxCK84yR6TL5UMrdfqe5r7z5PBxhAg
 QXF/hLN8opXrLqmD/Ywop+7QKSafS3KqeI+sXmjMY1u/VJfB4e1VkHqhVBQeoVADjiqx
 wXpA==
X-Gm-Message-State: AOAM531SuN+sADDhBM3uT2QFIwGRcIfnGeBbFLaV1ssfvLNmsmeHwniT
 bGF4OBQwFmcJ9n56M1p2t7ZL1RiKXlT9ddd3W5bFKG5BVJrnHxJhnNpp2lcWbEqNgV5LNpH1ZQ3
 xmtYs7c2z1/+Ue6J8dmzp9JlEDIy17UmRjxpD3Vbz+aXhHeuR7sf6I2chrCjcviaY
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr40111592wrw.116.1635951849884; 
 Wed, 03 Nov 2021 08:04:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY3avv0jl0uLEC2awxb+wjt0mkK7rcfCJ0OnRqau9HlDKc1udhFerf7FEttG8hqkc2L60ebQ==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr40111546wrw.116.1635951849595; 
 Wed, 03 Nov 2021 08:04:09 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 c79sm2283584wme.43.2021.11.03.08.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Nov 2021 08:04:09 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] scripts/coverity-scan: Use Fedora project Docker container
 registry
Date: Wed,  3 Nov 2021 16:04:07 +0100
Message-Id: <20211103150407.3459877-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 John Snow <jsnow@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Similarly to commit 102cd5c294d ("tests/docker: use project
specific container registries"), use the Fedora registry to
reduce pull rate limits enforced by Docker Hub.

Inspired-by: John Snow <jsnow@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 scripts/coverity-scan/coverity-scan.docker | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/coverity-scan/coverity-scan.docker b/scripts/coverity-scan/coverity-scan.docker
index ecff6ac5b4b..529c0a28566 100644
--- a/scripts/coverity-scan/coverity-scan.docker
+++ b/scripts/coverity-scan/coverity-scan.docker
@@ -15,7 +15,7 @@
 # The work of actually doing the build is handled by the
 # run-coverity-scan script.
 
-FROM fedora:30
+FROM registry.fedoraproject.org/fedora:30
 ENV PACKAGES \
     alsa-lib-devel \
     bc \
-- 
2.31.1


