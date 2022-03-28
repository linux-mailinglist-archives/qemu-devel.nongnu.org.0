Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AE574EA257
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 23:20:31 +0200 (CEST)
Received: from localhost ([::1]:53954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwms-0001XE-K8
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 17:20:30 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiO-0001gb-GR
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:52 -0400
Received: from [2a00:1450:4864:20::12a] (port=40700
 helo=mail-lf1-x12a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiN-0003rS-38
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:52 -0400
Received: by mail-lf1-x12a.google.com with SMTP id t25so26963357lfg.7
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xJSmV3NZ+AOVy0EQfz+E+II5VBJktTYUyBL6qJb89d0=;
 b=ZIJ4NMiTtIVgNAkkh1T3dFB0Al14YBtAUP/exbs6srLToI/1xiDJD2quQpk7TYU5W5
 TUlSWHvq+pHsYcHEIB1t1pHlgmzZnmx/Ks81+g7snIB0KopvMqxO5zEi5d3u055JTg+0
 C4pe/0ELnuopk3Z9kV3StLX29eA5r/FAaHFIOsSLeh4jMuQYD7XtS2p6xq3oIiojSPd5
 4sbe8NIlSeI1wU5e52JmD35vIxJKiN8FhwCyLpQ6pZQ5U98IyfR2fCgy1GTdFV1ZrKt6
 yXnHItiVU7uZfL5PUALcOYmXg5id2BVWIp+wCltPTQWI52RUYHFRsVm0uPgJcPzecnx/
 Q4Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xJSmV3NZ+AOVy0EQfz+E+II5VBJktTYUyBL6qJb89d0=;
 b=zkQSnurS8Z8Aksrnv67crLfExCfctSUIggcA5F3WE8Agk/jaovQsY19XvGGcLtiJuy
 0vCMr39S6Hv9H/LiifZDKnVDrH0oHIVkomB5f7brconxNXXw+iXkMyeYkKZZh9dOHaim
 X20E287nRvInbTBvzHA75nrO3cVcTss9xM4unlIaCIHRXcwENSCw9X7R4lNn5oaGRdRq
 sqaFXI4hVNoXk6biEsziClcntJEPkqAIVOJIkHuTAHzx55Muirpk8957um029tx9eFrj
 FMo9pR7fZffzOOWGbirXnsvUSwcpj1Ue1Rf8ou+X2WauJMADEWkbp4bL06Ci/QYfjw99
 vOIQ==
X-Gm-Message-State: AOAM531jJaIEQNPwda2rlz7KiI42j54nQ9P6B2vNXduEvthuSPYs3X9H
 SRw3SI+Zzi5NlOpB3vc7xCf9T7DMvgJqpg==
X-Google-Smtp-Source: ABdhPJxcJt7FOl5RzSBCR+nTKQ8q4kKuJ0dmaGdN/lnOslPl5HjyGhngJS7JCb4l4r0MJ13kqNyP2g==
X-Received: by 2002:a05:6512:2341:b0:448:2465:7cf with SMTP id
 p1-20020a056512234100b00448246507cfmr20604947lfu.474.1648502148584; 
 Mon, 28 Mar 2022 14:15:48 -0700 (PDT)
Received: from localhost.localdomain ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1855827ljh.45.2022.03.28.14.15.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:15:48 -0700 (PDT)
From: Maxim Davydov <maxim.davydov@openvz.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 5/9] wctablet: add appropriate unregister handler
Date: Tue, 29 Mar 2022 00:15:35 +0300
Message-Id: <20220328211539.90170-6-maxim.davydov@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220328211539.90170-1-maxim.davydov@openvz.org>
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lf1-x12a.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: eduardo@habkost.net, v.sementsov-og@mail.ru, berrange@redhat.com,
 xiaoguangrong.eric@gmail.com, mst@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, f4bug@amsat.org, chen.zhang@intel.com, armbru@redhat.com,
 wangyanan55@huawei.com, marcandre.lureau@redhat.com, imammedo@redhat.com,
 lizhijian@fujitsu.com, pbonzini@redhat.com, ani@anisinha.ca, den@openvz.org,
 maxim.davydov@openvz.org, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Attempt to finalize msmouse after initalization brings to segmentation
fault in QTAILQ_REMOVE.

Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
---
 chardev/wctablet.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/chardev/wctablet.c b/chardev/wctablet.c
index e8b292c43c..43bdf6b608 100644
--- a/chardev/wctablet.c
+++ b/chardev/wctablet.c
@@ -319,7 +319,9 @@ static void wctablet_chr_finalize(Object *obj)
 {
     TabletChardev *tablet = WCTABLET_CHARDEV(obj);
 
-    qemu_input_handler_unregister(tablet->hs);
+    if (tablet->hs) {
+        qemu_input_handler_unregister(tablet->hs);
+    }
 }
 
 static void wctablet_chr_open(Chardev *chr,
-- 
2.31.1


