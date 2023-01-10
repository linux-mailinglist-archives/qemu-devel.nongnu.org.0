Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC4846645A7
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 17:11:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFH6c-0003aQ-OO; Tue, 10 Jan 2023 11:04:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6J-0003PZ-9L
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pFH6H-00056o-Pz
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 11:03:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673366624;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JxFwuoY0l5szGFqjgOPodO6ocLa/m3CKjP5XJeoQJfw=;
 b=aHgiDQVvarXl69BPQ4jeLmKgYkE1d7ttbvjhC2agHwDuCunZ8c0L1ikbztT52uQG+ZICrw
 0ZEatmhgD2fkKgcNy89Ovd7e04rkGo48qGn2xVLdouoYikFG/+WaxQsfVnM+x1oa5KQD16
 IaI6tjYRKTHVaNsm34TPKpI9583MmWs=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-eAmRQmyHMMmYo90XzMEy_g-1; Tue, 10 Jan 2023 11:03:43 -0500
X-MC-Unique: eAmRQmyHMMmYo90XzMEy_g-1
Received: by mail-wm1-f72.google.com with SMTP id
 m7-20020a05600c4f4700b003d971a5e770so6490017wmq.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 08:03:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JxFwuoY0l5szGFqjgOPodO6ocLa/m3CKjP5XJeoQJfw=;
 b=HIWOUblKhtwvFMTeNm/MJ3BJ59p5+Kqsr7OgGWsg5IkgXoE2I8lDzaBUpH70MKeJiF
 Jy+a5E85veOSTL06+n5gOZQkUDuHXGl/HPnOdWLPkMMu7nRMxvAHBTMUHI52508hqWHj
 aUJgLi7LH7UTs3sTLLwTYXIWhvCiwrxa/0ByMQQpNs8OuQXiPC8SrralfNDi7U9WBcRB
 QteKlLl8mpcLCRxsf/8SBd4TAzH+0TgCmqppz7mZNoyRqT7WuF/60XoeCnu+mQa9UFxq
 ZlXIT2q4saCThy/vAtj/Pe8ATEzgMOCOIn56qPABHSHyDRcUBsCwOGZSVi0GWSs4tzp/
 XLfg==
X-Gm-Message-State: AFqh2ko7G7NY7kBp+DA6TJFLBOf9CykhpzkMImDsp2V5ohRzM+HI0yD/
 IO5Ivu8Ilm8NhqTybcDDage4B4703FOW3EJZtJZXDjaZFOXeAjAiWKodnzMgrqg7ZQt/4bhh47g
 lC4D2gdVuXlXVc7D0wyjg7cvOqkW0glogaPERaI3IAQEOFXr0EMPrwUUtMYwJ6SyxOHU=
X-Received: by 2002:a05:600c:1e1d:b0:3cf:b07a:cd2f with SMTP id
 ay29-20020a05600c1e1d00b003cfb07acd2fmr48816531wmb.37.1673366621357; 
 Tue, 10 Jan 2023 08:03:41 -0800 (PST)
X-Google-Smtp-Source: AMrXdXujK+aUjfokkOYZxDs+7TneEItPwD85YE0iMkZjMq2PTf5k+WZZOI6GXhw2lQPnHS+GQQSBqQ==
X-Received: by 2002:a05:600c:1e1d:b0:3cf:b07a:cd2f with SMTP id
 ay29-20020a05600c1e1d00b003cfb07acd2fmr48816506wmb.37.1673366621120; 
 Tue, 10 Jan 2023 08:03:41 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:1c09:f536:3de6:228c])
 by smtp.gmail.com with ESMTPSA id
 m18-20020a05600c4f5200b003c71358a42dsm26783902wmq.18.2023.01.10.08.03.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 08:03:40 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: Marcel Holtmann <marcel@holtmann.org>, Xie Yongji <xieyongji@bytedance.com>
Subject: [PULL 24/29] libvduse: Fix assignment in vring_set_avail_event
Date: Tue, 10 Jan 2023 17:02:28 +0100
Message-Id: <20230110160233.339771-25-pbonzini@redhat.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110160233.339771-1-pbonzini@redhat.com>
References: <20230110160233.339771-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PP_MIME_FAKE_ASCII_TEXT=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Marcel Holtmann <marcel@holtmann.org>

Since the assignment is causing a compiler warning, fix it by using
memcpy instead.

  CC       libvduse.o
libvduse.c: In function ‘vring_set_avail_event’:
libvduse.c:603:7: error: dereferencing type-punned pointer will break strict-aliasing rules [-Werror=strict-aliasin]
  603 |     *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) = htole16(val);
      |      ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Signed-off-by: Marcel Holtmann <marcel@holtmann.org>
Suggested-by: Xie Yongji <xieyongji@bytedance.com>
Suggested-by: Paolo Bonzini <pbonzini@redhat.com>
Message-Id: <4a0fe2a6436464473119fdbf0bc4076b36fbb37f.1671741278.git.marcel@holtmann.org>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 subprojects/libvduse/libvduse.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
index 338ad5e352e7..377959a0b4fb 100644
--- a/subprojects/libvduse/libvduse.c
+++ b/subprojects/libvduse/libvduse.c
@@ -582,7 +582,8 @@ void vduse_queue_notify(VduseVirtq *vq)
 
 static inline void vring_set_avail_event(VduseVirtq *vq, uint16_t val)
 {
-    *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) = htole16(val);
+    uint16_t val_le = htole16(val);
+    memcpy(&vq->vring.used->ring[vq->vring.num], &val_le, sizeof(uint16_t));
 }
 
 static bool vduse_queue_map_single_desc(VduseVirtq *vq, unsigned int *p_num_sg,
-- 
2.38.1


