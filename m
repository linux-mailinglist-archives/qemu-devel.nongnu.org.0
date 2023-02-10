Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 192B8691892
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Feb 2023 07:37:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQN1m-00007z-UG; Fri, 10 Feb 2023 01:36:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pQN1d-00007G-QC
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:36:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leobras@redhat.com>)
 id 1pQN1c-0008PH-Db
 for qemu-devel@nongnu.org; Fri, 10 Feb 2023 01:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676011007;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9bV/z5jl1WDXfSp1c5JG+u1MzXkIYXzcWvCvitMlANY=;
 b=AWaVm+RLzj3NpmbDs0DxhG4lfXmkQZetj+FYmL8nuMz46vDNiJZfBlblsLZtMFmo2FAB+1
 ElCCknrVkd+PfgWYGMeaBMeVwCvzFpqtFq0NaHQMFWZ94CybcPxVq3zqnnFrdt/zo/lxrO
 ifCWhpI5H0RRqocYq/YNq0OQU3knWCo=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-63-NJy80ixKNjmM6Up1XB-PqA-1; Fri, 10 Feb 2023 01:36:45 -0500
X-MC-Unique: NJy80ixKNjmM6Up1XB-PqA-1
Received: by mail-oo1-f71.google.com with SMTP id
 r21-20020a4a83d5000000b0051a1b4e72a5so1813367oog.4
 for <qemu-devel@nongnu.org>; Thu, 09 Feb 2023 22:36:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9bV/z5jl1WDXfSp1c5JG+u1MzXkIYXzcWvCvitMlANY=;
 b=rOjc/0KWNogLrdzdM3mYSWnxMSIG43fWLU6oil3FECMGDMEXr4Pzg4gMaqUDZjSpBr
 LaQTMYtpoSL15tLX7rJw4DzaPbaTAkBXI6ejrFdz3XfA6KFoRrdB+b1CNPk9rYq84G3e
 4vr9MLDsAeZTdPL7UEjuf5XbIg6MCBSpSefIJEMVvSANq/FKf2nBKk3hSNP3BmS4EuMl
 W6y14gBshXV6Rt0jxvs6Li+psa4G6PXqw0FfRZ2gW2NxzSdQztR+vj76WZ+rGDWrsWBz
 9K5fGydeguUKJusVdHA+GLFpx9W6b2MKUFvh1ALe2w5NBSCLA7NYPe0YyCvVvrV7/zBp
 QwAA==
X-Gm-Message-State: AO0yUKVhrE4ga2Yu251x3sf7itGmfGJ8PvPdxLSF1C54TzPQIeMGjL6k
 Ii1wKU0bPjp+Bk0cck3blE9upAQUPYnokIexBvqmF6QwvPW0YdP8KiSiHIUifh7AWJUUhT/JE1m
 DK++mgKBi2wh4xaC9HbGQ
X-Received: by 2002:a05:6830:349e:b0:68b:d4ac:1ca0 with SMTP id
 c30-20020a056830349e00b0068bd4ac1ca0mr10053497otu.29.1676011004692; 
 Thu, 09 Feb 2023 22:36:44 -0800 (PST)
X-Google-Smtp-Source: AK7set8Ta0osLw6MggkHn+Q4WEZvk9QnWdvHrLmjFTgCRt4biQes9DnvVFuYHKxcPRvcZD5VLs1Q4A==
X-Received: by 2002:a05:6830:349e:b0:68b:d4ac:1ca0 with SMTP id
 c30-20020a056830349e00b0068bd4ac1ca0mr10053479otu.29.1676011004408; 
 Thu, 09 Feb 2023 22:36:44 -0800 (PST)
Received: from LeoBras.redhat.com ([2804:1b3:a800:9aa9:fdcb:7dec:9680:8417])
 by smtp.gmail.com with ESMTPSA id
 d8-20020a05683018e800b00670679748f9sm1705285otf.49.2023.02.09.22.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 22:36:43 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras <leobras@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH v1 2/4] migration/multifd: Remove unnecessary assignment on
 multifd_load_cleanup()
Date: Fri, 10 Feb 2023 03:36:29 -0300
Message-Id: <20230210063630.532185-2-leobras@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230210063630.532185-1-leobras@redhat.com>
References: <20230210063630.532185-1-leobras@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=leobras@redhat.com;
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

Before assigning "p->quit = true" for every multifd channel,
multifd_load_cleanup() will call multifd_recv_terminate_threads() which
already does the same assignment, while protected by a mutex.

So there is no point doing the same assignment again.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
---
 migration/multifd.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 174726982c..1a445b36f1 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -1034,7 +1034,6 @@ void multifd_load_cleanup(void)
         MultiFDRecvParams *p = &multifd_recv_state->params[i];
 
         if (p->running) {
-            p->quit = true;
             /*
              * multifd_recv_thread may hung at MULTIFD_FLAG_SYNC handle code,
              * however try to wakeup it without harm in cleanup phase.
-- 
2.39.1


