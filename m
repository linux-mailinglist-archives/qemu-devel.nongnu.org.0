Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9736EAF69
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 18:44:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pptqw-0005Cj-DT; Fri, 21 Apr 2023 12:43:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqt-0005CM-PA
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:15 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <kariem.taha2.7@gmail.com>)
 id 1pptqs-00037n-As
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 12:43:15 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3f09b9ac51dso56083595e9.0
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 09:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1682095392; x=1684687392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7jgiE25TkQPb7QKZwOmBGpdrqCl81qjrHt2UK3yyPZ4=;
 b=k61pcPV4/N50xTq0JG1GP4qfD5SUHHHvxOD4IdCdZIwM/V0nylzI8EAKRs2seMvwMN
 aq9LSSTZN1YYvAyW6bwnmU7AbY+trcqLDzh7H+Nuq/YPt8mQxuOUa/52hYHpQussN8rg
 dvLb8WBJJp89GNwHIw0t3Oe+a+/kfXrFuz2XNYQXV8UAsvMCpDPfOc8lvE5DUyNfCsi5
 Z3N3iL9/PNhJYSEgoSege0xEz48cPHgHzs3IfXYKd31lt7jd3g9LRuCvwA1LFmQUfsfs
 UDxBBMOVF91qBuyZR74e45z7PVJFwigb4TLKMrQZwe6dekUziHaK0PZPfJv3DxhdxQga
 pcsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682095392; x=1684687392;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7jgiE25TkQPb7QKZwOmBGpdrqCl81qjrHt2UK3yyPZ4=;
 b=MhbS40xPog3DD1Qas8nw0C1J6ugWA44OvaOypufrjDsSb4agoweZXwO+Q0EhS4CxYH
 66Bu4aZcrJRyl+pgL8Kxx39qP3R/E/VbVVMQAblHb84/Nw486AHuCx90f/yXbbBT6MPc
 MjooedENyyqiQJB4/NNsNxLWGONCs66DeqV+dBOIPjYM5bal8QvW/GYoPT9tl/RGn1im
 IEPY6ySZR+zAKUKKPe2x/6hv/YisfC/YAWRj4oZ+2PA92qdfRvAo71x3yRKubAsbKeCA
 WmkuylylBjuKt9BD1OmlM5Gnzijyt33nb4GsVoEvodxe53Wz9EqctWtottayb9/kEzbJ
 xZWg==
X-Gm-Message-State: AAQBX9d8q848ACCCWtpZN0wVAWHydI9AUoPcHfvjz6woR9+w/D4RUx/+
 emcMMELoEQZx9WKNS5jbfVquzX5dpc0=
X-Google-Smtp-Source: AKy350aGgl+ypOzZorYUKGzoUlbWLNPu8FWzsRgsHZh+Oj5Uu3DpfPmu6P6OwMdo7McUPB1TGmzR/Q==
X-Received: by 2002:a5d:620b:0:b0:2fb:48a9:f554 with SMTP id
 y11-20020a5d620b000000b002fb48a9f554mr8695520wru.2.1682095392496; 
 Fri, 21 Apr 2023 09:43:12 -0700 (PDT)
Received: from karim.my.domain ([197.39.145.151])
 by smtp.gmail.com with ESMTPSA id
 z16-20020a05600c221000b003ee1b2ab9a0sm5266658wml.11.2023.04.21.09.43.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 09:43:12 -0700 (PDT)
From: Karim Taha <kariem.taha2.7@gmail.com>
To: qemu-devel@nongnu.org
Cc: imp@bsdimp.com,
	Karim Taha <kariem.taha2.7@gmail.com>
Subject: [PATCH v3 06/11] Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
Date: Fri, 21 Apr 2023 18:41:55 +0200
Message-Id: <20230421164200.2913-7-kariem.taha2.7@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
References: <20230421164200.2913-1-kariem.taha2.7@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=kariem.taha2.7@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Build bsd-user/bsd-socket.c.

Add bsd-user/bsd-socket.c to meson.build.

Signed-off-by: Karim Taha <kariem.taha2.7@gmail.com>
---
 bsd-user/meson.build | 1 +
 1 file changed, 1 insertion(+)

diff --git a/bsd-user/meson.build b/bsd-user/meson.build
index 5243122fc5..f648bd3554 100644
--- a/bsd-user/meson.build
+++ b/bsd-user/meson.build
@@ -7,6 +7,7 @@ bsd_user_ss = ss.source_set()
 common_user_inc += include_directories('include')
 
 bsd_user_ss.add(files(
+  'bsd-socket.c',
   'bsdload.c',
   'elfload.c',
   'main.c',
-- 
2.40.0


