Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A683A5F4478
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Oct 2022 15:41:26 +0200 (CEST)
Received: from localhost ([::1]:57664 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofiAn-0004py-OX
	for lists+qemu-devel@lfdr.de; Tue, 04 Oct 2022 09:41:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgN-0007NW-6z
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:09:59 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ofhgJ-00008P-ON
 for qemu-devel@nongnu.org; Tue, 04 Oct 2022 09:09:58 -0400
Received: by mail-wr1-x42e.google.com with SMTP id bq9so21256172wrb.4
 for <qemu-devel@nongnu.org>; Tue, 04 Oct 2022 06:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=fhoAi/xjuDoN5VZ/rqThN4w2DfKiDIs3NBYh2o+mArw=;
 b=n4rhT87wP1uUGOIK3z0zbJAnigrr8SZCtlcoGCuIfeqAPmWXHHNEoDR04Blwvj440J
 pJS/Be3xw9y+ssJsjMcupKA3m9s5QcBqZghwITsom3G64HkWOq0VNQ8jcHRh+FvSGKEy
 GNyLXMjhGkvHcdUdTY+Mc0ZHNWActa5L+Te2Bl1he/uXEga+6wEN6T2gJc30YqhlKrTG
 0MAzFtU5SJgJRFJzOvqeIy6ZSemZoVPeGRwgmTj04vYSJcK6sYBYwS6TaT86+OYriRyb
 k+W/4kjq2e4qnT1Yn5mKQr2IiVex3+12aX/v1PwgX1WTLyQJ7GZtOkk+5OdklV4mKtDu
 /XkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=fhoAi/xjuDoN5VZ/rqThN4w2DfKiDIs3NBYh2o+mArw=;
 b=sjH1yFfAKjA2lYl52Kx31rXaLQtNCbEwrjXLhktyCMDIz65zuRyWe/qB23ZLWVEd1+
 9nDTKv/MjzbJljXqT8ES3O4k7VkISg0HQ1W80Iy0qyDDU3hg+OPstYOk5+ImhHlqHOBU
 D7rMPKdZEmcHvXixaQVub3bADVatiuaSLd2WQ7TDOwhuM6JLYXTvmHoJmlTU+pVL4EiR
 7Ds0Ze9cNzyD/GwJp87CLqVEaoUlaCOGBs0Q4yyTL6GV4LMXqoyvS7a7lii7t2ub4S+f
 0WXbAzZneUTeYgS1vL7VN4PeAEtQMOw/foicPtJsfgaiCXtRV6jPpz3Li24R8YQOIXgs
 zWrQ==
X-Gm-Message-State: ACrzQf2rzmazH7t6wkSpe62WZzecyPcXxU3oBi+x4rP8i6xBxA6IOLjk
 iWNgZarLvV4ZXF7lEPCGJSYEsg==
X-Google-Smtp-Source: AMsMyM6OBuvIosstkG6UxFgDu+Nb00iz2VRoYUYtFxVvgLwUY04/6hte5U/zUHKk/P1vi4CbSeTUcw==
X-Received: by 2002:adf:f001:0:b0:22e:4f85:3abc with SMTP id
 j1-20020adff001000000b0022e4f853abcmr1908878wro.107.1664888993590; 
 Tue, 04 Oct 2022 06:09:53 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a5d568d000000b0022584c82c80sm12446271wrv.19.2022.10.04.06.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Oct 2022 06:09:51 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 9736B1FFDA;
 Tue,  4 Oct 2022 14:01:42 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Alexandre Iooss <erdnaxe@crans.org>,
 Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: [PULL 38/54] docs/devel: move API to end of tcg-plugins.rst
Date: Tue,  4 Oct 2022 14:01:22 +0100
Message-Id: <20221004130138.2299307-39-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221004130138.2299307-1-alex.bennee@linaro.org>
References: <20221004130138.2299307-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Message-Id: <20220929114231.583801-39-alex.bennee@linaro.org>

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


