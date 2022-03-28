Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA0FA4EA255
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 23:20:21 +0200 (CEST)
Received: from localhost ([::1]:53698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYwmi-0001MR-LX
	for lists+qemu-devel@lfdr.de; Mon, 28 Mar 2022 17:20:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiP-0001js-Nn
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:53 -0400
Received: from [2a00:1450:4864:20::12f] (port=35608
 helo=mail-lf1-x12f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <maxim.davydov@openvz.org>)
 id 1nYwiN-0003rm-Oz
 for qemu-devel@nongnu.org; Mon, 28 Mar 2022 17:15:53 -0400
Received: by mail-lf1-x12f.google.com with SMTP id h7so26997498lfl.2
 for <qemu-devel@nongnu.org>; Mon, 28 Mar 2022 14:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=openvz-org.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BYqdBYE6uDLQHGP/gZTw0UYrRiZaRuFE2yevThnIFfA=;
 b=NPcP2aVPokjrv13wzjDp1DuTXPjj1dCafYjvh/UGXx3cTxPqTSLKXU3eHDCe6MzcRV
 f2H3Ij6zr6RC6mFHLI8e0lVMImW6qDsJdebIRyY02GV/wMBUAx/LpmL41sYHXRcvwEmQ
 Jdr8htsCGHdru4eOfZNWdU6CUq2sFkpP/nOIHJL7sKpPD82dPt0HyABRLDNFUr9COuoY
 8eGpIkZmKRe0YEP7VK77AOuPj6ldQi4lrwGe5AsjUquOcZDb0tXW8qqI7X8FuziqpX8a
 y3p9IwPlDkMsKfD2zb/A6StliVgQZi7K7gOH8LdrNiS4LM4GiHf1K17y33Z788DCuK0u
 oGcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BYqdBYE6uDLQHGP/gZTw0UYrRiZaRuFE2yevThnIFfA=;
 b=N0jbYBuNXQrjKpxmOB3QcRl/4TpCBo0rEevX0YRAjpmNH0BH9wws8VeGQinn3C4gSk
 dwXI/BPq202NN+BfJ9ioMHY0iYPqPEIlnZXvY0l1mN54CXuvO318rE3CyfEu8iRDQ5ww
 oB+NK1zsyAnud5e+mej2LYH6Zkdp61CMca6gj9HFf9ugar+sP69k5YuzdKxhnhcUcZzU
 iXgTWUpLp5BKskyT+1kuR24fswwW9y78Rb7SIVkgF+HgJ5CMl8eW60utQ+VYaFEw2r/3
 gvlp4k9Hf27bM35/ZSlQ2EtITXFfTHWr+EYb2/dGS33aH7aTYz3D8fqQjKn0H4dTQoGD
 jReQ==
X-Gm-Message-State: AOAM530U+jpW0xmdLKqQLQWnaE3vppSfA6Vbg7tClm6EbImErYqHGjyH
 otliGfvVnIE/PCVeTDFqnq7N+JyqtmEj4Q==
X-Google-Smtp-Source: ABdhPJxGUDoZarq620vEwvEQeZzY6kbaOMlp87tWl4YoozSCCl72Fg6bx28BUdzVVY92//5CCTixjw==
X-Received: by 2002:a05:6512:1195:b0:44a:6e0a:115b with SMTP id
 g21-20020a056512119500b0044a6e0a115bmr17512823lfr.115.1648502150168; 
 Mon, 28 Mar 2022 14:15:50 -0700 (PDT)
Received: from localhost.localdomain ([93.175.1.181])
 by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1855827ljh.45.2022.03.28.14.15.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 14:15:49 -0700 (PDT)
From: Maxim Davydov <maxim.davydov@openvz.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 6/9] chardev: add appropriate getting address
Date: Tue, 29 Mar 2022 00:15:36 +0300
Message-Id: <20220328211539.90170-7-maxim.davydov@openvz.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220328211539.90170-1-maxim.davydov@openvz.org>
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::12f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::12f;
 envelope-from=maxim.davydov@openvz.org; helo=mail-lf1-x12f.google.com
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

Attempt to get address after initialization shouldn't fail on assert in
the qapi automatically generated code. As a possible solution, it can
return null type.

Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>
---
 chardev/char-socket.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/chardev/char-socket.c b/chardev/char-socket.c
index fab2d791d4..f851e3346b 100644
--- a/chardev/char-socket.c
+++ b/chardev/char-socket.c
@@ -33,6 +33,7 @@
 #include "qapi/clone-visitor.h"
 #include "qapi/qapi-visit-sockets.h"
 #include "qemu/yank.h"
+#include "qapi/qmp/qnull.h"
 
 #include "chardev/char-io.h"
 #include "chardev/char-socket.h"
@@ -1509,6 +1510,14 @@ char_socket_get_addr(Object *obj, Visitor *v, const char *name,
 {
     SocketChardev *s = SOCKET_CHARDEV(obj);
 
+    QNull *null = NULL;
+
+    /* Return NULL type if getting addr was called after init */
+    if (!s->addr) {
+        visit_type_null(v, NULL, &null, errp);
+        return;
+    }
+
     visit_type_SocketAddress(v, name, &s->addr, errp);
 }
 
-- 
2.31.1


