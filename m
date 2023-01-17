Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CD966E798
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 21:18:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHsO0-0002tE-7K; Tue, 17 Jan 2023 15:16:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHsNy-0002sW-8U
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 15:16:46 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHsNw-0006RK-JG
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 15:16:45 -0500
Received: by mail-ed1-x532.google.com with SMTP id v10so45514618edi.8
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 12:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y1QJd+rtKI9Yp4M7PcmRUuQ+kdiatTf3Upm4rybElsY=;
 b=YIkufVphlhsSHXEPU1AMP/pNqEuo9GtV4dHbgUoi2onJ6VJSu7C2hZQ0Kn4xnWc93S
 SItDHOJB/70HKmDiORbDnKAGI/ouWVfZXmyJVu8Ql1XWY8+cDrCxPxmgVWvDotVD/tFy
 59P7XdiiPjO+Tlbca04tD0t74csEE8r9mFZbpghNK/xQnYG388DsRRPdlCTr5vvcVxjd
 XANemTieb7FnHbfFvDpjTuIcuptFH5sGKL/VZZ6PkC7YsxoRcMjME4G104+TXsB+8aFX
 qsDqwRZUHGpMx+6qceE8YeTrTHqNeMsD2+WHMMXlUEMw6sgmm/IoTosAsCJEt7nMM3cZ
 NM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y1QJd+rtKI9Yp4M7PcmRUuQ+kdiatTf3Upm4rybElsY=;
 b=EyqGNCz2IZUfcq3x38R9IunPKD8uLsL+PihBk5s7xTVhP2Fx3S9UBy4URUl5kpWMB/
 esLdexJNMttPWx1JLtGxYk0JpcfuCPTpvVH5GzCfdyfJYZFqEZSbPbCb9zIwI3ag8qss
 zrEujHNN4K2P0ao16Zyb7AH5CsvFzFFLwmbSXRbI4p5V3qct0BobU9UZmoRRUX7fsPNU
 oOP5OVeVd3QY++lDih2JakZ+80hpodZiOHHfXqs3bYWvMZY93xzq9lkVhrm/oTXF0Efl
 Ki1I7bxDXD1m93dixDndtjSgHWYFpGdAbl0oDpoSZjvI3zOlkTz0SPEDMaRyk8Qvx0E9
 9lKg==
X-Gm-Message-State: AFqh2kqAcvWUvn8usBHx/QUbtOGsTeVJmp8htQImm1PKPcV/Ssh3azpz
 wUtqno5NyWXYxC2quGv2B+S3CnW5EGuoyEw6
X-Google-Smtp-Source: AMrXdXtb5X96t7eafB+VaGqSC1nVOexKwXpNvEVpIoY1wu7hM/esvL0RO29CKRlgz1QntikxqYXqYg==
X-Received: by 2002:a05:6402:449a:b0:499:d1ca:6d83 with SMTP id
 er26-20020a056402449a00b00499d1ca6d83mr4348830edb.2.1673986602749; 
 Tue, 17 Jan 2023 12:16:42 -0800 (PST)
Received: from localhost.localdomain ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b15-20020aa7c90f000000b004615f7495e0sm13289056edt.8.2023.01.17.12.16.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 17 Jan 2023 12:16:42 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, BALATON Zoltan <balaton@eik.bme.hu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 0/2] hw/ppc/pegasos2: Extract southbridge creation code to
 via_vt8231_create
Date: Tue, 17 Jan 2023 21:16:38 +0100
Message-Id: <20230117201640.88365-1-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x532.google.com
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

Simple refactor to clarify a bit the southbridge device creation.

Philippe Mathieu-Daudé (2):
  hw/ppc/pegasos2: Extract via_i2c_bus() helper
  hw/ppc/pegasos2: Extract via_vt8231_create() helper

 hw/ppc/pegasos2.c | 46 ++++++++++++++++++++++++++++++----------------
 1 file changed, 30 insertions(+), 16 deletions(-)

-- 
2.38.1


