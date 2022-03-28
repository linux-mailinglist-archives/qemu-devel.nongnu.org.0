Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 705654EA256
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 23:20:27 +0200 (CEST)
Received: from localhost ([::1]:53856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwmo-0001Sx-FF
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 17:20:26 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiM-0001am-H3
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:50 -0400
Received: from [2a00:1450:4864:20::12e] (port=46735
 helo=mail-lf1-x12e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiL-0003pI-05
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:50 -0400
Received: by mail-lf1-x12e.google.com with SMTP id e16so26930749lfc.13
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fZKapn44JNSnvlOlsZjDBxj/jSMFPLsC8E1aDAQA7GM=;
 b=MQqdkG+IyOLTOI/nH3x5P0AbDBvI89sLmcA2WfyRqskzLkBfWQ95/ljbIKSRX4u15v
 ObeojMVEW/zwQpSZgJiIM1g7ICp8GMiqRWHOSIoVVps1CzljL33mpKegcJedXNbHzZhR
 vXPAIf7weziAhRJIwwuc1OOf1gwLFg2KOZ4yLocaFgQSiNxPs8So2t/CZtXb8otAEtI7
 Eb9vPG1IzgUPH/W61YiDqWQgeyJEeC+qHgYLyXsBmMq0L6wT2V8W1Kf2L5fLbvTuUI3R
 zYY7ygdLp2eB3SLuySncbazdnYoMDmnuXLdXwqSfU3PJINN71n8YnYO5RBISLR+OAFkK
 wXlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fZKapn44JNSnvlOlsZjDBxj/jSMFPLsC8E1aDAQA7GM=;
 b=a3ypfTdTSRjMC7gweaIGaK86hzJxAD3U4FaLP02CzdaESkjkRbSNvPkR9hARpAoKAQ
 1N44E/vTr6Q7hjhxxxjAB5c/7kh+u7oaHuXqS7MOoJpsKU/h/KbDyXNXI9fDNdL+dBrs
 3BDLuMnS+P5jmc3Irfk5eCTdXDaHrFVGtG5KA2/nI/b8XdoGUmzz1w8Sn8Qi9v7VB+Er
 oz3pwIkhkGS+8Q9RUPOsAjAWNzP/ooi7SDjCnRV+tIMWXZWSCQvCqBre8NE+kOAMVFOl
 8eTe6mwomnPy4iYlaZr9RWBzYt3sJeqh0grhXCkDH9WjbYcjvg2Us1zj73uK81pYmWrG
 qQ7Q==
X-Gm-Message-State: AOAM531eqHkmfCmFl/FRwkUdkk8cu7mVzoCqO4F/RmPxAsqfdVIV6b1P
 PKkObpi3f/VsD61f2TrWbtEDHk2oyajjzw==
X-Google-Smtp-Source: ABdhPJy6zsAMaM+lyFqDnpqftyaBL9IdNCdfmrljdSbTf4HZaVFEPjnX3bzRrkw3h8S8xkiajDsaVw==
X-Received: by 2002:a05:6512:2214:b0:44a:348a:d6d with SMTP id
 h20-20020a056512221400b0044a348a0d6dmr21544010lfu.506.1648502147198; 
 Mon, 28 Mar 2022 14:15:47 -0700 (PDT)
Received: from localhost.localdomain ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1855827ljh.45.2022.03.28.14.15.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:15:46 -0700 (PDT)
From: Maxim Davydov <maxim.davydov@openvz.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/9] msmouse: add appropriate unregister handler
Date: Tue, 29 Mar 2022 00:15:34 +0300
Message-Id: <20220328211539.90170-5-maxim.davydov@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220328211539.90170-1-maxim.davydov@openvz.org>
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12e;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lf1-x12e.google.com
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
 chardev/msmouse.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/chardev/msmouse.c b/chardev/msmouse.c
index eb9231dcdb..2cc1b16561 100644
--- a/chardev/msmouse.c
+++ b/chardev/msmouse.c
@@ -146,7 +146,9 @@ static void char_msmouse_finalize(Object *obj)
 {
     MouseChardev *mouse = MOUSE_CHARDEV(obj);
 
-    qemu_input_handler_unregister(mouse->hs);
+    if (mouse->hs) {
+        qemu_input_handler_unregister(mouse->hs);
+    }
 }
 
 static QemuInputHandler msmouse_handler = {
-- 
2.31.1


