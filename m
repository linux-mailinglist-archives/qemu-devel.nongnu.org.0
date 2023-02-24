Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7E96A1F01
	for <lists+qemu-devel@lfdr.de>; Fri, 24 Feb 2023 16:55:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVaPV-0005MF-BY; Fri, 24 Feb 2023 10:55:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVaPS-0005LO-9N
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:54:58 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVaPQ-0005LW-Nu
 for qemu-devel@nongnu.org; Fri, 24 Feb 2023 10:54:58 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 l2-20020a05600c1d0200b003e1f6dff952so2509864wms.1
 for <qemu-devel@nongnu.org>; Fri, 24 Feb 2023 07:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aJFW+LMmK18fOMto9AtXzx1qQDMuR71IdpmNF0+iYWQ=;
 b=QqwOJC2obQg/ZtjW3sQEgwJ+lzG7VlrsWAZqltOTR77k44u9nbPKBP6AotqGvc+4PC
 KQqqJReeKVeVhmr41P1DsySHFyHImc5/oAMHzg4bks8VBFtKETaCOyKZUK5wglp0B45c
 DwUKKl5E+IhImEBaBHDfOnS29c/ZjK0OpxPqk6rTLzyzkflvqkKZKwYlwejrjsMvC3Oa
 1CMB2Kxf9AXuesPRRs1AXLMctSH+idim5KS+IBTyFM31BYZDnsCfPRjZwzZfhZ1+vT24
 AlYK2G4rXFggoi6u3M8RIOPuqgkuPl734mj6WlKubXQBiop3fwYBmtxmp8eyDyEQ+YAC
 StVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aJFW+LMmK18fOMto9AtXzx1qQDMuR71IdpmNF0+iYWQ=;
 b=GjvaEulM7+OiXnbZrTwXUg2udKFevA/mwTsAyZLsfrgSVnPs4yBeuZ8u9NkbZhQCip
 w1gBeIF/vckk8q2Ojzkxbz3fd4/WHrUnsEbYWOYdlxrfWJD/084esnjqPrQZw1w6lzEz
 o7AjTSDfKGMpV9JSouy3YySDwMAtrYoD7gA1ksLfyOxpLFHu7dvYX/NE1ngMdBEj2XGg
 QcwU0T32PKP10y+Ic4HONFO5mKaqRoh4YsTrObQJPLos1biDr6i1kCzm8VIpw04y/6Ku
 ZPNngT7ftHDA7/FtM4pkGOngTg7Baz25cOcuiE7jCzYvowo+WvN3kjWw5nEUKYsgczUx
 cADg==
X-Gm-Message-State: AO0yUKWS2pvLuhq6mnUBngU83hxCxEcdNwaq+gF5Yy4nkwPdT0jQGNi2
 hHlmPiWH0wYjjRY1zDIneJ2GTbwgrzrdcLqu
X-Google-Smtp-Source: AK7set9p9AWARufIHRoIqDC95j/dnk2p2IBSBz+f55VQHNAVUA/DSSTKLJ7TDHZwJWEY5FIjETiPuQ==
X-Received: by 2002:a05:600c:3088:b0:3d3:49db:9b25 with SMTP id
 g8-20020a05600c308800b003d349db9b25mr13159274wmn.26.1677254094632; 
 Fri, 24 Feb 2023 07:54:54 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a05600c219100b003e7f1086660sm3285602wme.15.2023.02.24.07.54.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 24 Feb 2023 07:54:53 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>,
 Paolo Bonzini <pbonzini@redhat.com>, Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] qapi: Simplify enum generation
Date: Fri, 24 Feb 2023 16:54:49 +0100
Message-Id: <20230224155451.20211-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
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

QAPI generating enum count as part of the enum forces handling
impossible switch cases. Modify qapi/types.py to generate the
enum count as a definition.
Do not try to cover the unreachable 'default' case.
Clean files covering unreachable foo__MAX case.

Philippe Mathieu-Daudé (2):
  qapi: Do not generate default switch case in
    gen_visit_object_members()
  qapi: Generate enum count as definition in gen_enum_lookup()

 audio/audio.c          |  6 ------
 audio/audio_template.h |  3 ---
 migration/migration.c  |  2 --
 replay/replay-input.c  | 12 ------------
 scripts/qapi/types.py  | 11 +++++++----
 scripts/qapi/visit.py  |  2 --
 softmmu/tpm-hmp-cmds.c |  2 --
 ui/input-linux.c       |  4 ----
 ui/input.c             |  6 ------
 9 files changed, 7 insertions(+), 41 deletions(-)

-- 
2.38.1


