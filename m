Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E7D35C040D
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 18:26:33 +0200 (CEST)
Received: from localhost ([::1]:42676 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ob2YS-00007Z-7e
	for lists+qemu-devel@lfdr.de; Wed, 21 Sep 2022 12:26:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54532)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Gq-0003Ts-L1
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:20 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:37735)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ob2Go-0000e3-NT
 for qemu-devel@nongnu.org; Wed, 21 Sep 2022 12:08:20 -0400
Received: by mail-wr1-x429.google.com with SMTP id bq9so10701321wrb.4
 for <qemu-devel@nongnu.org>; Wed, 21 Sep 2022 09:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=iHHyl8AojnEq14+3x1kjoY7otQgZX0hgTY1qjaFy320=;
 b=DgjEppD2lwo1KBT/JmrbtWMHe24x3FEtWiueAYDoEq3edddOgwN+lsD7HdBvFnKUiw
 dFtkt1TSBzLcHff6bd1ub8OUfL2gptjE+tXJUrX+D4F/tmOjO4NxDl4BFKNTEqCiF+uU
 a5QEXSWKFjjl26XSEyDF4iNtJqVOQ1vC5O8q+LufzUCjDMO6/rpB8PPXrB/h9hTRLdtS
 vU+P5XI2ZAgBVi5TbbYifBVxl5DUpdIf3ESx+F1gxiCjZbDhqFs9WLBModyrFJ88MppS
 YnzVmAZsCnny4OdNv6aTt6OomgacMZBHkCzQrwL7f1VvVCcMQ5PtWBdyWhlOXoF1V1mU
 5FkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=iHHyl8AojnEq14+3x1kjoY7otQgZX0hgTY1qjaFy320=;
 b=VA8PkrffaN5tht2fjmAEEyF/osug5f/tPvpmQD0rYT39wDRuz2Zm84nCUJIB0GyJZY
 K+ipJKAO1QnVw4CWKA8mIvUJ6YlcM8ZMGzLdGqAHEkrwtSvqVvCZoGuYprPc/4zEML2c
 E5+5AvUVV1JcR//tjU0LkdZF+2q/EivfiBfBTPOhGrXyrl64DnHM8emsnWvGSEQHPhS5
 csA9sv5by4mmGWcOjUdTMctvJskQQ47WMYr8/i6OR/pSrjmztuevVvLGznRZ3UDmA5Oy
 aWoguiSKz7r2Zb+nP6ORxElmMJk1VBbKFkyl7li1bQhOZaTFQkCrlpPBILPmvASBwqJC
 hGDQ==
X-Gm-Message-State: ACrzQf1lHeRL+gxdGK+KH/bVwh521SsJZ1x9lWRhkquAXJI9oo1OgmQF
 sFbspbqAcRRHNnq8Q3P0Nz/08A==
X-Google-Smtp-Source: AMsMyM44+Xh/j6yRqnSUs28g0/T3j6kN/0MgJlWh/GTgpEwQyUVPfzJq2QvuhxIMLT3mlSgju58mDA==
X-Received: by 2002:a05:6000:14c:b0:22a:c14a:29f8 with SMTP id
 r12-20020a056000014c00b0022ac14a29f8mr17631312wrx.588.1663776497802; 
 Wed, 21 Sep 2022 09:08:17 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 j3-20020a05600c300300b003b4868eb6bbsm3675523wmh.23.2022.09.21.09.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Sep 2022 09:08:14 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id E3B041FFC0;
 Wed, 21 Sep 2022 17:08:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH  v1 08/10] docs/devel: move API to end of tcg-plugins.rst
Date: Wed, 21 Sep 2022 17:07:59 +0100
Message-Id: <20220921160801.1490125-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220921160801.1490125-1-alex.bennee@linaro.org>
References: <20220921160801.1490125-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x429.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The API documentation is quite dry and doesn't flow nicely with the
rest of the document. Move it to its own section at the bottom along
with a little leader text to remind people to update it.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 docs/devel/tcg-plugins.rst | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
index a6fdde01f8..8b40b2a606 100644
--- a/docs/devel/tcg-plugins.rst
+++ b/docs/devel/tcg-plugins.rst
@@ -110,11 +110,6 @@ details are opaque to plugins. The plugin is able to query select
 details of instructions and system configuration only through the
 exported *qemu_plugin* functions.
 
-API
-~~~
-
-.. kernel-doc:: include/qemu/qemu-plugin.h
-
 Internals
 ---------
 
@@ -448,3 +443,13 @@ The plugin has a number of arguments, all of them are optional:
   associativity of the L2 cache, respectively. Setting any of the L2
   configuration arguments implies ``l2=on``.
   (default: N = 2097152 (2MB), B = 64, A = 16)
+
+API
+---
+
+The following API is generated from the inline documentation in
+``include/qemu/qemu-plugin.h``. Please ensure any updates to the API
+include the full kernel-doc annotations.
+
+.. kernel-doc:: include/qemu/qemu-plugin.h
+
-- 
2.34.1


