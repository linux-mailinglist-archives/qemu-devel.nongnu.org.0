Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBDC6B3C5C
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 11:35:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paa28-0007VM-60; Fri, 10 Mar 2023 05:31:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa25-0007Tq-A9
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:29 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1paa22-0004Fc-RU
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 05:31:28 -0500
Received: by mail-wr1-x435.google.com with SMTP id h11so4577036wrm.5
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 02:31:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678444285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=y4cpR7vA6XSXxWS6bHag8gq4h8YFalbW/SrKcN6qWB8=;
 b=yJD+YSTuz7vpoXXmot7VlxR2O2T+u4PWtvW3AkDHAg3WffohrFj9zA53L6QHpcSPGS
 SbZ6OaMR+KMNEL/cwYD21Lp+5vg3xqX2Tu/l+OCbHpjT5vxQrsuF8z3bxhj6VU2RcJ1L
 H8mALYMfxKHkn3jXbp6T9RSB6m6UDB34oj6Wed31yRunnvPSMrbAyjanM16k2ev2tQ0H
 pi/R31Y59NjphHKeppWnYW4bwoEsx4wdq4M3Qfok8rxxpAEwv97XawcYk0WCNN+tx3vX
 Qut2VQggnmVe5XS8YZxxvtr6Gofk83ct1B8NFrVD/+G1Jt1dzrkgwU2UHw9ZhbUz8A6X
 MYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678444285;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4cpR7vA6XSXxWS6bHag8gq4h8YFalbW/SrKcN6qWB8=;
 b=n6vl72kX8f4l8LyQpPXuyYeuBngkB3ux32/vrHhg4JEDYP7fFwP4iDgS6DU9A6nKVP
 XFKqCzzL/lvqy0a8gv8ageZyQlj5m2HIiHpIwPqvSDqBo8nUfhqJgRgW/BMWTSt3yOX3
 GI8XoifAGBAofTQv6Nf5tqfCR5I3Px2ugIJQj/ZT345nVY9Ebv3iT5owMVnlUXusIP+l
 s6CEuH4WNEsDyeuB3nHv21mGntgdcoLkGbtnCFbcTIZTSMimU2BSqe2m3Osa9ezs0+pn
 poWiaLWVzeYH/NgTl386RbGZL3CbclLG2O6F7J9FPQrjl8QUV8G5eBsOrOZir/cXg2EA
 crcA==
X-Gm-Message-State: AO0yUKWFI2V/eFbBCQOgGJTPbZ+rrfSQcEcZvnEX6RFzFWnsNJ2TRugM
 QfPBWPj7nndfIKETgvaBptcGqg==
X-Google-Smtp-Source: AK7set9ayF5vM3mvRdTydN3/SKLZaR+ng7texETRhuRMM1m1q/O8hAE8EDHCmTo5HVoMXkjNgI083A==
X-Received: by 2002:a5d:4c52:0:b0:2c9:5675:7def with SMTP id
 n18-20020a5d4c52000000b002c956757defmr16189578wrt.2.1678444285375; 
 Fri, 10 Mar 2023 02:31:25 -0800 (PST)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a5d4bca000000b002c705058773sm1764094wrt.74.2023.03.10.02.31.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Mar 2023 02:31:24 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id CC8F91FFBB;
 Fri, 10 Mar 2023 10:31:23 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Cleber Rosa <crosa@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>
Subject: [PATCH 03/11] scripts/ci: add libslirp-devel to build-environment
Date: Fri, 10 Mar 2023 10:31:15 +0000
Message-Id: <20230310103123.2118519-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230310103123.2118519-1-alex.bennee@linaro.org>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x435.google.com
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

Without libslip enabled we won't have user networking which means the
KVM tests won't run.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/ci/org.centos/stream/8/build-environment.yml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/scripts/ci/org.centos/stream/8/build-environment.yml b/scripts/ci/org.centos/stream/8/build-environment.yml
index 0d094d70c3..1ead77e2cb 100644
--- a/scripts/ci/org.centos/stream/8/build-environment.yml
+++ b/scripts/ci/org.centos/stream/8/build-environment.yml
@@ -55,6 +55,7 @@
           - librados-devel
           - librbd-devel
           - libseccomp-devel
+          - libslirp-devel
           - libssh-devel
           - libxkbcommon-devel
           - lzo-devel
-- 
2.39.2


