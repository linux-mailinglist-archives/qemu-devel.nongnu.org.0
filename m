Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E1A76BAF39
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 12:29:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcPIu-00049J-E8; Wed, 15 Mar 2023 07:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcPIs-00048o-9e
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:28:22 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pcPIq-0000Mm-Qj
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 07:28:22 -0400
Received: by mail-wm1-x333.google.com with SMTP id x22so6851211wmj.3
 for <qemu-devel@nongnu.org>; Wed, 15 Mar 2023 04:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678879699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8XaO46O+XQUbG+N4rkWdsjN5zkz70OOKz1YQ5MqrEQ0=;
 b=f0/szIt/kZp0v35eQV5PknYjD4DKHtpBMYFaV0HyIeXQr8v7m1lI8zdjSqXTFZ0zlx
 puEHtMwZRWSr1dt5+fTVdWf8xHQsro9HFaV28viDE2B+wnpPePwhKSiLt0Ioww3KKzpu
 B2T+tI7crHPBcMxmsHOy0YxxuMy3Y9ErNAWebopsHyQtGrzOw0P+ObSPWK1D6TXJDs/d
 9Udlz/Bm1Ed1sIx5QTYpl6G5T5Bq9lt82/BVwF8yNdBhqF+656IEfm2qOvBEGkale9WE
 jFaKQP8EJ2vfHzgj8OgAAz3E5xm+5ygblfTr13hW8zciReH2yiceDus6ROZIhO27MDhP
 DpNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678879699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8XaO46O+XQUbG+N4rkWdsjN5zkz70OOKz1YQ5MqrEQ0=;
 b=w/mUM6jdGy5v3J68oyEOvrM4JQFaiL8BTRJ8jTzSBHnlo3c9fHqlqra8D4p5+lNJlL
 2RBzLhtNXFS8jRQQnksUs22tA2gosjkRZTuOB5jPZn+I7WizsXBGUMDzm/p0hroK8ZCi
 gF0OIJx5r2V2GAEC86RdzB2EzlEkah59NfZwxLwQKueEtNFhA3cArvWf+FlGHEOFxiw4
 opAHFuB4gI1yGKauH6cFmsDscZbWUo3uWlVyRqgI6+nXTzryAF3OW/jNEc5G95wmcahv
 jt/3enGXyzM1gOWjRyZQwCJlMW0APa0/KlJXvlQWqHsOX6+//1OU4AiTDzcQf28DD7rn
 BEwA==
X-Gm-Message-State: AO0yUKUA8KhGjUxB1Lmx4ymqCwqTkEjRmSFQU95SF+PBdYif/NL9A/jC
 dvHyKw4QqrbaMa3M7G++U0QpeKxqdTeU2Kr4kSAeIA==
X-Google-Smtp-Source: AK7set9MLHPRmKq927ev6ZvAxROF2Yt1tTZJZWftWugH7uqW9rIntqcla8o+I4azZKohRyFLtJqG0A==
X-Received: by 2002:a05:600c:3b07:b0:3ed:301d:9f86 with SMTP id
 m7-20020a05600c3b0700b003ed301d9f86mr3236709wms.9.1678879699126; 
 Wed, 15 Mar 2023 04:28:19 -0700 (PDT)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c1c0800b003ebf73acf9asm6269567wms.3.2023.03.15.04.28.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 15 Mar 2023 04:28:18 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>,
 Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 1/3] scripts/git.orderfile: Display QAPI script changes
 before schema ones
Date: Wed, 15 Mar 2023 12:28:09 +0100
Message-Id: <20230315112811.22355-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230315112811.22355-1-philmd@linaro.org>
References: <20230315112811.22355-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When modifying QAPI scripts and modifying C files along,
it makes sense to display QAPI changes first.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 scripts/git.orderfile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/git.orderfile b/scripts/git.orderfile
index 8edac0380b..70adc1a74a 100644
--- a/scripts/git.orderfile
+++ b/scripts/git.orderfile
@@ -22,6 +22,8 @@ Makefile*
 *.mak
 meson.build
 
+# qapi scripts
+scripts/qapi*
 # qapi schema
 qapi/*.json
 qga/*.json
-- 
2.38.1


