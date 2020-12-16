Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C78EA2DC2AA
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Dec 2020 16:03:47 +0100 (CET)
Received: from localhost ([::1]:37706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpYLC-0005zJ-Ry
	for lists+qemu-devel@lfdr.de; Wed, 16 Dec 2020 10:03:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpYJh-0004KE-OU
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:02:13 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:33920)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1kpYJf-0007S2-8K
 for qemu-devel@nongnu.org; Wed, 16 Dec 2020 10:02:13 -0500
Received: by mail-ej1-x62d.google.com with SMTP id g20so33189204ejb.1
 for <qemu-devel@nongnu.org>; Wed, 16 Dec 2020 07:02:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wriHtt7qiXwOsKyET9M1f7QWc8pzHgf4bO+e20Nf8bY=;
 b=IZb2atGbQaYK2L+9302EZgBeEqOp5wY1MYa/iFJ5BE0J8wHdC9Vhspotg2GyzoWec5
 wUxqmtj2Y/j+m5mKhmiagMwnlGOvjySJpR6pN7FdtQkxdkxKvNkA3amXPf+ieoLTWZIe
 4TwiPKd3YZ8FJVGWDa4WnxD2uBbJyBwlrg5NxpE/HXPoh+R6yNW2WSqCBj3ZnYczk/QP
 TMLk6B26S/tSZY5LGeVJnDO2slFq1tFqe7E/vwcAkp/PGMQadIOuOwNgXHUyC/noJ0Tb
 ZbMK7zjQg9Yc524SSC73PbAnI+NRTiz+4xobCxIKeu2eZwxvz7Rm/hVRoVZyfrpd8+P2
 ztXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=wriHtt7qiXwOsKyET9M1f7QWc8pzHgf4bO+e20Nf8bY=;
 b=tp/83rsOkRw0eIOsL2zSkLRJNdq03/TmHHauYJGZTZMSAaUU1QmuIjwgp8OpZz1Y0s
 3VCZQZaaQkG++Foc4WJP97oOe4XjDH0b77BjBRk1+0Mw7rXVXQoUKqgAuRc9eQfwjBLl
 aZWU+b0KWAdBHJa9PT6oF2NBujBOGVpCNxFQ2DIoXvwOMu7rfdHUS7QuoqdgmzvUiTwm
 AuFqfstxd2eCEkfeUKM0LA5B8jBMc1DNBxAOiWe/FGGRXMSGiVz7OcFv5yEHap4C9z19
 8Ev+anBDZG9obo54LRY/+tXjZ2rmpV4DVqoW3KLB0x78eV6VGZnTQCIGQODtlBMUsDik
 vh0Q==
X-Gm-Message-State: AOAM530CjkWHnGLKSRH61ZVx7lMYtUSDmDwKuRpyaE1rDLypIdAjXv94
 lljvN6hNJtkd0SumIkRU93rPkeuj7d4=
X-Google-Smtp-Source: ABdhPJwHGkoPjUOESWEh70G/slyqnnNDoU/lcUUFXH7pcQ9O1p/IgbniUw5GPP6zNTQ58QTl3fnmSQ==
X-Received: by 2002:a17:906:b217:: with SMTP id
 p23mr31719433ejz.461.1608130929293; 
 Wed, 16 Dec 2020 07:02:09 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id v24sm21397059edw.23.2020.12.16.07.02.08
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Dec 2020 07:02:08 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/7] First round of meson bugfixes and cleanups for 6.0
Date: Wed, 16 Dec 2020 16:02:00 +0100
Message-Id: <20201216150207.431437-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mostly switching to 0.56.0 in order to remove the b_staticpic
version-dependent hack.

Paolo Bonzini (7):
  Makefile: add dummy target for build.ninja dependencies
  meson: update submodule to 0.56.0
  meson: switch minimum meson version to 0.56.0
  meson: fix detection of curses with pkgconfig
  meson: use pkg-config method for libudev
  meson: use dependency to gate block modules
  meson: cleanup Kconfig.host handling

 Makefile                      |   1 +
 accel/Kconfig                 |   9 +++
 block/meson.build             |  20 +++----
 configure                     |   7 +--
 docs/devel/kconfig.rst        |  19 +++----
 docs/meson.build              |  12 ++--
 meson                         |   2 +-
 meson.build                   | 104 +++++++++++++++-------------------
 plugins/meson.build           |   4 +-
 tests/meson.build             |   2 +-
 tests/qapi-schema/meson.build |   4 +-
 tests/qtest/meson.build       |   2 +-
 trace/meson.build             |   4 +-
 13 files changed, 91 insertions(+), 99 deletions(-)

-- 
2.29.2


