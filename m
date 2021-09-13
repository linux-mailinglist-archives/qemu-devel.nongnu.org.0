Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63FC7408B07
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Sep 2021 14:25:39 +0200 (CEST)
Received: from localhost ([::1]:50058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mPl1m-0006pK-G1
	for lists+qemu-devel@lfdr.de; Mon, 13 Sep 2021 08:25:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbB-0002wh-O9
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:11 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1mPkbA-00063r-Ea
 for qemu-devel@nongnu.org; Mon, 13 Sep 2021 07:58:09 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 n7-20020a05600c3b8700b002f8ca941d89so6407839wms.2
 for <qemu-devel@nongnu.org>; Mon, 13 Sep 2021 04:58:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NeR77cPP8dHJ6y/NZzKUpgxfmomQXUZFqq15ts9MaO4=;
 b=Ec8OiY8ESgW7b9+5MACDq7hcDpo515QD4MPoFQWX3FbZwHrQ4RNEXT5c9bZeGqSGEZ
 SBaaenRm8kUU2i2CErAQiLCcVxZ15awr/sJG82tkOoxChb7DlXFlxdGv4nkvnXNtA5WV
 7ME4ijeGShiDKyKdLIwspXwxGx1u7+TYndklvKH1maoB+Zy29YfwOoLKQixtkKuUxkJt
 41cqrJgYjeEHf9kIa7dL/jRHjyt5cq5mQo/DSJCgeuSo7QWX5KMzlJ3Wnth4tTAIUGb6
 EAPcrxLf7eskQqwmCREHxZ1yVSWtmF0EBSIL0x7WM2BCVgMcDTMVhSYKNPcICRn7ShRW
 T2hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=NeR77cPP8dHJ6y/NZzKUpgxfmomQXUZFqq15ts9MaO4=;
 b=2iyDz3Uruv/DA6JA5VY+dcYs3r20q/KHeo4qiQFR7Yf1nEPM22b3F4az0FUnAjldvE
 ysZLvWS1zPUVJkSHWVDJQxD6F7mYOLfVzzWsZckccGVBwm2bcaHbqT4i5zMWVy+lz97W
 //iKkq6YbawlGjltqbeEKKqRsLRr7cAIOmtiDsQymcZVMY4kgXyVVIbM5H2aOeURYKUn
 BwhNuEeScQLUsKz+Z1a/Flc0/sPesx0GcPUWVKGSplm1Wfz3SBVhrtNufrmWn4L2Dbxc
 WKRDLm7ktyjloGPHXDV37yeDWUSrsxNQLFWhz3l4YfBT+aYNJqKbY+0AOuqe/p+BMCsv
 CtVw==
X-Gm-Message-State: AOAM533eX0zQS6Mqcnr4yFoAAZbwxFdQ8GKPdrfi6lG9d9ZYPvevIbaC
 PfMrGbLzhWPPB6B6KNzejirJ4Zb906c=
X-Google-Smtp-Source: ABdhPJxUUMNSSQE/Rc79JwlAVc2DX1B8tEhEz7W5v8xG3LQUJKjfof2zDnYcuh9HFWXyxmLb1gyh8Q==
X-Received: by 2002:a1c:3102:: with SMTP id x2mr10957838wmx.122.1631534287222; 
 Mon, 13 Sep 2021 04:58:07 -0700 (PDT)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id n186sm6011037wme.31.2021.09.13.04.58.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 04:58:06 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 15/21] meson: do not use python.full_path() unnecessarily
Date: Mon, 13 Sep 2021 13:57:36 +0200
Message-Id: <20210913115742.533197-16-pbonzini@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210913115742.533197-1-pbonzini@redhat.com>
References: <20210913115742.533197-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wm1-x32c.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The "python" variable is an external program and can be passed
directly to custom_target.  This avoids the need to look it up
multiple times, which was previously silent but is now explicit
in recent Meson versions.

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 ui/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/ui/meson.build b/ui/meson.build
index 7d25c1b95b..7faa42eb3f 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -134,7 +134,7 @@ if have_system or xkbcommon.found()
                   output: output,
                   capture: true,
                   input: files('keycodemapdb/data/keymaps.csv'),
-                  command: [python.full_path(), files('keycodemapdb/tools/keymap-gen'),
+                  command: [python, files('keycodemapdb/tools/keymap-gen'),
                             'code-map',
                             '--lang', 'glib2',
                             '--varname', 'qemu_input_map_@0@_to_@1@'.format(e[0], e[1]),
-- 
2.31.1



