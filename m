Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6010563762
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Jul 2022 18:06:38 +0200 (CEST)
Received: from localhost ([::1]:56728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o7JAD-0000YR-Sw
	for lists+qemu-devel@lfdr.de; Fri, 01 Jul 2022 12:06:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o7J3r-0005qu-G2
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:00:05 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1o7J3n-0001wk-FV
 for qemu-devel@nongnu.org; Fri, 01 Jul 2022 12:00:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1656691198;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ox4Xsr5IIBa2MFVKUDBG2RSJB9QVYlygPUGinGBDL2A=;
 b=b929bKepUEoO4VfEK/vfFeNAQVDLB1+kgqL2V5+RrM2GzRdBJYyRF/lYQJnsFUDKjL3blY
 p+Jcf0ezUZ7TN3XLfhL2YHoIFc1CKeX78AE603DFdxDEBzQqdniOaVQJRYY9z9A/iiSsgF
 ooYgNXctXfrvVg4XMD8B542I/FUFlqk=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-61-cloRC1OSNG2Yp0uY-h_1ZA-1; Fri, 01 Jul 2022 11:59:57 -0400
X-MC-Unique: cloRC1OSNG2Yp0uY-h_1ZA-1
Received: by mail-oi1-f198.google.com with SMTP id
 j6-20020aca3c06000000b00335214e5fbfso1555756oia.3
 for <qemu-devel@nongnu.org>; Fri, 01 Jul 2022 08:59:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ox4Xsr5IIBa2MFVKUDBG2RSJB9QVYlygPUGinGBDL2A=;
 b=Y7vSL4szth1Fn6yjnPh2NWorcd6Htqzi2jdogznA6cemiDa3G2F+cCqSdPiv6Zkohh
 nOhaCN3tzGJJEtD83rA/3vm3RL0ICACPBcYVHjA4Bntv8PXrMK2PbfF/ovNQI6wLhuXV
 qDxej3BRZwU1jt3KxZLhav9yWnIeVy555yLVA8JId+aXIxgB4gNG7xLNyS9HpvwM68e/
 FGVr/II7NMxEqrtgMclZT2boH6/E7Nvib4f81Cf7YVr2qF0P0mBICpDk+c/mwzkywfKZ
 I26eq4XQr/JweY7TqqlNdJqCw7+61IMBsHjWpFTX/GSgJmgANclNed1qOfnSGh/Jjnms
 xq+Q==
X-Gm-Message-State: AJIora84g4ruA9/gJ/rsByLeRjr2bF2ns4hhK0t0BZIleF75fHdwuOtN
 ff1sVDWHIREVP668Tad4r0AHin0N8sVs4wd6ch1jFHYMSScHMLSH4vEsYYZzVdTqg5AZ9wbKrac
 001fD6hewit7IArs=
X-Received: by 2002:a05:6808:30a5:b0:335:34dd:ef41 with SMTP id
 bl37-20020a05680830a500b0033534ddef41mr10082353oib.50.1656691196825; 
 Fri, 01 Jul 2022 08:59:56 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1ulGU2rApjCVHTxbzUV5aJDYBLJrY7PdrIC1NHS0tWcHicyZzBRs65HXAWWwUSUFdV2MbuhBw==
X-Received: by 2002:a05:6808:30a5:b0:335:34dd:ef41 with SMTP id
 bl37-20020a05680830a500b0033534ddef41mr10082333oib.50.1656691196647; 
 Fri, 01 Jul 2022 08:59:56 -0700 (PDT)
Received: from localhost.localdomain ([2804:431:c7f1:da6a:610c:873d:4fe2:e6ce])
 by smtp.gmail.com with ESMTPSA id
 n39-20020a056870972700b000f333ac991fsm14884274oaq.27.2022.07.01.08.59.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Jul 2022 08:59:55 -0700 (PDT)
From: Leonardo Bras <leobras@redhat.com>
To: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] QIOChannelSocket: Fix zero-copy flush returning code 1
 when nothing sent
Date: Fri,  1 Jul 2022 12:59:34 -0300
Message-Id: <20220701155935.482503-2-leobras@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220701155935.482503-1-leobras@redhat.com>
References: <20220701155935.482503-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If flush is called when no buffer was sent with MSG_ZEROCOPY, it currently
returns 1. This return code should be used only when Linux fails to use
MSG_ZEROCOPY on a lot of sendmsg().

Fix this by returning early from flush if no sendmsg(...,MSG_ZEROCOPY)
was attempted.

Fixes: 2bc58ffc2926 ("QIOChannelSocket: Implement io_writev zero copy flag & io_flush for CONFIG_LINUX")
Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 io/channel-socket.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/io/channel-socket.c b/io/channel-socket.c
index 4466bb1cd4..698c086b70 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -716,12 +716,18 @@ static int qio_channel_socket_flush(QIOChannel *ioc,
     struct cmsghdr *cm;
     char control[CMSG_SPACE(sizeof(*serr))];
     int received;
-    int ret = 1;
+    int ret;
+
+    if (!sioc->zero_copy_queued) {
+        return 0;
+    }
 
     msg.msg_control = control;
     msg.msg_controllen = sizeof(control);
     memset(control, 0, sizeof(control));
 
+    ret = 1;
+
     while (sioc->zero_copy_sent < sioc->zero_copy_queued) {
         received = recvmsg(sioc->fd, &msg, MSG_ERRQUEUE);
         if (received < 0) {
-- 
2.36.1


