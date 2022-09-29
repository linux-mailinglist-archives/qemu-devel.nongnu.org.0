Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 235325EF63E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Sep 2022 15:17:53 +0200 (CEST)
Received: from localhost ([::1]:52600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odtQG-0005Sc-5S
	for lists+qemu-devel@lfdr.de; Thu, 29 Sep 2022 09:17:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods3B-0000N6-CJ
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:50:05 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:45856)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ods37-0002NF-Cv
 for qemu-devel@nongnu.org; Thu, 29 Sep 2022 07:49:55 -0400
Received: by mail-wr1-x429.google.com with SMTP id n10so1756696wrw.12
 for <qemu-devel@nongnu.org>; Thu, 29 Sep 2022 04:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=LSxM948fp1p1t8Uf4MobowtOCXUoE+CecuNJGsP6k84=;
 b=dx/Fy5uDXxj7Gn4RYOVjz605cvWjoksGIp+6vOy35s1ROkPj2nLAcO2VQ7KQLULXWs
 f3xZs2q46I7BlvnyxVvLozZrEnpjCVwZ9U/PrxbzUFLUnueoeA03mIMQaJdR2jxDlEKD
 PjZ87svJTcfO5bWlvXrVWPv/rooj2Gnf1pYEx1xvFLmTUxDW2KV2k0q7INrNf3RWIBe7
 GmMV1shpYtLHD2ZLpKcgE+bE1I5UfUGaVPcFspwGPcO86jVqWxX8HBfH7ulCMCzFEeIA
 cmMegoCGnQw7W9N1k5tx3+IOuxk5iF+0/P58YwxLuS+qMPPCXiRXIb8xPu8mPgqMw1Ic
 zNMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=LSxM948fp1p1t8Uf4MobowtOCXUoE+CecuNJGsP6k84=;
 b=fQMglB3yNAlzpxhFRwGQiSGjKjEjejWgIT9Y+2fiiEk7nBUI6ozfAgjdxhBiLz68U5
 irvgjwI/GHq+QJ8lWtiQe0gaJ6GAJif6OwRc7ja5yfhwLVJgigH9jiMVEWex1fdPGw+A
 2tXYuYqAQ6txyajNy+yXNId1NiM248TD9z1pWMrOLD+3Ly8sov4u5FYILRExf0qd6VSJ
 shd2pu0LHiSEFdy0IBeqd/0byfBbnxIlgGFmGfraV3amiI//lx17K6OPslUF8eRMbMvq
 UAT3DwApOXjk0t3gl9p+5z4SvGbAplkLUZKQsjVwL5bbiH4sxlT0wYrtBlirYQlkCxTT
 6Ckg==
X-Gm-Message-State: ACrzQf1aQWgMZVvyt27c3uRp5O1fezHccF3iZsjcDGcOsdpMdgsJnNJx
 SThOGrmm5RrpxAVrAhup0ewS9g==
X-Google-Smtp-Source: AMsMyM76dku7eo26xUjLNZQeUk/titwJubIV98IfLGCGemAO20FNfrY/Fk1IvItFJYAFHb3c6c4yBw==
X-Received: by 2002:a5d:4f81:0:b0:21e:2cd7:25df with SMTP id
 d1-20020a5d4f81000000b0021e2cd725dfmr2034736wru.439.1664452191691; 
 Thu, 29 Sep 2022 04:49:51 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 g14-20020adfe40e000000b0022ae8b862a7sm6424485wrm.35.2022.09.29.04.49.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 04:49:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 94FF51FFBD;
 Thu, 29 Sep 2022 12:42:35 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 minyihh@uci.edu, ma.mandourr@gmail.com, Luke.Craig@ll.mit.edu,
 cota@braap.org, aaron@os.amperecomputing.com, kuhn.chenqun@huawei.com,
 robhenry@microsoft.com, mahmoudabdalghany@outlook.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Alexandre Iooss <erdnaxe@crans.org>
Subject: [PATCH  v1 38/51] docs/devel: move API to end of tcg-plugins.rst
Date: Thu, 29 Sep 2022 12:42:18 +0100
Message-Id: <20220929114231.583801-39-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220929114231.583801-1-alex.bennee@linaro.org>
References: <20220929114231.583801-1-alex.bennee@linaro.org>
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
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20220921160801.1490125-9-alex.bennee@linaro.org>
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


