Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9823088FA
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 13:17:38 +0100 (CET)
Received: from localhost ([::1]:45658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5SiX-0008PU-Ma
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 07:17:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5Rnd-0004yT-0i
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:49 -0500
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:38798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1l5RnZ-00067D-R5
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:18:48 -0500
Received: by mail-ed1-x52f.google.com with SMTP id s11so10132044edd.5
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=huvW24PZNK/dw5M5AF0YaNslMI2dHZzb2WGv43aBMTs=;
 b=iaGZ1w6QQy95kqBMbB8Fd/4aoNJrEYD3aK1ZGhltnepwM7RDdXkfPwTBbM9d7HYPGt
 eFiExBj+txG133CyrTIoKfdIU/3M2PEICgXtXhCS2ABb2rrCOfSQzF+B2KH4cMH+oZcp
 1XM6VvcsgNDYOmzFIMZkPmLBtiMtD+3SGgf6dOc2SDUH4ww6rYlk1hODKDebtd86L870
 logWkS791gCmB7OQjquMUUy97PL6PvxVYMG3L3zPllzg1w7m1ZLPvTIJZM0n5w03POLb
 5ua64I5FD7WgDCmcPQilkTI72LdzFhsEhX0WDotn1QVFJDM8UF/mDdu+bz2BWbrUVKDY
 raUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=huvW24PZNK/dw5M5AF0YaNslMI2dHZzb2WGv43aBMTs=;
 b=tsvReGYljMzRbQd5lZUHDQRc2HcYTTRK7ndEZaTu2rlUsm2o7MMGbxvfZVuigjQsaD
 6DirWy91vjmbpsVYyv5PcF/fTvDeCU7Nm77whzsaZKH33NpuMwJ7Z9ShQfoa4Y9F/l9d
 NnfPgvLVLVvTGXuFqTw0ph7Wi8mrpEq82Mgj3fvP84/MGwFmAxBM+HXyit47Fr8ACe8f
 h1BOoValW1a/miUVbrg/fctkkfYQAjQMzeBTQIpcpEvFsJ7EG5Y2avOlybhqmKkvT/iF
 5rLgMx9dOPrNX8WEhrJkYbvXflnjLZcNVux4QEs+TOkbMtCRGPggbibPqw3RDqE5eDx3
 Wisg==
X-Gm-Message-State: AOAM533dlRFI2R9zIXhFJAqCvk7wrPW5+XbYJYiQIHY/LPQwbO6WMNtZ
 G4h5vNPACBdYfVyL8uh3rdnZM9b1+98E/Q==
X-Google-Smtp-Source: ABdhPJx5Sy6132eCxxxLgMjaQfi7KsBAiJJSgjurOkSnzd35/TRiU6TbpC7nnpaPrLabixoenzMpwg==
X-Received: by 2002:aa7:d4d2:: with SMTP id t18mr4645412edr.238.1611919124631; 
 Fri, 29 Jan 2021 03:18:44 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id zg7sm3745296ejb.31.2021.01.29.03.18.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:18:44 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 33/36] qapi/meson: Restrict system-mode specific modules
Date: Fri, 29 Jan 2021 12:18:11 +0100
Message-Id: <20210129111814.566629-34-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129111814.566629-1-pbonzini@redhat.com>
References: <20210129111814.566629-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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



