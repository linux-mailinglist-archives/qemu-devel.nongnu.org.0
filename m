Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7281D31438D
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 00:14:20 +0100 (CET)
Received: from localhost ([::1]:57604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9FjX-000584-Gs
	for lists+qemu-devel@lfdr.de; Mon, 08 Feb 2021 18:14:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCe-0003a4-Vu
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:05 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:51505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l9BCd-0006Gf-9G
 for qemu-devel@nongnu.org; Mon, 08 Feb 2021 13:24:04 -0500
Received: by mail-wm1-x331.google.com with SMTP id t142so60737wmt.1
 for <qemu-devel@nongnu.org>; Mon, 08 Feb 2021 10:24:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=huvW24PZNK/dw5M5AF0YaNslMI2dHZzb2WGv43aBMTs=;
 b=UZmNxhgTu2tB4gZoOH6I6MHEws3BNOZOKgEu4HDvFYBHuPuD4Ay4y8lvxC56ewqDQw
 nPV8U0g2Jy4MfTY4pvULKVWXTmywckKy2Pc0Ep1WwwUQlk7BVh+5gI7/ZJXNRDFy62aY
 AURLkDgtEzs4rLAJvzqgBNOiiRLhoU8r6F7zglPUQ+Tqll4rFEdQ+NR+i7a+MTf/+zok
 7W+XxyUfmU4aJ0Bdwn007ATRP61cipNA2S8pQuBUfJghfwzV+eeuY8+Nz7ITVZHOwnPb
 bt7FPo77foHgB1Fboh0LvF+tCw7JidEWcSZO+hM1Wm3cZocoF19Uwtip+WpISKqIjNK1
 K7Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=huvW24PZNK/dw5M5AF0YaNslMI2dHZzb2WGv43aBMTs=;
 b=goXuHeWP3dCuUx/VNNGFVLY+YYNjW8eDmHTYjgglI7DvH+8A92vh4gsCX6OKNjeH4D
 TaUl2dABqtip8QxC/Dvh4ePK5OysxCJSm7RGm/Rw6m9VWTvsgS0wpW1bkPFR/SKYD5K5
 WNH0/ifpSP47T52+9yH0W9vTHtang+Cbqv1zthSnAn+bCkR91wkohKi9yafY+T8L7HL6
 1mHBqq9Z8D+IDfb83Ax8yS9X6qwaC0F93VmgINwic+LcTugm82AI9PbXTIp4l+6subUX
 KirB3kNT9L48JQVmBtrtvguGbQzuXaT1BPmQmXR8awgbsMCJVLm6GVJIUuHlhe2brXSO
 RmIg==
X-Gm-Message-State: AOAM530ZgP9gR7OMaeM0tWKUFIxjf7oQ33CnKm/UiD0FFdVSLP3nHaqr
 KkmcaNLarVQxjgIaP4pkDjxTD30gpblHWw==
X-Google-Smtp-Source: ABdhPJyy28dseU1HuDoWb6wRwZuk4WDpFxZ7P3J9Kwz/65O1OdbRlsJKDkA/0bORlNFDm9EhN/B0MQ==
X-Received: by 2002:a1c:31c2:: with SMTP id x185mr96226wmx.44.1612808640977;
 Mon, 08 Feb 2021 10:24:00 -0800 (PST)
Received: from avogadro.redhat.com ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id
 x22sm19670wmc.25.2021.02.08.10.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Feb 2021 10:24:00 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 30/46] qapi/meson: Restrict system-mode specific modules
Date: Mon,  8 Feb 2021 19:23:15 +0100
Message-Id: <20210208182331.58897-31-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210208182331.58897-1-pbonzini@redhat.com>
References: <20210208182331.58897-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <philmd@redhat.com>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Acked-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <20210122204441.2145197-12-philmd@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qapi/meson.build | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/qapi/meson.build b/qapi/meson.build
index b301a46f04..7aca8d5048 100644
--- a/qapi/meson.build
+++ b/qapi/meson.build
@@ -18,8 +18,6 @@ if have_system or have_tools
 endif
 
 qapi_all_modules = [
-  'acpi',
-  'audio',
   'authz',
   'block',
   'block-core',
@@ -39,14 +37,10 @@ qapi_all_modules = [
   'misc-target',
   'net',
   'pragma',
-  'pci',
   'qom',
-  'rdma',
   'replay',
-  'rocker',
   'run-state',
   'sockets',
-  'tpm',
   'trace',
   'transaction',
   'ui',
@@ -54,7 +48,13 @@ qapi_all_modules = [
 ]
 if have_system
   qapi_all_modules += [
+    'acpi',
+    'audio',
     'qdev',
+    'pci',
+    'rdma',
+    'rocker',
+    'tpm',
   ]
 endif
 
-- 
2.29.2



