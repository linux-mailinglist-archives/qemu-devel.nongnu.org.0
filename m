Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C5F7693CA3
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 03:54:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pROxD-0002H1-L6; Sun, 12 Feb 2023 21:52:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROxC-0002Gb-BB
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1pROxA-0006wG-TC
 for qemu-devel@nongnu.org; Sun, 12 Feb 2023 21:52:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676256748;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=826zd0O7d2WRwLdAeNQrO2BCJWaXFymU9+RS+HRc/0Y=;
 b=Su66OPcSd1XpFZVcmAsArcrRM8v+ic+UcMyvBOaDiOc02q89uJp1Xa8e7ma3CpHNlToW7i
 l6/UGi4j8cFFYoWPydicrywZMcLbRsYQtnNwXe2kSeumG1bz6VQQutcgm9hfWTgD8wDjd3
 OVhplifanq4qsH+kDJwCoU3XhlAfwS0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-352-GE14x_lgMNWAhMg53B72ng-1; Sun, 12 Feb 2023 21:52:26 -0500
X-MC-Unique: GE14x_lgMNWAhMg53B72ng-1
Received: by mail-wm1-f69.google.com with SMTP id
 k9-20020a05600c1c8900b003dc5dec2ac6so8392298wms.4
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 18:52:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=826zd0O7d2WRwLdAeNQrO2BCJWaXFymU9+RS+HRc/0Y=;
 b=pVRdGUKCsGvP0HA0lMat3ww0tIsDHX48ydptvi5nTO0cV1vOf38/DP77dLAGysbRFA
 zhY/Lye0Jt4n3Qg5I4B+7L7SR+ZircJA51daEQ2sb70C9UO6FtFv95kvNAEs1VDX7K+D
 8p3rR4DYC7fZe+jEp9DysvfFVKFgWLyNR1HHVS+Bj66ykn+18yzVPMHxT0KAQAkEbff9
 7huhgeSoSZScb9r1L3/vEzzEVc8ATM1tISP8veLvShFx0ahdN8g1v4GOePt4KO24Ge93
 xt2Ur33fTurtkD9zn2u8HANmEeksoSmSjaljMzGkGQNxGq0awAG5gBVliYf3upzeJuhv
 hmyA==
X-Gm-Message-State: AO0yUKVVx9lLEJWliFsePQiYqoc1qHVqyeJBC6qsgU9qnOZaGQzPjXzc
 T5SRTk8hj2YLBI2hAUBAmjjIb97kj/vB17Mr7JRNX2X8edsDXRlM7fz3AeRNss5kn7kX0IgmEB4
 KBfyhCNN45cWw741zn17D7VU7+wX48JRwwHuCchVMt5aeyQmAuUlNs3gmTRAGn+keUaroVQPK
X-Received: by 2002:a05:600c:998:b0:3dc:59ee:7978 with SMTP id
 w24-20020a05600c099800b003dc59ee7978mr17860670wmp.38.1676256745348; 
 Sun, 12 Feb 2023 18:52:25 -0800 (PST)
X-Google-Smtp-Source: AK7set/lnqPLcyhbtukqg1WPobPfl5GU8z3CthnoNbbEfoGXTfW3pja/FBl6VOTN6KkiWMDv9UH/rQ==
X-Received: by 2002:a05:600c:998:b0:3dc:59ee:7978 with SMTP id
 w24-20020a05600c099800b003dc59ee7978mr17860652wmp.38.1676256745119; 
 Sun, 12 Feb 2023 18:52:25 -0800 (PST)
Received: from redhat.com ([46.136.252.173]) by smtp.gmail.com with ESMTPSA id
 az10-20020a05600c600a00b003dc3f07c876sm16043142wmb.46.2023.02.12.18.52.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Feb 2023 18:52:24 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, kvm@vger.kernel.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Li Xiaohui <xiaohli@redhat.com>, Peter Xu <peterx@redhat.com>
Subject: [PULL 19/22] migration/multifd: Remove unnecessary assignment on
 multifd_load_cleanup()
Date: Mon, 13 Feb 2023 03:51:47 +0100
Message-Id: <20230213025150.71537-20-quintela@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213025150.71537-1-quintela@redhat.com>
References: <20230213025150.71537-1-quintela@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

From: Leonardo Bras <leobras@redhat.com>

Before assigning "p->quit = true" for every multifd channel,
multifd_load_cleanup() will call multifd_recv_terminate_threads() which
already does the same assignment, while protected by a mutex.

So there is no point doing the same assignment again.

Fixes: b5eea99ec2 ("migration: Add yank feature")
Reported-by: Li Xiaohui <xiaohli@redhat.com>
Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Reviewed-by: Peter Xu <peterx@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/multifd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index cac8496edc..3dd569d0c9 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1025,7 +1025,6 @@ void multifd_load_cleanup(void)
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
         if (p->running) {
-            p->quit = true;
             /*
              * multifd_recv_thread may hung at MULTIFD_FLAG_SYNC handle code,
              * however try to wakeup it without harm in cleanup phase.
-- 
2.39.1


