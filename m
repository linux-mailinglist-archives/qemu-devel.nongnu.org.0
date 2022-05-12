Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFEEF5258C8
	for <lists+qemu-devel@lfdr.de>; Fri, 13 May 2022 01:54:49 +0200 (CEST)
Received: from localhost ([::1]:59500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npIdt-0004jB-2T
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 19:54:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npIaR-0007DC-Bd
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:51:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <afaria@redhat.com>) id 1npIaN-0005gW-Hz
 for qemu-devel@nongnu.org; Thu, 12 May 2022 19:51:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652399470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=juphkoDYaBAl4VcdnicBmMRCWBXv/XQ424qePsr/oS8=;
 b=UlcOEgpNmoIALvswR1+HbwpUk1/wpyGKa5dFA2j2XbcCS919Gt+zqPyKozRQcDmF1KiUs4
 lfr7q2GAE3qBkVrKeP5ehCCogTVz7Lpi85NuB06GSGbEAR0tPIWFVUUN7nbAsY65p3uIk4
 yt4yvwaHP/9mC010yWL5iIO9GXF+IQA=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-IOFprhpANDyKDXVCPUpZqw-1; Thu, 12 May 2022 19:51:08 -0400
X-MC-Unique: IOFprhpANDyKDXVCPUpZqw-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a05600c0b4500b003941ca130f9so2174682wmr.0
 for <qemu-devel@nongnu.org>; Thu, 12 May 2022 16:51:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=juphkoDYaBAl4VcdnicBmMRCWBXv/XQ424qePsr/oS8=;
 b=LMbrTzRBZl4uf2vDm7BiG9GsubIqOlR5BbCF5W7IygU+113BYd+hciqOIseA0mcMyu
 SVGrf7L6h4bbYP63YEoctGD6RptlSBc/SDoFSP7z0Xz2E39gLQPhBk1NnG3bJ5UV8A+e
 /qbZz9QK8+5eFCw5UVrIJ6YRGY7KSyB+hnnCSxiGULExIBqmVFLAQLhMgII29hImhBo/
 DERHZtY6trAJEjY4hs8q/aZWfyhqi5EnHmMX66NBgNL1nCkZ+omnK2/Wm3bU1xeHaYcf
 nCHsiRWpue87aJOg2I4S0rPR7rnYT0efrIl7rY0Pm5jZgTlioPBeNae2zq5hup4qX4Gk
 W2bQ==
X-Gm-Message-State: AOAM532/TeulC+T4R2h4kiZac35cBDGMlaEIedIX1yYvLN06RHGMh2ng
 0oznnHl+c+fYOEs+4z2HoWdg5oZUQmkVIGtwpvgCdMK+20mlm3BO2tN6QAmBUTMu5Sbg9/T4pmB
 3T5yJwBhG7p0CkFatLbI01NW8eOUfZxC4ilvhHOLBvR/N7eeLsw9lIUrDYBjVHkc1
X-Received: by 2002:a05:600c:48b:b0:394:2ee9:5847 with SMTP id
 d11-20020a05600c048b00b003942ee95847mr12846373wme.117.1652399467119; 
 Thu, 12 May 2022 16:51:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzb9NPGpXBB9CqN550Rzp3OqlSH0hFVAixAC+gcA9vKqd471m7shjwMReUO7rzrJ0ZEEq+jbw==
X-Received: by 2002:a05:600c:48b:b0:394:2ee9:5847 with SMTP id
 d11-20020a05600c048b00b003942ee95847mr12846354wme.117.1652399466661; 
 Thu, 12 May 2022 16:51:06 -0700 (PDT)
Received: from DESKTOP-E7ACR7D.lan ([2001:8a0:f4d9:2101:a4fa:5f93:755f:6249])
 by smtp.gmail.com with ESMTPSA id
 a25-20020adfb519000000b0020c5253d90asm678577wrd.86.2022.05.12.16.51.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 16:51:06 -0700 (PDT)
From: Alberto Faria <afaria@redhat.com>
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Alberto Faria <afaria@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 4/7] block: Make bdrv_co_pwrite() take a const buffer
Date: Fri, 13 May 2022 00:51:00 +0100
Message-Id: <20220512235103.2224817-1-afaria@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220512233849.2219275-1-afaria@redhat.com>
References: <20220512233849.2219275-1-afaria@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=afaria@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

It does not mutate the buffer.

Signed-off-by: Alberto Faria <afaria@redhat.com>
---
 include/block/block_int-io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/block/block_int-io.h b/include/block/block_int-io.h
index bb454200e5..d4d3bed783 100644
--- a/include/block/block_int-io.h
+++ b/include/block/block_int-io.h
@@ -65,7 +65,7 @@ static inline int coroutine_fn bdrv_co_pread(BdrvChild *child,
 }
 
 static inline int coroutine_fn bdrv_co_pwrite(BdrvChild *child,
-    int64_t offset, unsigned int bytes, void *buf, BdrvRequestFlags flags)
+    int64_t offset, unsigned int bytes, const void *buf, BdrvRequestFlags flags)
 {
     QEMUIOVector qiov = QEMU_IOVEC_INIT_BUF(qiov, buf, bytes);
     IO_CODE();
-- 
2.35.3


