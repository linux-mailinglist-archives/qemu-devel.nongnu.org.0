Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC6866894D7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 11:13:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNt3i-0008Kw-Fg; Fri, 03 Feb 2023 05:12:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNt3Z-0008Ij-Ju
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:12:33 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNt3V-0002Ek-Ke
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 05:12:32 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 j29-20020a05600c1c1d00b003dc52fed235so3462153wms.1
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 02:12:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LEOiYrWSQHlsAiuHuhCXDy1Rcvv1RyyMjqSxdpXj0GY=;
 b=bAFZYsXNqhecxi1at/paRgFqbKwLYdYKYGVg2kUH/ZKlEHHHQpGlgpCMXuk1s3BVDb
 ZcHj8NGxXeYdQLsH//cr8HmT4SUHltKwcy4TA5Ep68g13vMm8bNTKmg8/clsNnUsm0Yl
 QzsBS1MG9xikLTSts0a2Rbl2Q+HUCEBlhXSrZgTqLj/EkZ5xMwx8ddtFNoLImAkq+qcF
 rWxsqAjp6gmBw2UUD4ECYh+ZB6fu2FtQ4JjF1KraH7h0B6Wi7ctEG1VtSF0TxMzKTJdF
 VJHUrr/cp/pjBPVAuDiKaOOlXkFJs1qPctE8NI0uf7qZuilhMPKAMbFcvNJFOklpmNUW
 U+OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LEOiYrWSQHlsAiuHuhCXDy1Rcvv1RyyMjqSxdpXj0GY=;
 b=HQTy7rWK7/sjRM+X01eM1d0ARhgTL8wX97xO72Rp8MUO4JB49eaZQm5MD98OE73xN1
 DeVtJufUGbhon3KoMRpkzpxakUUBCKWagWYwOetK7oZbK3TSRGX3ICAPO9NlBPd43Onp
 0wLo4RFy/HKQf/2X6VKKkibywN4PfwV/E6IWBClKVg/NcfQo77Z2DkDgsu2xnVMskBWj
 AH7Hi0oCy3XHyH14pkVLIb1ulJh/7Oe8eIZf84h2sAEXwhNJ/GZhNaMmEg1sepyeUjUF
 VYDG3F9724OEPUKO5bgoWwklL40fkuQf77m5tntXJDZKhbXJb/vBC4nY7Yf729RDCVGo
 wkNQ==
X-Gm-Message-State: AO0yUKXMX7USBmPTsHkuXWvFWPYphZTpdeThFH9TrSZjAF2Xt8qxbZk3
 LmRyeByLwcqW0WtfvEgZ8/pVI5qO0kpwr/nD
X-Google-Smtp-Source: AK7set8Sfx4sgTskc6CJvtmAG4e4O/2we2YFWDFxaPFVcqS51ufENpnZBcGBp7bFDXSckNjoVPDB4Q==
X-Received: by 2002:a05:600c:510e:b0:3dc:59e9:9285 with SMTP id
 o14-20020a05600c510e00b003dc59e99285mr9945129wms.18.1675419147489; 
 Fri, 03 Feb 2023 02:12:27 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c3ba400b003dc54eef495sm2473728wms.24.2023.02.03.02.12.26
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 02:12:27 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 qemu-trivial@nongnu.org,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/4] hw/qdev-properties: Constify Property* in DeviceClass
Date: Fri,  3 Feb 2023 11:12:20 +0100
Message-Id: <20230203101224.25796-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Qualify some Property pointers as 'const' when the
structure is accessed read-only.

Philippe Mathieu-Daudé (4):
  hw/qdev-properties: Constify Property* in object_field_prop_ptr()
  hw/qdev-properties: Constify Property* in PropertyInfo::print()
    handler
  hw/qdev-properties: Constify Property* in PropertyInfo::create()
    handler
  hw/qdev-properties: Constify DeviceClass::props_ field

 hw/core/qdev-properties-system.c |  2 +-
 hw/core/qdev-properties.c        | 14 +++++++-------
 include/hw/qdev-core.h           |  2 +-
 include/hw/qdev-properties.h     |  6 +++---
 softmmu/qdev-monitor.c           |  4 ++--
 5 files changed, 14 insertions(+), 14 deletions(-)

-- 
2.38.1


