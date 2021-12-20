Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E53F147B4C2
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 22:09:28 +0100 (CET)
Received: from localhost ([::1]:33672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzOtz-000495-MF
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 15:04:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38786)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzOq3-0001pq-V5
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:01:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27349)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mzOq2-00038p-GU
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 15:00:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640030449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Esu57sWgC3/UQ9aIRkG9aAmymu76n4chXDeJH006p+M=;
 b=Qb0GWWFKxYpk/9DZL2mvlOdbttokt6kH4xmSmEhhiLJF/b0bLOjEsjkTW2JrnogaU1OMpV
 a0rxthblcvCgD1sY5UCPtrFLNrMSxUx0uxqQz2XNcjSV01/mtgnrEIcigsblBr1kkaO+Pp
 wXM5jHL+EdZb1niiP7c9oK0RIXpSK5w=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-618--VZgZtzGMVCNy_eQ9VbWUw-1; Mon, 20 Dec 2021 15:00:48 -0500
X-MC-Unique: -VZgZtzGMVCNy_eQ9VbWUw-1
Received: by mail-wm1-f72.google.com with SMTP id
 a203-20020a1c7fd4000000b0034574187420so74006wmd.5
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 12:00:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Esu57sWgC3/UQ9aIRkG9aAmymu76n4chXDeJH006p+M=;
 b=YmWP4zSjgKv8a83DH30/S0F0ONmzpis77O/TuwLMasjEI34QsgEJFiuX0mEtaMjMO7
 xO+6xn9Kh8r6kTzU+eemtGnrWur9iNAYYtX9ZZRJS740iFiGnPeAZgH6gWHxNTrtC8TH
 HSw66Yv90L3/LJDMe+8GY+2pB8yRHrvLcgf1wyrW6uu29V4Lg0auiRpz/0P2wjwdFmYg
 arPQNT0wUYBuySdJKK/BfEl2RIjMCwX1trUOqiwQ8N7dIUczEOn6hJYJHe26AZENlSMI
 Gq++pV+WRurFqfGbY5JFLwsBoDw9LKXYwnYSLpvxM/M/ATq2kYsouc6/XEOMt9fQEU9b
 yhlA==
X-Gm-Message-State: AOAM531Db4A0YjiWTsrqPYXBhR+1JdyDxzJEXML1lHxufGOpqd7UqqYD
 SPDz/tYaksvLZhggEd1S8iDtuHX3sQM9pRCAp07fgEDewAZXmAwM0euerXf6otqgxLho3nvkicb
 PB5xnxyu68aK0VTSDvVI21WvfpZj8uSLJIMRb3PXMJ1p2L8crmJCuAytMUADy2p2f
X-Received: by 2002:adf:a489:: with SMTP id g9mr13714446wrb.235.1640030446690; 
 Mon, 20 Dec 2021 12:00:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwh8PZDOsTg1dJfgmw/yZ8CXrnCyp7RYaLkni4pwgCEeO435V/b2DV3M1GuSMwTV9W4JxiQ9w==
X-Received: by 2002:adf:a489:: with SMTP id g9mr13714428wrb.235.1640030446532; 
 Mon, 20 Dec 2021 12:00:46 -0800 (PST)
Received: from x1w.redhat.com (174.red-83-50-185.dynamicip.rima-tde.net.
 [83.50.185.174])
 by smtp.gmail.com with ESMTPSA id f6sm371074wmq.6.2021.12.20.12.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Dec 2021 12:00:46 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/2] qapi/block: Restrict vhost-user-blk to
 CONFIG_VHOST_USER_BLK_SERVER
Date: Mon, 20 Dec 2021 21:00:34 +0100
Message-Id: <20211220200034.2233987-3-philmd@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211220200034.2233987-1-philmd@redhat.com>
References: <20211220200034.2233987-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.209,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Do not list vhost-user-blk in BlockExportType
when CONFIG_VHOST_USER_BLK_SERVER is disabled.

Fixes: 90fc91d50b7 ("convert vhost-user-blk server to block export API")
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 qapi/block-export.json | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/qapi/block-export.json b/qapi/block-export.json
index c1b92ce1c1c..6bc29a75dc0 100644
--- a/qapi/block-export.json
+++ b/qapi/block-export.json
@@ -277,7 +277,8 @@
 # Since: 4.2
 ##
 { 'enum': 'BlockExportType',
-  'data': [ 'nbd', 'vhost-user-blk',
+  'data': [ 'nbd',
+            { 'name': 'vhost-user-blk', 'if': 'CONFIG_VHOST_USER_BLK_SERVER' },
             { 'name': 'fuse', 'if': 'CONFIG_FUSE' } ] }
 
 ##
-- 
2.33.1


