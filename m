Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FEA6A41EF
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:45:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcmf-0002Hq-UF; Mon, 27 Feb 2023 07:39:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcmT-0002Ed-Bs
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:39:02 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcmR-00018F-9y
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:39:00 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l1so2998229wry.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:38:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iLI4il3NN0+GV7Y2sSjTCTRrXRt+7nkyb0DHkXyrIEk=;
 b=FLUa5Efvj7qHZauBQcYNUf1hO4b3C7hLGkfPMsKTHnOFZr9joan7qvc32HfX4q7hJM
 2OxKPqKvOs2KVM9NMoCBGAvkkjRyzfG6U22K+BhB9FfKFKLiNnZ2ZJVPFq/7/JKQWifI
 lWTAAFtMCghez/eBpDxBlx3xTi+BYwIrRGkPqFqvKuTDa9OxV9LmY3BH2/S3+Fa6Ggg/
 zs76xT/Zm4GQLQha75bmo5tgJmIyuSshvXVRSSLJ1CZEeFw6Or+hexgdbEbvQ0eFBDe3
 39mM8C6WJPeBvwFB8Nf/0nkUhcNBMjcrT2v/Bd0eQ8+pFzCSGgX6sJ2RLDeAYnwBbqri
 R3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iLI4il3NN0+GV7Y2sSjTCTRrXRt+7nkyb0DHkXyrIEk=;
 b=KgLJ7vUqHuOxaCZ19OMs05Cl8nGAjf+xBKNoKd33om8yf4pwKoM1ylKEXCPn2K/orb
 LKg1SRjPjK5+66RVQAjmnbSnzjTLQzOiKWILBcQIlvUrZfOLwK1DJ9gqRWxWMwlbk9KE
 3nOxmFLRNwMFASPuQB3y1AjjN71i1GuiFGad1b6AdlxLt9H3Em9wn/oE6QoVHbF+AOK/
 IGdSz+sIJ1WPAVs0adr21C1ymiExQfDU+GHMWYPDaAlZ3E7TeFte6nMznV+Zqgumd0r4
 oqNoDzQTX7aJ+1tycQpZup48fMGMbmQLUeC4Egn3MBfoax+kF9QorTsxn2cN2YFDDayS
 21jg==
X-Gm-Message-State: AO0yUKUZoC63SwAJqvESavusM5mXwlFesNUXRFmQL6bRqWIHPKage4N3
 qv8Jp+NJuyV4ePnnJaof/lwXQCDEbM7OUoTy
X-Google-Smtp-Source: AK7set/OS3gH2PKY1eGNsv9LZbHq3i/RvSefE8eYFxgETLps5UHPeb5Kaoys6UnyqmuFOPqJwLxuGg==
X-Received: by 2002:a05:6000:1046:b0:2ca:e4ac:5089 with SMTP id
 c6-20020a056000104600b002cae4ac5089mr3381336wrx.30.1677501537555; 
 Mon, 27 Feb 2023 04:38:57 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f7-20020adffcc7000000b002c7163660a9sm7178752wrs.105.2023.02.27.04.38.55
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 04:38:56 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PULL 001/123] cpu: Remove capstone meson dependency
Date: Mon, 27 Feb 2023 13:36:45 +0100
Message-Id: <20230227123847.27110-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227123847.27110-1-philmd@linaro.org>
References: <20230227123847.27110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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

Only disas.c requires capstone CFLAGS, not cpu.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20221130135241.85060-2-philmd@linaro.org>
---
 meson.build | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meson.build b/meson.build
index 6cb2b1a42f..77d2ae87e4 100644
--- a/meson.build
+++ b/meson.build
@@ -3140,11 +3140,12 @@ if have_block
 endif
 
 common_ss.add(files('cpus-common.c'))
+specific_ss.add(files('cpu.c'))
 
 subdir('softmmu')
 
 common_ss.add(capstone)
-specific_ss.add(files('cpu.c', 'disas.c'), capstone)
+specific_ss.add(files('disas.c'), capstone)
 
 # Work around a gcc bug/misfeature wherein constant propagation looks
 # through an alias:
-- 
2.38.1


