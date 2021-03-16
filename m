Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B427533DEAF
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 21:27:39 +0100 (CET)
Received: from localhost ([::1]:49958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMGHy-0001Wa-Qk
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 16:27:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthoine.bourgeois@gmail.com>)
 id 1lMGH0-0000fK-Fs
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 16:26:38 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anthoine.bourgeois@gmail.com>)
 id 1lMGGx-0005GH-NC
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 16:26:38 -0400
Received: by mail-wr1-x429.google.com with SMTP id 61so8116189wrm.12
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 13:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+YuRi2tvcUFVsLuZ5e/s1Fk0A4Ozy+APo3zPGcPc92E=;
 b=a6HgkZEoGJS96IF6Zskb+xYPWe4phBjZtqbXcjYlM9Ia5q4x/0wgQpgBw+J2XLxi69
 Q6cth8mNXWeVwzeefOXT9BZh2T6NVo2onal7OxcNRcs1kPNBemGQO8gQ67a7x7rLa3Ty
 BU9th/edq/6RtQ9wJ/HrL4zuaIOBszjHxQ0WISNtDwVOABHd7e9x+S7NXF0lvwW665qe
 4GFyu6rfBEiEjcSrbyU/hpIZBuOdPF+8ghwBtaAup4+asVy8PNRjPtjfjU/gRrP+5eHn
 35FKs6iPfXrt5F+mPOMk80U7X37lP9KQBedjXhRVgJNgT2yjcrpSTY3wE1TdLjQrVE0g
 tj/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+YuRi2tvcUFVsLuZ5e/s1Fk0A4Ozy+APo3zPGcPc92E=;
 b=kftFYGcGBtn0gLUMjOhIs3RYgEy5dPZopTCb4PZPS67Xl2fw2xt8m7P+32DzsIzsjL
 S9Ci6j8CXy9v5e+n9idoyEYqwMFn+czrDMniNhHqhB1atDNAO+VmIbv0fZMoBYi3qifQ
 Y0R+P7xDsrXuEYTflMrNJ3wYEok53XkjWOMCh+poryhBfPR4m7kWFAow4AnSlZDvt5LL
 BLfERlaKedYFNqhiAcB3Kkb30YF+oGT9Y6FLxjQmEoI+M3KxyIcjHb8XPdiCMytzFqKj
 5+gJ2B5JyorZGiBoK3KPPzuRYthSBvzn9iGr0bdrvNemGS5fLWl6kjl98k4MMUnPpLAH
 aIzA==
X-Gm-Message-State: AOAM532PNguC3DUQ2XQjjpujCVi48qeXW4UCxKwQjTvP1EB4IFz98qVW
 vqPRfgkYMI1881ztVwHWwAfu0WZGDmE=
X-Google-Smtp-Source: ABdhPJwsB3xQxwHtsbDQg2Dk4Rndb9vRJzkp3HzlcJ7Ro/mt3W0/QaOR5ALSt4s67BWhwVrfejim6A==
X-Received: by 2002:adf:dc4e:: with SMTP id m14mr853031wrj.248.1615926393764; 
 Tue, 16 Mar 2021 13:26:33 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e34:ec42:a0d0:604f:fdaf:5fc6:75c7])
 by smtp.gmail.com with ESMTPSA id x8sm23196782wru.46.2021.03.16.13.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 13:26:33 -0700 (PDT)
From: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/core: fix link error with --disable-fdt
Date: Tue, 16 Mar 2021 21:23:47 +0100
Message-Id: <20210316202347.415131-1-anthoine.bourgeois@gmail.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=anthoine.bourgeois@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The link error appends only with x86_64-softmmu as the only target.

Fixes: a33ff6d2c6bd480fbab3bc9f748655a9269881eb ("hw/core: implement a
guest-loader to support static hypervisor guests")

Signed-off-by: Anthoine Bourgeois <anthoine.bourgeois@gmail.com>
---
 hw/core/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/core/meson.build b/hw/core/meson.build
index 9cd72edf51..5e61347779 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -37,7 +37,7 @@ softmmu_ss.add(files(
   'clock-vmstate.c',
 ))
 
-softmmu_ss.add(when: 'CONFIG_TCG', if_true: files('guest-loader.c'))
+softmmu_ss.add(when: ['CONFIG_TCG', 'CONFIG_FDT'], if_true: files('guest-loader.c'))
 
 specific_ss.add(when: 'CONFIG_SOFTMMU', if_true: files(
   'machine-qmp-cmds.c',
-- 
2.27.0


