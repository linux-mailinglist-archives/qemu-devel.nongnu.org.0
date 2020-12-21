Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A5252DFD27
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 16:03:06 +0100 (CET)
Received: from localhost ([::1]:59660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krMiH-00006V-Jy
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 10:03:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQs-0004na-DR
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:10 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:40429)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1krMQp-0007hH-H9
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 09:45:05 -0500
Received: by mail-wr1-x42a.google.com with SMTP id 91so11312352wrj.7
 for <qemu-devel@nongnu.org>; Mon, 21 Dec 2020 06:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rRKE92cmRUgzdGiZ2u19WojcJ5iJ7CYF7vHl9d+yt+c=;
 b=ovhp6ynsX+uHB/fJ4UlbZYOnd6gP/fi3PcfUnC4VAKjIWzm278u7D5x+UskxG4PB0k
 I/B8lFHo7UD/aJCFqqHv9am5xOzK1BuTpVE1+6Gytt+FwZegqdin+5LPflo/2xjNB0fV
 HizLv5D/vKfOFw+0fBYd9CT7auXat88nATzpGKC5rXfTczy6oeZMYZF6otBgCqPxWiwX
 aRvHWs8fOXIdTGwkdJ7jInusSQT3jDMUwa8U5tpOJ0X9wZTxT1GtzrZkWAzhumXSMOwG
 BoFwSQK8gak4neOu47gaIndydEGCad1nj7DT14pKKY4IhDMx5PyQ1FXbaL8xtUXkmZ7t
 2Usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=rRKE92cmRUgzdGiZ2u19WojcJ5iJ7CYF7vHl9d+yt+c=;
 b=Au0VehLkGCFYbeMEMIVcbcYxgEyFJ3Fx+ovVsBmJyHwK4UixjbS1Nn5vGcwmsHAkJu
 tlGz1jIY3OtuprZowZDhcFh2WTFnJh010o3tatd/YwhKipYtbl1L/+oYAXIseUHUgo57
 wVj75J3Nn9FtDBNqh5QPBe1uNxyYS202p0wTw0YRsNA38T5yYwdLu0HXatOd9zTX3HkF
 GxIcG2D7NRn5NYaFFOZ9lxDBslOyd0SfE09nEbbAkDgaYiFpMavVJ2Dy3Z4P8uaVCRk4
 CJwFLkNOURAoMYHZOWeqM5UjJ2HrfzCQflkmS9MPa5GFA+PZxLQv72qCpegCi83H9lJh
 aGUA==
X-Gm-Message-State: AOAM531rBN29S9yGdSqXDj2cjQFS70tE52FIiVi1UWoxkdKEAo1Lt26t
 v8ItMfN5xr2MA9cGjQA4sgFiPPCtIDU=
X-Google-Smtp-Source: ABdhPJzPQX5zTIhfQ3IstI819Y16DfUBLeuAEjC1Ka1GfIpsmXTbxpeTfhTcer2b9KFY8ULB+nHCsQ==
X-Received: by 2002:a5d:4905:: with SMTP id x5mr18779491wrq.75.1608561901932; 
 Mon, 21 Dec 2020 06:45:01 -0800 (PST)
Received: from avogadro.lan ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l5sm27439627wrv.44.2020.12.21.06.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 06:45:01 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 14/55] qom: Assert that objects being destroyed have no parent
Date: Mon, 21 Dec 2020 15:44:06 +0100
Message-Id: <20201221144447.26161-15-pbonzini@redhat.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201221144447.26161-1-pbonzini@redhat.com>
References: <20201221144447.26161-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

QOM reference counting bugs are often hard to detect, but there's
one kind of bug that's easier: if we are freeing an object but is
still attached to a parent, it means the reference count is wrong
(because the parent always hold a reference to their children).

Add an assertion to make sure we detect those cases.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20201215224133.3545901-3-ehabkost@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 qom/object.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/qom/object.c b/qom/object.c
index f2ae6e6b2a..5cfed6d7c6 100644
--- a/qom/object.c
+++ b/qom/object.c
@@ -685,6 +685,7 @@ static void object_finalize(void *data)
     object_deinit(obj, ti);
 
     g_assert(obj->ref == 0);
+    g_assert(obj->parent == NULL);
     if (obj->free) {
         obj->free(obj);
     }
-- 
2.29.2



